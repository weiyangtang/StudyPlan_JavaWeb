<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>个人信息</title>
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Pragma" content="no-cache">
	<meta name="" content="" charset="utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1">

	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css">

	<script>
		/*
		在第一次加载页面时访问数据库
		1.查询出教师发布的所有计划
		*/
		$(document).ready(function () {
			$.ajax({
				type: 'post',
				url: 'choose',
				async: false,
				data: {},
				success: function (result) {
// 					alert(result);
					var plan = JSON.parse(result);
// 					alert(plan);
					var table = document.getElementById("planpublish");
					for (var index in plan) {
						var newRow = table.insertRow(table.rows.length);
						var col0 = newRow.insertCell(0);
						var col1 = newRow.insertCell(1);
						var col2 = newRow.insertCell(2);
						var col3 = newRow.insertCell(3);
						var col4 = newRow.insertCell(4);

						col0.innerHTML = table.rows.length - 1;
						col1.innerHTML = plan[index].planName;
						col2.innerHTML = plan[index].planContext;
						col3.innerHTML = plan[index].planNo;
						col4.innerHTML = "<a href='#'onclick ='addPlan(this)'>选择计划</a>";
					}
				},
				error: function () {
					alert("error");
				}
			});
		});
		
		/*
		2.按照学号（账户）查询学生的所有所选计划
		*/
		function findPlanByNumber(){
			var number = '<%= session.getAttribute("studentNo")%>';
			$.ajax({
				type: 'post',
				url: 'stuplan',
				async: false,
				data: {
					'number':number
				},
				success: function (result) {
				    $("#stuplan  tr:not(:first)").remove();  
// 					alert(result);
					var plan = JSON.parse(result);
// 					alert(plan);
					var table = document.getElementById("stuplan");
					for (var index in plan) {
						var newRow = table.insertRow(table.rows.length);
						var col0 = newRow.insertCell(0);
						var col1 = newRow.insertCell(1);
						var col2 = newRow.insertCell(2);
						var col3 = newRow.insertCell(3);
						var col4 = newRow.insertCell(4);

						col0.innerHTML = table.rows.length - 1;
						col1.innerHTML = plan[index].planName;
						col2.innerHTML = plan[index].planContext;
						col3.innerHTML = plan[index].planNo;
						col4.innerHTML = "<a href='#'onclick ='plandelete(this)'>删除计划</a>";
					}
// 					alert("查询完毕");
				},
				error: function () {
					alert("不要重复添加！");
				}
			});
		}
		
		/*
		3.选择添加计划
		3.1判断是否已经选择
		3.2添加到学生计划
		3.3更新学生计划列表
		*/
		function addPlan(obj){
			var index = obj.parentNode.parentNode.rowIndex;
			var table = obj.parentNode.parentNode.parentNode;
			
			var planNo = table.rows[index].cells[3].innerHTML;
			var number = '<%= session.getAttribute("studentNo")%>';
// 			alert(planNo);
// 			alert(number);
// 			alert(acceptionNo);
// 			alert(stageCardNo);
			$.ajax({
				type: 'post',
				url: 'addstuplan',
				async: false,
				data: {
					'planNo':planNo,
					'number':number,
				},
				success: function (result) {
					if(result == 0)
					{
						alert("添加失败");
					}
					else{
						alert("添加成功");
					}
				},
				error: function () {
					alert("需要重新登陆");
				}
			});
		}
		
		/*
		4.删除学生计划
		*/
		function plandelete(obj){
			var index = obj.parentNode.parentNode.rowIndex;
			var table = obj.parentNode.parentNode.parentNode;
			
			var planNo = table.rows[index].cells[3].innerHTML;
			var number = '<%= session.getAttribute("studentNo")%>';
			$.ajax({
				type: 'post',
				url: 'plandelete',
				async: false,
				data: {
					'planNo':planNo,
					'number':number,
				},
				success: function (result) {
					if(result == 0)
					{
						alert("删除失败");
					}
					else{
						table.deleteRow(index);
						alert("删除成功");
					}
				},
				error: function () {
					alert("需要重新登陆");
				}
			});
		}
	</script>

</head>

<body class="container">
	
	<nav class="navbar-inverse visible-lg visible-md" role="navigation">
		<div class="container">
			<div class="navbar-header"> <a class="navbar-brand" href="#">学习计划打卡系统</a> </div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="http://localhost:8080/studyPlan/studentInfo">个人信息</a></li>
					<li><a href="#">计划池</a></li>
					<li><a href="http://localhost:8080/studyPlan/punch">计划打卡</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="panel panel-default">
		<div class="panel-heading" align="center">计划池</div>
		<div class="panel-body">
			<table class="table table-bordered" id="planpublish">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">计划名</th>
						<th scope="col">计划内容</th>
						<th scope="col">计划编号</th>
						<th scope="col">计划操作</th>
					</tr>
				</thead>
			</table>
			<div class="input-group">
				<span class="input-group-addon">搜索计划</span> <input type="text" class="form-control" placeholder="twitterhandle">
			</div>
		</div>
	</div>

	<div class="panel panel-default">
		<div class="panel-heading" align="center">我的计划</div>
		<div class="panel-body">
			<table class="table table-bordered" id="stuplan">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">计划名</th>
						<th scope="col">计划内容</th>
						<th scope="col">计划编号</th>
						<th scope="col">计划操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<div style="width: 100%; text-align: center">
		<button type="button" class="btn" onclick="findPlanByNumber()">查询我的计划</button>
<!-- 		<button type="button" class="btn" onclick="javascrtpt:window.location.href='http://localhost:8080/studyPlan/punch'">打卡计划系统</button> -->
	</div>
</body>
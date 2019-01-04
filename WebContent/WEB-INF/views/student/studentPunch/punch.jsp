<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>计划打卡</title>
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
		2.按照学号（账户）查询学生的所有所选计划
		*/
		$(document).ready(function () {
			var number = '<%= session.getAttribute("studentNo")%>';
			$.ajax({
				type: 'post',
				url: 'stuplan',
				async: false,
				data: {
					'number': number
				},
				success: function (result) {
					var plan = JSON.parse(result);
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
						col4.innerHTML = "<a href='#'onclick ='punch(this)'>打卡签到</a>";
					}
				},
				error: function () {
					alert("error");
				}
			});
		});
		
		function punch(obj) {
			var index = obj.parentNode.parentNode.rowIndex;
			var table = obj.parentNode.parentNode.parentNode;
			var number = '<%= session.getAttribute("studentNo")%>';
			var planNo = table.rows[index].cells[3].innerHTML;
			$.ajax({
				type: 'post',
				url: 'punch',
				async: false,
				data: {
					'planNo': planNo,
					'number':number
				},
				success: function (result) {
					if(result == 0){
						alert("今日已打卡。");
					}else{
						table.rows[index].cells[4].innerHTML = '<b>今日已打卡</b>';
						alert("打卡成功！");
					}
				},
				error: function () {
					alert("error");
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
					<li><a href="http://localhost:8080/studyPlan/choose">计划池</a></li>
					<li><a href="#">计划打卡</a></li>
				</ul>
			</div>
		</div>
	</nav>

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
		<button type="button" class="btn" onclick="javascrtpt:window.location.href='http://localhost:8080/studyPlan/choose'">返回选择计划</button>
	</div>
</body>

</html>
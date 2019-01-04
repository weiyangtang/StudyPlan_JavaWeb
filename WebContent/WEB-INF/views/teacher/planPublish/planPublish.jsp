<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学习计划制定发布</title>
<link
	href="<%=request.getContextPath()%>/resources/bootstrap3.3.4/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/resources/jquery1.9.1/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap3.3.4/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/layer/layer.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/My97DatePicker/WdatePicker.js"
	type="text/javascript"></script>

<script
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>

</head>
<body>
<nav class="navbar-inverse visible-lg visible-md" role="navigation">
		<div class="container">
			<div class="navbar-header"> <a class="navbar-brand" href="#">学习计划打卡系统</a> </div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="#">计划发布</a></li>
					<li><a href="http://localhost:8080/studyPlan/teacherInfo">个人信息</a></li>
					<li><a href="http://localhost:8080/studyPlan/planList">完成情况统计</a></li>
					<li><a href="http://localhost:8080/studyPlan/">退出登陆</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<form class="form-horizontal col-md-6" id="planPublish" method="post">
				<fieldset id="">
					<legend>制定发布学习计划</legend>
				</fieldset>

				<div class="form-group">
					<label class="col-md-2 control-label">计划类型:</label>
					<div class="col-md-4">
						<select id="planType" name="planType" class="form-control">
							<option>高数</option>
							<option>英语</option>
							<option>计算机科学</option>
						</select>
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">计划名称:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="planName"
							id="planName">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">分值:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="credit"
							id="credit">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">计划内容:</label>
					<div class="col-md-6">
						<textarea class="form-control" rows="5" id="planContent"
							name="planContent"></textarea>
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">文件上传:</label>
					<div class="col-md-4">
						<input type="file" name="planFile" id="planFile" value="" />
					</div>
			
				<div class="form-group ">
					<button type="button" onclick="submitForm()"
						class="btn btn-primary pull-right">提交计划</button>
				</div>

			</form>
		</div>
</body>
<script>
	$(document).ready(
			function() {
				$.ajax({
					type : 'post',
					url : 'PlanType',
					async : false,
					data : {},
					success : function(result) {

						var plan = result;
						$("#planType").empty();
						for ( var i in plan)
							$("#planType").append(
									"<option value="+i+">"
											+ plan[i].planTypeName
											+ "</option>");

					},
					error : function() {
						alert("error");
					}
				});

			})

	function submitForm() {
		var planContent = $('#planContent').val();
		var planName = $('#planName').val();
		var planType = $("#planType")[0].selectedIndex + 1;
		var credit = $('#credit').val();
		if (planContent == null || planContent == "") {
			layer.msg("计划内容不能为空");
		} else if (planName == null || planName == "") {
			layer.msg("计划名称不能为空");
		} else if (credit == null || credit == "") {
			layer.msg("计划积分不能为空");
		} else {
			var form = new FormData(document.getElementById("planPublish"));
			$.ajax({
				type : 'post',
				url : 'PlanPublish',
				async : false,
				/* contentType : false,
				processData : false, */
				data : {
					"planTypeNo" : planType,
					"planName" : planName,
					"planContext" : planContent,
					"coinNum" : credit
				},
				success : function(result) {
					if (result >0)
						layer.msg("计划发布成功");
					else
						layer.msg("计划发布失败");
				},
				error : function() {
					alert("error");
				}
			});

		}
	}
</script>
</html>
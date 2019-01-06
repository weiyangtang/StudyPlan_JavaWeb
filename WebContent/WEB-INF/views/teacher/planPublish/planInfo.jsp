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
	
	<div class="container">
		<div class="row">
			<form class="form-horizontal col-md-6" id="planPublish"  enctype="multipart/form-data">
			
				<fieldset id="">
					<legend>制定发布学习计划</legend>
				</fieldset>

				<div class="form-group">
					<label class="col-md-2 control-label">计划类型:</label>
					<div class="col-md-4" id="planType">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label" id="planName">计划名称:</label>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">积分:</label>
					<div class="col-md-4" id="credit" >
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">开始时间:</label>
					<div class="col-md-4" id="startTime">
					
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">截止时间:</label>
					<div class="col-md-4" id="endTime" >
			
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">计划内容:</label>
				</div>
				<div class="form-group ">
					<div class="col-md-off-2 col-md-6"  id="planContext">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">文件上传:</label>
					<div class="col-md-4">
						<input type="file" name="uploadFile" id="planFile" value="" />
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
		var planContext = $('#planContext').val();
		var planName = $('#planName').val();
		var planType = $("#planType")[0].selectedIndex + 1;
		var credit = $('#credit').val();
		var startTime=new Date($('#startTime').val());
		var endTime=new Date($('#endTime').val());
		//var endTime=$('#endTime').val();
		console.log(startTime);
		if (planContext == null || planContext == "") {
			layer.msg("计划内容不能为空");
		} else if (planName == null || planName == "") {
			layer.msg("计划名称不能为空");
		} else if (credit == null || credit == "") {
			layer.msg("计划积分不能为空");
		} else if (startTime == null || startTime == "") {
			layer.msg("开始时间不能为空");
		}else if (endTime == null || endTime == "") {
			layer.msg("结束时间不能为空");
		} else {
			var form = new FormData(document.getElementById("planPublish"));
			form.append('planTypeNo',planType);
			$.ajax({
				type : 'post',
				url : 'PlanPublish',
				async : false,
				data : form,
				cache : false,
				contentType : false,
				processData : false,
				data : form,
				success : function(result) {
					if (result > 0)
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
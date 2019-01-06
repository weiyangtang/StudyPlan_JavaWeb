<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学习计划信息</title>
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
			<form class="form-horizontal col-md-6" id="planPublish"
				enctype="multipart/form-data">

				<fieldset id="">
					<legend>制定发布学习计划</legend>
				</fieldset>

				<div class="form-group">
					<label class="col-md-2 control-label">计划类型:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" id="planType"
							name="planType" readonly="readonly">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">计划名称:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="planName"
							placeholder="计划名称不能超过20个汉字" id="planName" readonly="readonly">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">积分:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="credit"
							placeholder="积分为数字" id="credit" readonly="readonly">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">教师姓名:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required"
							name="teacherName" id="teacherName" readonly="readonly">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">开始时间:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="startTime"
							id="startTime" placeholder="开始时间大于等于今日日期" readonly="readonly" />
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">截止时间:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="endTime"
							id="endTime" placeholder="截止日期大于开始日期" readonly="readonly">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">计划内容:</label>
					<div class="col-md-6">
						<textarea class="form-control" rows="5" id="planContext"
							placeholder="请字数控制在50字以内,如有更多信息,请上传文件,详细说明" name="planContext"
							readonly="readonly"></textarea>
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">文件下载:</label>
					<div class="col-md-4" id="downloadfile"></div>

					<div class="form-group ">
						<button type="button" onclick="submitForm()"
							class="btn btn-primary pull-right">选择计划</button>
					</div>
				</div>
			</form>
		</div>
</body>
<script>
	var planNo;
	var url = window.location.href.toString();
	$(document)
			.ready(
					function() {
						planNo = window.location.href.split("=")[1];
						$
								.ajax({
									type : 'post',
									url : 'planInfo',
									async : false,
									data : {
										'planNo' : planNo
									},
									success : function(result) {
										var studyPlanInfo = result;
									
										
										$('#planType').val(studyPlanInfo.planTypeName);
										$('#planName').val(studyPlanInfo.planName);
										$('#startTime').val(studyPlanInfo.startTime);
										$('#endTime').val(studyPlanInfo.endTime)
										$('#planContext').val(studyPlanInfo.planContext);
										$("#teacherName").val(studyPlanInfo.teacherName); 
										$("#credit").val(studyPlanInfo.coinNum);
										$("#downloadfile")[0].innerHTML = "<a href='download?fileType=1&fileName="
												+ studyPlanInfo.planInfoFile
												+ "'>"
												+ studyPlanInfo.planInfoFile
												+ "</a>";

									},
									error : function() {
										alert("error");
									}
								});

					})

	function submitForm() {
			$.ajax({
				type : 'post',
				url : 'planSelection',
				async : false,
				data : {
					'planNo':planNo
				},
				success : function(result) {
					if (result > 0)
						layer.msg("计划选择成功");
					else
						layer.msg("已经选过该计划");
				},
				error : function() {
					alert("error");
				}
			});

		}
	
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>学习计划制定发布</title>
	<link href="<%=request.getContextPath()%>/resources/bootstrap3.3.4/css/bootstrap.min.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/jquery1.9.1/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/layer/layer.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

	<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>

</head>

<body>

	<div class="container">
		<div class="row">
			<form class="form-horizontal col-md-6" id="planPublish" enctype="multipart/form-data">

				<fieldset id="">
					<legend>制定发布学习计划</legend>
				</fieldset>

				<div class="form-group">
					<label class="col-md-2 control-label">计划类型:</label>
					<div class="col-md-4">
						<select id="planType" name="planType" class="form-control" onchange="modelShow()">
							<option>高数</option>
							<option>英语</option>
							<option>计算机科学</option>
						</select>
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">计划名称:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="planName" placeholder="计划名称不能超过20个汉字" id="planName">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">积分:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="coinNum" placeholder="积分为数字" id="coinNum">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">开始时间:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="startTime" id="startTime" placeholder="开始时间大于等于今日日期"
						 onClick="WdatePicker({skin:'whyGreen',minDate:'%y-%M-{%d}',maxDate:'#F{$dp.$D(\'endTime\')}'})" />
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">截止时间:</label>
					<div class="col-md-4">
						<input type="text" class="form-control required" name="endTime" id="endTime" placeholder="截止日期大于开始日期" onClick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}'})">
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">计划内容:</label>
					<div class="col-md-6">
						<textarea class="form-control" rows="5" id="planContext" placeholder="请字数控制在50字以内,如有更多信息,请上传文件,详细说明" name="planContext"></textarea>
					</div>
				</div>
				<div class="form-group ">
					<label class="col-md-2 control-label">文件上传:</label>
					<div class="col-md-4">
						<input type="file" name="uploadFile" id="planFile" value="" />
					</div>
				</div>
				<div class="form-group ">
					<button type="button" onclick="submitForm()" class="btn btn-primary pull-right">提交计划</button>
				</div>
			</form>
		</div>


		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">添加计划类型</h4>
					</div>
					<div class="container">

						<div id="" class=" col-sm-4">
							<form id="updateForm">
								<div class="rows">
									<label>计划类型名称:</label> <input type="text" placeholder="计划类型名称" class="form-control" name="planTypeName" id="planTypeName"
									 value="">
								</div>
							</form>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							取消</button>
						<button type="button" onclick="createPlanType();" class="btn btn-primary">确认</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<!-- end 模态层 -->

</body>
<script>
	$(document).ready(
		function(){
			findAllPlanType();
		}
	)


	function findAllPlanType () {
			$.ajax({
				type: 'post',
				url: 'PlanType',
				async: false,
				data: {},
				success: function (result) {

					var plan = result;
					$("#planType").empty();
					for (var i in plan)
						$("#planType").append(
							"<option value=" + i + ">" +
							plan[i].planTypeName +
							"</option>");
					$("#planType").append(
						"<option>其他</option>");

				},
				error: function () {
					alert("error");
				}
			});

		}

	

	function createPlanType() {
		var planTypeName=$("#planTypeName").val();
		if(planTypeName==null||planTypeName=="")
		 layer.msg("计划类型不能为空");
		 else{
			$.ajax({
				type: 'post',
				url: 'addPlanType',
				async: false,
				data: {
					'planTypeName':planTypeName
				},
				success: function (result) {
					if(result>0){
						findAllPlanType();
						$('#myModal').modal("hide");
						layer.msg("计划类型创建成功");
					}else{
						layer.msg('计划类型创建失败');
					}
					
				


				},
				error: function () {
					alert("error");
				}
			});

		 }
		


	}

	//显示模态框
	function modelShow(id) {
		var option= $("#planType  option:selected").text();
		if(option.trim()=="其他"){
			$('#myModal').modal("show");
		}
		
	}

	function submitForm() {
		var planContext = $('#planContext').val();
		var planName = $('#planName').val();
		var planType = $("#planType")[0].selectedIndex + 1;
		var credit = $('#coinNum').val();
		var startTime = new Date($('#startTime').val());
		var endTime = new Date($('#endTime').val());
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
		} else if (endTime == null || endTime == "") {
			layer.msg("结束时间不能为空");
		} else {
			var form = new FormData(document.getElementById("planPublish"));
			form.append('planTypeNo', planType);
			$.ajax({
				type: 'post',
				url: 'PlanPublish',
				async: false,
				data: form,
				cache: false,
				contentType: false,
				processData: false,
				data: form,
				success: function (result) {
					if (result > 0)
						layer.msg("计划发布成功");
					else
						layer.msg("计划发布失败");
				},
				error: function () {
					alert("error");
				}
			});

		}
	}
</script>

</html>
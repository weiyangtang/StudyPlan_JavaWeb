<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学习计划制定发布</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-table.css">

<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table-zh-CN.js"></script>

<script src="<%=request.getContextPath()%>/js/tableExport.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table-export.js"></script>
<script src="<%=request.getContextPath()%>/resources/layer/layer.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

<!--教师任教课程-->
<!--功能:导入学生(单个,批量),查看课程学生名单-->


<script type="text/javascript">
	var planNo;
	var url = window.location.href.toString();
	$(document).ready(function() {
		initTable();
	})

	function downloadFile(id, fileName) {
		var rowindex = id.parentNode.parentNode.rowIndex; //第几行
		PNO = $("#tb_departments")[0].rows[rowindex].cells[0].innerHTML; //SNO
		url = "download?fileName=" + PNO + "/" + fileName.trim()
				+ "&fileType=2";
		window.location.href = "download?fileName=" + PNO + "/"
				+ fileName.trim() + "&fileType=2";
	}
	
	//显示模态框
	function modelShow(id) {
		var rowindex = id.parentNode.parentNode.rowIndex; //第几行
		var planNo = $("#tb_departments")[0].rows[rowindex].cells[0].innerHTML; //planNo
		var studentNo = $("#tb_departments")[0].rows[rowindex].cells[1].innerHTML;
		$('#planNo').val(planNo);
		$('#studentNo').val(studentNo);
		$('#myModal').modal("show");
	}
	
	function punch() {
		var formData = new FormData($('#updateForm')[0]);
		$.ajax({
			type : 'post',
			url : 'checkWork',
			async : false,
			data : formData,
			cache : false,
			contentType : false,
			processData : false,
			success : function(result) {
				var timeLength=$('#timeLength').val();
				if (result > 0)
					layer.msg("评分成功");
				else
					layer.msg("评分失败");
			},
			error : function() {
				alert("error");
			}
		});

	}

	function initTable() {
		planNo = window.location.href.split("=")[1];
		$
				.ajax({
					type : 'post',
					url : 'AllSubmitStudentList',
					async : false,
					data : {
						"planNo" : planNo
					},
					//contentType: false,
					//contentType 传输给服务器的编码格式,发送json格式数据默认就可以,但发送文件时比如用FormData则要 contentType=false 不进行处理
					//processData: false,
					success : function(result) {

						var user = result;//Springmvc返回JSON对象
						$('#tb_departments')
								.bootstrapTable(
										{
											data : user, //最终的JSON数据放在这里
											height : $(window).height() - 100,
											striped : true,
											pagination : true,
											pageNumber : 1,
											pageSize : 10,
											pageList : [ 5, 10, 20 ],
											search : true,
											showRefresh : true,
											sidePagination : "client",
											showColumns : true,
											minimunCountColumns : 2,
											showExport : true, //是否显示导出
											exportDataType : "basic", //basic', 'all', 'selected'.
											exportTypes : [ 'excel' ],
											exportOptions : {
												ignoreColumn : [ 4, 5 ], //忽略某一列的索引
												fileName : '课程名单', //文件名称设置
												worksheetName : 'Sheet1', //表格工作区名称
												tableName : '课程名单',
												excelstyles : [
														'background-color',
														'color', 'font-size',
														'font-weight' ],
											//onMsoNumberFormat: DoOnMsoNumberFormat
											},
											columns : [
													{

														field : 'planNo', //列ID同时也是指定要显示的数据的ID
														title : '计划编号',
														//width: 50,
														align : 'center',
														valign : 'center',
														sortable : true,
														cellStyle : {
															css : {
																"font" : "bold 15px/20px 楷体,arial,sans-serif;",
																"height" : "20px"
															}
														}

													},
													{

														field : 'studentNo',
														title : '学号',
														align : 'center',
														valign : 'center',
														sortable : true,
														cellStyle : {
															css : {
																"font" : "bold 15px/20px 楷体,arial,sans-serif;",
																"height" : "20px"
															}
														}

													},
													{

														field : 'studentName',
														title : '姓名',
														align : 'center',
														valign : 'center',
														sortable : true,
														cellStyle : {
															css : {
																"font" : "bold 15px/20px 楷体,arial,sans-serif;",
																"height" : "20px"
															}
														}

													},
													{

														field : 'score',
														title : '评分',
														align : 'center',
														valign : 'center',
														sortable : true,
														cellStyle : {
															css : {
																"font" : "bold 15px/20px 楷体,arial,sans-serif;",
																"height" : "20px"
															}
														}

													},
													{

														field : 'studentFile',
														title : '文件下载',
														align : 'center',
														valign : 'center',
														sortable : true,
														cellStyle : {
															css : {
																"font" : "bold 15px/20px 楷体,arial,sans-serif;",
																"height" : "20px"
															}
														},
														formatter : function(
																value, row,
																index) {
															var d = ' <button type="button" class="btn btn-link" onclick="downloadFile(this,\''
																	+ value
																	+ '\')" >'
																	+ '文件下载'
																	+ '</button> ';
															return d;
														}

													},
													{

														field : 'score',
														title : '验收评分',
														align : 'center',
														formatter : function(
																value, row,
																index) {
															var d = '<button type="button" class="btn btn-link" onclick="modelShow(this)" >验收评分</button>';
															return d;
														}
													} ],

										});

					},
					error : function() {
						alert('ERROR!');
					}
				});

	}
</script>
</head>
<body>
	
	<div class="container">
		<table id="tb_departments"></table>
	</div>
	
	
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">每日打卡</h4>
				</div>
				<div class="container">

					<div id="" class=" col-sm-4">
						<form id="updateForm">
							<div class="rows">
								<label>计划编号:</label> <input type="text" placeholder="计划编号"
									class="form-control" name="planNo" id="planNo" value="" readonly="readonly">
							</div>
							<div class="rows">
								<label>学生学号:</label> <input type="text" placeholder="学生学号"
									class="form-control" name="studentNo" id="studentNo" value="" readonly="readonly">
							</div>
							<div class="rows">
								<label>评分:</label>
								<div class="input-group">
									<div class="input-icon-group">
										<div class="input-group" style="width: 100%">
											<input type="number" class="form-control" placeholder="评分为数字,包括小数"
												value="" name="score" id="score" />
										</div>
									</div>
									<span class="input-group-btn">
										<button class="btn btn-primary" type="button">分</button>
									</span>
								</div>
							</div>
						</form>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						取消</button>
					<button type="button" onclick="punch();" class="btn btn-primary">确定评分</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- end 模态层 -->
	

</body>
</html>
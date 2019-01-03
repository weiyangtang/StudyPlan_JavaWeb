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

<!--教师任教课程-->
<!--功能:导入学生(单个,批量),查看课程学生名单-->


<script type="text/javascript">
	var planNo;
    var url = window.location.href.toString();
	$(document).ready(function() {
		initTable();
	})


	function initTable() {
		  planNo = window.location.href.split("=")[1];
				$.ajax({
					type : 'post',
					url : 'cardCondition',
					async : false,
					data : {
						"planNo":planNo
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

														field : 'planName',
														title : '计划名称',
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

													},{

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

													},{

														field : 'cardNum',
														title : '打卡次数',
														align : 'center',
														valign : 'center',
														sortable : true,
														cellStyle : {
															css : {
																"font" : "bold 15px/20px 楷体,arial,sans-serif;",
																"height" : "20px"
															}
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

</body>
</html>
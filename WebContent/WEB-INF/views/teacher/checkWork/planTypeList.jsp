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
	var CNO;
	$(document).ready(function() {
		initTable();
	})

	//查看该计划完成情况
	function lookupList(id) {

		var rowindex = id.parentNode.parentNode.rowIndex; //第几行
		var planTypeNo = $("#tb_departments")[0].rows[rowindex].cells[0].innerHTML; //planTypeNo
		var url = "checkWorkPlanList?planTypeNo=" + planTypeNo;
		window.location.href = url;

	}

	function initTable() {

		
				$.ajax({
					type : 'post',
					url : 'planTypeList',
					async : false,
					data : {},
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

														field : 'planTypeNo', //列ID同时也是指定要显示的数据的ID
														title : '学习类型编号',
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

														field : 'planTypeName',
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

														field : 'planList',
														title : '查看学习计划类型',
														align : 'center',
														formatter : function(
																value, row,
																index) {
															var d = '<button type="button" class="btn btn-link" onclick="lookupList(this)" >查看</button>';
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
	 <fieldset>
            <legend>计划类型列表</legend>
        </fieldset>
		<table id="tb_departments"></table>
	</div>

</body>
</html>
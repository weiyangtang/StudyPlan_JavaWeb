<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
<script type="text/javascript">
	function submitform() {

		$.ajax({
			type : 'get',
			url : 'StudentInfo',
			async : true,
			success : function(result) {
				var student = result;
				alert(student[0].studentName)
				//alert(result);

			},
			error : function() {
				alert('ERROR!');
			}
		});
	}
	function submitform2() {
		//非常要小心的一点是,json对象的名称要和Bean对象的一致,特别是大小写,否则会报HTTP400错误
		var StudentInfo = new Object();
		StudentInfo.studentNo = '1663710324';
		var jsonStr = JSON.stringify(StudentInfo);
		$.ajax({
			type : 'post',
			url : 'Student',
			data : jsonStr,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			async : true,
			success : function(result) {
				var student = result;
				alert(student.studentName)

			},
			error : function() {
				alert('ERROR!');
			}
		});
	}
</script>
</head>
<body>
	<p>
		<a href="http://localhost:8080/SpringDemo">首页index</a>
	</p>
	<button type="button" onclick="submitform()">测试Controller</button>
	<button type="button" onclick="submitform2()">测试Controller</button>
</body>
</html>
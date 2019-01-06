<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学习计划打卡系统登录</title>
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
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {

		var username = $("#username").val();
		var password = $("#password").val();
		var identity = $('input[name="identity"]:checked').val();
		if (username == null || username == "") {
			alert("账号不能为空");
			return false;
		} else if (password == null || password == "") {
			alert("密码不能为空");
			return false;
		} else {

			$.ajax({
				type : 'post',
				url : 'login',
				async : false,
				data : {
					'username' : username,
					'password' : password,
					'identity' : identity
				},
				success : function(result) {
// 					alert(result);
					var option = parseInt(result);
					if (option == 0)
						alert("密码错误");
					else if(option == 1){
						//学生
						var url = "studentFrame";
						window.location.href = url;
// 						alert("密码正确");
					}else{
						var url = "teacherFrame";
						window.location.href = url;
						//老师
					}

				},
				error : function() {
					alert("error");
				}
			});
		}
		return true;
	}
</script>
</head>
<body>

	<div class="content">
		<div class="login_form">
			<h2>欢迎来到学习打卡系统</h2>
			<div class="head_img">
				<img src="<%=request.getContextPath()%>/resources/images/clock.png"
					class="header_icon" width="150px" height="150px" alt="" />
			</div>

			<form action="login" method="post" onsubmit="return check()">
				<div class="id">
					账号:&nbsp;&nbsp;<input type="text" id="username" name="username"
						placeholder="账号">
				</div>
				<div class="id">
					密码:&nbsp;&nbsp;<input type="password" id="password" name="password"
						placeholder="密码">
				</div>
				<div class="id">
					<input type="radio" name="identity" value="1" checked>学生 <input
						type="radio" name="identity" value="2">老师
				</div>
				<div class="two_button">
					<input class="button" type="button" onclick="check()" value="登录">
					<input class="button" type="button" value="注册"
						onclick="location.href='register'">
				</div>
				<div class="forget_password">忘记密码?</div>
			</form>
		</div>
	</div>
</body>
</html>
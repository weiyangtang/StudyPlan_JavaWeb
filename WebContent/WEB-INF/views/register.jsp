<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学习计划打卡系统注册</title>
<link href="<%=request.getContextPath()%>/resources/css/register.css"
	rel="stylesheet" type="text/css">
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/layer/layer.js"
	type="text/javascript"></script>
<script type="text/javascript">
        function check() {
            var username = $("#username").val();
            var userId = $("#userId").val();
            var password = $("#password").val();
            var password_2 = $("#password_2").val();
            var identity = $('input[name="identity"]:checked').val();
            if (username == null || username.length < 2 || username.length > 5) {
                alert("姓名为2-5位字符或数字");
                return false;
            }
            else if (userId == null || userId.length < 6 || userId.length > 15) {
                alert("账号为6-15位数字或字母");
                return false;
            }
            else if (password == null || password.length < 6 || password.length > 15) {
                alert("密码为6-15位数字或字符");
                return false;
            }
            else if (password != password_2) {
                alert("两次输入的密码不同");
                return false;
            } else {

                $.ajax({
                    type: 'post',
                    url: 'register',
                    async: false,
                    data: {
                        'username': username,
                        'password': password,
                        'userId': userId,
                        'identity': identity
                    },
                    success: function (result) {

                        var option = parseInt(result);
                        if (option == 0) alert("账号已存在");
                        else if (option == 1) {
                            layer.msg(username + " 注册成功");
                            window.location.href = "login";
                        }
                    },
                    error: function () {
                        alert("error");
                    }
                });

            }

            return true;
        }
    </script>
</head>
<body>
	<div class="register">
		<h2 class="header_tiltle">欢迎来到学习打卡系统</h2>
		<form id="msform">
			<input type="text" name="userId" id="userId" placeholder="账号" />
			<div class="message">账号为6-15位数字或字母</div>
			<input type="text" id="username" name="username" placeholder="姓名" />
			<div class="message">姓名为2-5位字符或数字</div>
			<input type="password" name="password" id="password" placeholder="密码" />
			<div class="message">密码为6-15位数字或字符</div>
			<input type="password" name="password2" id="password_2"
				placeholder="再次输入密码" />
			<div class="message">再次输入密码</div>
			<div class="id">
				<input type="radio" name="identity" value="1" checked>学生 <input
					type="radio" name="identity" value="2">老师
			</div>
			<input class="button" type="button" onclick="check()" value="注册">
			<!-- 注意要将type="submit" -->
		</form>
	</div>
</body>
</html>
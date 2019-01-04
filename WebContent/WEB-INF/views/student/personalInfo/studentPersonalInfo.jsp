<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>个人信息</title>
<meta http-equiv="Expires" content="0">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<meta name="" content="" charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1">

<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css">

<script>
	$(document).ready(function() {
		personalInfo();
	})

	function personalInfo() {
		$.ajax({
			type : 'post',
			url : 'studentInfo',
			async : false,
			data : {
				'planType' : '1'
			},
			success : function(result) {

				var student = result;

				$("#userID")[0].innerHTML = student.studentNo;
				$("#userName")[0].innerHTML = student.studentName;
				if (student.studentSex == null) {
					$("#sex")[0].innerHTML = "";
				} else
					$("#sex")[0].innerHTML = student.studentSex;

				if (student.major == null) {
					$("#major")[0].innerHTML = "";
				} else
					$("#major")[0].innerHTML = student.major;

				if (student.coin == null) {
					$("#coin")[0].innerHTML = "";
				} else
					$("#coin")[0].innerHTML = student.coin;

				if (student.headImage != null) {
					$("#header").attr("src",
							"<%=request.getContextPath()%>/resources/images/userPhoto/student/" + student.headImage);

					$("#headerPicture").attr("src",
							"<%=request.getContextPath()%>/resources/images/userPhoto/student/"
									+ student.headImage);
				}

				$("#userNames").val(student.studentName);
				$("#passwords").val(student.studentPassword);
				$("#coins").val(student.coin);
				$("#majors").val(student.major);

				if (student.studentSex == "女")
					$("#female").attr("checked", true);//设置radio选中

			},
			error : function() {
				alert('ERROR!');
			},
		});
	}

	function headerPic() {

		// 获取上传文件对象
		var file = $('#pic')[0].files[0];
		// 读取文件URL
		var reader = new FileReader();
		reader.readAsDataURL(file);
		// 阅读文件完成后触发的事件
		reader.onload = function() {
			// 读取的URL结果：this.result
			$("#headerPicture").attr("src", this.result);
		}
	}
	function submitForm() {

		////alert($('#updateForm')[0].files[0]);

		var userNames = $('#userNames').val();
		var passwords = $('#passwords').val();
		var Emails = $('#Emails').val();
		var sex = $('input[name="sex"]:checked').val();
		var file = $('#pic')[0].files[0];
		var title = $("#titles").val();

		var formData = new FormData($('#updateForm')[0]);
		/* 	formData.append('userNames', userNames);
			formData.append('passwords', passwords);
			formData.append('Emails', Emails);
			formData.append('sex', sex);
			formData.append('title', title);
			formData.append('file', file);
			formData.append('rand', new Date().getTime());
		 */
		$.ajax({
			type : 'post',
			url : 'updateStudentInfo',
			async : false,
			data : formData,
			cache : false,
			contentType : false,
			processData : false,
			success : function(result) {
				history.go(0);//清除浏览器缓存,刷新,请求后台

			},
			error : function() {
				alert('ERROR!');
			}
		});
	}
</script>
<style>

</style>
</head>
<body>
	<nav class="navbar-inverse visible-lg visible-md" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">学习计划打卡系统</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="#">个人信息</a></li>
					<li><a href="http://localhost:8080/studyPlan/choose">计划池</a></li>
					<li><a href="http://localhost:8080/studyPlan/punch">计划打卡</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row" style="background: #EEEEEE;">
			<!-- 左侧 -->
			<div class="col-sm-2">
				<div class="panel-body">
					<img id="header"
						src="<%=request.getContextPath()%>/resources/images/userPhoto/person.jpg"
						class="img-responsive img-circle img-thumbnail " alt="Me">
					<!--<p class="text-center text-primary">tangweiyang</p>-->
				</div>
			</div>
			<!-- 右侧 -->
			<div class="col-sm-9">
				<div class="panel-group" id="accoradion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title">
								<a href="#collapseOne" data-toggle="collapse"
									data-parent="#accoradion">账号信息</a>
							</div>
							<div id="collapseOne" class="panel-collapse ">
								<div class="panel-body">
									<ul class="list-group">
										<li class="list-group-item list-group-item-info">
											<div class="row">
												<div class="col-sm-2">
													<span class="glyphicon glyphicon-lock">账号</span>
												</div>
												<div class="col-sm-4" id="userID"></div>
											</div>
										</li>

										<li class="list-group-item list-group-item-info">
											<div class="row">
												<div class="col-sm-2">
													<span class="glyphicon glyphicon-user">姓名</span>
												</div>
												<div class="col-sm-4" id="userName"></div>

											</div>
										</li>

										<li class="list-group-item list-group-item-info">
											<div class="row">
												<div class="col-sm-2">
													<span class="glyphicon glyphicon-leaf">性别</span>
												</div>
												<div class="col-sm-3" id="sex"></div>
											</div>
										</li>
										<li class="list-group-item list-group-item-info">
											<div class="row">
												<div class="col-sm-2">
													<span class="glyphicon glyphicon-edit">专业</span>
												</div>
												<div class="col-sm-3" id=major></div>
											</div>
										</li>

										<li class="list-group-item list-group-item-info">
											<div class="row">
												<div class="col-sm-2">
													<span class="glyphicon glyphicon-envelope">积分</span>
												</div>
												<div class="col-sm-3" id="coin"></div>
											</div>
										</li>

									</ul>
									<div style="text-align: right;">
										<button class="btn btn-primary" style="text-align: right;"
											data-toggle="modal" data-target="#myModal">修改个人信息</button>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>



	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
				</div>
				<div class="container">
					<div class="col-sm-2">
						<img class="img-responsive img-circle img-thumbnail "
							id="headerPicture" alt="Me">
					</div>

					<div id="" class=" col-sm-4">
						<form id="updateForm" enctype="multipart/form-data"
							action="updateStudentInfo" method="post">
							<div class="rows">
								<label>姓名:</label> <input type="text" placeholder="姓名"
									class="form-control" name="userNames" id="userNames" value=" ">
							</div>
							<div class="rows">
								<label>密码:</label> <input type="password" placeholder="密码"
									class="form-control" name="passwords" id="passwords" value="">
							</div>
							<div class="rows">
								<label>专业:</label> <input type="text" placeholder="专业"
									class="form-control" name="majors" id="majors" value="">
							</div>
							<div class="rows">
								<label>性别:</label> <input type="radio" name="sex" value="男"
									checked id="male">男 <input type="radio" name="sex"
									value="女" id="female">女
							</div>
							<div class="rows ">
								<label for="pic" class="btn btn-default">更换头像</label> <input
									type="file" accept="image/gif, image/jpeg,image/jpg,image/png"
									class="btn btn-default" style="display: none;"
									onchange="headerPic(this)" id="pic" name='pic' value="" />
							</div>
						</form>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						取消</button>
					<button type="submit" onclick="submitForm();"
						class="btn btn-primary">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- end 模态层 -->

</body>
</html>

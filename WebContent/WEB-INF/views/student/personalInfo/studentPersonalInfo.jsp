<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>学生个人信息</title>
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
<script src="<%=request.getContextPath()%>/resources/layer/layer.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		personalInfo();
		findAllMajor();
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
					var headImage="<%=request.getContextPath()%>/uploads/headImage/student/"
									+ student.headImage;
							$("#header").attr("src", headImage);
							$("#headerPicture").attr("src", headImage);
						}
						$("#userNames").val(student.studentName.trim());
						$("#passwords").val(student.studentPassword.trim());
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
	
	function findAllMajor() {
		$.ajax({
			type : 'post',
			url : 'findAllMajor',
			async : false,
			data : {},
			success : function(result) {

				var major = result;
				$("#majors").empty();
				for ( var i in major)
					$("#majors").append(
							"<option value="+i+">"
									+ major[i].major
									+ "</option>");

			},
			error : function() {
				alert("error");
			}
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
		var majors = $("#majors").val();

		if (userNames == null || userNames == "") {
			layer.msg("用户名不能为空");
			return false;
		} else if (passwords == null || passwords == "") {
			layer.msg("密码不能为空");
			return false;
		} else if (majors == null || majors == "") {
			layer.msg("专业不为空");
		} else {
			var formData = new FormData($('#updateForm')[0]);
			$.ajax({
				type : 'post',
				url : 'updateStudentInfo',
				async : false,
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				success : function(result) {
					layer.msg("个人信息修改成功");
					history.go(0);//清除浏览器缓存,刷新,请求后台
				},
				error : function() {
					alert('ERROR!');
				}
			});
		}

	}
</script>
<style>
body {
	padding-top: 70px;
}
</style>
</head>
<body>

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
								<label>专业:</label> <select id="majors" name="majors"
									class="form-control">
									<option>计算机科学与技术</option>
									<option>通信工程 </option>
									<option>电子科学与技术</option>
								</select>
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
									onchange="headerPic(this)" id="pic" name='uploadFile' value="" />
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

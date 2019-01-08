<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学习计划打卡系统教师端</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-table.css">
<link href="<%=request.getContextPath()%>/css/content.css"
	rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table-zh-CN.js"></script>

<script src="<%=request.getContextPath()%>/js/tableExport.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table-export.js"></script>
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	function iframeSet(path) {
		$('iframe').attr('src', path);
	}
	function iframeHistory(n) {

		window.history.go(n);
	}
	function refresh() {
		window.location.reload();
	}
</script>
</head>

<body>
	<div class="header">
		<img class="header_icon"
			src="<%=request.getContextPath()%>/images/clock.jpg" width="100px"
			height="90px" alt="" /> <img
			src="<%=request.getContextPath()%>/images/banner_font.png" alt="" />
	</div>
	<div class="top_menu">
		<ul>
			<li id="first"><a href="/studyPlan/index.html" target="_blank">首页</a></li>
			<li><a href="#" onclick="iframeHistory(-1)">后退</a></li>
			<li><a href="#" onclick="refresh()">刷新</a></li>
			<li><a href="/studyPlan/exits">退出登录</a></li>
		</ul>
	</div>
	<div class="container">

		<div class="left_menu">
			<div class="left_menu_header">功能列表</div>
			<ul>
				<!-- <li class="system"><img src="./images/left/system.png" alt="" /><a href="#" target="target= _blank">个人信息<a></li> -->
				<li><img
					src="<%=request.getContextPath()%>/images/left/custom.png" alt="" />个人信息
					<ul>
						<li><a href="#" onclick="iframeSet('/studyPlan/teacherInfo')">个人信息</a></li>
						
					</ul></li>
				<li><img
					src="<%=request.getContextPath()%>/images/left/plan.jpg" alt="" />计划发布
					<ul>
						<li><a href="#" target="_self"
							onclick="iframeSet('/studyPlan/planPublish')">计划发布</a></li>

					</ul></li>
				<li><img
					src="<%=request.getContextPath()%>/images/left/cloud.png" alt="" />计划浏览
					<ul>
						<li><a href="#" target="_self"
							onclick="iframeSet('/studyPlan/checkWorkPlanType')">计划浏览</a></li>
					</ul></li>
				<li><img
					src="<%=request.getContextPath()%>/images/left/cloud.png" alt="" />学生打卡统计
					<ul>
						<li><a href="#" target="_self"
							onclick="iframeSet('/studyPlan/planList')">学生打卡统计</a></li>
					</ul></li>
				<li><img
					src="<%=request.getContextPath()%>/images/left/coin.jpg" alt="" />计划验收
					<ul>
						<li><a href="#" target="_self"
							onclick="iframeSet('/studyPlan/checkWorkPlanType')">计划验收</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- 左边菜单栏结束 -->

		<div class="content">

			<!-- 我们的个人信息啊 好友信息啊 积分信息啊 都写在这里 -->
			<iframe src="/studyPlan/teacherInfo" width="100%" height="100%"></iframe>
		</div>
		<!-- 正文部分 -->

	</div>
</body>
</html>


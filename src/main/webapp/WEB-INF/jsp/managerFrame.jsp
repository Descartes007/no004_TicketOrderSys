<%@ page import="com.tos.util.Constants" %>
<%@ page import="com.tos.pojo.Manager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--包含导航栏所用的css-start--%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/style.css" >
<link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
<%--包含导航栏所用的css-end--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/page.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js" ></script>

<title>后台管理</title>
</head>
<body>
	<div id="left">
		<div class="bigTitle">机票预订后台管理系统</div>

		<div id="left-menu">
			<div class="sub-left-menu scroll" style="width: 20%;">
				<ul class="nav nav-list">

					<li class="active ripple"><a class="tree-toggle nav-header"><span
							class="fa-home fa"></span>航班信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
						<li><a target="frame" href="${pageContext.request.contextPath}/flight/toFlightInsert">添加航班信息</a></li>
							<li><a target="frame" href="${pageContext.request.contextPath}/flight/toFlightList">航班信息列表</a></li>
							<li><a target="frame" href="${pageContext.request.contextPath}/flight/toFlightStatistics">航班预定情况</a></li>
						</ul>
					</li>
					<li class="ripple"><a class="tree-toggle nav-header"> <span
							class="fa-diamond fa"></span>机票信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span>
					</a>
						<ul class="nav nav-list tree">
							<li><a target="frame" href="${pageContext.request.contextPath}/ticket/toTicketList">机票信息列表</a></li>
						</ul>
					</li>
					<li class=" ripple"><a class="tree-toggle nav-header"><span
							class="fa fa-check-square-o"></span>用户信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
							<li><a target="frame" href="${pageContext.request.contextPath}/admin/toPassengerList">用户信息列表</a></li>
						</ul>
					</li>
<%--					<li class=" ripple"><a class="tree-toggle nav-header"><span class="fa fa-calendar-o"></span></span>留言评论管理<span--%>
<%--							class="fa-angle-right fa right-arrow text-right"></span> </a>--%>
<%--						<ul class="nav nav-list tree">--%>
<%--							<li><a target="frame" href="javascript:;">查看留言列表</a></li>--%>
<%--						</ul>--%>
<%--					</li>--%>
				</ul>
			</div>
		</div>

	</div>
	
	<div id="right">
		<div id="right_top">
			<div class="leftTiyle" id="flTitle"></div>
			<div class="thisUser">
				当前用户：<%=((Manager)session.getAttribute(Constants.MANAGER_SESSION)).getUserName() %>
				<div class="logout"><a href="${pageContext.request.contextPath}/admin/logout">退出</a></div>
			</div>
			
		</div>
		<div id="right_bottom">
			<iframe name="frame" scrolling="auto" width="100%" height="100%" frameborder="0" src="${pageContext.request.contextPath}/admin/toWelcomeManager"></iframe>
		</div>
	</div>
		
	
<%--包含导航栏所用的js-start--%>
<script src="${pageContext.request.contextPath}/static/asset/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/asset/js/plugins/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/static/asset/js/main.js"></script>
<%--包含导航栏所用的js-end--%>
</body>
</html>
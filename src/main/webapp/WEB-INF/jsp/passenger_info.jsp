<%@ page import="com.tos.util.Constants" %>
<%@ page import="com.tos.pojo.Passenger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/core.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
</head>
<body>

	<div class="ydc-content-slide ydc-body">
		<div class="ydc-flex">

			<!-- right begin -->
			<div class="ydc-column ydc-column-8">
				<div class="ydc-release-content">
					<div class="ydc-tabPanel ydc-tabPanel-release">
						<div class="ydc-release-tab-head">
							<ul>
								<li class="hit">帐号设置</li>
							</ul>
						</div>
						<div class="ydc-panes">
							<div class="ydc-pane ydc-pane-clear" style="display: block;">
								<%Passenger passenger = (Passenger)session.getAttribute(Constants.Passenger_SESSION); %>
								<div class="ydc-reg-form-group clearfix">
									<label>帐号头像</label>
									<div class="ydc-reg-form-input">
										<label></label>
										<div class="ydc-reg-form-text ydc-reg-form-user-logo">
											<img src="${pageContext.request.contextPath}<%=passenger.getAvatarImg() %>" alt="">
										</div>
									</div>
								</div>


								<div class="ydc-reg-form-group clearfix">
									<label>昵称</label>
									<div class="ydc-reg-form-input">
										<label><%=passenger.getNickName() %></label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>姓名</label>
									<div class="ydc-reg-form-input">
										<label><%=passenger.getPassengerName() %></label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>所在城市</label>
									<div class="ydc-reg-form-input">
										<label><%=passenger.getCity() %></label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>身份证号</label>
									<div class="ydc-reg-form-input">
										<label><%=passenger.getCardId() %></label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>联系手机</label>
									<div class="ydc-reg-form-input">
										<label><%=passenger.getPhone() %> 已验证</label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>邮箱</label>
									<div class="ydc-reg-form-input">
										<label><%=passenger.getEmail() %></label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>QQ/微信</label>
									<div class="ydc-reg-form-input">
										<label><%=passenger.getWechat() %></label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix"
									style="margin-top: 40px;">
									<div class="ydc-reg-form-button" style="margin-left: 255px;">
										<a class="btn fl" href="${pageContext.request.contextPath}/passenger/toEditInfo">修改</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- right end -->
		</div>
	</div>

</body>
</html>
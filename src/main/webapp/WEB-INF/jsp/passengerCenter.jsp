<%--
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Book Insert</title>
</head>
<body>
<h3>请输入机票信息：</h3>
<% if(request.getAttribute("result")!=null) {
    out.print(request.getAttribute("result"));
}
%>
<a href="${pageContext.request.contextPath}/flight/toFlightQuery">查询航班</a>
<a href="${pageContext.request.contextPath}/ticket/toTicketPage">查看机票</a>
<a href="${pageContext.request.contextPath}/note/toNotePage">查看取票通知</a>
<a href="${pageContext.request.contextPath}/bill/toBillPage">查看账单</a>

<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
</body>
</html>--%>
<%@ page import="com.tos.util.Constants" %>
<%@ page import="com.tos.pojo.Passenger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户中心</title>
    <link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/core.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/icon.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
</head>
<body>

<div class="ydc-entered" style="height:11%;width:100%;">
    <div class="ydc-header-content ydc-flex">

        <div class="ydc-column">
            <div class="ydc-column-user">
                <div class="ydc-user-photo">
                    <a href="javascript:;">
                        <img src="${pageContext.request.contextPath}<%=((Passenger)session.getAttribute(Constants.Passenger_SESSION)).getAvatarImg() %>" title="" alt="">
                    </a>
                </div>
                <div class="ydc-user-info">

                    <div class="ydc-user-info-func ydc-flex">
                        <span class="ydc-mal"><i
                                class="ydc-icon ydc-icon-mail fl"></i><em>0</em></span>
                        <%--							<a href="/jsp_plane_ticket_book/index/logout.jsp">退出</a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="ydc-content-slide ydc-body" style="height:86%;">
    <div class="ydc-flex" style="height:100%;">
        <!-- left begin -->
        <div class="ydc-column ydc-column-2">
            <div class="ydc-menu">
                <ul>
                    <li class="ydc-menu-item">
                        <span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-home fl"></i>首页
						</span>
                        <ul>
                            <li><a target="frame" href="${pageContext.request.contextPath}/passenger/toPassengerInfo">个人资料</a></li>
                            <li><a target="frame" href="${pageContext.request.contextPath}/passenger/toEditInfo">修改信息</a></li>
                        </ul>
                    </li>

                    <li class="ydc-menu-item">
							<span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-record fl"></i>机票
							</span>
                        <ul>
                            <li><a target="frame" href="${pageContext.request.contextPath}/ticket/toTicketPage">机票列表</a></li>
                        </ul>
                    </li>

                    <li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-file fl"></i>管理
						</span>
                        <ul>
                            <li><a target="frame"  href="${pageContext.request.contextPath}/bill/toBillPage">查看账单</a></li>
                        </ul>
                        <ul>
                            <li><a target="frame"  href="${pageContext.request.contextPath}/note/toNotePage">取票通知</a></li>
                        </ul>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/home/toIndex">返回首页</a></li>
                        </ul>
                    </li>


                </ul>
            </div>
        </div>
        <!-- left end -->

        <!-- right start -->
        <div style="width:76%;height:100%;">
            <iframe name="frame" scrolling="auto" width="100%" height="100%" frameborder="0" src="${pageContext.request.contextPath}/passenger/toPassengerInfo"></iframe>
        </div>
        <!-- right end -->
    </div>
</div>

</body>
</html>

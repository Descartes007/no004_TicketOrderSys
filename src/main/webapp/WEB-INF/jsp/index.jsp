<%--原始index--%>
<%--<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<form method="get" action="${pageContext.request.contextPath }/passengerLogin.do">
  <input name="method" value="searchFlight" class="input-text" type="hidden">



  <a href="${pageContext.request.contextPath}/manager/toLogin">管理员登录</a>
  <a href="${pageContext.request.contextPath}/passenger/toLogin">旅客登录</a>
  <a href="${pageContext.request.contextPath}/flight/toFlightQuery">航班查询</a>
</form>
</body>
</html>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.tos.util.Constants" %>
<%@ page import="com.tos.pojo.Passenger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%
    //添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
    session.setAttribute("url", request.getRequestURI());
%>--%>
<html>

<head>
    <meta charset="UTF-8">
    <title>机票预订系统</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/corptravel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/enterprise.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/iconfont.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/IconOfIndex.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script>
        var path = $("#path").val();
        function myfunction() {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/flight/loadCity",
                data: {},
                dataType: "json",
                // success:function(data){
                //
                //
                //     console.log(data);
                //     var target1 = document.getElementById("src");
                //     var target2 = document.getElementById("dst");
                //
                //     $('#dst').empty();
                //     $('#src').empty();
                //
                //     if (data) {
                //         target2.options.add(new Option('请选择',''));
                //         for (var i = 0; i < data.length; i++) {
                //             var item = new Option(data[i]);
                //             //将列表中的内容加入到第二个下拉框
                //             target2.options.add(item);
                //         }
                //     }
                //     if (data) {
                //         target1.options.add(new Option('请选择',''));
                //         for (var i = 0; i < data.length; i++) {
                //             var item = new Option(data[i]);
                //             //将列表中的内容加入到第二个下拉框
                //             target1.options.add(item);
                //
                //         }
                //     }
                //
                //
                //
                //
                // },
                error: function (data) {
                    alert("对不起，操作失败");
                }
            });

            <%--$.post(${pageContext.request.contextPath}/flight/getFlights,'srcCity':'5200','dstCity':5200,'querydate':'2222-6-7');--%>

        }
    </script>
</head>


<body class="bg-body" style="background:url('${pageContext.request.contextPath}/static/images/background5.jpg');background-repeat:no-repeat ;
      background-size:100% 100%;
      background-attachment: fixed;"
      onload="myfunction()">

<!-- header -->
<nav class="navbar navbar-resources navbar-fixed-top bg-white" style="display:block;">

    <nav class="navbar navbar-resources"
         style="min-height: 30px; line-height: 30px; margin-bottom: 0px; border-radius: 0;">
        <div class="container bg-gray-eee box-shadow" style="display: block; background-color: rgba(200,200,200,0.42); width:100%;">
            <div style="background-color: #c53939;">
                <div class="topMesh">
                    <ul class="nav navbar-nav nav-top-small" style="margin-left: -15px;">
                        <li class="dropdown">
                            <% if (session.getAttribute(Constants.Passenger_SESSION) != null) { %>
                            <a href="javacript:none" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">
                                您好，<%=((Passenger) session.getAttribute(Constants.Passenger_SESSION)).getNickName() %>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/passenger/logout">退出</a></li>
                            </ul>
                            <%} else { %>
                            <a href="${pageContext.request.contextPath}/passenger/toLogin" class="dropdown-toggle"
                               role="button"
                               aria-haspopup="true" aria-expanded="false">
                                登录
                            </a>
                            <%} %>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right nav-top-small">
                        <li class="dropdown">
                            <a class="dropdown-toggle"> 留言板 </a>
                        </li>

                    </ul>
                </div>

            </div>
        </div>
        <div class="container font12">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed"
                        data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                        aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span>
                </button>
            </div>
        </div>
    </nav>

<%--    首页导航栏 首页 旅客中心 后台管理--%>
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class=" " href="${pageContext.request.contextPath}/WEB-INF/jsp/index.jsp"><img
                    src="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png"
                    width="70" height="70" alt="系统LOGO" class="pull-left mar-right-30"
                    style="margin-left: -15px;"></a>

        </div>


        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="javascript:none"><i
                        class="icon iconfont icon-shouye font24"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/passenger/toPassengerCenter"><i
                        class="icon iconfont icon-yonghu font24"></i> 旅客中心</a></li>

                <li><a href="${pageContext.request.contextPath}/admin/toManagerFrame"><i
                        class="icon iconfont icon-houtai font24"></i> 后台管理</a></li>

            </ul>
        </div>

    </div>

</nav>


<div class="container mar-bottom-30 " style="background:white no-repeat;width:100%;height:100px;">
</div>

<!-- header end -->
<!-- 搜索 -->
<div class="index-wall white " style="margin-top: -20px;display:block;">
    <div class="container"
         style="position: relative; text-align: center; width: auto;">
        <form class="form-inline" action="${pageContext.request.contextPath}/flight/getFlights" method="post">
            <%--				<div class="form-group">
                                <select name="" class="form-control">
                                    <option selected>单程</option>
                                    <option>往返</option>
                                </select>
                            </div>--%>
            <div class="form-group mar-left-10">
                <label for="">出发城市</label>
                <select name="srcCity" value="${srcCity}" id="src" class="form-control" style="width: 100px;"
                        placeholder="出发城市" selected="selected">
                    <option value="">请选择</option>
                    <c:if test="${cityList != null }">
                        <c:forEach var="city" items="${cityList}">
                            <option
                                    <c:if test="${city == srcCity }">selected="selected"</c:if>
                                    value="${city}">${city}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div class="form-group">
                <label for=""> — <a href="#" class="huan">换</a> —
                </label>
            </div>
            <div class="form-group">
                <label for="">到达城市</label>
                <select name="dstCity" value="${dstCity}" id="dst" class="form-control" style="width: 100px;"
                        placeholder="到达城市" selected="selected">
                    <option value="">请选择</option>
                    <c:if test="${cityList != null }">
                        <c:forEach var="city" items="${cityList}">
                            <option
                                    <c:if test="${city == dstCity }">selected="selected"</c:if>
                                    value="${city}">${city}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div class="form-group">
                <label for="">日期</label> <input type="date" name="queryDate" class="form-control"
                                                style="width: 160px;" id=""
                                                value="<fmt:formatDate value="${queryDate}" pattern="yyyy-MM-dd"/>"/>
            </div>
            <button type="submit" class="btn btn-warning mar-left-10">查询</button>
        </form>
    </div>
</div>
<!-- 搜索结束 -->


<!-- 列表开始 -->
<c:if test="${pageInfo.list != null }">
    <div class="container mar-bottom-30 ">
        <c:forEach var="flight" items="${pageInfo.list }" varStatus="status">
            <div class="hangbanlist">
                <div>
                    <!-- 表头 -->
                    <ul class="list-inline bor-bottom-solid-1  ">
                        <li class="w-percentage-25"><i class="icon iconfont icon-feiji2"  style="width:80px;height:80px; color:indianred;" ></i>
                                                         <strong>航班</strong> ${flight.id}<span
                                class="gray-999 font12 mar-left-10">机型：${flight.getSizeStr()}</span></li>
                        <li class="text-right w80"><strong class="time "><fmt:formatDate value="${flight.startTime}"
                                                                                         pattern="MM-dd"/></strong></li>
                        <li class="text-right w80"><strong class="time "><fmt:formatDate value="${flight.startTime}"
                                                                                         pattern="HH:mm"/></strong></li>
                        <li class="">——</li>
                        <li class="w80"><strong class="time "><fmt:formatDate value="${flight.endTime}"
                                                                              pattern="MM-dd"/></strong></li>
                        <li class="w80"><strong class="time "><fmt:formatDate value="${flight.endTime}"
                                                                              pattern="HH:mm"/></strong></li>
                        <li class="w100 text-right">${flight.srcAirport}</li>
                        <li class="">——</li>
                        <li class=" w100">${flight.dstAirport}</li>

                    </ul>
                    <!-- 表头结束 -->
                    <!-- 表BODY -->
                    <div class="collapse" id="collapseExample" style="display: block;">
                        <div class="hangbanlist-body " style="background-color: #FEFCFC;">
                            <ul class="list-inline">
                                <li class="w-percentage-20"><strong class="blue-0093dd">头等舱(F)</strong></li>
                                <li class="w-percentage-25">座位数:&nbsp${flight.advancedNum}</li>
                                <li class="w-percentage-25">剩余:&nbsp${flight.advancedNum-flight.advancedCount}</li>
                                <li class="w-percentage-20 ">优惠价:&nbsp<strong
                                        class="rmb orange-f60 font16">￥${flight.advancedPrice}</strong></li>

                                <li class="pull-right ">
                                    <form class="btn btn-danger btn-sm" method="post"
                                          action="${pageContext.request.contextPath}/ticket/toConfirmBook">
                                        <input type="hidden" name="flightId" value="${flight.id}"/>
                                        <input type="hidden" name="seatType" value="1"/>
                                        <input style="background-color: transparent;border: none;" type="submit"
                                               value="订票">
                                    </form>
                                </li>
                            </ul>
                            <ul class="list-inline">
                                <li class="w-percentage-20"><strong class="blue-0093dd">经济舱(E)</strong></li>
                                <li class="w-percentage-25">座位数:&nbsp${flight.economicNum}</li>
                                <li class="w-percentage-25">
                                    剩余:&nbsp${flight.economicNum-(flight.seatCount-flight.advancedCount)}</li>
                                <li class="w-percentage-20 ">优惠价:&nbsp<strong
                                        class="rmb orange-f60 font16">￥${flight.economicPrice}</strong></li>
                                <li class="pull-right ">
                                    <form class="btn btn-danger btn-sm" method="post"
                                          action="${pageContext.request.contextPath}/ticket/toConfirmBook">
                                        <input type="hidden" name="flightId" value="${flight.id}"/>
                                        <input type="hidden" name="seatType" value="2"/>
                                        <input style="background-color: transparent;border: none;" type="submit"
                                               value="订票">
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- 表BODY 结束 -->
                </div>
            </div>

        </c:forEach>
        <!--显示分页信息-->
        <div class="modal-footer no-margin-top">
            <div class="col-md-6">
                当前第 ${pageInfo.pageNum}页,共 ${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录
            </div>

            <ul class="pagination pull-right no-margin">
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/flight/getFlights?pageNum=1&srcCity=${srcCity}&dstCity=${dstCity}&queryDate=${queryDate}">首页</a>
                    </li>
                </c:if>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/flight/getFlights?pageNum=${pageInfo.prePage}&srcCity=${srcCity}&dstCity=${dstCity}&queryDate=${queryDate}">
                            <i class="ace-icon fa fa-angle-double-left"></i>
                        </a>
                    </li>
                </c:if>
                <!--遍历条数-->

                <c:forEach var="nav" items="${pageInfo.navigatepageNums}" varStatus="status">
                    <li>
                        <c:if test="${nav != pageInfo.pageNum}">
                            <a href="${pageContext.request.contextPath}/flight/getFlights?pageNum=${nav}&srcCity=${srcCity}&dstCity=${dstCity}&queryDate=${queryDate}" >${nav}</a>
                        </c:if>
                        <c:if test="${nav == pageInfo.pageNum}">
                            <span style="font-weight: bold;background: #6faed9;" >${nav}</span>
                        </c:if>
                    </li>
                </c:forEach>


                <c:if test="${pageInfo.hasNextPage}">
                    <li class="next">
                        <a href="${pageContext.request.contextPath}/flight/getFlights?pageNum=${pageInfo.nextPage}&srcCity=${srcCity}&dstCity=${dstCity}&queryDate=${queryDate}">
                            <i class="ace-icon fa fa-angle-double-right"></i>
                        </a>
                    </li>
                    <span style="font-weight: bold;background: #6faed9;" >${nav}</span>
                </c:if>

                <li>
                    <a href="${pageContext.request.contextPath}/flight/getFlights?pageNum=${pageInfo.pages}&srcCity=${srcCity}&dstCity=${dstCity}&queryDate=${queryDate}">尾页</a>
                </li>
            </ul>
        </div>

    </div>
</c:if>


<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/notePage.js"></script>


</body>
</html>


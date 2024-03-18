<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/16
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/corptravel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/enterprise.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/iconfont.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/IconOfIndex.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <title>确认买票</title>
</head>
<body >
<%
    String bookResult = (String) request.getAttribute("bookResult");         // 获取错误属性
    if (bookResult != null) {
%>
<%--        输出插入信息--%>
<script type="text/javascript" language="javascript">
    alert("<%=bookResult%>");
    window.location="${pageContext.request.contextPath}/passenger/toPassengerCenter";// 弹出错误信息     // 跳转到登录界面
</script>
<%
    }
%>



<div class="container bg-gray-eee box-shadow mar-bottom-30"
     style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">

    <table border="0" cellspacing="0" cellpadding="0"
           class="table table-hover table-striped font12 table-bordered v-align-top"
           style="table-layout:fixed;word-wrap:break-word;text-align: center">
        <tr class="firstTr">
            <th width="10%">航班号</th>
            <th width="25%">航班路线</th>
            <th width="12%">出发时间</th>
            <th width="12%">到达时间</th>
            <th width="10%">座位类型</th>
            <th width="15%">价格</th>

        </tr>

        <tr>
            <td style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;"><h3>${flight.id}</h3></td>
            <td>
                <h3 >${flight.srcAirport}------>${flight.dstAirport}</h3>
            </td>
            <td>
                <li class="text-right w80"><strong class="time "><fmt:formatDate value="${flight.startTime}"
                                                                                 pattern="MM-dd"/></strong></li>
                <li class="text-right w80"><strong class="time "><fmt:formatDate value="${flight.startTime}"
                                                                                 pattern="HH:mm"/></strong></li>
            </td>
            <td>
                <li class="text-right w80"><strong class="time "><fmt:formatDate value="${flight.endTime}"
                                                                                 pattern="MM-dd"/></strong></li>
                <li class="text-right w80"><strong class="time "><fmt:formatDate value="${flight.endTime}"
                                                                                 pattern="HH:mm"/></strong></li>
            </td>
            <td><h3>${Type}</h3></td>
            <td>
                <h3 style="color: orange">￥${price}</h3>
            </td>
        </tr>

    </table>

</div>
<div class="text-center" style="margin:20px;">


<%--    --%>
    <form class="btn btn-danger btn-sm" method="post" style="background-color:#a8bfda;border:none;height:32px;">
        <input type="button" name="Submit" onclick="javascript:history.back(-1);" style="background-color:transparent;border: none;"  value="返回上一页">
    </form>



    <form class="btn btn-danger btn-sm" method="post"
          action="${pageContext.request.contextPath}/flight/bookFlight">
        <input type="hidden" name="flightId" value="${flight.id}"/>
        <input type="hidden" name="seatType" value="${seatType}"/>

        <input style="background-color:transparent;border: none;" type="submit" style="width:200px;"
               value="确认订票">
    </form>
</div>


<script src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js"></script>
<script>
    function getFlight() {
        alert("1314");
    }

    let flightId = document.getElementById("seatType");
    alert(flightId.value);
    <%--$.ajax({--%>
    <%--    type: "POST",--%>
    <%--    url: "${pageContext.request.contextPath}/flight/getFlightById",--%>
    <%--    data: {'flightId':flightId},--%>
    <%--    dataType: "json",--%>
    <%--    success:function(data){--%>

    <%--        alert("yes")--%>

    <%--    },--%>
    <%--    error: function (data) {--%>
    <%--        alert("对不起，操作失败");--%>
    <%--    }--%>
    <%--});--%>

</script>


<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ticketPage.js"></script>
</body>
</html>

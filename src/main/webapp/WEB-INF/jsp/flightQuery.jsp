<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.tos.pojo.Flight" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/4/25
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flightQuery.css">
<head>
    <title>机票查询</title>
</head>
<body>
<div class="container">
    <div class="in-box">
        <form action="${pageContext.request.contextPath}/flight/getFlights" method="post">

            城市&nbsp
            <select name="srcCity" value='' class="m-wrap  " style="width: 80px; padding: 2px 0;">
                <option value="">请选择</option>
                <c:if test="${cityList != null }">
                    <c:forEach var="city" items="${cityList}">
                        <option <c:if test="${city == srcCity }">selected="selected"</c:if>
                                value="${city}">${city}</option>
                    </c:forEach>
                </c:if>
            </select>
            <i class="iconfont icon-xiangyou" style="color:rgb(78,110,242);size: 20px;"></i>
            <select name="dstCity" value='' id="dst" class="m-wrap " style="padding: 2px 0;">
                <option value="">请选择</option>
                <c:if test="${cityList != null }">
                    <c:forEach var="city" items="${cityList}">
                        <option <c:if test="${city == dstCity }">selected="selected"</c:if>
                                value="${city}">${city}</option>
                    </c:forEach>
                </c:if>
            </select>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp日期
            <input type="date" class="inputDay" name="queryDate" value="<fmt:formatDate value="${queryDate}" pattern="yyyy-MM-dd"/>" style="color: rgba(2,156,240,0)">&nbsp&nbsp&nbsp
            <button type="submit" class="" name="query">立即查询</button>


        </form>
    </div>
</div>


<script>
    function test() {
        let dst = document.getElementById("dst");
        alert(dst.value);
    }
</script>


<%--    显示查询结果--%>
<% String result = (String) request.getAttribute("result");
    if (result != "" && result != null) {
%>


<script type="text/javascript">
    alert("<%=result%>");
</script>

<%
    }
%>

<%
    ArrayList<Flight> flightBeans = (ArrayList<Flight>) request.getAttribute("flightList");
    SimpleDateFormat minite = new SimpleDateFormat("HH:mm");
    SimpleDateFormat day = new SimpleDateFormat("MM-dd");
    if (flightBeans != null) {

%>
<button class="button1">航班信息</button>
<button class="button2">起飞时间</button>
<button class="button3">到达时间</button>
<button class="button4">价格</button>
<%
    Iterator<Flight> iterator = flightBeans.iterator();
    while (iterator.hasNext()) {
        Flight flight = iterator.next();
%>


<table class="gridtable" id="table-1">
    <tr>
        <td style="font-size:20px"><%=flight.getAirline()%><td>

        <h5 style="font-size: 20px"><%=minite.format(flight.getStart_time())%></h5>
            <%=day.format(flight.getStart_time())%>
            <%=flight.getSrc_airport()%>
        <td>
            <h5 style="font-size: 20px"><%=minite.format(flight.getEnd_time())%></h5>
            <%=day.format(flight.getEnd_time())%>
            <%=flight.getDst_airport()%>
        </td>

        <td>
            <h5 style="font-size: 10px;color:rgb(252,167,39)"><%=flight.getEconomic_price()%>
        </td>


    </tr>


</table>


<%

            /* flight.getSrc_ariport()+"目的站: "+flight.getDst_airport()+"出发时间: "+minite.format(flight.getStart_time())+                "到达时间: "+minite.format(flight.getEnd_time())+"价格: "+flight.getEconomic_price());*/
        }

    }

%>


</body>
</html>
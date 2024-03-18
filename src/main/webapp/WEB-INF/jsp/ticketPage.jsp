<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flightQuery.css">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/corptravel.css" rel="stylesheet">

</head>

<body>
<script>
    function test() {
        let dst = document.getElementById("dst");
        alert(dst.value);
    }
</script>


<div class="container bg-gray-eee box-shadow mar-bottom-30"
     style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">

    <table border="0" cellspacing="0" cellpadding="0"
           class="table table-hover table-striped font12 table-bordered v-align-top" style="table-layout: fixed;word-wrap:break-word;">

        			<tr>
        				<form action="${pageContext.request.contextPath}/ticket/getTickets"  method="post">
        					<span>出发地&nbsp</span>
        					<select name="srcCity">
        						<option value="">请选择</option>
        						<c:if test="${cityList != null }">
        							<c:forEach var="city" items="${cityList}">
        								<option <c:if test="${city == srcCity }">selected="selected"</c:if>
        										value="${city}">${city}</option>
        							</c:forEach>
        						</c:if>
        					</select>
        					<span>&nbsp&nbsp&nbsp&nbsp&nbsp目的地&nbsp</span>
        					<select name="dstCity">
        						<option value="">请选择</option>
        						<c:if test="${cityList != null }">
        							<c:forEach var="city" items="${cityList}">
        								<option <c:if test="${city == dstCity }">selected="selected"</c:if>
        										value="${city}">${city}</option>
        							</c:forEach>
        						</c:if>
        					</select>
        					<span>&nbsp&nbsp&nbsp&nbsp&nbsp出发日期&nbsp</span>
        					<input  type="date" name="queryDate"  value="<fmt:formatDate value="${queryDate}" pattern="yyyy-MM-dd"/>" />
                            &nbsp&nbsp<button type ="submit" class="" name="query"style="color:white">查询</button>
        				</form>
        			</tr>
        <tr>
            <th style="width:10%;">机场</th>
            <th style="width:10%;!important;">机票id</th>
            <th style="width:10%;">航班id</th>
            <th style="width:10%;">座位号</th>
            <th style="width:15%;">出发时间</th>
            <th style="width:15%;">登机时间</th>
        </tr>
        <c:forEach var="ticket" items="${ticketList }" varStatus="status">
            <tr>
                <td>${ticket.srcAirport}</td>
                <td style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">${ticket.ticketId}</td>
                <td>${ticket.flightId}</td>
                <td>${ticket.seatId}</td>
                <td><fmt:formatDate value="${ticket.departureTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                <td><fmt:formatDate value="${ticket.boardTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                <td>
                    <input type="button" class="refund" value="退票" ticketId = "${ticket.ticketId}">
                </td>
            </tr>
        </c:forEach>

    </table>

</div>
<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ticketPage.js"></script>

</body>
</html>
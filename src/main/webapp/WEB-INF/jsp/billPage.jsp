<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看账单</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/corptravel.css" rel="stylesheet">
</head>
<body>
<div class="container bg-gray-eee box-shadow mar-bottom-30"
     style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">
    <table border="0" cellspacing="0" cellpadding="0" style="border-radius: 13px; table-layout:fixed;word-wrap:break-word;"
           class="table table-hover table-striped font12 table-bordered v-align-top">
    <tr class="firstTr">
        <th width="10%">账单id</th>
        <th width="22%">路线</th>
        <th width="10%">航班id</th>
        <th width="10%">姓名</th>

        <th width="10%">消费日期</th>
        <th width="10%">座位类型</th>
        <th width="10%">价格</th>

    </tr>
    <c:forEach var="bill" items="${billList }" varStatus="status">
        <tr id="${bill.billId}">
            <td style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">${bill.billId }</td>
            <td>${bill.route }</td>
            <td>${bill.flightId}</td>
            <td>${bill.name}</td>
            <td hidden>${bill.phone}</td>
            <td><fmt:formatDate value="${bill.consumeDate}" pattern="yyyy-MM-dd HH:mm"/></td>
            <td>${bill.seatType}</td>
            <td>${bill.price}</td>

            <td>
                <button class="downloadBill" >下载</button>
            </td>
            <td>
                <span><a class="deleteBill" href="javascript:;" billId="${bill.billId }">删除</a></span>
            </td>
        </tr>
    </c:forEach>
</table>
</div>
<%--<input type="hidden" id="totalPageCount" value="${totalPageCount}"/>--%>
<%--<c:import url="rollpage.jsp">--%>
<%--    <c:param name="totalCount" value="${totalCount}"/>--%>
<%--    <c:param name="currentPageNo" value="${currentPageNo}"/>--%>
<%--    <c:param name="totalPageCount" value="${totalPageCount}"/>--%>
<%--</c:import>--%>
<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/billPage.js"></script>
</body>
</html>

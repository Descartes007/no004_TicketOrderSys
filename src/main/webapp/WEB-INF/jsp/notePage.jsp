<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tos.pojo.Notification" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--<head>
    <title>取票通知</title>
</head>
<body>

<table class="noteTable" cellpadding="0" cellspacing="0">
    <tr class="firstTr">
        <th width="20%">通知id</th>
        <th width="20%">旅客id</th>
        <th width="10%">姓名</th>
        <th width="10%">电话</th>
        <th width="10%">最迟取票时间</th>
        <th width="10%">机场</th>
    </tr>
    <% List<Notification> noteList = (List)request.getAttribute("noteList");%>
    <% for(Notification note : noteList){ %>
    <%="<tr>" %>
    <%="<td>"+note.getNote_id()+"</td>"%>
    <%="<td>"+note.getPassenger_id()+"</td>"%>
    <%="<td>"+note.getPassenger_name()+"</td>"%>
    <%="<td>"+note.getPhone()+"</td>"%>
    <%="<td>"+note.getTake_time()+"</td>"%>
    <%="<td>"+note.getAirport()+"</td>"%>
    <td>
        <span><a class="deleteNote" href="note.do?method=deleteNote&noteId=<%=note.getNote_id()%>">删除</a></span>
    </td>
    <%="</tr>" %>
    <% } %>
</table>
</body>--%>
<head>
    <%--    ajax异步加载数据--%>
    <title>取票通知</title>
<%--    <script>
        // 如果不加第一个$()，默认在页面加载前搜索btn，但是此时没有btn，所以不会给btn注册点击事件
        $(function (){
            $("#btn").click(function (){
                /*
                * $.post(url,params[可以省略],success)*/
                $.post("${pageContext.request.contextPath}/note/getNotes",function (data) {
                    var html="";
                    for(let i=0;i<data.length;i++){
                        html += "<tr>"+
                            "<td>"+data[i].note_id+"</td>"+
                            "<td>"+data[i].passenger_id+"</td>"+
                            "<td>"+data[i].passenger_name+"</td>"+
                            "<td>"+data[i].phone+"</td>"+
                            "<td>"+data[i].take_time+"</td>"+
                            "<td>"+data[i].airport+"</td>"+
                            "<td> <span><a class=\"deleteNote\" href=\"${pageContext.request.contextPath}/note/deleteNote?noteId="  +
                            data[i].note_id +
                            "\">删除</a></span> </td>" +
                            "</tr>";
                    }
                    $("#content").html(html);
                })
            })
        });

    </script>--%>

        <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/common.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/corptravel.css" rel="stylesheet">
</head>
<body>

<%--<input type="submit" value="加载" id="btn">
<table>
    <tr>
        <th width="20%">通知id</th>
        <th width="20%">旅客id</th>
        <th width="10%">姓名</th>
        <th width="10%">电话</th>
        <th width="10%">最迟取票时间</th>
        <th width="10%">机场</th>
    </tr>
    <tbody id="content"></tbody>
</table>--%>
<div class="container bg-gray-eee box-shadow mar-bottom-30"
     style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">

    <table  border="0" cellspacing="0" cellpadding="0"
            class="table table-hover table-striped font12 table-bordered v-align-top" style="table-layout:fixed;word-wrap:break-word;">
        <tr class="firstTr">
            <th width="20%">通知id</th>
            <th width="15%">航班id</th>
            <th width="15%">旅客id</th>
            <th width="15%">最迟取票时间</th>
            <th width="10%">机场</th>
        </tr>
        <c:forEach var="note" items="${noteList }" varStatus="status">
            <tr>
                <td style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">${note.noteId }</td>
                <td>${note.flightId }</td>
                <td>${note.cardId }</td>
                <td><fmt:formatDate value="${note.takeTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                <td>${note.airport}</td>
                <td hidden>${note.passengerName}</td>
                <td hidden>${note.phone}</td>
                <td>
                    <button class="downloadNote" >下载</button>
                </td>
                <td>
                    <span><a class="deleteNote" href="javascript:;" noteId="${note.noteId }">删除</a></span>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/notePage.js"></script>
</body>
</html>

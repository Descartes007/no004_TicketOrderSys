<%@ page import="com.tos.pojo.Flight" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/2
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>航班统计</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/asset/css/plugins/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/asset/css/plugins/animate.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/style.css">
</head>
<body>


<div class="panel">
    <div class="panel-body">
        <div class="col-md-12">
            <h3 class="animated fadeInLeft">航班统计</h3>
            <p class="animated fadeInDown">航班管理<span class="fa-angle-right fa"></span>航班统计</p>
        </div>
    </div>
</div>
<div class="panel col-md-12 padding-0 form-element">
    <div class="panel-heading" style="vertical-align:center">
        <table>
            <tr>
                <th>
                    <form action="${pageContext.request.contextPath}/flight/flightStatistics" method="post">

                        航空公司&nbsp
                        <select class="m-wrap" name="airline">
                            <option selected disabled hidden>选择航空公司</option>
                            <option>东方航空</option>
                            <option>SCAU航空</option>
                            <option>南方航空</option>
                            <option>东方航空</option>
                            <option>邮政航空</option>
                            <option>国际航空</option>
                            <option>联合航空</option>
                            <option>飞龙航空</option>
                            <option>大新华航空</option>
                        </select>

                        出发地&nbsp
                        <select class="m-wrap" name="srcCity" value=''>
                            <option></option>
                            <option>广州</option>
                            <option>上海</option>
                            <option>北京</option>
                            <option>重庆</option>
                            <option>辽宁</option>
                            <option>云南</option>
                            <option>华农</option>
                        </select>
                        目的地&nbsp
                        <select class="m-wrap" name="dstCity" value='' id="dst">
                            <option></option>
                            <option>广州</option>
                            <option>上海</option>
                            <option>北京</option>
                            <option>重庆</option>
                            <option>辽宁</option>
                            <option>云南</option>
                            <option>华农</option>
                        </select>
                        <select class="m-wrap" name="statisticsTime">
                            <option selected disabled hidden>时间范围</option>
                            <option value="-7">过去7天</option>
                            <option value="-15">过去15天</option>
                            <option value="-30">过去一个月</option>
                            <option value="7">未来7天</option>
                            <option value="15">未来15天</option>
                            <option value="30">未来一个月</option>
                        </select>
                        <button type="submit" class="" name="query"> 查询</button>
                    </form>
                </th>
            </tr>
        </table>
    </div>
    <div class="panel-body">
        <div class="responsive-table">
            <div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                <div class="row">
                    <div class="col-sm-12">
                        <table class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0"  style="width: 100%;">
                            <thead>
                            <tr role="row">
                                <th class="sorting_asc"style="width:10%;">航班ID</th>
                                <th class="sorting" style="width:25%;">路线</th>
                                <th class="sorting" style="width:20%">出发时间</th>
                                <th class="sorting"  style="width:10%;">订票人数</th>
                                <th class="sorting" style="width:15%;">满座率</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                ArrayList<Flight> flightBeans = (ArrayList<Flight>) session.getAttribute("statisticsFlights");
                                SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");
                                if (flightBeans != null) {
                                Iterator<Flight> iterator = flightBeans.iterator();
                                while (iterator.hasNext()) {
                                    Flight flight = iterator.next();
                            %>

                            <tr >
                                <td>
                                    <%=flight.getId()%>
                                </td>
                                <td role="row" class="${status.index % 2 == 0 ? "even" : "odd"}">
                                    <%=flight.getSrcAirport()%>----><%=flight.getDstAirport()%>
                                </td>
                                <td>
                                    <%=simpleDateFormat.format(flight.getStartTime())%>
                                </td>
                                <td>
                                    <%=flight.getSeatCount()%>
                                </td>
                                <td>
                                    <%=String.format("%.2f", (float) flight.getSeatCount() / flight.getSeatNum() * 100)%>%
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--    显示查询结果--%>
<% String result = (String) request.getAttribute("statisticsResult");
    if (result != "" && result != null) {
%>
<script type="text/javascript">
    alert("<%=result%>");
</script>
<%
    }
%>




</table>
</div>

</body>
</html>

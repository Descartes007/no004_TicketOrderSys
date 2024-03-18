<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/plugins/animate.min.css"/>
<link type="text/css" href="${pageContext.request.contextPath}/static/asset/css/style.css" rel="stylesheet">




</head>
<body>

	<div class="panel">
		<div class="panel-body">
			<div class="col-md-12">
				<h3 class="animated fadeInLeft">航班列表</h3>
				<p class="animated fadeInDown">航班管理<span class="fa-angle-right fa"></span>航班列表</p>
			</div>
		</div>
    </div>



    <div class="col-md-12 padding-0 form-element">
      
        <div class="panel">
			<div class="panel-heading">
				<table>
					<tr>
						<th>
							<form action="${pageContext.request.contextPath}/flight/getFlightsByManager" method="post">
								出发城市&nbsp&nbsp
								<select name="srcCity" value='' class="m-wrap  " style="width: 80px; padding: 2px 0;">
									<option value="">请选择</option>
									<c:if test="${cityList != null }">
										<c:forEach var="city" items="${cityList}">
											<option <c:if test="${city == srcCity }">selected="selected"</c:if>
													value="${city}">${city}</option>
										</c:forEach>
									</c:if>
								</select>
								&nbsp&nbsp目的城市&nbsp&nbsp
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
											<th class="sorting_asc"style="width:8%;">航班号</th>
											<th class="sorting" style="width:8%;">航空公司</th>
											<th class="sorting" style="width:8%;">始发机场</th>
											<th class="sorting"  style="width:8%;">目的机场</th>
											<th class="sorting"  style="width:10%;">起飞时间</th>
											<th class="sorting"  style="width:10%;">到达时间</th>
											<th class="sorting"  style="width:8%;">头等舱价格</th>
											<th class="sorting"  style="width:8%;">经济舱价格</th>
											<th class="sorting_asc"style="width:8%;">座位数</th>
											<th class="sorting_asc"style="width:8%;">预定座位数</th>
											<th class="sorting_asc"style="width:6%;">头等舱数</th>
											<th class="sorting_asc"style="width:6%;">经济舱数</th>
											<th class="sorting_asc"style="width:4%;">型号</th>
										</tr>
									</thead>
									
									<tbody>
										<c:if test="${flightList != null }">
											<c:forEach var="flight" items="${flightList}" varStatus="status">
												<tr role="row" class="${status.index % 2 == 0 ? "even" : "odd"}">
													<td class="sorting_1">${flight.id}</td>
													<td>${flight.airline}</td>
													<td>${flight.srcAirport}</td>
													<td>${flight.dstAirport}</td>
													<td><fmt:formatDate value="${flight.startTime}" pattern="yyyy-MM-dd HH:mm"/></td>
													<td><fmt:formatDate value="${flight.endTime}" pattern="yyyy-MM-dd HH:mm"/></td>
													<td>${flight.advancedPrice}</td>
													<td>${flight.economicPrice}</td>
													<td>${flight.seatNum}</td>
													<td>${flight.seatCount}</td>
													<td>${flight.advancedNum}</td>
													<td>${flight.economicNum}</td>
													<td>${flight.size}</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
    </div>

</body>
</html>
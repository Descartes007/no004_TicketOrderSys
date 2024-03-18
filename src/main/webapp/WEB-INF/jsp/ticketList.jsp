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
<link href="${pageContext.request.contextPath}/static/asset/css/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flightQuery.css">
</head>
<body>



<div class="form-element">
	<div class="col-md-12 padding-0">
		<div class="col-md-12">


			<div class="panel">
				<div class="panel-body">
					<div class="col-md-12">
						<h3 class="animated fadeInLeft">订单列表</h3>
						<p class="animated fadeInDown">订单管理<span class="fa-angle-right fa"></span>订单列表</p>
					</div>
				</div>
			</div>
			<div class="col-md-12 padding-0 form-element">

				<div class="panel">
					<div class="panel-heading">
						<h3>列表内容</h3>
					</div>

					<div class="panel-body">
						<div class="responsive-table">
							<div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0"  style="width: 100%;">
											<thead>
											<tr role="row">
												<th class="sorting_asc"style="width:10%;">机票id</th>
												<th class="sorting" style="width:10%;">航班号</th>
												<th class="sorting"  style="width:10%;">座位号</th>
												<th class="sorting" style="width:15%;">出发时间</th>
												<th class="sorting" style="width:15%;">登记时间</th>
												<th class="sorting" style="width:10%;">姓名</th>
												<th class="sorting"  style="width:20%;">身份证</th>

											</tr>
											</thead>

											<tbody>
											<c:if test="${ticketList != null }">
												<c:forEach var="ticket" items="${ticketList}" varStatus="status">
													<tr role="row" class="${status.index % 2 == 0 ? "even" : "odd"}">
														<td class="sorting_1">${ticket.ticketId}</td>
														<td>${ticket.flightId}</td>
														<td>${ticket.seatId}</td>
														<td><fmt:formatDate value="${ticket.departureTime}" pattern="yyyy-MM-dd HH:mm"/></td>
														<td><fmt:formatDate value="${ticket.boardTime}" pattern="yyyy-MM-dd HH:mm"/></td>
														<td>${ticket.passengerName}</td>
														<td>${ticket.cardId}</td>

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


		</div>
	</div>
</div>



</body>
</html>
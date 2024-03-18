<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/asset/css/plugins/animate.min.css"/>
<link href="${pageContext.request.contextPath}/static/asset/css/style.css" rel="stylesheet">
</head>
<body>

	<div class="panel">
		<div class="panel-body">
			<div class="col-md-12">
				<h3 class="animated fadeInLeft">用户列表</h3>
				<p class="animated fadeInDown">用户管理<span class="fa-angle-right fa"></span>用户列表</p>
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
											<th class="sorting" style="width: 30%;">账号</th>
											<th class="sorting_asc"style="width: 30%;">姓名</th>
											<th class="sorting" style="width: 40%;">身份证</th>
										</tr>
									</thead>
									
									<tbody>
										<c:if test="${passengerList != null }">
											<c:forEach var="passenger" items="${passengerList}" varStatus="status">
												<tr role="row" class="${status.index % 2 == 0 ? "even" : "odd"}">
													<td class="sorting_1">${passenger.phone}</td>
													<td>${passenger.passengerName}</td>
													<td>${passenger.passengerId}</td>
													<td>
														<form id="_form" style="text-decoration:none;" method="post" action="${pageContext.request.contextPath}/admin/deletePassenger">
															<input type="hidden" name="phone" value="${passenger.phone}" />
															<input type="submit" value="删除">

														</form>
<%--														<a style="text-decoration:none;" href="${pageContext.request.contextPath}/admin/deletePassenger" phone="${passenger.phone}">--%>
<%--															删除--%>
<%--														</a>--%>
													</td>

												</tr>
											</c:forEach>
										</c:if>
										
<%--										<%
											db_conn conn= new db_conn(); 
											String sql="select * from common_user";
											ResultSet res=conn.executeQuery(sql);
							
											while(res.next()){
												String user_name=res.getString(1);
												String user_pwd=res.getString(2);
												String user_img=res.getString(3);
												String row=null;
												
												if(res.getRow()%2==0){
													row="even";
												}else{
													row="odd";
												}
										%>
										
										
										<tr role="row" class="even">
											<td class="sorting_1"><%=user_name %></td>
											<td><%=user_pwd %></td>
											<td><%=user_img %></td>
											<td>
												<a style="text-decoration:none;" href="/jsp_plane_ticket_book/del_message?id=<%=user_name%>&class=user">
													删除
												</a>
											</td>
										</tr>
                     
                     					<%
											}
                     					%>--%>
                     
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
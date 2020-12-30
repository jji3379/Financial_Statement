<%@page import="java.text.DecimalFormat"%>
<%@page import="costDB.MaterialDto"%>
<%@page import="java.util.List"%>
<%@page import="costDB.MaterialDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//MaterialList DataBase 불러오기
	List<MaterialDto> list=MaterialDao.getInstance().getList();
	MaterialDao dao=MaterialDao.getInstance();
	
	//숫자에 쉼표 넣기
	DecimalFormat df=new DecimalFormat("#,##0");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>원재료 리스트</title>
</head>
<body>
<div class="container">	
	<div class="row">
		<div class="col-2">
			<p style="font-size:50px;"><a href="${pageContext.request.contextPath}/index.jsp">POS</a></p>
			<ul class="nav flex-column">
				<li class="nav-item">	
					<a class="btn btn-outline-dark nav-link" href="${pageContext.request.contextPath}/sales/sales.jsp">매출</a>
				<br /></li>
				<li class="nav-item">
					<a class="btn btn-outline-dark nav-link" href="#">재고</a>
			 	<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="${pageContext.request.contextPath}/purchase/purchase.jsp">매입</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="${pageContext.request.contextPath}/cost/CostList.jsp">원가</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link active" href="#">원재료리스트</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">관리</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">재무재표</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">손실</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">예금</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">채작</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">재고계산</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">제공품리스트</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">제품리스트</a>
				<br /></li>
			</ul>
		</div><!-- col-2 END -->
		<!-- col-10 Start -->
		<div class="col-10">
			<div class="container"><br />
				<h2 class="d-inline">원재료 리스트</h2>
			</div><br /><!-- 제목 div END -->
			<!-- form Start -->
			<div class="container collapse show" id="collapseExample">
				<form class="card card-body" style="border: solid" action="insert.jsp">
					<!-- 재료이름, 원가-->
					<div>
						<span class="btn btn-dark btn-sm">재료이름</span>
						<input class="align-middle" type="text" name="name" size=45/>
						&nbsp;&nbsp;
						<span class="btn btn-dark btn-sm">원가</span>
						<input class="align-middle" type="text" name="cost" size=18/>
						
						<!-- 분류 Start -->
						<div><br />
							<span class="btn btn-dark btn-sm">분류</span>
							<label>
								<input type="checkbox" name="category" value="석판" />석판
							</label>
							<label>
								<input type="checkbox" name="category" value="원예" />원예
							</label>
							<label>
								<input type="checkbox" name="category" value="광부" />광부
							</label>
							<label>
								<input type="checkbox" name="category" value="정제" />정제
							</label>
							<label>
								<input type="checkbox" name="category" value="제작" />제작
							</label>
							<button style="float:right" class="btn btn-danger btn-sm" type="submit">등록</button>
						</div><!-- 분류 checkbox END -->
					</div><!-- 재료이름, 원가END -->
				</form>
			</div><!-- Category Container END -->
			<br />
			<div class=container><!-- Table Div Start -->
				<table class="table table-bordered">
					<!-- head -->
					<thead class="table-dark">
						<tr>
							<th>분류</th>
							<th>코드</th>
							<th>재료이름</th>
							<th>원가</th>
						</tr>
					</thead>
					
					<!-- body -->
					<tbody>
						<%for(MaterialDto tmp:list){ %>
							<tr>														
								<td><%=tmp.getCategory()%></td>
								<td><%=tmp.getCode()%></td>
								<td><%=tmp.getName()%></td>
								<%int cost=tmp.getCost(); %>
								<td><%=df.format(cost) %></td>
							</tr>					
						<%} %>
					</tbody>
					<!-- body END -->
				</table>
			</div><!-- Table Container END -->
		</div><!-- col-10 END -->
	</div><!-- row END -->	
</div><!-- 전체 Container END -->
</body>
</html>
<%@page import="salesDB.SalesDao"%>
<%@page import="salesDB.SalesDto"%>
<%@page import="costDB.MaterialDao"%>
<%@page import="costDB.MaterialDto"%>
<%@page import="purchaseDB.PurchaseDao"%>
<%@page import="purchaseDB.PurchaseDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="offerDB.OfferDao"%>
<%@page import="offerDB.OfferDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	OfferDto dto=new OfferDto();
	//offer DataBase 불러오기
	List<OfferDto> list=OfferDao.getInstance().getList();
	OfferDao dao=OfferDao.getInstance();
	
				
	//숫자에 쉼표 넣기
	DecimalFormat df=new DecimalFormat("#,##0");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
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
			    	<a class="btn btn-outline-dark nav-link" href="${pageContext.request.contextPath}/cost/MaterialList.jsp">원재료리스트</a>
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
			    	<a class="btn btn-outline-dark nav-link" href="${pageContext.request.contextPath}/offer/offer.jsp">재공품리스트</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link active" href="${pageContext.request.contextPath}/product/product.jsp">제품리스트</a>
				<br /></li>
			</ul>
		</div><!-- col-2 END -->
		<!-- col-10 Start -->
		<div class="col-10">
			<div class="container"><br />
				<h2 class="d-inline">제품리스트</h2>
			</div><!-- 제목 div END <--><br />
			<!-- form start div-->
			<div class="container">
			<form class="card card-body" style="border: solid" action="insert.jsp">
				<div class="d-grid gap-4">
					<!-- 재료1 드랍다운 -->
					<div class="p-1">
						<span class="btn btn-dark btn-sm">분류</span>
						<select name="group" id="group">
							<option>분류</option>
							<option>목수</option>
							<option>대장</option>
							<option>갑주</option>
							<option>보석</option>
							<option>가죽</option>
							<option>재봉</option>
							<option>연금</option>
						</select><br /><br />
						
						<span class="btn btn-dark btn-sm">직군</span>
						<select name="group" id="group">
							<option>직군 선택</option>
							<option>수호자</option>
							<option>학살자</option>
							<option>타격대</option>
							<option>공격대</option>
							<option>정찰대</option>
							<option>유격대</option>
							<option>마술사</option>
							<option>치유사</option>
						</select><br /><br />
						
						<span class="btn btn-dark btn-sm">부위</span>
						<select name="group" id="group">
							<option>부위 선택</option>
							<option>머리</option>
							<option>상의</option>
							<option>손</option>
							<option>허리</option>
							<option>하의</option>
							<option>발</option>
							<option>귀걸이</option>
							<option>목걸이</option>
							<option>팔찌</option>
							<option>반지</option>
						</select><br /><br />

						<span class="btn btn-dark btn-sm">재료1</span>
						<select name="group" id="group">
							<option>재료1</option>
							<%for(OfferDto tmp:list) {%>
								<option><%=tmp.getName() %></option>
							<%} %>
						</select>
						<span class="btn btn-dark btn-sm">개수</span>  
						<label>
							<input class="align-middle" type="text" name="regdate"size=5/>																
						</label><br /><br />
						
						<span class="btn btn-dark btn-sm">재료2</span>
						<select name="group" id="group">
							<option>재료1</option>
							<%for(OfferDto tmp:list) {%>
								<option><%=tmp.getName() %></option>
							<%} %>
						</select>
						<span class="btn btn-dark btn-sm">개수</span>  
						<label>
							<input class="align-middle" type="text" name="regdate"size=5/>																
						</label><br /><br />
						
						<span class="btn btn-dark btn-sm">재료3</span>
						<select name="group" id="group">
							<option>재료1</option>
							<%for(OfferDto tmp:list) {%>
								<option><%=tmp.getName() %></option>
							<%} %>
						</select>
						<span class="btn btn-dark btn-sm">개수</span>  
						<label>
							<input class="align-middle" type="text" name="regdate"size=5/>																
						</label><br /><br />

						<span class="btn btn-dark btn-sm">재료4</span>
						<select name="group" id="group">
							<option>재료1</option>
							<%for(OfferDto tmp:list) {%>
								<option><%=tmp.getName() %></option>
							<%} %>
						</select>
						<span class="btn btn-dark btn-sm">개수</span>  
						<label>
							<input class="align-middle" type="text" name="regdate"size=5/>																
						</label>
						
						<button style="float:right" class="btn btn-danger btn-sm" type="submit">등록</button>
					</div>
				</div><!-- row align-items-start END -->
			</form><!-- form END -->
			</div><!-- form container div END --><br />
			<!-- data table div Start -->
			<div class=container>
				<table style="text-align :center" class="table table-bordered">
					<!-- head -->
					<thead class="table-dark">
						<tr>
							<th style="display:none">번호</th>
							<th>제작</th>
							<th>코드</th>
							<th>제품직군</th>
							<th>제품부위</th>
							<th>원가</th>
							<th>재료</th>
							<th>개수</th>
							<th>원가</th>
						</tr>
					</thead>
					
					<!-- body -->
					<tbody>
						
					</tbody>
					<!-- body END -->
				</table>
			</div><!-- Table Container END -->
		</div><!-- col-10 END -->
	</div><!-- row END -->	
</div><!-- 전체 Container END -->
</body>
</html>
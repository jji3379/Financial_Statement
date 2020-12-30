<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>원가</title>
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
			    	<a class="btn btn-outline-dark nav-link active" href="${pageContext.request.contextPath}/cost/CostList.jsp">원가</a>
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
			    	<a class="btn btn-outline-dark nav-link" href="${pageContext.request.contextPath}/offer/offer.jsp">제공품리스트</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">제품리스트</a>
				<br /></li>
			</ul>
		</div><!-- col-2 END -->
		<!-- col-10 Start -->
		<div class="col-10">
			<div class="container"><br />
				<h2 class="d-inline">원가</h2>		
			</div><!-- 제목 div END -->
		</div><!-- col-10 END -->
	</div><!-- row END -->	
</div><!-- 전체 Container END -->
</body>
</html>
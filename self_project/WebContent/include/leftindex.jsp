<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	// "thisPage" 라는 파라미터 명으로 전달된 문자열 읽어오기 
 	String thisPage=request.getParameter("thisPage");
 	//NullPointerException 방지 (500번 버스 안타기)
 	if(thisPage==null){
 		thisPage="";
 	}
 %>
<div class="col-2">
	<p style="font-size:50px;"><a href="${pageContext.request.contextPath}/index.jsp">POS</a></p>
	<ul class="nav flex-column">
		<li class="nav-item">	
			<a class="btn btn-outline-dark nav-link <%=thisPage.equals("sales") ? "active" : "" %>" href="${pageContext.request.contextPath}/sales/sales.jsp">매출</a>
		<br /></li>
		<li class="nav-item">
			<a class="btn btn-outline-dark nav-link" href="#">재고</a>
	 	<br /></li>
		<li class="nav-item">
	    	<a class="btn btn-outline-dark nav-link <%=thisPage.equals("purchase") ? "active" : "" %>" href="${pageContext.request.contextPath}/purchase/purchase.jsp">매입</a>
		<br /></li>
		<li class="nav-item">
	    	<a class="btn btn-outline-dark nav-link <%=thisPage.equals("cost") ? "active" : "" %>" href="${pageContext.request.contextPath}/cost/CostList.jsp">원가</a>
		<br /></li>
		<li class="nav-item">
	    	<a class="btn btn-outline-dark nav-link <%=thisPage.equals("material") ? "active" : "" %>" href="${pageContext.request.contextPath}/cost/MaterialList.jsp">원재료리스트</a>
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
	    	<a class="btn btn-outline-dark nav-link <%=thisPage.equals("offer") ? "active" : "" %>" href="${pageContext.request.contextPath}/offer/offer.jsp">재공품리스트</a>
		<br /></li>
		<li class="nav-item">
	    	<a class="btn btn-outline-dark nav-link <%=thisPage.equals("product") ? "active" : "" %>" href="${pageContext.request.contextPath}/product/product.jsp">제품리스트</a>
		<br /></li>
	</ul>
</div><!-- col-2 END -->
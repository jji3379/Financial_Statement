<%@page import="costDB.MaterialDao"%>
<%@page import="purchaseDB.PurchaseDao"%>
<%@page import="costDB.MaterialDto"%>
<%@page import="purchaseDB.PurchaseDto"%>
<%@page import="java.awt.Color"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 인코딩
	request.setCharacterEncoding("utf-8");
	// 2. 폼에서 전송된 파라미터 읽어내기
	String regdate=request.getParameter("regdate");
	String name=request.getParameter("name");
	int cost=Integer.parseInt(request.getParameter("cost"));
	int amount=Integer.parseInt(request.getParameter("amount"));
	int unit=cost/amount;
	String server=request.getParameter("server");
	
	// 3. PurchaseDto 객체에 담기
	PurchaseDto dto=new PurchaseDto();
	dto.setRegdate(regdate);
	//dto.setCode(mdto.getCode());
	dto.setName(name);
	dto.setCost(cost);
	dto.setAmount(amount);
	dto.setUnit(unit);
	dto.setServer(server);
	
	
	// 5. PurchaseDao에 insert 메소드 만들고
	// 6. PurchaseDao 객체를 이용해서 DB에 저장
	PurchaseDao dao=PurchaseDao.getInstance();
	boolean isSuccess=dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>data insert</title>
</head>
<body>
<%if(isSuccess){ %>
		<script>			
			location.href="purchase.jsp";
		</script>
	<%}else {%>
		<script>
			location.href="purchase.jsp";
		</script>
	<%} %>
</body>
</html>
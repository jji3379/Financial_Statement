<%@page import="offerDB.OfferDao"%>
<%@page import="offerDB.OfferDto"%>
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
	String production=request.getParameter("production");
	String name=request.getParameter("name");
	String part1=request.getParameter("part1");
	int count1=Integer.parseInt(request.getParameter("count1"));

	String part2=request.getParameter("part2");
	int count2=Integer.parseInt(request.getParameter("count2"));
	
	String part3=request.getParameter("part3");
	int count3=Integer.parseInt(request.getParameter("count3"));
	
	String part4=request.getParameter("part4");
	int count4=Integer.parseInt(request.getParameter("count4"));
	
	OfferDto dto=new OfferDto();
	// 3. OfferDtoDto 객체에 담기
	dto.setProduction(production);
	dto.setName(name);
	dto.setPart1(part1);
	dto.setCount1(count1);
	
	dto.setPart2(part2);
	dto.setCount2(count2);
	
	dto.setPart3(part3);
	dto.setCount3(count3);
	
	dto.setPart4(part4);
	dto.setCount4(count4);	
	
	// 5. OfferDao에 insert 메소드 만들고
	// 6. OfferDao 객체를 이용해서 DB에 저장
	OfferDao dao=OfferDao.getInstance();
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
			location.href="offer.jsp";
		</script>
	<%}else {%>
		<script>
			location.href="offer.jsp";
		</script>
	<%} %>
</body>
</html>
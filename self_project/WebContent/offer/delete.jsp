<%@page import="offerDB.OfferDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 몇번 데이터를 삭제할 것인지 알아내서 (checkbox name 불러오기)
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. DB 에서 실제로 삭제한다.
	OfferDao dao=OfferDao.getInstance();
	boolean isSuccess=dao.delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
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
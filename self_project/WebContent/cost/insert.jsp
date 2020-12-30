<%@page import="costDB.MaterialDao"%>
<%@page import="costDB.MaterialDto"%>
<%@page import="java.awt.Color"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 인코딩
	request.setCharacterEncoding("utf-8");
	// 2. 폼에서 전송된 파라미터 읽어내기
	String name=request.getParameter("name");	
	String category=request.getParameter("category");
	int cost=Integer.parseInt(request.getParameter("cost"));
	// 3. MaterialDto 객체에 담기
	MaterialDto dto=new MaterialDto();
	dto.setName(name);
	dto.setCategory(category);
	dto.setCost(cost);
	// 4. MaterialDao에 insert 메소드 만들고
	// 5. MaterialDao 객체를 이용해서 DB에 저장
	MaterialDao dao=MaterialDao.getInstance();
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
			location.href="MaterialList.jsp";
		</script>
	<%}else {%>
		<script>
			location.href="MaterialList.jsp";
		</script>
	<%} %>
</body>
</html>
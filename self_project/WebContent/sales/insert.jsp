<%@page import="java.text.DecimalFormat"%>
<%@page import="java.awt.Color"%>
<%@page import="salesDB.SalesDao"%>
<%@page import="salesDB.SalesDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 인코딩
	request.setCharacterEncoding("utf-8");
	// 2. 폼에서 전송된 파라미터 읽어내기
	String regdate=request.getParameter("regdate");
	String job=request.getParameter("job");
	String parts=request.getParameter("parts");
	
	int cost=Integer.parseInt(request.getParameter("cost"));
	int count=Integer.parseInt(request.getParameter("count"));
	
	// 3. SalesDto 객체에 담기
	SalesDto dto=new SalesDto();
	dto.setRegdate(regdate);
	dto.setParts(parts);
	dto.setCost(cost);
	dto.setCount(count);
	// 4. code dto 알고리즘
	//수호자
	if(job.equals("수호자")){
		dto.setJob(job);
		switch(parts){
		case "머리": dto.setCode("A00001"); break;
		case "상의": dto.setCode("A00002");break;
		case "손": dto.setCode("A00003");break;
		case "허리": dto.setCode("A00004");break;
		case "하의": dto.setCode("A00005");break;
		case "발": dto.setCode("A00006");break;
		case "귀걸이": dto.setCode("A10001");break;
		case "목걸이": dto.setCode("A10002");break;
		case "팔찌": dto.setCode("A10003");break;
		case "반지": dto.setCode("A10004");break;
		}		
	}
	//학살자
	if(job.equals("학살자")){
		dto.setJob(job);
		switch(parts){
		case "머리": dto.setCode("B00001");break;
		case "상의": dto.setCode("B00002");break;
		case "손": dto.setCode("B00003");break;
		case "허리": dto.setCode("B00004");break;
		case "하의": dto.setCode("B00005");break;
		case "발": dto.setCode("B00006");break;
		case "귀걸이": break; //스크립트 알람 넣자
		case "목걸이": break;
		case "팔찌": break;
		case "반지": break;
		}		
	}
	//타격대
	if(job.equals("타격대")){
		dto.setJob(job);
		switch(parts){
		case "머리": dto.setCode("B00101");break;
		case "상의": dto.setCode("B00102");break;
		case "손": dto.setCode("B00103");break;
		case "허리": dto.setCode("B00104");break;
		case "하의": dto.setCode("B00105");break;
		case "발": dto.setCode("B00106");break;
		}		
	}
	//공격대
	if(job.equals("공격대")){
		dto.setJob(job);
		switch(parts){
		case "귀걸이": dto.setCode("B10001");break;
		case "목걸이": dto.setCode("B10002");break;
		case "팔찌": dto.setCode("B10003");break;
		case "반지": dto.setCode("B10004");break;
		}		
	}
	//정찰대
	if(job.equals("정찰대")){
		dto.setJob(job);
		switch(parts){
		case "머리": dto.setCode("C00001");break;
		case "상의": dto.setCode("C00002");break;
		case "손": dto.setCode("C00003");break;
		case "허리": dto.setCode("C00004");break;
		case "하의": dto.setCode("C00005");break;
		case "발": dto.setCode("C00006");break;
		}		
	}
	//유격대
	if(job.equals("유격대")){
		dto.setJob(job);
		switch(parts){
		case "머리": dto.setCode("C00101");break;
		case "상의": dto.setCode("C00102");break;
		case "손": dto.setCode("C00103");break;
		case "허리": dto.setCode("C00104");break;
		case "하의": dto.setCode("C00105");break;
		case "발": dto.setCode("C00106");break;
		case "귀걸이": dto.setCode("C10001");break;
		case "목걸이": dto.setCode("C10002");break;
		case "팔찌": dto.setCode("C10003");break;
		case "반지": dto.setCode("C10004");break;
		}		
	}
	//마술사
	if(job.equals("마술사")){
		dto.setJob(job);
		switch(parts){
		case "머리": dto.setCode("D00001");break;
		case "상의": dto.setCode("D00002");break;
		case "손": dto.setCode("D00003");break;
		case "허리": dto.setCode("D00004");break;
		case "하의": dto.setCode("D00005");break;
		case "발": dto.setCode("D00006");break;
		case "귀걸이": dto.setCode("D10001");break;
		case "목걸이": dto.setCode("D10002");break;
		case "팔찌": dto.setCode("D10003");break;
		case "반지": dto.setCode("D10004");break;
		}		
	}
	//치유사
	if(job.equals("치유사")){
		dto.setJob(job);
		switch(parts){
		case "머리": dto.setCode("E00001");break;
		case "상의": dto.setCode("E00002");break;
		case "손": dto.setCode("E00003");break;
		case "허리": dto.setCode("E00004");break;
		case "하의": dto.setCode("E00005");break;
		case "발": dto.setCode("E00006");break;
		case "귀걸이": dto.setCode("E10001");break;
		case "목걸이": dto.setCode("E10002");break;
		case "팔찌": dto.setCode("E10003");break;
		case "반지": dto.setCode("E10004");break;
		}		
	}
	// 5. SalesDao에 insert 메소드 만들고
	// 6. SalesDao 객체를 이용해서 DB에 저장
	SalesDao dao=SalesDao.getInstance();
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
			location.href="sales.jsp";
		</script>
	<%}else {%>
		<script>
			location.href="sales.jsp";
		</script>
	<%} %> 	
</body>
</html>
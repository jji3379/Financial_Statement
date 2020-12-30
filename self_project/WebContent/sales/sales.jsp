<%@page import="java.text.DecimalFormat"%>
<%@page import="salesDB.SalesDto"%>
<%@page import="java.util.List"%>
<%@page import="salesDB.SalesDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//한페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=10;
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum!=null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	
	int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	
	//전체 row 의 개수
	int totalRow=SalesDao.getInstance().getCount();
	//전체 페이지의 개수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 개수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount; //보정을 해준다.
	}
	
	//startRowNum 과 endRowNum 을 SalesDto 객체에 담고
	SalesDto dto=new SalesDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	//sales DataBase 불러오기
	List<SalesDto> list=SalesDao.getInstance().getList(dto);
	SalesDao dao=SalesDao.getInstance();
	
	//숫자에 쉼표 넣기
	DecimalFormat df=new DecimalFormat("#,##0");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>매출</title>
</head>
<body>
<div class="container">	
		<div class="row">
			<div class="col-2">
				<p style="font-size:50px;"><a href="${pageContext.request.contextPath}/index.jsp">POS</a></p>
					<ul class="nav flex-column">
						<li class="nav-item">	
							<a class="btn btn-outline-dark nav-link active" href="${pageContext.request.contextPath}/sales/sales.jsp">매출</a>
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
				<h2 class="d-inline">매출</h2>
					<button style="float:right" class="btn btn-outline-dark btn-sm" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			   			-
			  		</button>	
			</div><br /><!-- 제목 div END -->
			<div class="container collapse show" id="collapseExample">
				<form class="card card-body" style="border: solid" action="insert.jsp">
					<div class="d-grid gap-4">
						<div class="p-1">				
							<span class="btn btn-dark btn-sm">날짜</span>  
							<label>
								<input class="align-middle" type="text" name="regdate"size=5/>																
							</label>
						</div>
						<!-- 제품직군 radio -->
						<div class="p-1">
							<span class="btn btn-dark btn-sm">직군</span>
							<label>
								<input type="checkbox" name="job" value="수호자" />수호자
							</label>
							<label>
								<input type="checkbox" name="job" value="학살자" />학살자
							</label>
							<label>
								<input type="checkbox" name="job" value="타격대" />타격대
							</label>
							<label>
								<input type="checkbox" name="job" value="공격대" />공격대
							</label>
							<label>
								<input type="checkbox" name="job" value="정찰대" />정찰대
							</label>
							<label>
								<input type="checkbox" name="job" value="유격대" />유격대
							</label>
							<label>
								<input type="checkbox" name="job" value="마술사" />마술사
							</label>
							<label>
								<input type="checkbox" name="job" value="치유사" />치유사
							</label>
						</div><!-- 제품직군 radio END -->
						<!-- 제품부위 radio -->
						<div class="p-1">
							<span class="btn btn-dark btn-sm">부위</span>
							<label>
								<input type="checkbox" name="parts" value="머리" />머리
							</label>
							<label>
								<input type="checkbox" name="parts" value="상의" />상의
							</label>
							<label>
								<input type="checkbox" name="parts" value="손" />손
							</label>
							<label>
								<input type="checkbox" name="parts" value="허리" />허리
							</label>
							<label>
								<input type="checkbox" name="parts" value="하의" />하의
							</label>
							<label>
								<input type="checkbox" name="parts" value="발" />발
							</label>
							<label>
								<input type="checkbox" name="parts" value="귀걸이" />귀걸이
							</label>
							<label>
								<input type="checkbox" name="parts" value="목걸이" />목걸이
							</label>
							<label>
								<input type="checkbox" name="parts" value="팔찌" />팔찌
							</label>
							<label>
								<input type="checkbox" name="parts" value="반지" />반지
							</label>					
						</div><!-- 제품직군 radio END -->
						<!-- 판매금액, 재고수 -->
						<div class="p-1">
							<span class="btn btn-dark btn-sm">금액</span>
							<input class="align-middle" type="text" name="cost" size=4 />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
							<span class="btn btn-dark btn-sm">개수</span>
							<input class="align-middle" type="text" name="count" size=1/> 개 	
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;														
						<button style="float:right" class="btn btn-danger btn-sm" type="submit">등록</button>
						</div><!-- 판매금액, 재고수 END -->
					</div><!-- row align-items-start END -->
				</form>
			</div><!-- Category Container END -->
				<br />
				<!-- Data Table -->
				<div class=container>
					<table class="table table-bordered">
						<!-- head -->
						<thead class="table-dark">
							<tr>
								<th>번호</th>
								<th>날짜</th>
								<th>코드</th>
								<th>제품직군</th>
								<th>제품부위</th>
								<th>판매금액</th>
								<th>재고수</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						
						<!-- body -->
						<tbody>
							<%for(SalesDto tmp:list){ %>
								<tr>						
									<td><%=tmp.getNum()%></td>
									<td><%=tmp.getRegdate()%></td>
									<!-- code 색 적용 -->
									<td style="<%if(tmp.getCode().contains("A")){ %>
												background-color:#6d9eeb;
												color:white;											
										<%}else if(tmp.getCode().contains("B")){ %>
												background-color:#e06666;
												color:white;												
										<%}else if(tmp.getCode().contains("C")){ %>
												background-color:#76a5af;
												color:white;												
										<%}else if(tmp.getCode().contains("D")){ %>
												background-color:#8e7cc3;
												color:white;												
										<%}else if(tmp.getCode().contains("E")){ %>
												background-color:#93c47d;
												color:white;												
										<%}else if(tmp.getCode()==null){%>
												background-color:black;
												color:white;	
										<%}%>
										">
										<%if(tmp.getCode().equals("X")) {%>
											<script>											
												alert("해당 직군의 부위는 존재하지 않습니다.");
												location.href="delete.jsp?num=<%=tmp.getNum()%>"
											</script>
										<%}else{ %>										
										<%=tmp.getCode()%>
										<%} %>
										</td>
									<!-- code 색 적용 END -->					
									<td><%=tmp.getJob() %></td>
									<td><%=tmp.getParts() %></td>
									<!-- cost, count ,넣기 -->
									<%int cost=tmp.getCost(); %>
									<td><%=df.format(cost) %></td>
									<%int count=tmp.getCount(); %>
									<td><%=df.format(count)%></td>
									<td><a style="color:red" href="update.jsp?num=<%=tmp.getNum()%>">수정</a></td>				
									<td><a style="color:red" href="delete.jsp?num=<%=tmp.getNum()%>">X</a></td>				
								</tr>					
							<%} %>
						</tbody>
						<!-- body END -->
					</table>
				</div><!-- Table Container END -->
				<!-- page 넘기기 Start-->
				<div class="container">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<%if(startPageNum !=1) {%>
						<!-- 페이징 head -->
						<li class="page-item">
							<a class="page-link" href="sales.jsp?pageNum=<%=startPageNum-1 %>" aria-label="Previous">
			    				<span aria-hidden="true">&laquo;</span>
							</a>
			    		</li>												
						<%}else{ %>
						<li class="page-item disabled">
							<a class="page-link" href="javascript:" aria-label="Previous">
			    				<span aria-hidden="true">&laquo;</span>
							</a>
			    		</li>												
						<%} %>
			    		<!-- 페이징 body-->
			    		<%for(int i=startPageNum; i<=endPageNum; i++) {%>
			    			<%if(i==pageNum) {%>
			    				<li class="page-item-active">
			    					<a href="sales.jsp?pageNum=<%=i %>" class="page-link"><%=i %></a>
			    				</li>
			    			<%}else {%>
			    				<li class="page-item">
			    					<a href="sales.jsp?pageNum=<%=i %>" class="page-link"><%=i %></a>
			    				</li>			    				
			    			<%} %>
			    		<%} %>
			    		<%if(endPageNum<totalPageCount) {%>
			    		<!-- 페이징 bottom -->
			    		<li>
			    			<a class="page-link" href="sales.jsp?pageNum=<%=endPageNum+1 %>" aria-label="Next">
			    				<span aria-hidden="true">&raquo;</span>
			    			</a>
			    		</li>			    		
			    		<%}else {%>
			    		<li>
			    			<a class="page-link disabled" href="sales.jsp?pageNum=<%=endPageNum+1 %>" aria-label="Next">
			    				<span aria-hidden="true">&raquo;</span>
			    			</a>
			    		</li>			    		
			    		<%} %>			    		
			    	</ul>
				</nav><!-- page 넘기기창 END -->
				</div><!-- page 넘기기 div END -->
			</div><!-- col-10 END -->
		</div><!-- row END -->	
	</div><!-- 전체 Container END -->
</body>
</html>
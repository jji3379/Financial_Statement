<%@page import="java.text.DecimalFormat"%>
<%@page import="purchaseDB.PurchaseDto"%>
<%@page import="purchaseDB.PurchaseDao"%>
<%@page import="costDB.MaterialDto"%>
<%@page import="costDB.MaterialDao"%>
<%@page import="java.util.List"%>
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
	int totalRow=PurchaseDao.getInstance().getCount();
	//전체 페이지의 개수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 개수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount; //보정을 해준다.
	}
	
	//startRowNum 과 endRowNum 을 SalesDto 객체에 담고
	PurchaseDto dto=new PurchaseDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	//MaterialList DataBase 불러오기
	List<MaterialDto> list=MaterialDao.getInstance().getList();
	MaterialDto dto3=new MaterialDto();
	MaterialDao dao=MaterialDao.getInstance();

	//PurchaseList DataBase 불러오기
	List<PurchaseDto> list2=PurchaseDao.getInstance().getList(dto);
	PurchaseDto dto2=new PurchaseDto();
	PurchaseDao dao2=PurchaseDao.getInstance();
	
	//숫자에 쉼표 넣기
	DecimalFormat df=new DecimalFormat("#,##0");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>매입</title>
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
			    	<a class="btn btn-outline-dark nav-link active" href="${pageContext.request.contextPath}/purchase/purchase.jsp">매입</a>
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
				<h2 class="d-inline">매입</h2>
			</div><!-- 제목 div END <--><br />
			<!-- form start div-->
			<div class="container">
			<form class="card card-body" style="border: solid" action="insert.jsp">
				<div class="d-grid gap-4">
					<div class="p-1">				
						<span class="btn btn-dark btn-sm">날짜</span>  
						<label>
							<input class="align-middle" type="text" name="regdate"size=5/>																
						</label>
					</div>
					<!-- 분류 드랍다운 -->
					<div class="p-1">
						<span class="btn btn-dark btn-sm">분류</span>
						<select name="group" id="group" onchange="category2(this)">
							<option>1차 분류</option>
							<option value="1">석판</option>
							<option value="2">원예</option>
							<option value="3">광부</option>
							<option value="4">정제</option>
							<option value="5">제작</option>
						</select>
						<!-- 소분류 자바스크립트 -->
						<script>
						function category2(e) {
							//석판 데이터 분류
						    var suk = new Array();
						    <%for(MaterialDto tmp:list){%>
								<%if(tmp.getCategory().equals("석판")){%>
									suk.push("<%=tmp.getName()%>");
									<%}%> 
							<%}%>	
							//원예 데이터 분류
						    var one = new Array();
						    <%for(MaterialDto tmp:list){%>
								<%if(tmp.getCategory().equals("원예")){%>
									one.push("<%=tmp.getName()%>");
									<%}%> 
							<%}%>	
							//광부 데이터 분류
						    var gwang = new Array();
						    <%for(MaterialDto tmp:list){%>
								<%if(tmp.getCategory().equals("광부")){%>
									gwang.push("<%=tmp.getName()%>");
									<%}%> 
							<%}%>	
							//정제 데이터 분류
						    var jung = new Array();
						    <%for(MaterialDto tmp:list){%>
								<%if(tmp.getCategory().equals("정제")){%>
									jung.push("<%=tmp.getName()%>");
									<%}%> 
							<%}%>	
							//제작 데이터 분류
						    var je = new Array();
						    <%for(MaterialDto tmp:list){%>
								<%if(tmp.getCategory().equals("제작")){%>
									je.push("<%=tmp.getName()%>");
									<%}%> 
							<%}%>	

						    var target = document.getElementById("name");

						    if(e.value == "1") var data = suk;
						    if(e.value == "2") var data = one;
						    if(e.value == "3") var data = gwang;
						    if(e.value == "4") var data = jung;
						    if(e.value == "5") var data = je;

						    target.options.length = 0;

						    for (x in data) {
						        var opt = document.createElement("option");
						        opt.value = data[x];
						        opt.innerHTML = data[x];
						        target.appendChild(opt);
						    }   
						}
						</script><!-- 소분류 자바스크립트 END -->
						<!-- 2차 분류 -->
						<select name="name" id="name">
							<option>2차 분류</option>							
						</select><!-- 2차 분류 END --> 	
					</div><!-- 분류 드랍다운 END -->
					<!-- 금액, 수량 -->
					<div class="p-1">
						<span class="btn btn-dark btn-sm">금액</span>
						<input class="align-middle" type="text" name="cost" size=4 />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
						<span class="btn btn-dark btn-sm">수량</span>
						<input class="align-middle" type="text" name="amount" size=1 /> 	
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- 서버 드랍다운 Start-->
						<span class="btn btn-dark btn-sm">서버</span>
						<select name="server" id="server">
							<option>타이탄</option>
							<option>아니마</option>
							<option>아수라</option>
							<option>벨리아스</option>
							<option>초코보</option>
							<option>하데스</option>
							<option>익시온</option>
							<option>만드라</option>
							<option>마사무네</option>
							<option>판데</option>
							<option>신류</option>
						</select>														
					<button style="float:right" class="btn btn-danger btn-sm" type="submit">등록</button>
					</div><!-- 판매금액, 재고수 END -->
				</div><!-- row align-items-start END -->
			</form><!-- form END -->
			</div><!-- form container div END --><br />
			<!-- data table div Start -->
			<div class=container>
				<table class="table table-bordered">
					<!-- head -->
					<thead class="table-dark">
						<tr>
							<th style="display:none">번호</th>
							<th>날짜</th>
							<th>코드</th>
							<th>재료명</th>
							<th>금액</th>
							<th>수량</th>
							<th>단가</th>
							<th>서버</th>
							<th>삭제</th>
						</tr>
					</thead>
					
					<!-- body -->
					<tbody>
						<%for(PurchaseDto tmp:list2){ %>
							<tr>														
								<td style="display:none"><%=tmp.getNum()%></td>
								<td><%=tmp.getRegdate()%></td>
								<td style="
								background-color:#cccccc;
								color:white;">
								<%=tmp.getCode()%>
								</td>
								<td><%=tmp.getName()%></td>
								<%int cost=tmp.getCost(); %>
								<td><%=df.format(cost) %></td>
								<%int amount=tmp.getAmount(); %>
								<td><%=df.format(amount)%></td>
								<%int unit=tmp.getUnit(); %>
								<td><%=df.format(unit)%></td>
								<td><%=tmp.getServer()%></td>
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
		    					<a href="purchase.jsp?pageNum=<%=i %>" class="page-link"><%=i %></a>
		    				</li>
		    			<%}else {%>
		    				<li class="page-item">
		    					<a href="purchase.jsp?pageNum=<%=i %>" class="page-link"><%=i %></a>
		    				</li>			    				
		    			<%} %>
		    		<%} %>
		    		<%if(endPageNum<totalPageCount) {%>
		    		<!-- 페이징 bottom -->
		    		<li>
		    			<a class="page-link" href="purchase.jsp?pageNum=<%=endPageNum+1 %>" aria-label="Next">
		    				<span aria-hidden="true">&raquo;</span>
		    			</a>
		    		</li>			    		
		    		<%}else {%>
		    		<li>
		    			<a class="page-link disabled" href="purchase.jsp?pageNum=<%=endPageNum+1 %>" aria-label="Next">
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
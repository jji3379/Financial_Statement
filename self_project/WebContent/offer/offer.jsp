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
	
	//MaterialList DataBase 불러오기
	List<MaterialDto> list=MaterialDao.getInstance().getList();
	MaterialDto dto3=new MaterialDto();
	MaterialDao dao=MaterialDao.getInstance();

	//offer DataBase 불러오기
	List<OfferDto> list2=OfferDao.getInstance().getList();
	OfferDao dao2=OfferDao.getInstance();
				
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
			    	<a class="btn btn-outline-dark nav-link active" href="${pageContext.request.contextPath}/offer/offer.jsp">재공품리스트</a>
				<br /></li>
				<li class="nav-item">
			    	<a class="btn btn-outline-dark nav-link" href="#">제품리스트</a>
				<br /></li>
			</ul>
		</div><!-- col-2 END -->
		<!-- col-10 Start -->
		<div class="col-10">
			<div class="container"><br />
				<h2 class="d-inline">재공품리스트</h2>
			</div><!-- 제목 div END <--><br />
			<!-- form start div-->
			<div class="container">
			<form class="card card-body" style="border: solid" action="insert.jsp">
				<div class="d-grid gap-4">
					<div class="p-1">				
						<span class="btn btn-dark btn-sm">제작</span>  
						<label>
							<input class="align-middle" type="text" name="production"size=5/>																
						</label><br />
						<span class="btn btn-dark btn-sm">재공품</span>  
						<label>
							<input class="align-middle" type="text" name="name"size=5/>																
						</label><br />
			 
					<!-- 재료1 드랍다운 -->
					<div class="p-1">
						<span class="btn btn-dark btn-sm">재료1</span>
						<select name="group" id="group" onchange="category1(this)">
							<option>1차 분류</option>
							<option value="1">석판</option>
							<option value="2">원예</option>
							<option value="3">광부</option>
							<option value="4">정제</option>
							<option value="5">제작</option>
						</select>
						<!-- 소분류 자바스크립트 -->
						<script>
						function category1(e) {
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

						    var target = document.getElementById("part1");

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
						<select name="part1" id="part1">
							<option>2차 분류</option>							
						</select><!-- 2차 분류 END --> 	
						<span class="btn btn-dark btn-sm">개수</span>  
						<label>
							<input class="align-middle" type="text" name="count1"size=5/>																
						</label><br />
					</div><!-- 재료1 드랍다운 END -->
					
					<!-- 재료2 드랍다운 -->
					<div class="p-1">
						<span class="btn btn-dark btn-sm">재료2</span>
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

						    var target = document.getElementById("part2");

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
						<select name="part2" id="part2">
							<option>2차 분류</option>							
						</select><!-- 2차 분류 END --> 	
						<span class="btn btn-dark btn-sm">개수</span>  
						<label>
							<input class="align-middle" type="text" name="count2"size=5/>																
						</label><br />						
					</div><!-- 재료2 드랍다운 END -->
					
					<!-- 재료3 드랍다운 -->
					<div class="p-1">
						<span class="btn btn-dark btn-sm">재료3</span>
						<select name="group" id="group" onchange="category3(this)">
							<option>1차 분류</option>
							<option value="1">석판</option>
							<option value="2">원예</option>
							<option value="3">광부</option>
							<option value="4">정제</option>
							<option value="5">제작</option>
						</select>
						<!-- 소분류 자바스크립트 -->
						<script>
						function category3(e) {
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

						    var target = document.getElementById("part3");

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
						<select name="part3" id="part3">
							<option>2차 분류</option>							
						</select><!-- 2차 분류 END --> 	
						<span class="btn btn-dark btn-sm">개수</span>  
						<label>
							<input class="align-middle" type="text" name="count3"size=5/>																
						</label><br />
					</div><!-- 재료3 드랍다운 END -->
					<!-- 재료1 드랍다운 -->
					<div class="p-1">
						<span class="btn btn-dark btn-sm">재료4</span>
						<select name="group" id="group" onchange="category4(this)">
							<option>1차 분류</option>
							<option value="1">석판</option>
							<option value="2">원예</option>
							<option value="3">광부</option>
							<option value="4">정제</option>
							<option value="5">제작</option>
						</select>
						<!-- 소분류 자바스크립트 -->
						<script>
						function category4(e) {
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

						    var target = document.getElementById("part4");

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
						<select name="part4" id="part4">
							<option>2차 분류</option>							
						</select><!-- 2차 분류 END --> 	
						<span class="btn btn-dark btn-sm">개수</span>  
						<label>
							<input class="align-middle" type="text" name="count4"size=5/>																
						</label><br />
					</div><!-- 재료4 드랍다운 END -->	
						<button style="float:right" class="btn btn-danger btn-sm" type="submit">등록</button>
					</div>
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
							<th>제작</th>
							<th>제공품이름</th>
							<th>코드</th>
							<th>원가</th>
							
							<th>재료</th>
							<th>개수</th>
							<th>원가</th>
							
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					
					<!-- body -->
					<tbody>
						<%for(OfferDto tmp:list2){ %>
							<tr>														
								<td style="display :none"><%=tmp.getNum()%></td>
								<td><%=tmp.getProduction()%></td>
								<td><%=tmp.getName() %></td>
								<td><%=tmp.getCode()%></td>
								<%int total=tmp.getTotal();%>
								<td><%=df.format(total)%></td>
								
								<td><%=tmp.getPart1()%></td>
								<td><%=tmp.getCount1()%></td>
								<%int cost1=tmp.getCost1(); %>
								<td><%=df.format(cost1)%></td>

								<td><a style="color:red" href="update.jsp?num=<%=tmp.getNum()%>">수정</a></td>				
								<td><a style="color:red" href="delete.jsp?num=<%=tmp.getNum()%>">X</a></td>		
							</tr>					
							<tr>
								<td style="display :none"><%=tmp.getNum()%></td>
								<td><%=tmp.getProduction()%></td>
								<td><%=tmp.getName() %></td>
								<td><%=tmp.getCode()%></td>
								<td><%=df.format(total)%></td>

								<td><%=tmp.getPart2()%></td>
								<td><%=tmp.getCount2()%></td>
								<%int cost2=tmp.getCost2(); %>
								<td><%=df.format(cost2)%></td>																

								<td><a style="color:red" href="update.jsp?num=<%=tmp.getNum()%>">수정</a></td>				
								<td><a style="color:red" href="delete.jsp?num=<%=tmp.getNum()%>">X</a></td>		
							</tr>
							<tr>		
								<td style="display :none"><%=tmp.getNum()%></td>
								<td><%=tmp.getProduction()%></td>
								<td><%=tmp.getName() %></td>
								<td><%=tmp.getCode()%></td>
								<td><%=df.format(total)%></td>
													
								<td><%=tmp.getPart3()%></td>
								<td><%=tmp.getCount3()%></td>
								<%int cost3=tmp.getCost3(); %>
								<td><%=df.format(cost3)%></td>
																
								<td><a style="color:red" href="update.jsp?num=<%=tmp.getNum()%>">수정</a></td>				
								<td><a style="color:red" href="delete.jsp?num=<%=tmp.getNum()%>">X</a></td>		

							</tr>
							<tr>
								<td style="display :none"><%=tmp.getNum()%></td>
								<td><%=tmp.getProduction()%></td>
								<td><%=tmp.getName() %></td>
								<td><%=tmp.getCode()%></td>
								<td><%=df.format(total)%></td>

								<td><%=tmp.getPart4()%></td>
								<td><%=tmp.getCount4()%></td>
								<%int cost4=tmp.getCost4(); %>
								<td><%=df.format(cost4)%></td>
								
								<td><a style="color:red" href="update.jsp?num=<%=tmp.getNum()%>">수정</a></td>				
								<td><a style="color:red" href="delete.jsp?num=<%=tmp.getNum()%>">X</a></td>		
							</tr>
						<%} %>
					</tbody>
					<!-- body END -->
				</table>
			</div><!-- Table Container END -->
		</div><!-- col-10 END -->
	</div><!-- row END -->	
</div><!-- 전체 Container END -->
</body>
</html>
<%@page import="model.BBSDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BBSDao"%>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ include file="/Common/IsMember.jsp" %>
<%@ include file="/01Directive/IncludePage.jsp"%>
<% 
	BBSDao dao = new BBSDao(application, "JSP", "JSP");
	List<BBSDto> bbsList = dao.selectBBSList();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta
	name="viewport"
	content="width=device-width, initial-scale=1.0"
>
<title>Index.html</title>
<link
	rel="stylesheet"
	href="<%=request.getContextPath()%>/Styles/divLayout.css"
>
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!-- 탑메뉴 및 로고를 감싸는 div 시작 -->
			<div class="header">
				<div class="logo">
					<img
						src="<%=request.getContextPath()%>/Images/logo.jpg"
						alt="회사 로고 이미지"
					>
				</div>
				<div class="topMenu">
					<%@ include file="/Template/Top.jsp"%>
				</div>
			</div>
			<!-- 탑메뉴 및 로고를 감싸는 div 끝 -->
			<!-- Left메뉴 및 실제내용 감싸는 div 시작 -->
			<div class="section">
				<div class="leftMenu">
					<%@ include file="/Template/Left.jsp"%>
				</div>
				<div class="body">
					<div class="content">
						<fieldset style="padding: 10px">
							<legend>회원제 게시판 목록(2/15)</legend>
							<!-- 글쓰기 버튼 -->
							<table style="width: 100%">
								<tr>
									<td style="text-align: right">
										<a href="Write.jsp">글작성</a>
									</td>
								</tr>
							</table>
							<table
								width="100%"
								style="border-spacing: 1px; background-color: gray"
							>
								<tr
									style="background-color: white"
									align="center"
								>
									<th width="10%">번호</th>
									<th width="45%">제목</th>
									<th width="15%">작성자</th>
									<th width="10%">조회수</th>
									<th>작성일</th>
								</tr>
								<% if(bbsList.size()==0){ %>
								<tr
									style="background-color: white"
									align="center"
								>
									<td colspan="5">등록된 글이 없어요</td>
								</tr>
								<% } else { 
										for(BBSDto dto : bbsList){
								%>
								<tr
									style="background-color: white"
									align="center"
								>
									<td><%=dto.getNo()  %></td>
									<td style="text-align: left">
									<a href="View.jsp?no=<%=dto.getNo()%>"><%=dto.getTitle()%></a>
									</td>
									<td><%=dto.getName()  %></td>
									<td><%=dto.getVisitCount()  %></td>
									<td><%=dto.getPostDate()  %></td>
								</tr>
								<% }//for 
								}//if %>
							</table>
							<!-- 페이징 -->
							<table width="100%">
								<tr align="center">
									<td>1 2 3 4 5 6 7 8 9 10</td>
								</tr>
							</table>
							<!-- 검색UI -->
							<form method="post">
								<table width="100%">
									<tr align="center">
										<td>
											<select name="searchColumn">
												<option value="title">제목</option>
												<option value="name">작성자</option>
												<option value="content">내용</option>
											</select>
											<input
												type="text"
												name="searchWord"
											/> <input
												type="submit"
												value="검색"
											/>
										</td>
									</tr>
								</table>
							</form>
						</fieldset>
					</div>
				</div>
			</div>
			<!-- Left메뉴 및 실제내용 감싸는 div 끝 -->
			<!-- footer를 감싸는 div 시작 -->
			<div class="footer">
				<%@ include file="/Template/Footer.jsp"%>
			</div>
			<!-- footer를 감싸는 div 끝 -->
		</div>
	</div>
</body>
</html>
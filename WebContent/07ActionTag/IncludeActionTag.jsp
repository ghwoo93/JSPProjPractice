<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//페이지명 변수에 저장]
	String directivePath="DirectivePage.jsp";
	String actionPath = "ActionTagePage.jsp";
	//페이지 및 리퀘스트 영역에 속성저장]
	pageContext.setAttribute("pageVar", "페이지 영역입니다.");
	request.setAttribute("requestVar", "리퀘스트 영역입니다.");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>include지시어와 &lt;jsp:include&gt;액션태그</legend>
		<h2>include지시어로 페이지 포함하기</h2>
		<%-- <%@ include file="<%=directivePath %>" %> --%>
		<%@ include file="DirectivePage.jsp" %>
		
		<h2> &lt;jsp:include&gt;액션태그로 페이지 포함하기</h2>
		<jsp:include page="<%=actionPath %>"></jsp:include>
		<h2>삽입된 페이지 안에서 선언한 변수 사용하기</h2>
		<ul>
			<li>directiveString:<%=directiveString %></li>
			<li>actionTagString:
			<%-- <%=actionTagString%> --%>
			</li>
		</ul>
	</fieldset>
</body> 
</html>
<%@page import="sun.rmi.server.Dispatcher"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("requestInteger", 11);
	request.setAttribute("requestString", "요청 영역에 저장된 문자열");
	request.setAttribute("requestDate", new Date(new java.util.Date().getTime()));
	request.setAttribute("requestMemberFirst", new MemberDTO("KIM","1234","김길동",null,"20"));
	request.setAttribute("requestMemberSecond", new MemberDTO("PARK","1234","김길동",null,"20"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestScopeIndex</title>
</head>
<body>
	<fieldset>
		<legend>요청 영역</legend>
		<h2>요청 영역에 저장된 속성 읽기</h2>
		<%
		Object object = request.getAttribute("requestMemberFirst");
		String firstMemberStr = "";
		if(object instanceof MemberDTO)
			firstMemberStr = 
				String.format(
						"이름:%s,아이디:%s,비번:%s,나이:%s", 
						((MemberDTO)object).getName(),
						((MemberDTO)object).getId(),
						((MemberDTO)object).getPwd(),
						((MemberDTO)object).getAge());
		MemberDTO second = (MemberDTO)request.getAttribute("requestMemberSecond");			
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer타입:<%=request.getAttribute("requestInteger") %></li>
			<li>String타입:<%=request.getAttribute("requestString") %></li>
			<li>Date타입:<%=request.getAttribute("requestDate") %></li>
			<li>MemberDTO타입1st:<%=firstMemberStr %></li>
			<li>MemberDTO타입2nd:<%=second %></li>
		</ul>
		<h2>요청 영역에 저장된 속성 삭제 후 읽기</h2>
		<%
			request.removeAttribute("NoKey");
			
			request.removeAttribute("requestInteger");
			request.removeAttribute("requestString");
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer타입:<%=request.getAttribute("requestInteger") %></li>
			<li>String타입:<%=request.getAttribute("requestString") %></li>
			<li>Date타입:<%=request.getAttribute("requestDate") %></li>
			<li>MemberDTO타입1st:<%=firstMemberStr %></li>
			<li>MemberDTO타입2nd:<%=second %></li>
		</ul>
		<h2>페이지 이동</h2>
		<a href="RequestScopeResult.jsp">사용자 클릭에 의한 이동</a>
		
	</fieldset>
	<%@ include file="pageScopeIncludePage.jsp" %>
</body>
</html>
<%
	RequestDispatcher dispatcher = 
		request.getRequestDispatcher("/04InnerObjectScope/RequestScopeResult.jsp");
	dispatcher.forward(request, response);
%>


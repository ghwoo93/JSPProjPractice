<%@page import="model.MemberDTO"%>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestScopeResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>요청 영역</legend>
		<h2>요청 영역에 저장된 속성 읽기</h2>
		<%
		Object object = request.getAttribute("requestMemberFirst");
		String firstMemberStr = "";
		if (object instanceof MemberDTO){
			firstMemberStr = 
					String.format(
							"이름:%s,아이디:%s,비번:%s,나이:%s", 
							((MemberDTO) object).getName(),
							((MemberDTO) object).getId(), 
							((MemberDTO) object).getPwd(), 
							((MemberDTO) object).getAge());
		}
		MemberDTO second = (MemberDTO) request.getAttribute("requestMemberSecond");
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer타입:<%=request.getAttribute("requestInteger") %></li>
			<li>String타입:<%=request.getAttribute("requestString") %></li>
			<li>Date타입:<%=request.getAttribute("requestDate") %></li>
			<li>MemberDTO타입1st:<%=firstMemberStr %></li>
			<li>MemberDTO타입2nd:<%=second %></li>
		</ul>
	</fieldset>
</body>
</html>
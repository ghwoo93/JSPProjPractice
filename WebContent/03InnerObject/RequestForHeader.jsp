<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForHeader</title>
</head>
<body>
	<fieldset>
		<legend>요청 헤더명: 요청 헤더값</legend>
		<ul style="list-style: upper-roman;">
			<%
				Enumeration<String> names = request.getHeaderNames();
				while(names.hasMoreElements()){
					String headerName = names.nextElement();
					
			%>
			<li><%= request.getHeader(headerName) %></li>
			<% } %>
		</ul>
	</fieldset>
</body>
</html>
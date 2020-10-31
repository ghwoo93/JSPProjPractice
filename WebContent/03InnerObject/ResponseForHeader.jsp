<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("pragma", "no-cache");
	response.setHeader("cache-control", "no-cache");
	//	response.setContentType("text/plain; charset=UTF-8");
	//	response.setContentType("binary/octaect-stream");
	
	Date date = new Date();
	long currentTime = date.getTime();
	response.setDateHeader("currentDate", currentTime);
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	long startTime = dateFormat.parse("2020-8-10").getTime();
	response.addDateHeader("currentDate", startTime);
	
	response.addIntHeader("NumberOfStudents", 32);
	
	response.addIntHeader("NumberOfStudents", -1);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>응답 헤더</legend>
		<ul style="list-style: upper-roman;">
		<%
			Collection<String> names = response.getHeaderNames();
			for(String name:names){
				String headerValue = response.getHeader(name);
				out.println(String.format("<li> %s : %s</li>", name,headerValue));
			}
		%>
		</ul>
		<h2>응답헤더명 존재 여부 판단:boolean containsHeader("헤더명")</h2>
		<h4>Content-Type 존재 여부 판단</h4>
		<%=response.containsHeader("content-type")?"존재":"미존재" %>
		<h4>CurrentDate 존재 여부 판단</h4>
		<%=response.containsHeader("currentDate")?"존재":"미존재" %>
	</fieldset>
</body>
</html>
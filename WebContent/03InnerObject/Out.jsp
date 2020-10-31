<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>out내장객체</legend>
		<h2>버퍼와 관련된 메소드</h2>
		<%
		out.println("버퍼에 저장될 문자열<br/>");
		out.flush();
		out.println("웹브라우저에 출력이 안될 문자열");
		out.clearBuffer();
		
		out.println("마지막으로 저장될 문자열");
		%>
	</fieldset>
	<h2>기타 메소드</h2>
	<ul style="list-style: upper-roman">
		<li>자동 플러쉬 여부:<%=out.isAutoFlush()%></li>
		<li>버퍼 크기:<%=out.getBufferSize()%>바이트</li>
		<li>남은 버퍼 크기:<%=out.getRemaining()%>바이트</li>
	</ul>
	<h2>print와 println차이</h2>
	<h4>print 메소드</h4>
	<%
		out.print("<table style='border-spacing:1px;background-color:red'>");
		out.print("<tr style='background-color:white'>");
		out.print("<td>가</td><td>나</td></tr></table>");
	%>
	<h4>println 메소드</h4>
	<%
		out.println("<table style='border-spacing:1px;background-color:red'>");
		out.println("<tr style='background-color:white'>");
		out.println("<td>가</td><td>나</td></tr></table>");
	%>
</body>
</html>
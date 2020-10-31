<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="true"
    %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>session(HttpSession타입)</legend>
		<ul style="list-style: upper-roman;">
			<li>세션의 유효시간 얻기(web.xml:분단위):<%=session.getMaxInactiveInterval() %>초</li>
			<%session.setMaxInactiveInterval(60); %>
			<li>메소드로 세션의 유효시간 설정(초단위):<%=session.getMaxInactiveInterval() %>쵸</li>
			<li>세션 아이디:<a href="SessionResult.jsp"><%=session.getId() %></a></li>
			<%
				long createTime = session.getCreationTime();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String creationTimeStr = dateFormat.format(new Date(createTime));
				long accessTime = session.getLastAccessedTime();
				String accessTimeStr = dateFormat.format(accessTime);
			%>
			<li>세션의 최초 생성 시간: <%=creationTimeStr %></li>
			<li>클라이언트의 최근 요청 시간:<%=accessTimeStr %></li>
		</ul>
		<h2>세션 및 리퀘스트 영역에 저장</h2>
		<%
			request.setAttribute("requestScope", "리퀘스트 영역입니다");
			session.setAttribute("sessionScope", "세션 영역입니다");
		%>
	</fieldset>
</body>
</html>
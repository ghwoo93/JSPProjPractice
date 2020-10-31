<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<li>세션 아이디:<a href="SessionResult.jsp"><%=session.getId() %></a></li>
			<li>세션의 유효시간:<%=session.getMaxInactiveInterval() %>초</li>
			<li>리퀘스트 영역:<%=request.getAttribute("requestScope") %></li>
			<li>세션 영역:<%=session.getAttribute("sessionScope") %></li>
		</ul>
	</fieldset>
</body>
</html>
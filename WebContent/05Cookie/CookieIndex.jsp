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
		<legend>쿠키</legend>
		<%
			Cookie cookie = new Cookie("UserID","KOSMO");
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
			cookie.setMaxAge(5);
		%>
		<h2>쿠키를 생성하는 현재 페이지에서 쿠키값 읽기</h2>
		<%
			Cookie[] cookies = request.getCookies();
			if(cookies !=null){
				for(Cookie cook:cookies){
					String name = cook.getName();
					String value = cook.getValue();
					out.print(String.format("%s:%s", name,value));
				}
			}
		%>
		<h2>페이지 이동 후 쿠키 값 확인</h2>
		<a href="CookieResult.jsp">쿠키값 확인</a>
		<% %>
	</fieldset>
</body>
</html>
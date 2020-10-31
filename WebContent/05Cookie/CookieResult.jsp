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
		<legend>쿠키값 확인</legend>
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
		<a href=""></a>
	</fieldset>
</body>
</html>
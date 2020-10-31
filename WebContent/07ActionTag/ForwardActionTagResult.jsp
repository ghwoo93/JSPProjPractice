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
		<legend>포워드 및 리다이렉트 방식으로 이동 된 페이지</legend>
		<ul>
			<li>페이지 영역: <%=pageContext.getAttribute("pageVar") %></li>
			<li>요청 영역: <%=request.getAttribute("requestVar") %></li>
		</ul>
	</fieldset>

</body>
</html>
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
		<legend>Content-Type응답 헤더</legend>
		<h3>서블릿에서 직접 브라우저에 스트림 출력(이때는 반드시 setContent() 사용)</h3>
		<a href="<%=request.getContextPath()%>/AniDir/SomeDir/SetContentType.kosmo">서블릿으로 요청 보내기</a>
	</fieldset>
</body>
</html>
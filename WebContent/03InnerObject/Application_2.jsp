<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedReader"%>
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
		<legend>application객체의 getResourceAsStream()</legend>
		<h2>자바 IO를 사용해서 파일 내용을 웹 브라우저로 출력</h2>
		<%
			String path = application.getRealPath("/03InnerObject/Out.jsp");
			BufferedReader br = new BufferedReader(new FileReader(path));
			String data;
			while((data=br.readLine())!=null){
				out.println(data+"<br/>");
			}
			br.close();
			
		%>
		<h2>getResourceAsStream()을 사용해서 파일 내용을 브라우저에 출력</h2>
		<%
			InputStream is = application.getResourceAsStream("/03InnerObject/Out.jsp");
			br = new BufferedReader(new InputStreamReader(is));
			while((data=br.readLine())!=null){
				out.println(data+"<br/>");
			}
			br.close();
		%>
	</fieldset>
</body>
</html>
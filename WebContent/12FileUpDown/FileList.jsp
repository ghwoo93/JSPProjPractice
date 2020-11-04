<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileList.jsp</title>
</head>
<body>
	<fieldset>
		<% 
			String savaDirectory = application.getRealPath("/Upload");
			File file = new File(savaDirectory);
			File[] list = file.listFiles();
		%>
		<legend>업로드된 파일 목록</legend>
		<ul style="list-style:decimal;">
			<% for(File f : list){ %>
			<li>이름:<a href="Download.jsp?filename=<%= f.getName()%>"><%= f.getName() %>,용량:<%= (int)Math.ceil(f.length()/1024.0) %>KB</a></li>
			<% } %>
		</ul>
	</fieldset>
</body>
</html>
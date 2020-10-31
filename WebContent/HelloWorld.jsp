<%@page import="model.BBSDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String dateStr = dateFormat.format(new Date());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello World wkh1</h1>
	<fieldset>
		<legend>jsp테스트</legend>
		<h3>오늘은 <%= dateStr %>일 입니다.</h3>
	</fieldset>
	<fieldset>
		<legend>servlet테스트</legend>
		<h3><a href="HelloServlet.do">젤다가 초록색 인가요?</a></h3>
		<span style="color: red;font-size: 1.2em;font-weight: bold;">${message}</span>
		<h2>계산기</h2>
		<form action="Calcurator.kosmo">
			<input type="text" name="firstNum" size="10" maxlength="10"/>
			<select name="operator">
				<option value="+">더하기</option>
				<option value="-">빼기</option>
				<option value="*">곱하기</option>
				<option value="/">나누기</option>
			</select>
			<input type="text" name="secondNum" size="10" maxlength="10"/>
			<button type="submit">결과는</button>
			<span style="color: green;font-size: 1.4em;font-weight: bold;">${result}</span>
		</form>
	</fieldset>
</body>
</html>
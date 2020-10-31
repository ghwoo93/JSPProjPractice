<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="ErrorInfo.jsp"
    %>
<%
	String stringAge = request.getParameter("age");
// 	out.println(stringAge);
	String errorMessage="";
	int after10Years=-1;
	if(stringAge!=null){
		/*
		try{
			after10Years = Integer.parseInt(stringAge)+10;
		} catch (NumberFormatException e) {
			errorMessage="나이는 숫자만...";
		}
		*/
		after10Years = Integer.parseInt(stringAge)+10;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>나이입력</legend>
		<form>
			<input type="text" name="age">
			<input type="submit" value="제출">
		</form>
		<%if(after10Years!=-1){ %>
		당신의 10년 후 나이는 <%=after10Years %>살 이군요.
		<%} %>
		<%= errorMessage %>
	</fieldset>
</body>
</html>
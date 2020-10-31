<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("UTF-8");
    	request.setAttribute("member", new MemberDTO("KIM","1234","김기동",null,"20"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamActionTagInclude.jsp</title>
</head>
<body>
	<fieldset>
		<legend>삽입하는 페이지에 파라미터 전달</legend>
		<jsp:include page="IncludedPage.jsp">
			<jsp:param value="쿼리스트링" name="query"/>
			<jsp:param value="좆같은" name="name"/>
			<jsp:param value="18" name="age"/>
		</jsp:include>
	</fieldset>
</body>
</html>
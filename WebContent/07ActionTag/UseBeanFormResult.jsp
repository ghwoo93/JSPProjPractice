<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id")==null?request.getParameter("user"):request.getParameter("id");
    String pwd = request.getParameter("pwd")==null?request.getParameter("pass"):request.getParameter("pwd");
    String name = request.getParameter("name");
    
    MemberDTO member = new MemberDTO();
    member.setId(id);
    member.setPwd(pwd);
    member.setName(name);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>useBean액션태그로 폼의 하위요소 값 받기</legend>
		<h2>스크립팅 요소 즉 자바코드로 받기</h2>
		<%=member %>
		<jsp:useBean id="action" class="model.MemberDTO"/>
		<h3>파라미터명과 자바빈의 속성명(멤버변수) 일치시</h3>
		<jsp:setProperty property="*" name="action" />
		<%=action %>
		<h3>파라미터명과 자바빈의 속성명(멤버변수) 불일치시</h3>
		<jsp:setProperty property="id" name="action" param="user"/>
		<jsp:setProperty property="pwd" name="action" param="pass"/>
		<jsp:setProperty property="name" name="action" param="name"/>
		<%=action %>
	</fieldset>
</body>
</html>
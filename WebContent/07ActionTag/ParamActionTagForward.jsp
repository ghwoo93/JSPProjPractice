<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pageUrl="ForwardedPage.jsp?query=쿼리스트링";
	String paramValue = "KOSMO";
	request.setAttribute(
			"member", new MemberDTO("KIM","1234","김기동",null,"20"));
// 	MemberDTO member = (MemberDTO)request.getAttribute("member");
%>
<jsp:forward page="<%=pageUrl %>">
	<jsp:param value="코스모" name="name"/>
	<jsp:param value="<%=paramValue %>" name="id"/>
</jsp:forward>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Common/IsValidate.jsp" %> 

<%
	request.setCharacterEncoding("UTF-8");
	//파라미터 받기
	String id = request.getParameter("id");
	if(!isValidate(out, id, "아이디를 입력하세요")) return;
	
	String pwd = request.getParameter("pwd");
	if(!isValidate(out, pwd, "비밀번호를 입력하세요")) return;
	
	request.setAttribute("id", id);
	request.setAttribute("pwd", pwd);
	//가정 아이디가 KIM, 비번이 1234DLAUS GHLDNJS
	if("KIM".equals(id.trim())&&"1234".equals(pwd.trim())){
		//response.sendRedirect("ForwardRedirectExamMyPage.jsp");
		request.getRequestDispatcher("ForwardRedirectExamMyPage.jsp").forward(request, response);
	}else{
		//response.sendRedirect("ForwardRedirectExample.jsp");
		request.setAttribute("errorMsg", "아이디와 비번 불일치");
		request.getRequestDispatcher("ForwardRedirectExample.jsp").forward(request, response);
	}
	
%>
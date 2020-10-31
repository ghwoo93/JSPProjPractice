<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//사용자 입력값 받기]
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	
	//if("KIM".equals(user.trim())&&"1234".equals(pass.trim())){
	//실제 테이블과 연동
	BBSDao dao = new BBSDao(application, "JSP", "JSP");
	boolean flag = dao.isMember(user,pass);
	if(flag){
		session.setAttribute("USER_ID", user);
		response.sendRedirect("MyPage.jsp");
	}else{//아이디 비번 불일치
		request.setAttribute("NOT_LOGIN", "아이디와 비번 물일치");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		
	}
%>

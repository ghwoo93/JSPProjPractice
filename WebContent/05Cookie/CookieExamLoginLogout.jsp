<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CookieExamLoginLogout.jsp -->
<% 
// 	session.removeAttribute("USER_ID");
// 	session.removeAttribute("USER_PWD");
	session.invalidate();
	response.sendRedirect("CookieExamIndex.jsp");
%>
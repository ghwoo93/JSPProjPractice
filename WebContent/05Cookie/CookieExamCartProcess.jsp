<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] carts = request.getParameterValues("cart");
	for(String cart:carts){
		Cookie cookie = new Cookie(cart,cart);
		cookie.setPath(request.getContextPath());
		response.addCookie(cookie);
	}
	response.sendRedirect("CookieExamIndex.jsp");
%>


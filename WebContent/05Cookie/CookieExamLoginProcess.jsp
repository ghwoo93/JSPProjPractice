<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	String idsave = request.getParameter("idsave");
	
	if("KIM".equals(user.trim())&&"1234".equals(pass.trim())){
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pass);
		if(idsave!=null){
			Cookie cookie = new Cookie("USER_ID",user);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		}else{
			Cookie cookie = new Cookie("USER_ID","");
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		}
		response.sendRedirect("CookieExamIndex.jsp");
	}else{
		request.setAttribute("ERROR", "아이디/비번 불일치");
		request.getRequestDispatcher("CookieExamIndex.jsp").forward(request, response);
	}
%>
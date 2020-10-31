<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CookieExamIndex.jsp -->
<% 
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie cookie:cookies){
			//쿠키명 얻ㄱ기
			String name = cookie.getName();
			//쿠키값 얻기
			String value = cookie.getValue();
			//out.println(String.format("%s:%s<br/>", name,value));
			if(name.indexOf("product")!=-1) {
				Cookie cook = new Cookie(name,"");
				cook.setPath(request.getContextPath());
				cook.setMaxAge(-1);
				response.addCookie(cook);
			}
		}		
	}///if
	response.sendRedirect("CookieExamIndex.jsp");
%>

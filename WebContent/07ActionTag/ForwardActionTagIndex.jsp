<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	pageContext.setAttribute("pageVar", "페이지 영역입니다.");
	request.setAttribute("requestVar", "리퀘스트 영역입니다.");
	
	//response.sendRedirect(request.getContextPath()+"/07ActionTag/ForwardActionTagResult.jsp");
	
	//액션태그가 아닌 자바코드로 포워딩
// 	request.getRequestDispatcher("/07ActionTag/ForwardActionTagResult.jsp").forward(request, response);
	
%>
	<!-- 액션태그로 포워딩 -->
	<jsp:forward page="/07ActionTag/ForwardActionTagResult.jsp"/>

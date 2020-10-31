<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	if(!request.getParameter("no").equals("")){
		String no = request.getParameter("no");
		int flag = 0;
		flag = dao.deleteBBS(no);
		if(flag!=0){
			response.sendRedirect(
					request.getContextPath()+"/08BBS/List.jsp");
		}else{%>
			<script type="text/javascript">
			alert('삭제 실패');
			history.back();
			</script>
<%}
	}else{
		response.sendRedirect(
				request.getContextPath()+"/01Directive/ErrorInfo.jsp");
	}
%>
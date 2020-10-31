<%@page import="model.BBSDao"%>
<%@page import="model.BBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	BBSDto dto = new BBSDto();
	if(!request.getParameter("no").equals("")){
		String no = request.getParameter("no");
		dto.setNo(no);
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		if(dao.updateBBS(dto)==0){%>
			<script type="text/javascript">
			alert('수정 실패');
			history.back();
			</script>
	<%
		}else{
			response.sendRedirect(
					request.getContextPath()+"/08BBS/View.jsp?no="+no);
		}
	}else{
		response.sendRedirect(
				request.getContextPath()+"/01Directive/ErrorInfo.jsp");
	}
	
	
%>
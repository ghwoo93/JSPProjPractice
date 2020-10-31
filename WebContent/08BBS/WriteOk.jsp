<%@page import="model.BBSDto"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String id = session.getAttribute("USER_ID").toString();
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	BBSDao dao = new BBSDao(application, "JSP", "JSP");
	BBSDto dto = new BBSDto(null,id,title,content,null,null);
	
	int iFlag = dao.insertBBS(dto);
	if(iFlag==0){%>
		<script type="text/javascript">
		alert('입력 실패');
		history.back();
		</script>
	<%	
	}else{
		response.sendRedirect(request.getContextPath()+"/08BBS/List.jsp");
	}%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul>
	<li><a href="<%=request.getContextPath() %>/01Directive/Index.jsp">Home</a></li>
	<% if(session.getAttribute("USER_ID")==null){ %>
	<li><a href="<%=request.getContextPath()%>/06Session/Login.jsp">LogIn</a></li>
	<% } else { %>
	<li><a href="<%=request.getContextPath()%>/06Session/Logout.jsp">LogOut</a></li>
	<% } %>
	<li><a href="<%=request.getContextPath() %>/01Directive/Member.jsp">SignUp</a></li>
	<li>공지사항</li>
	<li><a href="<%=request.getContextPath()%>/08BBS/List.jsp">게시판</a></li>
	<li>Q&A</li>
</ul>

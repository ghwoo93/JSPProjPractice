<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(!"POST".equals(request.getMethod())){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다')");
		out.println("history.back()");
		out.println("</script>");
		return;
	}/////
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	if("KIM".equals(id)&&"1234".equals(pwd)){
// 		response.sendRedirect(
// 				request.getContextPath()
// 				+"/03InnerObject/ResponseForMyPage.jsp?id="+id+"&pwd="+pwd);
// 		out.println("<script>");
// 		out.println("alert('"+id+"님 반갑습니다.');");
// 		out.println("location.replace('ResponseForMyPage.jsp?id='"+id+"&pwd="+pwd+")");
// 		out.println("</script>");
// 		response.sendRedirect(
// 			request.getContextPath()
// 			+"/03InnerObject/ResponseForMyPage.jsp?id="+id+"&pwd="+pwd);
%>
	<form action="ResponseForMyPage.jsp" method="post">
		<input type="hidden" name="id" value="<%=id%>"/>
		<input type="hidden" name="pwd" value="<%=pwd%>"/>
	</form>
	<script type="text/javascript">
		alert("<%=id%>님 반갑습니다");
		document.forms[0].submit();
	</script>

<%	
	} else {
// 		response.sendRedirect("ResponseForRedirectIndex.jsp");
		out.println("<script>");
		out.println("alert('아이디와 비번 불일치');");
		out.println("location.replace('ResponseForRedirectIndex.jsp');");
		out.println("</script>");
	}
	
	
%>
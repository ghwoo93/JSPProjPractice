<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>pageContext 및 page내장 객체</legend>
		<h2>pageContext</h2>
		<hr/>
		<h4>request내장객체로 전송방식 얻기</h4>
		<%=request.getMethod() %>
		<h4>pageContext내장 객체로 전송방식 얻기</h4>
		<%
		ServletRequest req = pageContext.getRequest(); 
		String method = ((HttpServletRequest)req).getMethod();
		out.println(method);
		%>
		<h4>pageContext내장 객체로 전송방식 얻기</h4>		
		<% pageContext.getOut().println("메소드 체인"); %>
		<h4>application 내장 객체로 서버의 물리적 경로 얻기</h4>
		<%=application.getRealPath("/Images") %>
		<h4>pageContext내장 객체로 서버의 물리적 경로 얻기</h4>
		<%=pageContext.getServletContext().getRealPath("/Images") %>
		
		<h2>page내장 객체</h2>
		<%
			out.println("page내장객체의 클래스명:"+page.getClass().getName()+"<br/>");
			out.println("this내장객체의 클래스명:"+this.getClass().getName()+"<br/>");
			out.println(
					this instanceof HttpServlet ? 
							"page는 서블릿이다":"page는 서블릿이 아니다");
			
		%>
	</fieldset>
</body>
</html>

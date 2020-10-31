<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	private String getRealPath(){
		return this.getServletContext().getRealPath("/Images");
	}
	
	private String getRealPath(ServletContext app){
		return app.getRealPath("/Images");
	}
	private ServletContext application;
	private String getRealPath2(){
		return application.getRealPath("/Images");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>application 내장 객체의 주요 메소드</legend>
		<ul style="list-style: upper-roman;">
			<li>오라클 드라이버:<%=application.getInitParameter("ORACLE_DRIVER") %></li>
			<li>오라클 URL:<%=application.getInitParameter("ORACLE_URL") %></li>
			<li>this.getInitParameter(서블릿 초기화 파라미터):<%=this.getInitParameter("ORACLE_DRIVER") %></li>
			<li>this.getInitParameter(서블릿 초기화 파라미터):<%=this.getInitParameter("SERVLET_INIT") %></li>
			<li><%=config.getInitParameter("SERVLET_INIT") %></li>
		</ul>
		<h2>컨텍스트 초기화 파라미터 목록</h2>
		<ul style="list-style: upper-roman;">
			<%
				Enumeration<String> names =  application.getInitParameterNames();
				while(names.hasMoreElements()){
					String paramName = names.nextElement();
					String paramValue = application.getInitParameter(paramName);
					
				
			%>
			<li><%=paramName %>:<%=paramValue %></li>
			<% } %>
		</ul>
		<h2>서버의 물리적 경로 얻기</h2>
		<ul style="list-style: upper-roman;">
			<li>application내장객체:<%=application.getRealPath("/Styles") %></li>
			<li>request내장객체(주로 서블릿에서 사용):<%=request.getServletContext().getRealPath("/Styles")%></li>
			<li>session객체:<%=session.getServletContext().getRealPath("Styles") %></li>
			<li>this키워드(선언부에서 사용):<%=this.getServletContext().getRealPath("Styles") %></li>
		</ul>
		<h2>선언부에서 물리적 경로 얻기</h2>
		<ul>
			<li>this 키워드 사용:<%=getRealPath() %></li>
			<li>매개변수로 전달:<%=getRealPath(application) %></li>
			<%this.application=application; %>
			<li>멤버변수 사용:<%=getRealPath2() %></li>
		</ul>
	</fieldset>
</body>
</html>
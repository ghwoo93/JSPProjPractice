<%@page import="model.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("pageInteger", 11);
	pageContext.setAttribute("pageString", "페이지 영역에 저장된 문자열");
	pageContext.setAttribute("pageDate", new Date(new java.util.Date().getTime()));
	pageContext.setAttribute("pageMemberFirst", new MemberDTO("KIM","1234","김길동",null,"20"));
	pageContext.setAttribute("pageMemberSecond", new MemberDTO("PARK","1234","김길동",null,"20"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageScopeIndex</title>
</head>
<body>
	<fieldset>
		<legend>페이지 영역</legend>
		<h2>페이지 영역에 저장된 속성 읽기</h2>
		<%
		Object object = pageContext.getAttribute("pageMemberFirst");
		String firstMemberStr = "";
		if(object instanceof MemberDTO)
			firstMemberStr = 
				String.format(
						"이름:%s,아이디:%s,비번:%s,나이:%s", 
						((MemberDTO)object).getName(),
						((MemberDTO)object).getId(),
						((MemberDTO)object).getPwd(),
						((MemberDTO)object).getAge());
		MemberDTO second = (MemberDTO)pageContext.getAttribute("pageMemberSecond");			
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer타입:<%=pageContext.getAttribute("pageInteger") %></li>
			<li>String타입:<%=pageContext.getAttribute("pageString") %></li>
			<li>Date타입:<%=pageContext.getAttribute("pageDate") %></li>
			<li>MemberDTO타입1st:<%=firstMemberStr %></li>
			<li>MemberDTO타입2nd:<%=second %></li>
		</ul>
		<h2>페이지 영역에 저장된 속성 삭제 후 읽기</h2>
		<%
			pageContext.removeAttribute("NoKey");
		
			pageContext.removeAttribute("pageInteger");
			pageContext.removeAttribute("pageString");
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer타입:<%=pageContext.getAttribute("pageInteger") %></li>
			<li>String타입:<%=pageContext.getAttribute("pageString") %></li>
			<li>Date타입:<%=pageContext.getAttribute("pageDate") %></li>
			<li>MemberDTO타입1st:<%=firstMemberStr %></li>
			<li>MemberDTO타입2nd:<%=second %></li>
		</ul>
		<h2>페이지 이동</h2>
		<a href="PageScopeResult.jsp">사용자 클릭에 의한 이동</a>
	</fieldset>
	<%@ include file="pageScopeIncludePage.jsp" %>
</body>
</html>
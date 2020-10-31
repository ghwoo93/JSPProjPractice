<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationScopeResult</title>
</head>
<body>
	<fieldset>
		<legend>application영역에 저장된 속성 읽기</legend>
		<h2>리스트 계열 컬렉션</h2>
		<ul style="list-style: upper-roman;">
			<%
			List<MemberDTO> list = (List<MemberDTO>)application.getAttribute("list"); 
			for(MemberDTO m:list){%>
			<li><%=m %></li>
			<%
			}
			%>
		</ul>
		<h2>맵 계열 컬렉션</h2>
		<ul style="list-style: upper-roman;">
		<%
		Map<String,MemberDTO> map = (Map<String,MemberDTO>)application.getAttribute("map");
		Set<String> keys = map.keySet();
		for(String key:keys){ %>
			<li><%=map.get(key) %></li>
		<%
		}
		%>
		</ul>
	</fieldset>
</body>
</html>
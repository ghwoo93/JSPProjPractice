<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!private String codeToValue(String code) {
		switch (code.toUpperCase()) {
		case "ECO":
			return "경제";
		case "POL":
			return "정치";
		case "SPO":
			return "스포츠";
		default:
			return "연예";
		}
	}%>
<%
	request.setCharacterEncoding("UTF-8");
//파라미터
String name = request.getParameter("name");
String gender = request.getParameter("gender");
//String inter = request.getParameter("inter");
String[] inter = request.getParameterValues("inter");
// 	out.println(
// 			String.format(
// 					"name:%s,gender:%s,inter:%s", name,gender,inter));
String values = "";
if (name != null && name.trim().length() != 0 && gender != null && inter != null) {
	values = String.format("이름:%s,성별:%s,관심사:", name, gender);
	for (String code : inter)
		values += codeToValue(code) + " ";
}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>사용자가 전송한 파라미터와 관련된 request객체의 메소드</legend>
		<h3>form태그를 이용한 값 전송</h3>
		<form method="get">
			<table
				cellspacing="1"
				bgcolor="gray">
				<tr bgcolor="white">
					<td>이름</td>
					<td><input
						type="text"
						name="name" /></td>
				</tr>
				<tr bgcolor="white">
					<td>성별</td>
					<td>남<input
						type="radio"
						name="gender"
						value="남자" /> 여<input
						type="radio"
						name="gender"
						value="여자" />
					</td>
				</tr>
				<tr bgcolor="white">
					<td>관심사항</td>
					<td>경제<input
						type="checkbox"
						name="inter"
						value="eco" /> 정치<input
						type="checkbox"
						name="inter"
						value="pol" /> 스포츠<input
						type="checkbox"
						name="inter"
						value="spo" /> 연예<input
						type="checkbox"
						name="inter"
						value="ent" />
					</td>
				</tr>
				<tr
					bgcolor="white"
					align="center">
					<td colspan="2"><input
						type="submit"
						value="확인" /></td>
				</tr>
			</table>
		</form>
		<!--값 출력-->
		<%=values%>
		<h3>A태그를 이용한 값 전송</h3>
		<a
			href="RequestForParameter.jsp?name=홍길동&gender=남&inter=spo&inter=ent">GET</a>
		<h3>모든 파라미터명 얻기</h3>
		<!--
		-request객체의 getParameterNames()메소드로
		얻는다
		-파라미터명 존재 여부판단
		-->
		<ul style="list-style-type: upper-roman;">
			<%
				Enumeration<String> names = request.getParameterNames();
			while (names.hasMoreElements()) {
				String paramNames = names.nextElement();
				if (paramNames.equals("inter")) {
					String[] inters = request.getParameterValues(paramNames);
					String paramValues = "";
					for (String code : inters)
				paramValues += codeToValue(code) + " ";
					out.println("<li>" + paramNames + " : " + paramValues + "</li>");
				} else {
					String paramValue = request.getParameter(paramNames);
					out.println("<li>" + paramNames + " : " + paramValue + "</li>");
				}
			}
			%>
		</ul>
		​
	</fieldset>
	<h2>맵으로 모든 파라미터 받기</h2>
	<ul style="list-style-type: upper-roman;">
		<%
		Map<String, String[]> params = request.getParameterMap();
		Set<String> paramNames = params.keySet();
		for (String key : paramNames) {
			if (paramNames.equals("inter")) {
				String[] inters = params.get(key);
				String paramValues = "";
				for (String code : inters) paramValues += codeToValue(code) + " ";
				out.println("<li>" + paramNames + " : " + paramValues + "</li>");
			} else {
				String[] paramValue = params.get(key);
				out.println("<li>" + paramNames + " : " + paramValue + "</li>");
			}
		}
		%>​
	</ul>
</body>
</html>
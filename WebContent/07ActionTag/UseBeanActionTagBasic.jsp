<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanActionTagBasic.jsp</title>
</head>
<body>
	<fieldset>
		<legend>씨발</legend>
		<jsp:useBean id="member" class="model.MemberDTO" scope="request"/>
		
		<%
// 			//scope속성에 지정한 영역에서 객체 얻기
// 			//인스턴스 변수명은 역시 did엦 지정한 이름으로
// 			MemberDTO member = (MemberDTO)pageContext.getAttribute("member");
// 			//영역에 존재하지 않을 때 생성
// 			if(member==null){
// 				member = new MemberDTO();
// 				pageContext.setAttribute("member", member);				
// 			}
		%>
			
			
			
	
		<%=member.getId() %>
		<h2>setProperty액션 태그로 자바빈 객체 속성 설정</h2>
		<jsp:setProperty property="id" name="member" value="KIM"/>
		<jsp:setProperty property="name" name="member" value="김길동"/>
		
		<%
			member.setAge("20");
			member.setPwd("1234");
		%>
		
		<%=member %>
		
		<h2>getProperty액션 태그로 자바빈 객체 속성 설정</h2>
		<ul>
			<li>아이디:<jsp:getProperty property="id" name="member"/></li>
			<li>비번:<jsp:getProperty property="pwd" name="member"/></li>
			<li>이름:<%=member.getName() %></li>
			<li>나이:<%=member.getAge() %></li>
		</ul>
		
		<jsp:forward page="UseBeanActionTagForward.jsp"/>
		
	</fieldset>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String user= request.getParameter("user");
	String pass= request.getParameter("pass");
	String myPage = "ForwardExamMyPage.jsp"; 
	String idxPage = "ForwardExamLogin.jsp";
	//회원인 경우 로그인처리
	//마이페이지로 이동
	if("KIM".equals(user.trim())&&"1234".equals(pass.trim())){
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pass);
// 		request.getRequestDispatcher("ForwardExamMyPage.jsp?USER_ID="+user+"&USER_PWD="+pass).forward(request, response);
		request.getRequestDispatcher("ForwardExamMyPage.jsp");
	%>
		<jsp:forward page="<%=myPage %>"></jsp:forward>
	<% }else{ 
		//비회원인 경우
		//에러메시지를 저장하고
		request.setAttribute("ERROR", "회원이 아닙니다");
		request.setAttribute("USER_ID", user);
		request.setAttribute("USER_PWD", pass);
	%>
		<jsp:forward page="<%=idxPage %>"></jsp:forward>
	<% } %>
	
	
%>
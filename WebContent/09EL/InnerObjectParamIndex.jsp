<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- InnerObjectParamIndex.jsp -->
<%	//new MemberDTO("KIM","1234","김길동",null,"20")
	//new String("문자열 객체")
	//new Integer(100)
	//페이지 이동전 리퀘스트 영역에 속성저장]
	request.setAttribute("memberDto", new MemberDTO("KIM","1234","김길동",null,"20"));
	request.setAttribute("string", new String("문자열 객체"));
	request.setAttribute("integer", new Integer(100));
	//fisrt 10 second 5
%>
<jsp:forward page="InnerObjectParamResult.jsp">
	<jsp:param value="10" name="first"/>
	<jsp:param value="5" name="second"/>
</jsp:forward>
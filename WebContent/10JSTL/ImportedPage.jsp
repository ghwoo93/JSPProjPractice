<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ImportedPage -->
<hr/>
<h4>포함된 페이지 : ImportedPage.jsp</h4>
<h5>리퀘스트 영역에 저장된 속성</h5>
\${requestScope.requestvar} : ${requestScope.requestvar}
<h5>파라미터로 전달된 값</h5>
<ul>
	<c:forEach var="user" items="${paramValues.user }">
		<li>아이디:${user }</li>
	</c:forEach>
	<c:forEach var="pass" items="${paramValues.pass }">
		<li>비번:${pass }</li>
	</c:forEach>
	
</ul>
<hr/>
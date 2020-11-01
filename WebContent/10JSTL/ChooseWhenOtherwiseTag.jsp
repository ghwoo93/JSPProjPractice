<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/mytag.tld" prefix="my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChooseWhenOtherwiseTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>choose ~ when ~otherwise태그</legend>
		<!-- EL에서 사용할 변수 설정 -->
		<h2>if태그로 짝/홀수 판단</h2>
		<h2>choose ~ when~otherwise태그로 짝/홀수 판단</h2>
		<!--choose태그안에 주석시 에러 .반드시 when~otherwise절만..-->
		<h2>choose ~ when~otherwise태그로 문자열 비교</h2>
	</fieldset>
	<fieldset>
		<legend>점수 확인</legend>
		<form>
			국어 <input type="text" name="kor"/>
			영어 <input type="text" name="eng"/>
			수학 <input type="text" name="math"/>
			<input type="submit" value="확인"/>
		</form>
		
		<!-- 국영수 점수를  받아서 평균이
		    90점이상이면 "A학점"출력
		    80점이상이면 "B학점"출력
		    70점이상이면 "C학점"출력
		    60점이상이면 "D학점"출력
		    60점미만이면 "F학점"출력.
		    단,EL과 JSTL만을 사용하여라
		   -->
		 <c:set var="kor" value="${param.kor }"/>
		 <c:set var="eng" value="${param.eng }"/>
		 <c:set var="math" value="${param.math }"/>
		 <!-- 파라 미터 체크 -->
		 <c:if test="${not empty kor}"> 
		 	<!-- 숫자인지 체크 -->
		 	<c:if test="${my:isNumber(kor) }">
		 		<!-- 평균 저장 -->
		 		<c:set var="sum" value="${(kor+eng+math)/3 }"/>
		 	</c:if>
		 <c:choose>
		 	<c:when test="${sum>=90 }">
		 		${'A학점' }
		 	</c:when>
		 	<c:when test="${sum>=80 }">
		 		${'B학점' }
		 	</c:when>
		 	<c:when test="${sum>=70 }">
		 		${'C학점' }
		 	</c:when>
		 	<c:when test="${sum>=60 }">
		 		${'D학점' }
		 	</c:when>
		 	<c:otherwise>
		 		${'F학점' }
		 	</c:otherwise>
		 </c:choose>
		 </c:if>
		 
	</fieldset>
	
	<fieldset>
		<legend>로그인</legend>
		<form>
			아이디 <input type="text" name="user"/>
			비밀번호 <input type="text" name="pass"/>			
			<input type="submit" value="로그인"/>
		</form>
		 <!--
	           회원인 경우 "?님 반갑습니다"
	           아닌 경우 "로그인후 이용하세요"출력.
	           단,자신만의 태그라이브러리를 만들어
	           EL식으로 호출하여라 그리고 
	           실제 멤버 테이블을 연동(BBS게시판에서 사용했던 회원테이블 연동)하여라.
	        --> 
	     <c:if test="${not empty param.user }">
		     <c:if test="${my:isMember(pageContext.servletContext,param.user,param.pass) }" var="result">
		     	${param.user }님 반갑습니다.
		     </c:if> 
		     <c:if test="${not result }">
		     	로그인 후 이용하세요
		     </c:if>
	     </c:if>
	</fieldset>
</body>
</html>
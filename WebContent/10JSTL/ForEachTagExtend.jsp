<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachTagExtend.jsp</title>
</head>
<body>
	<fieldset>
		<legend>확장 for문 형태의 forEach태그</legend>
		<!-- 
		 필수 속성 : items 및 var
		 -배열이나 컬렉션에서 값을 꺼내올때 사용	
		-varStatus에 지정한 LoopStatusTag객체의
		 index속성은 항상 0부터 시작	
	 	-->
		<%
			String[] colors = { "red", "green", "blue", "#9944a5" };
		%>
		<h2>자바코드로 배열 출력</h2>
		<h2>EL 및 JSTL로 배열 출력</h2>
		<h2>varStatus속성</h2>
		<h2>리스트 계열 컬렉션</h2>
		<%
			//데이타 준비]
		List list = new Vector();
		list.add(new MemberDTO("KIM", "1234", "김길동", null, null));
		list.add(new MemberDTO("LEE", "1234", "이길동", null, null));
		list.add(new MemberDTO("PARK", "1234", "박길동", null, null));
		%>
		<h4>일반 for문 형태의 forEach태그로 출력</h4>
		<h4>확장 for문 형태의 forEach태그로 출력</h4>
		<h2>맵계열 컬렉션</h2>
		<%
			//데이타 준비
		Map map = new HashMap();
		map.put("first", list.get(0));
		map.put("second", list.get(1));
		map.put("third", list.get(2));
		%>
		<h4>키값을 알때 :el변수.키값 혹은 el변수["키값"]</h4>
		<ul>

		</ul>
		<h4>키값을 모를때</h4>
		<!-- 
		      KEY값 얻기 : var속성에 지정한 \${EL변수명.key}
		      VALUE값 얻기: var속성에 지정한 \${EL변수명.value}
		-->
		<ul>

		</ul>
	</fieldset>
	<!-- 
  	회원제 게시판에 저장된 글을 읽어와서
 	목록으로 출력하여라(위에서 10개만:start=1,end=10).
  	태그 라이브러에 목록을 반환하는 메소드를
  	정의하여 그 메소드를 EL에서 사용하도록 하여라  
  	단,EL과 JSTL만 사용하여라. 
  --> 
	<fieldset>
		<legend>게시판 글 읽어오기</legend>
		<table style="width: 70%; background-color: green; border-spacing: 1px">
			<tr style="background-color: white;">
				<th style="width: 10%">번호</th>
				<th>제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일</th>
			</tr>
				<tr style="background-color: white; text-align: center">
					<td></td>
					<td style="text-align: left"></td>
					<td></td>
					<td></td>
				</tr>
		</table>
	</fieldset>
</body>
</html>
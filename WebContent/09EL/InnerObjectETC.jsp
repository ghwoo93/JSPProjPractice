<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>EL의 기타 내장 객체들</legend>
		<h2>1. EL의 pageContext</h2>
		<h4>자바코드로 컨텍스트 루트(/JSPProj) 얻기</h4>
		<%
			String path = ((HttpServletRequest) pageContext.getRequest()).getContextPath();
		%>
		<ul>
			<li>방법1:request 내장객체 - <%=request.getContextPath()%></li>
			<li>방법2:pageContext내장객체 - <%=path%></li>
		</ul>
		<h4>EL로 컨텍스트 루트(/JSPProj) 얻기</h4>
		\${pageContext.request.contextPath }:${pageContext.request.contextPath }
		<h4>자바코드로 URL얻기</h4>
		<%=request.getRequestURL()%>
		<h4>EL로 URL얻기</h4>
		\${pageContext.request.requestURL }:${pageContext.request.requestURL }
		<h4>자바코드로 세션의 유효시간 얻기</h4>
		<%=session.getMaxInactiveInterval()%>초
		<h4>EL로 세션의 유효시간 얻기</h4>
		${pageContext.session.maxInactiveInterval}초
		<h2>2. EL의 header내장 객체</h2>
		<!-- JSP로 요청 헤더 정보를 얻어 오려면
		       request.getHeader("user-agent")식으로 
		              얻는다.
      	  -->
		<h4>자바코드로 요청 헤더값 얻기</h4>
		<%=request.getHeader("user-agent")%><br />
		<%=request.getHeader("accept")%><br />
		<%=request.getHeader("host")%><br />
		<h4>EL로 요청 헤더값 얻기</h4>
		<!-- 
	    	EL식으로 요청헤더명에 따른 
	   		헤더 값을 출력할때는
	    	header.요청헤더명이나
	    	혹은 header["요청헤더명"]
	                단,키값에 해당하는 요청헤더명에
	               특수 문자가 들어가 있는 경우에는 
	               무조건 []사용
	     -->
		\${header.user-agent }:${header.user-agent }<br />
		\${header['user-agent'] }:${header['user-agent'] }<br />
		\${header.accept }:${header.accept }
		\${header.host }:${header.host }

		<h2>3. EL의 cookie내장 객체</h2>
		<!-- 
			※EL에서는 값을 설정하거나 영역에 속성을 
			  저장하지는 못한다.
			  단지 저장된 값을 출력만 할 수 있다.
		 	-->
		<h4>자바코드로 쿠키값 읽기</h4>
		<%
			Cookie coo = new Cookie("KOSMO", "한소인");
		coo.setPath(request.getContextPath());
		response.addCookie(coo);
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cook : cookies) {
		%>
		<%=cook.getName()%>:<%=cook.getValue()%><br />
		<%
			}
		}
		%>
		<h4>EL로 쿠키값 읽기</h4>
		\${cookie.KOSMO }:${cookie.KOSMO }<br />
		\${cookie.KOSMO.value }:${cookie.KOSMO.value }<br />
		<h5>JSTL을 이용해서 쿠키배열 출력</h5>
		<c:forEach
			var="cook"
			items="${pageContext.request.cookies }"
		>
			${cook }:${cook.value }<br />
		</c:forEach>
		<h2>4. EL의 initParam내장 객체</h2>
		<!-- 
		     	컨텍스트 초기화 파라미터를 얻어 올수 있는 내장 객체  
		   	-->
		<!-- 
		   [Context초기화 파라미터]
		   -Context초기화 파라미터는 ServletContext의
		    getInitParameter("파라미터명")메소드를 통해서 
		    얻는다.
		   -Context를 구성하는 모든 서블릿에서 공유할 수 있는 변수
		   [Servlet초기화 파라미터]
		   -Servlet초기화 파라미터는 ServletConfig의
		    getInitParameter("파라미터명")메소드를 통해서 얻는다
		   -해당 서블릿에서만 사용할 수 있는 변수		   
		      ※초기화 파라미터는 web.xml에 등록
		   -->
		<h4>자바코드로 컨텍스트 초기화 파라미터 얻기</h4>
		<ul>
			<li><%=application.getInitParameter("ORACLE_URL")%></li>
			<li><%=application.getInitParameter("ORACLE_DRIVER")%></li>
			<li><%=application.getInitParameter("PAGE_SIZE")%></li>
			<li><%=application.getInitParameter("BLOCK_PAGE")%></li>
		</ul>


		<h4>EL로 컨텍스트 초기화 파라미터 얻기</h4>
		<ul>
			<li>\${initParam.ORACLE_URL}:${initParam.ORACLE_URL}</li>
			<li>\${initParam.ORACLE_DRIVER
				}:${initParam.ORACLE_DRIVER }</li>
			<li>\${initParam.PAGE_SIZE
				}:${initParam.BLOCK_PAGE }</li>
			<li>\${initParam.BLOCK_PAGE
				}:${initParam.BLOCK_PAGE }</li>
		</ul>

		<h2>컬렉션에 저장된 객체를 EL로 출력</h2>
		<%
			//데이타 준비
			MemberDTO first = new MemberDTO("KIM", "1234", "김길동", null, null);
			MemberDTO second = new MemberDTO("LEE", "1234", "이길동", null, null);
			//리스트 계열 컬렉션에 객체 저장]
			List<MemberDTO> list = new Vector<MemberDTO>();
			list.add(first);
			list.add(second);
			//맵 계열 컬렉션에 객체 저장]
			Map<String, MemberDTO> map = new HashMap<String, MemberDTO>();
			map.put("first", first);
			map.put("second", second);
		%>
		<h2>자바코드로 출력</h2>
		<h4>리스트 계열 컬렉션</h4>
		<h6>일반 for문</h6>
		<ul>
		<%
			for(int i=0;i<list.size();i++){%>
				<li><%=list.get(i) %></li>
			<% }
		%>
		</ul>
		<h6>확장 for문</h6>
		<ul>
			<% for(MemberDTO member:list){ %>
				<li><%=member  %></li>
			<% } %>
		</ul>
		<h4>맵 계열 컬렉션</h4>
		<ul>
		<% 
			Set<String> keys = map.keySet();
			for(String key:keys){
		%>		
			<li><%=map.get(key) %></li>
		<%		
			}
		%>
		</ul>
		<h2>EL로 출력</h2>
		<c:set var="elList" value="<%=list %>"/>
		<c:set var="elMap" value="<%=map %>"/>
		<!-- EL에서 사용할 수 있도록 JSTL을 이용해서
                                  변수로 설정
    	   	-->
		<!-- 스크립팅요소에서 선언한 변수를
		         EL식에서 사용해봤자 소용없다
		      	 JSTL을 이용해서 EL변수로 설정해야 한다.
		  	-->
		<h4>리스트 계열 컬렉션</h4>
		<!-- 
			List계열:
			el변수[인덱스]
			단,el변수.인덱스는 사용불가
			Map계열:
			el변수.키값
			혹은 el변수["키값"]
			     el변수['키값']		
		   -->
		<h6>JSTL 미 사용</h6>
		<ul>
			<li>${elList[0] }</li>
			<li>${elList[1] }</li>
		</ul>
		<h6>JSTL 사용</h6>
		<ul>
		<c:forEach var="list" items="${elList}">
			<li>${list }</li>
		</c:forEach>
		</ul>
		<h4>맵 계열 컬렉션</h4>
		<h6>JSTL 미 사용</h6>
		<ul>
			<li>${elMap.first}</li>
			<li>${elMap.second}</li>
		</ul>
		<h6>JSTL 사용</h6>
		<ul>
			<c:forEach var="item" items="${elMap }">
				<li>${item }</li>
			</c:forEach>
		</ul>
		<h5>컬렉션에 저장된 객체 수 : el변수.size()</h5>
		${elMap.size() }
	</fieldset>
</body>
</html>
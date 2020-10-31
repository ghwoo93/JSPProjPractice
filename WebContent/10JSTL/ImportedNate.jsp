<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- ImportedNate.jsp -->

<c:import url="https://www.nate.com" var="nate" />
<c:set var="css"
	value="${fn:replace(
				fn:replace(
					nate,'http://localhost:8080/css','https://www.nate.com/css'),
					'http://localhost:8080/js',
					'https://www.nate.com/js') }" />
${css}

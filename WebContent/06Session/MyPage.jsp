<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	rel="stylesheet"
	href="<%=request.getContextPath()%>/Styles/divLayout.css"
>
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!-- 탑메뉴 및 로고를 감싸는 div 시작 -->
			<div class="header">
				<div class="logo">
					<img
						src="<%=request.getContextPath()%>/Images/logo.jpg"
						alt="회사 로고 이미지"
					>
				</div>
				<div class="topMenu">
					<%@ include file="/Template/Top.jsp"%>
				</div>
			</div>
			<!-- 탑메뉴 및 로고를 감싸는 div 끝 -->
			<!-- Left메뉴 및 실제내용 감싸는 div 시작 -->
			<div class="section">
				<div class="leftMenu">
					<%@ include file="/Template/Left.jsp"%>
				</div>
				<div class="body">
					<div class="content">
						<fieldset>
							<legend>마이페이지</legend>
							<table
								style="width: 300px; border-spacing: 1px; background-color: green"
							>
								<tr style="background-color: white">
									<td style="width: 25%">아이디</td>
									<td style="padding-left: 5px">
										<span><%=session.getAttribute("USER_ID") == null ? "" : session.getAttribute("USER_ID")%></span>
									</td>
								</tr>
								<tr style="background-color: white">
									<td colspan="2">
										<a href="Logout.jsp">로그아웃</a>
									</td>
								</tr>
							</table>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
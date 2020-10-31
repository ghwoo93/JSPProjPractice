<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ include file="/Common/IsMember.jsp"%>
<%@ include file="/01Directive/IncludePage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta
	name="viewport"
	content="width=device-width, initial-scale=1.0"
>
<title>Index.html</title>
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
						<fieldset style="padding: 10px">
							<legend>글 작성 페이지</legend>
							<form
								action="WriteOk.jsp"
								method="post"
							>
								<table
									width="75%"
									bgcolor="gray"
									cellspacing="1"
								>
									<tr bgcolor="white">
										<td
											width="30%"
											align="center"
										>제목</td>
										<td style="padding: 5px">
											<input
												type="text"
												name="title"
												style="width: 98%"
											/>
										</td>
									</tr>
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td style="padding: 5px">
											<textarea
												rows="10"
												style="width: 98%"
												name="content"
											></textarea>
										</td>
									</tr>
									<tr
										bgcolor="white"
										align="center"
									>
										<td colspan="2">
											<input
												type="submit"
												value="등록"
											/>
										</td>
									</tr>
								</table>
							</form>
						</fieldset>
					</div>
				</div>
			</div>
			<!-- Left메뉴 및 실제내용 감싸는 div 끝 -->
			<!-- footer를 감싸는 div 시작 -->
			<div class="footer">
				<%@ include file="/Template/Footer.jsp"%>
			</div>
			<!-- footer를 감싸는 div 끝 -->
		</div>
	</div>
</body>
</html>
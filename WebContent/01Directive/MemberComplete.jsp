<%@page import="java.util.Arrays"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	private boolean isValidate(JspWriter out,String param){
		if(param == null || param.trim().length()==0){
			try{
				out.println("<script>");
				out.println("alert(\"값을 입력하거나 선택해야합니다\");");
				out.println("history.back();");
				out.println("</script>");
			}
			catch(IOException e){e.printStackTrace();}
			return false;
		}
		return true;
	}
	
	private boolean isValidate(JspWriter out,String[] param){
		if(param == null){
			try{
				out.println("<script>");
				out.println("alert(\"관심사항을 선택해야합니다\");");
				out.println("history.back();");
				out.println("</script>");
			}
			catch(IOException e){e.printStackTrace();}
			return false;
		}
		else{
			if(param.length < 3){
				try{
					out.println("<script>");
					out.println("alert(\"관심사항은 3개 이상 선택해야합니다\");");
					out.println("history.back();");
					out.println("</script>");
				}
				catch(IOException e){e.printStackTrace();}
				return false;
			}
		}
		return true;
}
%>
<%
	request.setCharacterEncoding("UTF-8");
	if(!"POST".equals(request.getMethod())){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다');");
		out.println("self.close();");
		out.println("</script>");
		return;//void _jspService()메소드 빠져 나가기
	}
	
	String id = request.getParameter("id");
	if(!isValidate(out, id)) return;
	String pwd = request.getParameter("pwd");
	if(!isValidate(out, pwd)) return;
	String gender = request.getParameter("gender");
	if(!isValidate(out, gender)) return;
	String[] inters = request.getParameterValues("inter");
	if(!isValidate(out, inters)) return;
	String grade = request.getParameter("grade");
	if(!isValidate(out, grade)) return;
	String file = request.getParameter("file");
	if(!isValidate(out, file)) return;
	String self = request.getParameter("self");
	if(!isValidate(out, self)) return;
	
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MemberComplete.jsp</title>
<link rel="stylesheet" href="../Styles/divLayout.css">
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!-- 탑메뉴 및 로고를 감싸는 div 시작 -->
			<div class="header">
				<div class="logo">
					<img src="../Images/logo.jpg" alt="회사 로고 이미지">
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
						<h2>회원가입 완료페이지</h2>
						<table
							style="width: 75%; border-spacing: 1px; background-color: green">
							<tr style="background-color: white">
								<td>아이디</td>
								<td><input type="text" name="id" size="20" value="<%=id %>" />
									<span style="color: red; font-size: 0.8em" id="idError"></span></td>
							</tr>
							<tr style="background-color: white">
								<td>비밀번호</td>
								<td><input type="password" name="pwd" size="20"
									value="<%=pwd %>" /></td>
							</tr>
							<tr style="background-color: white">
								<td>성별</td>
								<td><input type="radio" name="gender" value="man"
									<%if("MAN".equals(gender.toUpperCase())){ %> checked <% } %> />남 <input
									type="radio" name="gender" value="woman"
									<%if("WOMAN".equals(gender.toUpperCase())){ %> checked <% } %> />녀 <input
									type="radio" name="gender" value="trans"
									<%if("TRANS".equals(gender.toUpperCase())){ %> checked <% } %> />트랜스젠더</td>
							</tr>
							<!--if(Arrays.toString(inter).indexOf("pol")!=-1){} -->
							<tr style="background-color: white">
								<td>관심사항</td>
								<td><input
									type="checkbox"
									name="inter"
									value="pol"
									<%if (Arrays.toString(inters).indexOf("pol") != -1) {%>
									checked
									<%}%> />정치 <input
									type="checkbox"
									name="inter"
									value="eco"
									<%if (Arrays.toString(inters).indexOf("eco") != -1) {%>
									checked
									<%}%> />경제 <input
									type="checkbox"
									name="inter"
									value="spo"
									<%if (Arrays.toString(inters).indexOf("spo") != -1) {%>
									checked
									<%}%> />스포츠 <input
									type="checkbox"
									name="inter"
									value="ent"
									<%if(Arrays.toString(inters).indexOf("ent")!=-1){ %>
									checked
									<% } %> />연예</td>
							</tr>
							<tr style="background-color: white">
								<td>학력사항</td>
								<td><select name="grade">
										<option value="">==학력을 선택하세요==</option>
										<%--<%if("ELE".equals(grade.toUpperCase())){%> select <% } %> --%>
										<option value="ele"
											<%if("ELE".equals(grade.toUpperCase())){ %> selected <% } %>>초등학교</option>
										<option value="mid"
											<%if("MID".equals(grade.toUpperCase())){ %> selected <% } %>>중학교</option>
										<option value="hig"
											<%if("HIG".equals(grade.toUpperCase())){ %> selected <% } %>>고등학교</option>
										<option value="uni"
											<%if("UNI".equals(grade.toUpperCase())){ %> selected <% } %>>대학교</option>
								</select></td>
							</tr>
							<tr style="background-color: white">
								<td>첨부파일</td>
								<td><input type="file" name="file" size="40" /><%=file %></td>
							</tr>
							<tr style="background-color: white">
								<td>자기소개</td>
								<td><textarea cols="60" rows="5" name="self"><%=self %></textarea></td>
							</tr>
						</table>
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
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//멤버변수
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private JspWriter out;
	
	//메소드
	private void connect(ServletContext app){
		try{
			//드라이버 로딩
			Class.forName(app.getInitParameter("ORACLE_DRIVER"));
			conn = 
				DriverManager.getConnection(
						app.getInitParameter("ORACLE_URL"),"scott","scott");
			out.println("<h2>데이터 베이스 연결 성공</h2>");
		} catch (ClassNotFoundException e) {
			try{
				out.println("<h2>드라이버 로딩 실패</h2>");
			} catch (IOException e1) {e1.printStackTrace();}
		} catch (SQLException | IOException e) {
			try{
				out.println("<h2>데이터 베이스 연결 실패</h2>");
			} catch (IOException e1) {e1.printStackTrace();}			
		}
	}
	private void close(){
		try{
			if(rs!=null)rs.close();
			if(psmt!=null)psmt.close();
			if(conn!=null)conn.close();
		} catch (SQLException e){e.printStackTrace();}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>스크립팅 요소 연습</legend>
		<h2>표현식으로 출력</h2>
		<table style="border-spacing: 2px;background-color: green">
			<tr style="background-color: white">
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
				<th>입사일</th>
				<th>연봉</th>
				<th>보너스</th>
				<th>부서코드</th>
			</tr>
			<%
				this.out=out;
				connect(application);
				String sql="SELECT * FROM emp ORDER BY empno DESC";
				psmt = 
					conn.prepareStatement(
							sql,
							ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
				rs = psmt.executeQuery();
				while(rs.next()){	%>
			<tr style="background-color: white">
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getDate(5) %></td>
				<td><%= rs.getString(6) %></td>
				<td><%= rs.getString(7)==null?"":rs.getString(7) %></td>
				<td><%= rs.getString(4) %></td>
			</tr>
			<% } %>
		</table>
		<h2>OUT내장객체로 출력</h2>
		<table style="border-spacing: 2px;background-color: green">
			<tr style="background-color: white">
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
				<th>입사일</th>
				<th>연봉</th>
				<th>보너스</th>
				<th>부서코드</th>
			</tr>
			<%
				while(rs.previous()){
					out.println("<tr style=\"background-color: white\">");
					out.println("<td>"+rs.getString(1)+"</td>");
					out.println("<td>"+rs.getString(2)+"</td>");
					out.println("<td>"+rs.getString(3)+"</td>");
					out.println("<td>"+rs.getDate(5)+"</td>");
					out.println("<td>"+rs.getString(6)+"</td>");
					out.println("<td>"+(rs.getString(7)==null?"":rs.getString(7))+"</td>");
					out.println("<td>"+rs.getString(4)+"</td>");
					out.println("</tr>");
				}
			%>
		</table>
		<%
			close();
		%>
	</fieldset>
</body>
</html>
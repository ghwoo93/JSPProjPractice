<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public static final int INT_MAX = Integer.MAX_VALUE;

	String mVariable = "<h3>선언부에서 선언한 변수</h3>";
	
	
	int getMaxNumber(int num1,int num2){
		return num1 > num2 ? num1 : num2;
	}
	
	JspWriter out;
	void showMessage(String msg){
		try{
			out.println(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void showMessage(String msg,JspWriter out){
		try{
			this.out = out;
			out.println(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		<legend>스트립팅 요소(원소)</legend>
		<%
			String localVariable = "<h4>스크립틀릿 안에서 선언한 변수</h4>";
			out.println(INT_MAX); 
			out.println(mVariable);
			out.println(localVariable);
			out.println(getMaxNumber(10, 100));
			
			this.out=out;
			showMessage("<h4>this.out=out방식으로 선언부에서 선언한 내장객체 전달</h4>");
			
			showMessage("<h4>매개변수로 내장 객체 전달</h4>",out);
			
			
		%>
		<h3>표현식으로 출력</h3>
		<%= INT_MAX %>
		<%= mVariable %>
		<%= localVariable %>
		<%= "최대값:"+getMaxNumber(10, 100) %>
		
	</fieldset>
</body>
</html>
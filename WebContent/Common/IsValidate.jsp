<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- IsValidate.jsp -->
<%!
	//관심사항을 제외한 입력요소의 유효성 체크
	private boolean isValidate(JspWriter out,String param,String message){
		if(param == null || param.trim().length()==0){
			try{
				out.println("<script>");
				out.println("alert(\""+message+"\");");
				out.println("history.back();");
				out.println("</script>");
			}
			catch(IOException e){e.printStackTrace();}
			return false;
		}
		return true;
	}
	
	private boolean isValidate(JspWriter out,String[] param,int requiredCount){
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
			if(param.length < requiredCount){
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
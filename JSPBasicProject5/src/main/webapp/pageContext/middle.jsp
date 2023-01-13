<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	System.out.println("middle:id="+id);
	System.out.println("middle:pwd="+pwd);
	
	//화면 이동
	response.sendRedirect("output.jsp");
%>
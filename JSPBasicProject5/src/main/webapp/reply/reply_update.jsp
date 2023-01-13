<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	//값을 받는다
	String no=request.getParameter("no");
	String fno=request.getParameter("fno");
	String msg=request.getParameter("msg");
	
	//DAO연결 => 
	ReplyDAO dao=new ReplyDAO();
	dao.replyUpdate(Integer.parseInt(no),msg);
	//화면 이동
	response.sendRedirect("../include/main.jsp?mode=2&fno="+fno);
%>
<%@page import="com.sist.dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     String no=request.getParameter("no");
     String fno=request.getParameter("fno");
     
     // DAO연동 => 댓글 삭제 
     ReplyDAO dao=new ReplyDAO();
     dao.replyDelete(Integer.parseInt(no));
     // 화면 이동 
     response.sendRedirect("../include/main.jsp?mode=2&fno="+fno);
%>
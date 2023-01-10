<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
    String pwd=request.getParameter("pwd");
    //DAO연결
    BoardDAO dao=new BoardDAO();
    boolean bCheck=dao.boardDelete(Integer.parseInt(no),pwd);
    //이동 => 목록
    if(bCheck==true){
    	response.sendRedirect("list.jsp");
    }else{
%>
		<script>
			alert("비밀번호가 틀리다!");
			history.back();
		</script>
<%
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%--
	<jsp:useBean id="bean" class="com.sist.vo.MyBean">
	== MyBean bean=new MyBean();
	
	<jsp:setProperty name="bean" property="*"/>
	== String xxx=request.getParameter("xxx");
 --%>
<jsp:useBean id="bean" class="com.sist.vo.MyBean">
  <jsp:setProperty name="bean" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>개인 정보 출력</h1>
	이름 : <jsp:getProperty name="bean" property="name"/><br>
	성별 : <jsp:getProperty name="bean" property="sex"/><br>
	지역 : <jsp:getProperty name="bean" property="loc"/><br>
	소개 : <jsp:getProperty name="bean" property="content"/><br>
</body>
</html>
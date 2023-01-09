<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*"%>
<%
	MyBean bean=new MyBean();
	//1. 사용자가 보내준 데이터를 받는다
	//1-1 한글 변환
	request.setCharacterEncoding("UTF-8");
	//1-2 데이터 받기
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String loc=request.getParameter("loc");
	String content=request.getParameter("content");
	
	bean.setName(name);
	bean.setSex(sex);
	bean.setLoc(loc);
	bean.setContent(content);
	//=> 오라클
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>개인 정보 출력</h1>
	이름 : <%=bean.getName() %><br>
	성별 : <%=bean.getSex() %><br>
	지역 : <%=bean.getLoc() %><br>
	소개 : <%=bean.getContent() %><br>
</body>
</html>
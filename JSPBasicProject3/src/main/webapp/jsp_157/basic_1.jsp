<%--
	JSP 액션 태그
	<jsp:~~>
	1) <jsp:include> : 동적, <%@ include %> :정적 (메뉴,헤더,푸터)
	       |
	     section / 부메뉴
	   -------------------  ---------------------------
	   컴파일 : HTML           JSP
	2) <jsp:setProperty>
		  <jsp:setProperty name="객체명(id)" property="*">
		  => 전체 객체가 가지고 있는 setXxx()
		  <jsp:setProperty name="객체명(id)" property="name" value="aaa">
		  => setName("aaa")
	3) <jsp:getProperty>
		  <jsp:getProperty name="ID명" property="name"/>
		  => getName()
		  <% %> => 사라짐
		  ==> View(태그형 프로그램)
	4) <jsp:forward>
		  => 화면 이동 (내용만 변경) ==> MVC용 (spring)
	5) <jsp:useBean> : 메모리 할당
	   <jsp:useBean id="a" class="com.sist.dao.A">
	                   --- 객체명  --------------- 클래스
	    => A a=new A()
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
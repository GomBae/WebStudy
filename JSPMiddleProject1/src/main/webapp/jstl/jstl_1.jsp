<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%--
	1. JSTL (JSP Standard Tag Library) => Tag형으로 자바 문법을 제작
	   1) core : 제어문, URL(이동), 변수설정
	   --------------------------------
	   		<c:forEach> => for
	   		<c:if> => if =====> else문장이 없다
	   		<c:choose>
	   		  <c:when></c:when>
	   		  <c:otherwise></c:otherwise>
	   		</c:choose>
	   		<c:redirect url=""> sendRedirect()
	   		<c:set var="" value=""> => request.setAttribute()
	   		<c:forTokens> => 
	   2) fmt : 변환(날짜, 숫자) ==> 오라클에서 변환
	   			<fmt:formatDate>
	   			<fmt:formatNumber>
	   3) fn : String 메소드 => 자바 코딩
	   			${fn:substring()}
	   --------------------- 자바
	   4) sql : DAO
	   5) xml : OXM
	   ---------------------
 --%>
<%-- 라이브러리 임포트 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<String> list=new ArrayList<String>();
	list.add("홍길동");
	list.add("이순신");
	list.add("박문수");
	list.add("심청이");
	list.add("강감찬");
	
	request.setAttribute("list", list);
%>
<%-- 제어문 --%>
<h1>자바 사용</h1>
<%
	for(int i=1; i<=10;i++)
	{
%>
	<%=i %>&nbsp;
<%
	}
%>
<h1>JSTL</h1>
<%--
	for(int i= 1; i<=10; i++)
		  ---  --    ---  ----
		  var  begin end  step => step이 1일 경우엔 생략이 가능
 --%>
<c:forEach var="i" begin="1" end="10" step="1">
	${i }&nbsp;
</c:forEach>
<h1>for-each 향상된 for</h1>
<ul>
<%
	for(String name:list)
	{
%>
	<li><%=name %></li>
<%
	}
%>
</ul>
<h1>JSTL = forEach</h1>
<ul>
  <c:forEach var="name" items="${list }">
  	<li>${name }</li>
  </c:forEach>
</ul>
<h1>forTokens</h1>
<%
	String color="red,blue,green,yellow,black";
%>
<h1>자바</h1>
<%
	StringTokenizer st=new StringTokenizer(color,",");
	while(st.hasMoreTokens())
	{
%>
	<b><%=st.nextToken() %></b><br>
<%
	}
%>
<h1>JSTL(forTokens)</h1>
<c:forTokens items="red,blue,green,yellow,black" delims="," var="color">
	<b>${color}</b><br>
</c:forTokens>
</body>
</html>
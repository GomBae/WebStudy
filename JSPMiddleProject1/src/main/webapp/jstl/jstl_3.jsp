<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	<c:if> => <c:if test="조건문"> => <c:else>는 존재하지 않는다
	<c:choose>
	
	= 화면 출력
	  request/session 저장 => model클래스
	  <c:forEach>
	  <c:forTokens>
	  <c:if> , <c:choose>
	  <fmt:formatDate>==>oracle
 --%>
<%
	int sex=1;
%>
<%--
	JSTL : XML형식으로 제작
	      ----- 
	      1) 여는 태그/ 닫는 태그가 동일, 단독태그형식을 구현
	         <c:set></c:set>        <c:set/>
	      2) 대소문자 구분 <C:set> (x)
	      3) 속성값은 반드시 ""
 --%>
<c:set var="sex" value="<%=sex %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>&lt;c:if test=""&gt; => 단점은 else가 없다</h1>
  <%
  		if(sex==1)
  		{
  %>
  			남자
  <%
  		}else
  		{
  %>
  			여자
  <%
  		}
  %>
  <h1>JSTL = if</h1>
  <c:if test="${sex==1 }" }>
  남자
  </c:if>
  <c:if test="${sex!=1 }" }>
  여자
  </c:if>
  
  <h1>다중 조건문 &lt;c:choose&gt;</h1>
  <%
  		int star=3;
  %>
  <c:set var="star" value="<%=star %>"/>
  <h1>자바 이용</h1>
  <%
  		if(star==1)
  		{
  			
  		}
  		else if(star==2)
  		{
  			
  		}
  		else if(star==3)
  		{
  			
  		}
  		else if(star==4)
  		{
  			
  		}
  		else if(star==5)
  		{
  			
  		}
  		
  %>
  <h1>JSTL</h1>
  <c:choose>
    <c:when test="{star==1}">★☆☆☆☆</c:when>
    <c:when test="{star==2}">★★☆☆☆</c:when>
    <c:when test="{star==3}">★★★☆☆</c:when>
    <c:when test="{star==4}">★★★★☆</c:when>
    <c:when test="{star==5}">★★★★★</c:when>
    <c:otherwise>☆☆☆☆☆</c:otherwise>
  </c:choose>
</body>
</html>
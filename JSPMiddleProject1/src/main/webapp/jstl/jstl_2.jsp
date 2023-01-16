<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String name="홍길동";
%>
<c:set var="name" value="<%=name %>"/><%--request.setAttribute("name","홍길동") --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>&lt;c:set var="key" value="실제값"&gt; = request.setAttribute(key,value)</h1>
${name }<br>
<c:out value="${name }"/><%--<c:out> : 자바스크립트에서 출력 : $=>Jquery --%>
</body>
</html>
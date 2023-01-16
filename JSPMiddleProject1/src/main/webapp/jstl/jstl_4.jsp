<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Date date=new Date();
%>
<c:set var="today" value="<%=date %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>자바</h1>
  <%=date %><br>
  <%
  	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
  	String today=sdf.format(date);// TO_CHAR(regdate,'YYYY-MM-DD')
  %>
  <%=today %>
  <h1>JSTL</h1>
  <fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>
  <h1>숫자 변환</h1>
  <%
  	int a=12345678;
    DecimalFormat d=new DecimalFormat("###,###,###");//TO_CHAR(num,'$999,999')
  	String num=d.format(a);
  %>
  <%=num %>
  <c:set var="num" value="<%=a %>"/>
  <fmt:formatNumber value="${num }" type="currency" currencySymbol="$"/>
</body>
</html>
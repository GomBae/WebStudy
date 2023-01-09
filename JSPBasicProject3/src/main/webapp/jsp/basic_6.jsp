<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.container{
	width:960px;
	height: 700px;
	border:1px solid red;
	margin: 0px auto;
}
div.header{
	width: 100%;
	height: 150px;
	background-color: yellow;
}
div.footer{
	width: 100%;
	height: 150px;
	background-color: pink;
	clear:both;
}
div.aside{
	width: 25%;
	height: 400px;
	background-color: green;
	float:left;
}
div.section{
	width: 75%;
	height: 400px;
	background-color: blue;
	float:left;
}
</style>
</head>
<body>
  <div class="container">
    <div class="header"><%@ include file="a1.jsp" %></div>
    <div class="aside"><%@ include file="a2.jsp" %></div>
    <div class="section"><%@ include file="a3.jsp" %></div>
    <div class="footer"><%@ include file="a4.jsp" %></div>
  </div>
</body>
</html>
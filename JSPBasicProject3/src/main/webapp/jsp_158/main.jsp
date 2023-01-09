<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	width: 960px;
	height: 800px;
	margin: 0px auto;
	border: 1px solid black;
}
.header{
	width:100%;
	height: 150px;
	background-color: yellow;
}
.content{
	width:100%;
	height: 500px;
	background-color: green;
}
.footer{
	width:100%;
	height: 150px;
	background-color: blue;
}
</style>
</head>
<body>
	<div class="container">
	  <div class="header"><jsp:include page="header.jsp"/></div>
	  <div class="content"><jsp:include page="content.jsp"/></div>
	  <div class="footer"><jsp:include page="footer.jsp"/></div> 
	</div>
</body>
</html>
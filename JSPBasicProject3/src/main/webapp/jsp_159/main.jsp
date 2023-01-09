<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mode=request.getParameter("mode");
	String jsp="home.jsp";
	if(mode==null)
		mode="0";
	switch(mode){
	case "0": jsp="home.jsp"; break;
	case "1": jsp="food.jsp"; break;
	case "2": jsp="recipe.jsp"; break;
	case "3": jsp="travle.jsp"; break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

.row {
   width: 960px;
   margin: 0px auto;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="height:20px"></div>
	<div class="row">
	  <jsp:include page="<%=jsp %>"></jsp:include>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //자바영역
  request.setCharacterEncoding("UTF-8");
  String name=request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <b><%=name %></b>

</body>
</html>
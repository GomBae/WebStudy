<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	FoodDAO dao=new FoodDAO();
	ArrayList<CategoryVO> list=dao.categoryAllData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for(CategoryVO vo:list){
	%>
			<img src="<%=vo.getPoster()%>" style="width:250px; height: 180px">
	<%
		}
	%>
</body>
</html>
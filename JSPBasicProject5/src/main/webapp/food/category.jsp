<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"/>
<%
	String cate=request.getParameter("cate");
	if(cate==null){
		cate="1";
	}
	int c=Integer.parseInt(cate);
	
	ArrayList<CategoryVO> list=dao.categoryListData(c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="height: 10px"></div>
	<div class="row">
	 <div class="text-center">
	  <a href="main.jsp?cate=1" class="btn btn-sm btn-danger">믿고보는 맛집 리스트</a>
	  <a href="main.jsp?cate=2" class="btn btn-sm btn-info">지역별 맛집 리스트</a>
	  <a href="main.jsp?cate=3" class="btn btn-sm btn-success">메뉴별 인기 맛집 리스트</a>
	</div>
	
	<div style="height: 10px"></div>
	<div class="row">
	  <%
	  	for(CategoryVO vo:list)
	  	{
	  %>
	  	  <div class="col-md-4">
		    <div class="thumbnail">
		      <a href="main.jsp?mode=1&cno=<%=vo.getCno()%>">
		        <img src="<%=vo.getPoster() %>" title="<%=vo.getSubject() %>" style="width:100%">
		        <div class="caption">
		          <p><%=vo.getTitle()%></p>
		        </div>
		      </a>
		    </div>
		  </div>
	  <%
	  	}
	  %>
	</div>
   </div>
</body>
</html>
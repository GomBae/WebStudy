<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"/>
<%
	//main.jsp?mode=1&cno=1
	//         ------- -----
	//         main.jsp에서 화면 변경 cno => food_list에서 사용
	// include => request공유가 가능
	String cno=request.getParameter("cno");
	//DAO연결
	CategoryVO vo=dao.categoryInfoData(Integer.parseInt(cno));
	
	//카테고리별 맛집 목록 읽기
	ArrayList<FoodVO> list=dao.category_food_list(Integer.parseInt(cno));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron">
	  <h2 class="text-center"><%=vo.getTitle() %></h2>
	  <h4 class="text-center"><%=vo.getSubject() %></h4>
	</div>
	<div class="row">
	  <table class="table">
	    <tr>
	      <td class="text-center">
	        <%
	          for(FoodVO fvo : list)
	          {
	        %>
	        	<table class="table">
	        	  <tr>
	        	    <td width=30% class="text-center" rowspan="4">
	        	      <a href="main.jsp?mode=2&fno=<%=fvo.getFno()%>">
	        	      <img src="<%=fvo.getPoster() %>" style="width:270px;height: 200px" class="img-rounded">
	        	      </a>
	        	    </td>
	        	    <td width=70% class="text-left">
	        	      <h3><a href="main.jsp?mode=2&fno=<%=fvo.getFno()%>"><%=fvo.getName() %></a>&nbsp;<span style="color:orange"><%=fvo.getScore() %></span></h3>
	        	    </td>
	        	  </tr>
	        	  <tr>
	        	    <td width=70% class="text-left"><%=fvo.getAddress() %></td>
	        	  </tr>
	        	  <tr>
	        	    <td width=70% class="text-left"><%=fvo.getTel() %></td>
	        	  </tr>
	        	  <tr>
	        	    <td width=70%><%=fvo.getType() %></td>
	        	  </tr>
	        	</table>
	        <%
	          }
	        %>
	      </td>
	    </tr>
	  </table>
	</div>
</body>
</html>
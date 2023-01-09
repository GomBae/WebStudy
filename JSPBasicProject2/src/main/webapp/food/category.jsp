<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao2.*"%>
<%
     FoodDAO dao=new FoodDAO();
     ArrayList<CategoryVO> list=dao.categoryData();
     //오코노미야끼 맛집 베스트
     for(CategoryVO vo:list)
     {
    	 String title=vo.getTitle();
    	 if(title.length()>13)
    	 {
    		 title=title.substring(0,13)+"...";
    		 vo.setTitle(title);
    	 }
    	 vo.setTitle(title);
     }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
   width: 960px;
   margin: 0px auto;
}
h1{
   text-align: center
}
</style>
</head>
<body>
  <div class="container">
    <h3>믿고보는 맛집 리스트</h3>
    <hr>
    <div class="row">
      <%
          for(int i=0;i<12;i++)
          {
        	   CategoryVO vo=list.get(i);
      %>
                <div class="col-md-3">
				    <div class="thumbnail">
				      <a href="#">
				        <img src="<%=vo.getPoster() %>" alt="Lights" style="width:100%">
				        <div class="caption">
				          <p><b><%=vo.getTitle() %></b></p>
				        </div>
				      </a>
				    </div>
				  </div>
      <%
          }
      %>
    </div>
    <div style="height: 10px"></div>
    
    <h3>지역별 인기 맛집</h3>
    <hr>
    <div class="row">
      <%
          for(int i=12;i<18;i++)
          {
        	   CategoryVO vo=list.get(i);
      %>
                <div class="col-md-4">
				    <div class="thumbnail">
				      <a href="#">
				        <img src="<%=vo.getPoster() %>" alt="Lights" style="width:100%">
				        <div class="caption">
				          <p><b><%=vo.getTitle() %></b></p>
				        </div>
				      </a>
				    </div>
				  </div>
      <%
          }
      %>
    </div>
    <div style="height: 10px"></div>
    
    <h3>메뉴별 인기 맛집</h3>
    <hr>
    <div class="row">
      <%
          for(int i=18;i<30;i++)
          {
        	   CategoryVO vo=list.get(i);
      %>
                <div class="col-md-3">
				    <div class="thumbnail">
				      <a href="#">
				        <img src="<%=vo.getPoster() %>" alt="Lights" style="width:100%">
				        <div class="caption">
				          <p><b><%=vo.getTitle() %></b></p>
				        </div>
				      </a>
				    </div>
				  </div>
      <%
          }
      %>
    </div>
    <div style="height: 10px"></div>
  </div>
</body>
</html>







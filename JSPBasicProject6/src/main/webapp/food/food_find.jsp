<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%

	ArrayList<FoodVO> list=null;
	FoodDAO dao=new FoodDAO();
	String addr=request.getParameter("addr");
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curpage=Integer.parseInt(strPage);
	if(addr==null){
		addr="강남";
	}
	list=dao.foodFindData(addr, curpage);
	
	int totalpage=dao.foodFindTotalPage(addr);
	
	final int BLOCK=5;
	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	if(endPage>totalpage)
		endPage=totalpage;
	
	int count=dao.foodFindCount(addr);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
	<form method=post action="../main/main.jsp">
	  <input type=hidden name=mode value="4">
	  검색:<input type=text name=addr size=30 class="input-sm" value="<%= addr!=null?addr:""%>">
	  <button class="btn btn-sm btn-danger">검색</button>  
	</form>
	</div>
	<div style="height:10px"></div>
	<div class="row">
	  <div class="text-right">
	    검색결과 : <b style="color:green;font-size:35px"><%=count %></b>개 있습니다
	  </div>
	</div>
	<div style="height: 5px"></div>
	<div class="row">
	  <%
	  if(list!=null)
	  {
	    for(FoodVO vo:list)
	    {
	  %>
	  		  <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="../main/main.jsp?mode=6&fno=<%=vo.getFno()%>">
			        <img src="<%=vo.getPoster() %>" style="width:260px;height: 200px" class="img-rounded">
			        <div class="caption">
			          <p style="font-size:9px;font-weight:bold"><%=vo.getName() %></p>
			        </div>
			      </a>
			    </div>
			  </div>
	  <%
	    }
	  }
	  %>
	</div>
	<div class="row">
	  <div class="text-center">
	        <ul class="pagination">
      <%
      		if(startPage>1)
      		{
      %>
      		<li><a href="../main/main.jsp?mode=4&page=<%=startPage-1%>">&lt;</a></li>
      <%
      		}
      %>

		  <%
		  	for(int i=startPage;i<=endPage;i++)
		  	{
		  %>
		  		<li <%=i==curpage?"class=active":"" %>><a href="../main/main.jsp?mode=4&page=<%=i%>"><%=i %></a></li>
		  <%
		  	}
		  %>
		  <%
		  	if(endPage<totalpage)
		  	{
		  %>
		  		<li><a href="../main/main.jsp?mode=4&page=<%=endPage+1%>">&gt;</a></li>
		  <%
		  	}
		  %>
	  </ul>
	  </div>
	</div>
</body>
</html>
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
	margin:0px auto;
}
h1{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
	  <h1>구구단</h1>
	  <table width=700 border=1 bordercolor=black>
	    <tr bgcolor="orange">
	    <%
	    	for(int i=2;i<=9;i++){
	    %>
	    <th><%=i %>단</th>
	    <%	
	    	}
	    %>
	    </tr>
	    <%
	    	for(int i=1;i<=9;i++){
	    %>
	    	<tr>
	    <%
	    	for(int j=2;j<=9;j++){
	    %>
	    	<td align=center><%=j+"*"+i+"="+(j*i)%></td>	
	    <%	
	    	}
	    }
	    %>
	    </tr>
	  </table>
	</div>

</body>
</html>
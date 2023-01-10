<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//사용자 보내준 번호를 받는다
	String no=request.getParameter("no");
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
   width: 600px;
   margin: 0px auto;
}
h1{
   text-align: center
}
</style>
</head>
<body>
	<div class="container">
	  <h1>삭제하기</h1>
	  <div class="row">
	   <form method=post action="delete_ok.jsp">
	    <table class="table">
	      <tr>
	        <td width="30%" class="text-right">Password</td>
	        <td width=70%>
	          <input type=password name=pwd size=15 class="input-sm" required>
	          <input type="hidden" name=no value="<%=no%>">
	        </td>
	      </tr>
	      <tr>
	        <td colspan="2" class="text-center">
	          <button class="btn btn-sm btn-danger">삭제</button><%-- submit --%>
	          <input type=button class="btn btn-sm btn-info" value="취소"
	            onclick="javascript:history.back()"
	          >
	        </td>
	      </tr>
	    </table>
	   </form>
	  </div>
	</div>
</body>
</html>
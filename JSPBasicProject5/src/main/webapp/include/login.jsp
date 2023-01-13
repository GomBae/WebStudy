<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="login_ok.jsp">
	<table class="table">
	  <tr>
	    <td width="30%" class="text-right">ID</td>
	    <td width=70%>
	      <input type=text name=id size=15 class="input-sm">
	    </td>
	  </tr>
	  <tr>
	    <td width="30%" class="text-right">PWD</td>
	    <td width=70%>
	      <input type=password name=pwd size=15 class="input-sm">
	    </td>
	  </tr>
	  <tr>
	    <td colspan="2" class="text-right">
	      <button class="btn btn-sm btn-danger">로그인</button>
	    </td>
	  </tr>
	</table>
	</form>
</body>
</html>
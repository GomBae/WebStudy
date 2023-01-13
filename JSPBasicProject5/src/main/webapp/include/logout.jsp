<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="logout_ok.jsp">
	<table class="table">
	  <tr>
	    <td width="30%" class="text-right"></td>
	    <td width=70%>
	      <%=session.getAttribute("name") %> 님 로그인되었습니다
	    </td>
	  </tr>
	  <tr>
	    <td width="30%" class="text-right"></td>
	    <td width=70%>
	      메일:1개 &nbsp; 쪽지:3개
	    </td>
	  </tr>
	  <tr>
	    <td colspan="2" class="text-right">
	      <button class="btn btn-sm btn-danger">로그아웃</button>
	    </td>
	  </tr>
	</table>
	</form>
</body>
</html>
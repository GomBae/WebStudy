<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	  <h1>글쓰기</h1>
	  <div class="row">
	   <form method="post" action="insert_ok.jsp">
	    <table class="table">
	      <tr>
	        <th class="text-right success" width=20%>이름</th>
	        <td width=80%>
	          <input type=text name=name size=15 class="input-sm">
	        </td>
	      </tr>
	      <tr>
	        <th class="text-right success" width=20%>제목</th>
	        <td width=80%>
	          <input type=text name=subject size=50 class="input-sm">
	        </td>
	      </tr>
	      <tr>
	        <th class="text-right success" width=20%>내용</th>
	        <td width=80%>
	          <textarea rows="10" cols="50" name=content></textarea>
	        </td>
	      </tr>
	      <tr>
	        <th class="text-right success" width=20%>비밀번호</th>
	        <td width=80%>
	          <input type=password name=pwd size=10 class="input-sm">
	        </td>
	      </tr>
	      <tr>
	        <td colspan="2" class="text-center">
	          <input type=submit class="btn btn-sm btn-info" value="글쓰기">
	          <input type=button class="btn btn-sm btn-warning" onclick="javascript:history.back()" value="취소">
	        </td>
	      </tr>
	    </table>
	    </form>
	  </div>
	</div>
</body>
</html>
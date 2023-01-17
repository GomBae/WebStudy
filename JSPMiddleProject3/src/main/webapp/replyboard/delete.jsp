<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
	margin-top:100px;
}
.row{
	width:300px;
	margin: 0px auto;
}
</style>
</head>
<body>
     <div class="row">
       <img src="qna.jpg" style="width: 800px;height: 150px;" class="img-rounded">
     </div>
     <div style="height: 5px"></div>
  <div class="row row1">
    <h1 class="text-center">삭제하기</h1>
    <form method="post" action="delete_ok.jsp">
    <table class="table">
      <tr>
        <td width=40%>비밀번호</td>
        <td width=60%>
          <input type=password name=pwd size=15 class="input-sm" required>
          <input type=hidden name=no value="${param.no }"><%--param.no => request.getParameter("no") --%>
        </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type=submit value="삭제" class="btn btn-sm btn-danger">
          <input type=button value="취소" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
        </td>
      </tr>
    </table>
    </form>
  </div>
</body>
</html>
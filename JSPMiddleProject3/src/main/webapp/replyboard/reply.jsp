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
   margin-top:30px;
}
.row{
   width: 800px;
   margin: 0px auto;
}
</style>
</head>
<body>
 <div class="container">
     <div class="row">
       <img src="qna.jpg" style="width: 800px;height: 150px;" class="img-rounded">
     </div>
     <div style="height: 5px"></div>
  <div class="row">
    <form method="post" action="reply_ok.jsp" >
    <table class="table">
      <tr>
        <th width=15% class="text-center success">이름</th>
        <td width=85%>
          <input type=text name=name size=15 class="input-sm" required>
          <input type=hidden name=pno value="${param.pno }">
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">제목</th>
        <td width=85%>
          <input type=text name=subject size=45 class="input-sm" required>
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">내용</th>
        <td width=85%>
          <textarea rows="10" cols="50" name=content required></textarea>
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">비밀번호</th>
        <td width=85%>
          <input type="password" name=pwd size=10 class="input-sm" required>
        </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type=submit value="글쓰기" class="btn btn-sm btn-primary">
          <input type=button value="취소" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
        </td>
      </tr>
    </table>
    </form>
  </div>
  </div>
</body>
</html>





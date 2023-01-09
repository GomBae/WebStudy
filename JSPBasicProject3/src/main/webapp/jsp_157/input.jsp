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
   width: 500px;
   margin: 0px auto;
}
h1{
   text-align: center
}
</style>
</head>
<body>
	<div class="container">
	  <h1>개인정보</h1>
	  <div class="row">
	    <form method=post action="output2.jsp"><%--action에 등록된 파일로 데이터 전송 --%>
	    <table class="table">
	      <tr>
	        <th width=20% class="text-right">이름</th>
	        <td width=80%><input type=text name=name size=15 class="input-sm"></td>
	      </tr>
	      <tr>
	        <th width=20% class="text-right">성별</th>
	        <td width=80%>
	        <input type=radio name=sex value="남자" checked>남자
	        <input type=radio name=sex value="여자">여자
	        </td>
	      </tr>
	      <tr>
	        <th width=20% class="text-right">지역</th>
	        <td width=80%>
	        <select name="loc" class="inut-sm">
	          <option>서울</option>
	          <option>경기</option>
	          <option>부산</option>
	          <option>대전</option>
	          <option>제주</option>
	        </select>
	        </td>
	      </tr>
	      <tr>
	        <th width=20% class="text-right">소개</th>
	        <td width=80%>
	        <textarea rows="8" cols="30" name="content"></textarea>
	        </td>
	      </tr>
	      <tr>
	        <td colspan="2" class="text-center">
	          <input type=submit value="전송" class="btn btn-sm btn-danger">
	      </tr>
	    </table>
	    </form>
	  </div>
	</div>
</body>
</html>
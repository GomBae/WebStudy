<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    //1. 게시물 번호 받기 (알파벳, 숫자 => 변환없이 그대로 받는다)
    String no=request.getParameter("no");
    //2. 오라클에서 데이터를 받아온다
    BoardDAO dao=new BoardDAO();
    BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
    
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
   width: 800px;
   margin: 0px auto;
}
h1{
   text-align: center
}
</style>
</head>
<body>
	<div class="container">
	  <h1>내용 보기</h1>
	  <div class="row">
	    <table class="table">
	      <tr>
	        <th width=20% class="text-center success">번호</th>
	        <td width=30% class="text-center"><%=vo.getNo() %></td>
	        <th width=20% class="text-center success">작성일</th>
	        <td width=30% class="text-center"><%=vo.getDbday() %></td>
	      </tr>
	      <tr>
	        <th width=20% class="text-center success">이름</th>
	        <td width=30% class="text-center"><%=vo.getName() %></td>
	        <th width=20% class="text-center success">조회수</th>
	        <td width=30% class="text-center"><%=vo.getHit() %></td>
	      </tr>
	      <tr>
	        <th width=20% class="text-center success">제목</th>
	        <td colspan="3"><%=vo.getSubject() %></td>
	      </tr>
	      <tr>
	        <td colspan="4" valign="top" height="200"><pre style="white-space:pre-wrap;background-color:white;border:none"><%=vo.getContent() %></pre></td>
	      </tr>
	      <tr>
	        <td colspan="4" class="text-right">
	          <a href="update.jsp?no=<%=no %>" class="btn btn-xs btn-success">수정</a>
	          <a href="delete.jsp?no=<%=no %>" class="btn btn-xs btn-info">삭제</a>
	          <a href="list.jsp" class="btn btn-xs btn-warning">목록</a>
	        </td>
	      </tr>
	    </table>
	  </div>
	</div>
</body>
</html>
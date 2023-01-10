<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,java.text.*"%>
<%--
	page 지시자 => JSP에 대한 정보
	1) contentType : 변환 text/html, text/xml, text/plain
	2) import : 자바 라이브러리 읽기
				java.lang, javax.servlet, javax.http
	3) errorPage : 에러발생시 이동하는 파일 지정
	4) buffer : 출력내용이 많은 경우에 메모리 크기 늘리기
	==> JSP의 시작점
	
	1. 자바 => 사용자가 보내준 데이터를 받는다
	2. 오라클 연결
	3. 처리 결과값 읽기
	4. HTML에 처리결과 출력
	==> Front용
 --%>
<%
	// 1. 사용자가 보내준 데이터를 읽는다 (page)
	String strPage=request.getParameter("page");
    // 2. null값 처리
    /*
    	list.jsp
    	=> null
    	if(strPage==null)
    		
    	list.jsp?page=
    	=> ""
    	if(strPage.equals(""))
    */
    if(strPage==null){
    	strPage="1";
    }
    //현재페이지 지정
    int curpage=Integer.parseInt(strPage);
    //현재페이지에 해당되는 데이터를 오라클에서 가지고 온다
    BoardDAO dao=new BoardDAO();
    ArrayList<BoardVO> list=dao.boardListData(curpage);
    //총페이지 읽기
    int totalpage=dao.boardTotalPage();
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
.list{
	height: 550px;
}
</style>
</head>
<body>
	<div class="container">
	  <h1>자유 게시판</h1>
	  <div class="row list">
	    <%-- 게시물 출력 --%>
	    <table class="table">
	      <tr>
	        <td>
	          <a href="insert.jsp" class="btn btn-sm btn-warning">새글</a>
	        </td>
	      </tr>
	    </table>
	    <table class="table">
	      <tr class="success">
	        <th width=10% class="text-align">번호</th>
	        <th width=45% class="text-align">제목</th>
	        <th width=15% class="text-align">이름</th>
	        <th width=20% class="text-align">작성일</th>
	        <th width=10% class="text-align">조회수</th>
	      </tr>
	      <%
	      	for(BoardVO vo:list)
	      	{
	      %>
	      		<tr>
		          <td width=10% class="text-align"><%=vo.getNo() %></td>
		          <td width=45%><a href="detail.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>&nbsp;
		            <%
		              String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		              if(today.equals(vo.getDbday()))
		              {
		            %>
		            	<sup style="color:red">new</sup>
		            <%
		              }
		            %>
		          </td>
		          <td width=15% class="text-align"><%=vo.getName()%></td>
		          <td width=20% class="text-align"><%=vo.getDbday() %></td>
		          <td width=10% class="text-align"><%=vo.getHit() %></td>
	      		</tr>
	      <%
	      	}
	      %>
	    </table>
	    <table class="table">
	      <tr>
	        <td>
	          <input type="checkbox" value="name">이름
	          <input type="checkbox" value="subject">제목
	          <input type="checkbox" value="content">내용
	          &nbsp;
	          <input type=text name=ss size=15 class="input-sm" autocomplete="off">
	          <input type=submit value="검색" class="btn btn-sm btn-danger">
	        </td>
	      </tr>
	    </table>
	  </div>
	  <div style="height: 20px"></div>
	  <div class="row">
	    <%-- 페이지  --%>
	    <div class="text-center">
	      <a href="list.jsp?page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-primary">이전</a>
	      	<%=curpage %> page / <%=totalpage %> pages
	      <a href="list.jsp?page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-primary">다음</a>
	    </div>
	  </div>
	</div>
</body>
</html>
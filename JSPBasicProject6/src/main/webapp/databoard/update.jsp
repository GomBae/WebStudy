<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%
	//1. 사용자가 보내준 데이터 받기
	String no=request.getParameter("no");
	//2. DAO를 이용해서 데이터값 읽기
	DataBoardDAO dao=new DataBoardDAO();
	DataBoardVO vo=dao.databoardUpdateData(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
	width:800px;
}
</style>
</head>
<body>
  <div class="row row1">
    <h1 class="text-center">수정하기</h1>
    <%-- main => main.jsp로 이동 : 화면 출력하는 JSP등록
    	JSP 
    	  1) 화면 출력
    	  2) 값을 받아서 처리 ===> _ok ==> 자체 jsp
    	  
    	      <form method="post" action="../databoard/insert_ok.jsp" enctype="multipart/form-data">
     --%>
    <form method="post" action="../databoard/update_ok.jsp">
    <table class="table">
      <tr>
        <th width=15% class="text-center success">이름</th>
        <td width=85%>
          <input type=text name=name size=15 class="input-sm" required value="<%=vo.getName()%>">
          <input type=hidden name=no value="<%=no %>">
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">제목</th>
        <td width=85%>
          <input type=text name=subject size=45 class="input-sm" required value="<%=vo.getSubject()%>">
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">내용</th>
        <td width=85%>
          <textarea rows="10" cols="50" name=content required><%=vo.getContent()%></textarea>
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">비밀번호</th>
        <td width=85%>
          <input type=password name=pwd size=10 class="input-sm" required>
        </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type=submit value="수정" class="btn btn-sm btn-primary">
          <input type=button value="취소" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
        </td>
      </tr>
    </table>
    </form>
  </div>
</body>
</html>
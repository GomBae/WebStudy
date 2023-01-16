<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%
	//1. 사용자가 보내준 데이터 받기 (X)
	// => 사용자로부터 page를 받는다
	String strPage=request.getParameter("page"); //page는 내장객체라서 다른 변수명을 해야함
	if(strPage==null)
		strPage="1";
	//현재 페이지 설정
	int curpage=Integer.parseInt(strPage);
	//2. 처리된 데이터를 읽기 (dao) (X)
	//curpage에 해당되는 데이터를 오라클로부터 가지고 온다
	DataBoardDAO dao=new DataBoardDAO();
	ArrayList<DataBoardVO> list=dao.databoardListData(curpage);
	//3. 출력 => HTML
	//*** 데이터를 자바에서 읽은 다음에 출력 (자바는 데이터관리) => HTML은 가지고 온 데이터를 출력만함 (정적페이지) => JPS(동적페이지)
	//총페이지 받기
	int totalpage=(int)(Math.ceil(dao.databoardRowCount()/10.0));//자바로 총페이지 구하기
	int count=dao.databoardRowCount();//숫자 일정하게 배치
	count=count-((curpage*10)-10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="row">
    <h1 class="text-center">자료실</h1><%-- class : text-center , text-left, text-right --%>
    <table class="table">
      <tr>
        <td>
          <a href="../main/main.jsp?mode=7" class="btn btn-sm btn-danger">새글</a><%-- btn-danger(red), btn-success(green),btn-info(cyan), btn-primary(blue), btn-warning(orange) --%>
        </td>
      </tr>
    </table>
    <table class="table">
      <tr class="danger">
        <th width=10% class="text-center">번호</th>
        <th width=45% class="text-center">제목</th>
        <th width=15% class="text-center">작성자</th>
        <th width=15% class="text-center">작성일</th>
        <th width=10% class="text-center">조회수</th>
        <th width=10% class="text-center"></th>
      </tr>
      <%-- 게시물 출력 위치 --%>
      <%
      		for(DataBoardVO vo:list)
      		{
      %>
      			      <tr>
				        <td widtd=10% class="text-center"><%=count--%></td>
				        <td widtd=40%><a href="../main/main.jsp?mode=8&no=<%=vo.getNo()%>"><%=vo.getSubject() %></a></td>
				        <%--
				        	include => include된 모든 JSP에서 main으로 들어오는 request를 공유
				        	main.jsp => 화면 변경 ==> 구분자 (mode)
				        	&뒤에 있는 데이터 => 각 JSP에서 사용하는 값
				         --%>
				        <td widtd=15% class="text-center"><%=vo.getName() %></td>
				        <td widtd=15% class="text-center"><%=vo.getDbday() %></td>
				        <td widtd=10% class="text-center"><%=vo.getHit() %></td>
				        <td widtd=10% class="text-center">
				          <%
				            if(vo.getFilesize()>0)
				            {
				          %>
				          		<img src="../images/file.jpg" style="width:20px;height: 20px" class="img-circle">
				          <%
				            }
				          %>
				        </td>
				      </tr>
      <%
      		}
      %>
    </table>
    <table class="table">
      <tr>
        <td class="text-right">
          <a href="../main/main.jsp?mode=5&page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-info">이전</a>
          <%=curpage %> page / <%=totalpage %> pages
          <a href="../main/main.jsp?mode=5&page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-warning">다음</a>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>

<%
	EmpDAO dao=new EmpDAO();
	//ArrayList<EmpVO> list=dao.empListData();
	ArrayList<EmpVO> list=dao.empJoinData();
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
.row{
	width:800px;
	margin: 0px auto;
}
h1{
	text-align:center;
}
</style>
</head>
<body>
	<div class="container">
		<h1>사원 목록</h1>
		<div class="row">
		  <table class="table table-hover">
		    <tr class="success">
		      <th class="text-center">사번</th>
		      <th class="text-center">이름</th>
		      <th class="text-center">직위</th>
		      <th class="text-center">사수</th>
		      <th class="text-center">입사일</th>
		      <th class="text-center">급여</th>
		      <th class="text-center">성과급</th>
		      <th class="text-center">부서번호</th>
		      <th class="text-center">부서명</th>
		      <th class="text-center">근무지</th>
		    </tr>
		    <%
		    	for(EmpVO vo:list){
		    %>
		    	<tr>
			      <td class="text-center"><%=vo.getEmpno() %></td>
			      <td class="text-center"><%=vo.getEname() %></td>
			      <td class="text-center"><%=vo.getJob() %></td>
			      <td class="text-center"><%=vo.getMgr() %></td>
			      <td class="text-center"><%=vo.getHiredate() %></td>
			      <td class="text-center"><%=vo.getSal() %></td>
			      <td class="text-center"><%=vo.getComm() %></td>
			      <td class="text-center"><%=vo.getDeptno() %></td>
			      <td class="text-center"><%=vo.getDvo().getDname() %></td>
			      <td class="text-center"><%=vo.getDvo().getLoc() %></td>
		        </tr>
		    <%		
		    	}
		    %>
		  </table>
		</div>
	</div>
</body>
</html>
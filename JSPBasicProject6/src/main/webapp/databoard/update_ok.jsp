<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	
%>
<%--
	public String update(DataBoardVO vo)
 --%>
<jsp:useBean id="dao" class="com.sist.dao.DataBoardDAO"/>
<jsp:useBean id="vo" class="com.sist.vo.DataBoardVO">
  <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	//DAO연동
	boolean bCheck=dao.databoardUpdate(vo);
	//화면 이동
	if(bCheck==true)
	{
		response.sendRedirect("../main/main.jsp?mode=8&no="+vo.getNo());
	}else
	{
%>
		<script>
		alert("비밀번호가 틀립니다.");
		histroy.back();
		</script>
<%
	}
%>
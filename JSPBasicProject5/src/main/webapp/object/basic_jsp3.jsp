<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	pageContext : pageContext
	1) JSP안에서 사용되는 내부객체를 얻어올 수 있다
	   request : pageContext.getRequest()
	   response : pageContext.getResponse()
	   session : pageContext.getSession()
	   out : pageContext.getOut()
	   application : pageContext.getServletContext()
	   page : pageContext.getPage()
	   config : pageContext.getServletConfig()
	   exception : pageContext.getException()
	2) 웹 흐름 (데이터 공유(request), request를 공유하면서 화면 이동 가능)
			  ------------------  ----------------------------
			    include             forward
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String serverName=request.getServerName();
		String serverName2=pageContext.getRequest().getServerName();
		out.println(serverName+"<br>");
		out.println(serverName2);
	%>
</body>
</html>
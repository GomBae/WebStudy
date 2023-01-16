<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.main.*"%>
<%
	SawonVO vo=new SawonVO();
	vo.setSabun(1);
	vo.setName("이순신");
	vo.setDept("개발부");
	vo.setJob("대리");
	vo.setLoc("서울");
	// ${} => session/request에 저장
	request.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사원 정보 출력</h1>
사번:${vo.sabun } : <%=((SawonVO)request.getAttribute("vo")).getSabun() %><br>
사번:${vo.getSabun() }<br>
이름:${vo.name },${vo.getName() }
</body>
</html>
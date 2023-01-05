<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP : Java Server Page => 서버에서 실행되는 파일
	      JSP => HTML+Java
	      
	실행 과정 :
	  
	  1) 사용자가 요청 URL(파일명)
	  2) 톰캣이 요청을 받는다
	  3) 파일 찾기
	        = 찾은 경우
	          3-1) jsp 파일을 자바파일로 변경 basic_1_jsp.java
	          3-2) 변경된 파일을 컴파일 basic_1.jsp.class
	          3-3) JVM에서 .class파일 로딩
	          3-4) 한줄씩 번역 (인터프리터)
	          3-5) 메모리에 HTML만 출력
	          3-6) 출력된 HTML을 브라우저에서 읽어서 출력
	        = 못찾은 경우 => 404 ERROR
	        
	  소스 코딩 : 
	       java영역
	       1) <%@ page import=""%>
	       2) 일반 자바 코딩 영역
	           <%
	           		자바 영역
	           		변수 선언
	           		제어문
	           		메소드 호출
	           %>
	       3) 출력 : 변수값
	          <%= 변수%>
	       HTML영역
	          <%@ %> <% %> <%= %>를 제외한 영역
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
  String name="ddsfsd";
  out.println(name);
  %>
</body>
</html>
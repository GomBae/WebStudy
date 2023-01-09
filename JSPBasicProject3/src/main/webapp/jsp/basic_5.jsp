<%--
	스크립트릿 <% %>
	표현식 <% %> => 데이터값 출력
	<%
		제어문 : if, for, while
	%>
	
	chapter 6장
	-----------
	  지시자
	  -----
	   page : JSP파일에 대한 정보
	   		  contentType ==> 브라우저 알려주는 기능 (어떤 파일 형식) ==> 관리하는 클래스 (HttpServletResponse)
	   		  default : contentType ="text/html;charset=ISO-8859-1"
	   		  											---------- ASC(1byte) => 한글깨짐
	   		  						 "text/html;charset=UTF-8"
	   		  						 		xml
	   		  						 		plain(json)
	   		  => 한번만 사용이 가능 (JSP한개에서)
	   		  import : 자바 라이브러리를 가지고 올때 사용
	   		  			java.lang, javax.servlet
	   		  buffer : 출력버퍼 => jsp를 실행 => html을 출력해둔다
	   		  								--------------- 출력버퍼 => 브라우저에서 읽어서 출력
	   		  								TCP => tlsfhltjd (apahfl => apahflrkqt) => 80
	   		  		 default : 8kb => 필요시에는 늘려준다
	   		  		 		   16kb, 32
	   		  errorPage : JSP에서 error가 발생시 이동하는 페이지를 지정
	   		  				404 : 파일이 없는 경우
	   		  				500 : 자바 소스파일 에러
	   		  				415 : 지원하지 않는 한글 변환 코드 사용
	   		  				400 : spring
	   		  				403 : spring(보안) 접근거부
	   		  				200 : 정상수행 => 화면출력
	   		  
	   		  info : 파일정보 => 수정일, 작성자
	   		  language : default : java ==> JSP안에서 다른 언어 사용이 가능
	   		  pageEncoding : 한글 변환 코드
	   		  				 UTF-8 => 리눅스,깃
	   		  				 EUC-KR => default
	   		  autoFlush : 새로고침, 페이지 이동 => 출력버퍼에 내용을 초기화 => true
	   		  isErrorPage : 사용(종류별로 에러를 처리)
	   		  session : 서버에 정보 저장 (id,
	   		  ==> 한번만 사용이 가능 (단 import는 여러번 사용이 가능)
	    taglib
	    include	
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp"
    pageEncoding="UTF-8" info="2023_01_06 홍길동"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%int a=10/0; %>
</body>
</html>
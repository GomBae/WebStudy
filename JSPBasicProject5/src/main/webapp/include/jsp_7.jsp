<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		JSP (웹=>서버프로그램 : _jspService()안에 소스 코딩을 한다)
		-----------------------------------------------------
		JSP 구동
		1) WebServer가 URL주소를 받는다 ==> 마지막에 파일명이 존재 (필요시에 의해서 변경)
		   -------------------------
		   1-1) .html, .xml일 경우에는 => 브라우저로 바로 전송
		   1-2) .jsp의 경우에는 WAS(Web Application Server)로 전송
							----------------------------- 톰캣
		
		2) JSP에 대한 정보 제공
				| 지시자
				<%@ page 변환코드 에러시출력할파일지정 라이브러리 출력버퍼크기> => JSP의 시작점
						 ------ --------------- ------ ----------
						  								| buffer="16kb"
						 						| import=""
						 			| errorPage="파일명"
						 | contentType="text/html;charset=UTF-8", "text/xml;charset=UTF-8", "text/plain;charset=UTF-8"
				** 지시자안에 모든 속성은 지정이 되어 있다
					속성="값" 속성="값" ==> 한번만 사용이 가능
					단 import는 여러번 사용이 가능
					예) <%@ page import="java.util.*,java.io.*"
		3) JSP => 자바+HTML(CSS,JavaScript)
				  자바와 HTML을 구분
				  ---
				  <% 스크립트릿 : 일반자바(메소드안에) => 지역변수, 메소드 호출, 제어문, 연산자 
				  <%= 표현식 : 화면에 출력 : 변수, 메소드 리턴값 
				  <%! 선언식 : 메소드선언, 전역변수선언
				  -----------------------------------------
				  => 출력문 : ${}
				  => 제어문 : 태그로 만들어져 있다 => 모든 프로그램은 태그형으로 변경
		4) 내장객체
			= request
				클래스 확인 : HttpServletRequest
				= 역할
				  1. 브라우저 정보 / 서버 정보
				     http://localhost/JSPBasicProject5/include/jsp_7.jsp
				     ---------------- -----------------------------------
				        | 서버정보          | 사용자 요청정보 ==> URL
				        					---------- URI
				        = getServerInfo(), getServerPort() => 8080
				          --------------- localhost
				        = getRequestURI()	=> /JSPBasicProject5/include/jsp_7.jsp
				        = getContextPath() => /JSPBasicProject5
				        = getRemoteAddr() => 사용자의 IP를 읽어온다
				  2. 사용자 요청 데이터관리
				  		= getParameter()
				  		= getParameterValues()
				  		= setCharacterEncoding()
				  3. 추가 정보
				  		= setAttribute() : 추가
				  		= getAttribute() : 읽기
				= 주요메소드
			= response
			= session
			= out
			= pageContext
			= application
			
		5) JSP액션태그
			= <jsp:include> : tiles
			= 
	*/

%>
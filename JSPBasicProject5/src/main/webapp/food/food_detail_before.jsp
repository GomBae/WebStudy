<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //사용자가 보내준 데이터 받기 ==> submit 버튼 클릭, <a href="파일명?">
   String fno=request.getParameter("fno");
   //브라우저에 저장
   Cookie cookie=new Cookie("f"+fno,fno);
   cookie.setMaxAge(60*60*24);
   cookie.setPath("/");
   response.addCookie(cookie);
   
   //상세보기로 이동
   response.sendRedirect("../include/main.jsp?mode=2&fno="+fno);
   //           ------------------------ 내부객체X. 일반객체
   /*
      클라이언트 브라우저에 저장
      1. 생성
      Cookie cookie=new Cookie("f"+fno,fno);
      2. 저장 기간 설정
      setMaxAge(초); ==> 60*6024
      3. 저장 위치 설정
      setPath("/")
      4. response를 이용해서 클라이언트로 전송
      adCookie()
      ** 문자열만 저장할 수 있다
         보안 취약
         => 최근 방문 기록
      ** 파일 생성 이유 => response은 한개의 JSP에서 전송을 한번만 가능하다
         => 모든 JSP는 클라이언트로 전송을 하고 있다(HTML)
   */
%>
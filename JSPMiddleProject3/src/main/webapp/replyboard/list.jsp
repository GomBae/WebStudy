<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="model" class="com.sist.model.BoardModel"/>
<%--BoardModel model = new BoardModel() 
	출력형식 : EL 
	${출력물} => 일반 변수가 아니다
				request.getAttribute("key") => request.setAttribute("key","value")
				${requestScope.key}
				=> 생략이 가능 => ${key}
				session.getAttribute("key") => sessiomn.setAttribute("key","value")
				${sessionScope.key}
	연산자
	  산술연산자 => 문자열 결합 (+=)
	  			  null연산 => null은 0이다
	  			  ${null+10} => 10
	  			  ${"10"+10} => 20
	  			  ${"hello"+" el"} => 오류
	  			  -------------------------
	  			  ${"hello" += " el"}
	  			  정수/정수 = 실수
	  			  
	  			  / => div ${10/3}, ${10 div 3}
	  			  % => mod ${10%3}, ${10 mod 3}
	  비교연산자 => 결과값 (true/false) => 문자열, 날짜도 동일하게 처리
	  			 == eq
	  			 != ne
	  			 < lt
	  			 > gt
	  			 <= le
	  			 >= ge
	  논리연산자 => && and, || or, not()
	  ------------------------------------------------ <c:if test="${비교연산,논리연산}">
	  삼항연산자 => 조건 ? 값1:값2
	  
	  JSTL => JSP안에서 java코딩을 최소화 (자바제어문 => 태그형으로 제작)
	  core => 
	  	<c:set> : 변수 설정
	  	  <c:set var="msg" value="Hello JSTL">
	  	    => request.setAttribute("msg","Hello JSTL");
	  	<c:out> : 화면 출력
	  	  <c:out value="Hello"> => out.println("Hello") => JQuery, VueJS.. 자바스크립트에서 주로 사용
	  	<c:forEach> : for문
	  	  <c: forEach var="i" begin="1" end="10" step="1"> => 증가는 가능, 감소는 불가능
	  	    => for(int i=1; i<=10; i++)
	  	    		  -- -     --  ---
	  	    		var begin  end step
	  	  
	  	  <c:forEach var="vo" items="${list}"> => 가장 많이 사용 => for-each(향상된 for문)
	  	    => for(VO vo:list)
	  	<c:choose> => 다중 조건문
	  	  <c:when test="조건문"></c:when>
	  	  <c:when test="조건문"></c:when>
	  	  <c:when test="조건문"></c:when>
	  	  <c:when test="조건문"></c:when>
	  	  <c:when test="조건문"></c:when>
	  	  <c:otherwise></c:otherwise> else
	  	</c:choose>
	  	
	  	<c:if> ==> XML (닫기가 없는 경우에 오류발생)
	  	  <c:if test="">
	  	    처리문장
	  	  </c:if>
	  	  
	  	  DTD => 태그,속성 정의 => XML의 단점 : 태그에 순서 (MyBatis,Spring) => XML기반
	  	  => XML 파싱 => JAXP, JAXB
	  	  => JSON 파싱 => Rest
	  	  
	  	<c:forTokens> : StringTokenizer
	  	
	  format => Oracle SQL문장에서 처리
	    <fmt:formatDate>
	    <fmt:formatNumber>
	    
	  fn => 모델에서 처리 => 메소드 String
	  -------- 보안의 문제가 있다 (거의 사용하지 않음)
	  sql => DAO,ORM
	  xml => OXM
	  ----------
	  
	  <c:forEach>, <c:if>, <c:choose>, <c:redirect> => 대소문자 구분
--%>
<%
	model.boardListData(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
	margin-top:100px;
}
.row{
	width:800px;
	margin: 0px auto;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <img src="qna.jpg" style="width: 800px;height: 150px;">
    </div>
    <div style="height: 5px"></div>
    <div class="row">
      <table class="table">
        <tr>
          <td>
            <a href="insert.jsp" class="btn btn-sm btn-danger">새글</a>
          </td>
        </tr>
      </table>
      <table class="table">
        <tr class="warning">
          <th width="10%" class="text-center">번호</th>
          <th width="45%" class="text-center">제목</th>
          <th width="15%" class="text-center">이름</th>
          <th width="20%" class="text-center">작성일</th>
          <th width="10%" class="text-center">조회수</th>
        </tr>
        <c:forEach var="vo" items="${list }">
        <tr class="warning">
          <td width="10%" class="text-center">${vo.no }</td>
          <td width="45%">
          <c:if test="${vo.group_tab>0}">
            <c:forEach var="i" begin="0" end="${vo.group_tab }">
              &nbsp;&nbsp;
            </c:forEach>
           <img src="re_icon.png">
          </c:if>
          <c:if test="${vo.subject==msg }">
            <span style="color:gray">${vo.subject }</span>
          </c:if>
          <c:if test="${vo.subject!=msg }">
            <a href="detail.jsp?no=${vo.no }">${vo.subject }</a>
          </c:if>

          &nbsp;
          <c:if test="${today==vo.dbday} ">
            <sup><img src="new.gif"></sup>
          </c:if>
          </td>
          <td width="15%" class="text-center">${vo.name }</td>
          <td width="20%" class="text-center">${vo.dbday }</td>
          <td width="10%" class="text-center">${vo.hit }</td>
        </tr>
        </c:forEach>
      </table>
    </div>
  </div>
</body>
</html>
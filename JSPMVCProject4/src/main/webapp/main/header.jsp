<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">JSPExam</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="../main/main.jsp">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">회원가입</a></li>
          <li><a href="#">아이디찾기</a></li>
          <li><a href="#">비밀번호찾기</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">서울여행
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <%-- 블록별 페이지 나누기 --%>
          <li><a href="../main/main.jsp?mode=1">명소</a></li>
          <%-- 페이지나누기 --%>
          <li><a href="../main/main.jsp?mode=2">자연&관광</a></li>
          <li><a href="../main/main.jsp?mode=3">쇼핑</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">쇼핑몰
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">전체</a></li>
          <li><a href="#">베스트</a></li>
          <li><a href="#">특가</a></li>
          <li><a href="#">신상품</a></li>
        </ul>
      </li>
      <li><a href="../main/main.jsp?mode=5">커뮤니티</a></li>
      <li><a href="../main/main.jsp?mode=4">맛집검색</a></li>
    </ul>
  </div>
</nav>
</body>
</html>
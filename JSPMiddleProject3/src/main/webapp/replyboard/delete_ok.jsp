<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="model" class="com.sist.model.BoardModel"/>
<%
	model.boardDelete(request, response);
//request에 결과값이 들어와 있다
%>
<c:choose>
  <c:when test="${bCheck==true }">
    <c:redirect url="list.jsp"/>
  </c:when>
  <c:otherwise>
    <script>
    alert("비밀번호가 틀리다!")
    history.back()
    </script>
  </c:otherwise>
</c:choose>
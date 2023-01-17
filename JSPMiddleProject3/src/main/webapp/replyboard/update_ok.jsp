<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="model" class="com.sist.model.BoardModel"/>
<%
	model.boardUpdate(request, response);
%>
${msg }
<%--
<c:choose>
  <c:when test="${msg=='yes' }">
    <c:redirect url="detail.jsp?no=${no }"/>
  </c:when>
  <c:otherwise>
    <script>
      alert("비밀번호가 틀립니다!!");
      history.back();
    </script>
  </c:otherwise>
</c:choose>
 --%>
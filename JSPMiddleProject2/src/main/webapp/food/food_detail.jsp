<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.FoodModel"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	model.foodDetailData(request, response);
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
	width:960px;
	margin: 0px auto;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <table class="table">
        <tr>
          <%--
          		StringTokenizer st=new StringTokenizer(vo.getPoster(), "^")
          		while(st.hasMoreTokens()) => <c:forTokens>
          		{
          			st.nextToken() ==> var
          		}
           --%>
          <c:forTokens items="${vo.poster }" delims="^" var="image">
          <td>
            <img src="${image }" style="width:100%" class="img-rounded">
          </td>
          </c:forTokens>
        </tr>
      </table>
      <table class="table">
        <tr>
          <td width=25%><span style="color:gray">가게명</span></td>
          <td width=75%>${vo.name }</td>
        </tr>
        <tr>
          <td width=25%><span style="color:gray">주소</span></td>
          <td width=75%>${vo.address }</td>
        </tr>
        <tr>
          <td width=25%><span style="color:gray">전화번호</span></td>
          <td width=75%>${vo.tel }</td>
        </tr>
        <tr>
          <td width=25%><span style="color:gray">음식종류</span></td>
          <td width=75%>${vo.type }</td>
        </tr>
        <tr>
          <td width=25%><span style="color:gray">가격대</span></td>
          <td width=75%>${vo.price }</td>
        </tr>
        <tr>
          <td width=25%><span style="color:gray">영업시간</span></td>
          <td width=75%>${vo.time }</td>
        </tr>
        <tr>
          <td width=25%><span style="color:gray">주차</span></td>
          <td width=75%>${vo.parking }</td>
        </tr>
        <tr>
          <td width=25%><span style="color:gray">메뉴</span></td>
          <td width=75%>${vo.menu }</td>
        </tr>
        <tr>
          <td colspan="2" class="text-right">
            <input type=button value="목록" class="btn btn-xs btn-danger" onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 제어문 : core, 변환 : fmt, String 메소드 : fn --%>
<%-- 
	JSP에서 처리 => Model로 따로 처리가 가능하게 만든다 (보안, 확장성, 재사용)
	--- JSP는 단발성, 여러명이 동시에 작업이 불가능
	--- JSP => Model/View 차이점, GET/POST
	Model : 사용자 요청 처리
	View : 처리된 데이터만 받아서 출력(JSP)
	--------------------------------- Controller
--%>
<jsp:useBean id="model" class="com.sist.model.FoodModel"/>
<%
	model.foodListData(request, response);
	//JSP마다 request를 가지고 있다 ==> request를 전송하고 직접 값을 받아온다
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
    <div class="jumbotron">
      <h3 class="text-center">${vo.title }</h3>
      <h4 class="text-center">${vo.subject }</h4>
    </div>
    <div class="row">
      <table class="table">
        <tr>
          <td>
            <%--
              request.setAttribute("list",list)
              
              => ArrayList<FoodVO> list=(ArrayList<FoodVO>)request.getAttribute("list");
                 for(FoodVO vo:list)
                 {
                 }
             --%>
            <c:forEach var="vo" items="${list }">
              <table class="table">
                <tr>
                  <td class="text-center" width=30% rowspan="4">
                    <a href="food_detail.jsp?fno=${vo.fno }"><img src="${vo.poster }" style="width:310px;height:230px;"></a>
                  </td>
                  <td width="70%">
                    <h4><a href="food_detail.jsp?fno=${vo.fno }">${vo.name }</a>&nbsp;<span style="color:orange">${vo.score }</span></h4>
                  </td>
                </tr>
                <tr>
                  <td width=70%>${vo.address }</td>
                </tr>
                <tr>
                  <td width=70%>${vo.tel }</td>
                </tr>
                <tr>
                  <td width=70%>${vo.type }</td>
                </tr>
              </table>
            </c:forEach>
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
	Cookie / Session
	----------------
	1. 저장공간 : 클라이언트 브라우저에 저장(보안 취약), 서버 메모리에 저장 (보안)
	2. 동일점은 생성시에는 request로 생성
	   request.getCookie()
	   request.getSession()
	3. 저장 => cookie (문자열만 저장), session (Object저장)
	4. 동일점 : Map형식 (키,값) ==> 키가 동일하면 덮어쓴다
	
	------------------------------------------
	주요 메소드
	Cookie
		1. 생성
			Cookie cookie=new cookie(키,값)
									------ 문자열로 저장
		2. 저장위치 지정
			cookie.setPath("/")
		3. 저장 기간
			cookie.setMaxAge(초단위로 저장)
		4. 브라우저 전송
			response.addCookie(cookie)
		5. 쿠키 읽기
			Cookie[] cookies=request.getCookie();
			= 키 이름 => getName()
			= 값 => getValue()
		6. 삭제
			Cookie.setMaxAge(0)
		7. 사용처 => 최근 방문, 장바구니, 자동 로그인
			로그인 (스프링) => 암호화, 복호화, 자동 로그인, ID저장
		
		Session
			1. 저장
				session.setAttribute(키,값)
									키 : 문자열
									값 : Object저장이 가능
			2. 저장 기간
				session.setMaxInactiveInterval(초단위) ==> default:30분
			3. 읽기
				session.getAttribute(키)
			4. 삭제(일부)
				session.removeAttribute(키)
				전체삭제
				session.invalidate() => 로그아웃
			5. 확인 => 값을 읽어서 null
			6. 처음 생성 => isNew()
			7. 각 브라우저마다 sessionId ==> getId()
				
			--------------------- 공통점 : 모든 JSP에서 사용이 가능(필요한 위치에서 언제든 사용이 가능)
			
			page : this (자신의 객체)
			=> Objecet page=this;
			config : 환경 설정 ==> ServletConfig => web.xml
												--------- 에러처리, 한글변환, 파일 저장위치 등록, 서블릿등록
			exception : Exception ==> try~catch
 --%>
<%
     String mode=request.getParameter("mode");
     if(mode==null)
        mode="0";
     int index=Integer.parseInt(mode);
     String jsp="";
     // main.jsp안에서 화면을 변경하는 위치
     switch(index)
     {
     case 0:
        jsp="../food/category.jsp";
        break;
     case 1:
        jsp="../food/food_list.jsp";
        break;
     case 2:
        jsp="../food/food_detail.jsp";
        break;
     }
     
     String log_jsp="";
     String id=(String)session.getAttribute("id");
     if(id==null) // 로그인이 없는 상태 
     {
        log_jsp="login.jsp";
     }
     else
     {
        log_jsp="logout.jsp";
     }
     // 쿠키 처리
     // 1. 
     Cookie[] cookies=request.getCookies();
     ArrayList<FoodVO> cList=new ArrayList<FoodVO>();
     FoodDAO dao=new FoodDAO();
     if(cookies!=null)//cookie가 존재한다면
     {
        for(int i=cookies.length-1;i>=0;i--)
        {
           if(cookies[i].getName().startsWith("f"))
           {
             String fno=cookies[i].getValue();
             FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
             String poster=vo.getPoster();
             poster=poster.substring(0,poster.indexOf("^")).replace("#","&");
             vo.setPoster(poster);
             cList.add(vo);
              
           }
        }
     }
     
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9965c727d3306713c47391be682e4be9&libraries=services"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.main{
   margin-top: 50px;
}
.row {
   width: 800px;
   margin: 0px auto;
}
h1{
   text-align: center
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.radios').on('click',function(){
		console.log("click");
		let fno=$(this).arrt("value");
		console.log("fno="+fno);
		$('#cookie_frm'+fno).submit();
	})
})
</script>
</head>
<body>
  <%
     pageContext.include("header.jsp"); // <jsp:include page="header.jsp">
  %>
  <div class="container main">
    <div class="col-sm-3">
      <%
         pageContext.include(log_jsp);
      %>
    </div>
    <div class="col-sm-9">
      <%
         pageContext.include(jsp);
      %>
      <div style="height: 20px"> </div>
       <h3>최신방문 맛집 &nbsp; 더보기 &nbsp; <a href="../food/cookie_delete.jsp">삭제</a></h3>
       <hr>
       <form method=post action="../food/cookie_one_delete.jsp" id="cookie_frm">
        <%
         for(int i=0;i<=cList.size();i++)
         {
            if(i<5)
            { FoodVO vo=cList.get(i);
        %>    
         
         <input type="radio" name="cookie" value="<%=vo.getFno()%>" class="radios">
         <img src="<%=vo.getPoster() %>" title="<%=vo.getName()%>" style="width: 150px;height: 150px">
         
        <% 
           }
         }
        %>
        <button class="btn btn-sm btn-danger">삭제</button>
     </form>
    </div>
  </div>
</body>
</html>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"/>
<%
	//사용자가 보내준 데이터를 받는다
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberVO vo=dao.isLogin(id,pwd);
	
	if(vo.getMsg().equals("NOID"))
	{
%>
		<script>
			alert("ID가 존재하지 않습니다!!");
			history.bakc();
		</script>
<%
	}

	else if(vo.getMsg().equals("NOPWD"))
	{
%>
	<script>
		alert("PWD가 틀립니다!!");
		history.bakc();
	</script>
<%
		/*
			request / response / session / cookie
		*/
	}else if(vo.getMsg().equals("OK")){
		// session에 저장 ==> 183page
		/*
			session : 서버에 저장 (유지 => 브라우저 종료나 로그아웃 전까지 지속적으로 유지)
					  모든 JSP에서 사용이 가능
					  용도 : 로그인 (ID)
			session : HttpSession
					  내장 객체 ==> 필요에 의해서는 request를 이용해서 생성이 가능
			주요 메소드
			1) 저장 기간 설정 : setMaxInactiveInterval(time) => 1800초 (30분) default
			2) 해제 : 로그아웃 => invalidate
            3) 등록 : setAttribute(키,값); ==> 값(Object)
            4) 등록된 값 읽기 : Object getAttribute()
			5) 새로 생성인지 여부 : isNew() => 장바구니
		*/
		session.setAttribute("id", id);
		session.setAttribute("name", vo.getName());
		session.setAttribute("sex", vo.getSex());
		
		//화면 이동
		response.sendRedirect("main.jsp");
		
	}
%>
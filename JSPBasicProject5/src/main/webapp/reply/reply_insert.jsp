<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String fno=request.getParameter("fno");
	String msg=request.getParameter("msg");
	String id=(String)session.getAttribute("id");
	String name=(String)session.getAttribute("name");
	// session : id,name ==> 전체 프로그램에서 id를 필요로 하는 경우가 많다 : 브라우저마다 저장 공간 한개를 가지고 있다
	// ==> sessionId : 채팅 => getId()
	/*
		전송하고 값이 필요없는 경우 : 게시판 글쓰기, 댓글 회원
		브라우저 종료시까지 값이 필요없는 경우 (유지) : 장바구니
	*/
	//DAO에 전송 ==> 메소드 제작 (매개변수는 3이상을 설정하지 않는다 : 3개이상 => 배열, 클래스에 담아서 넘겨준다)
	ReplyVO vo=new ReplyVO();
	vo.setFno(Integer.parseInt(fno));
	vo.setId(id);
	vo.setName(name);
	vo.setMsg(msg);
	
	ReplyDAO dao=new ReplyDAO();
	dao.replyInsert(vo);
	
	//이동
	response.sendRedirect("../include/main.jsp?mode=2&fno="+fno);
	
%>

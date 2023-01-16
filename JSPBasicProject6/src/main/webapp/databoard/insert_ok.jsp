<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%
  request.setCharacterEncoding("UTF-8");
  //각 JSP마다 request를 가지고 있다 => 보내는 JSP에서 한글변환 ==> form => action
  //GET방식은 특별한 경우가 아니면 한글을 보내지 않는다
  //GET은 window10에서는 자동처리
  //POST방식은 한글 처리가 안된다
  String path="c:\\download"; //업로드된 파일 저장 위치
  int size=1024*1024*100; //업로드된 파일의 최대 크기 : 100MB
  String enctype="UTF-8"; //한글 파일명
  MultipartRequest mr=new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
  //new DefaultFileRenamePolicy() => 같은 파일명일때 파일명 변경 a.jpg => a1.jpg => a2.jpg
  //업로드 완료
  //데이터베이스에 저장
  String name=mr.getParameter("name");
  String subject=mr.getParameter("subject");
  String content=mr.getParameter("content");
  String pwd=mr.getParameter("pwd");
  String filename=mr.getFilesystemName("upload");
  					/*
  						mr.getOriginalFileName("upload"); => 실제 사용자가 보내준 파일명
  						mr.getFilesystemName("upload"); => 변경된 파일명
  						JSP.zip => JSP1.jsp
  					*/
  DataBoardVO vo=new DataBoardVO();
  vo.setName(name);
  vo.setSubject(subject);
  vo.setContent(content);
  vo.setPwd(pwd);
  if(filename==null){//업로드가 없는 상태
	  vo.setFilename("");
  	  vo.setFilesize(0);
  }else{//업로드가 된 상태
	  File file=new File(path+"\\"+filename);
  	  vo.setFilename(filename);
  	  vo.setFilesize((int)file.length());//실제 저장된 파일의 크기를 읽는다
  }
  
  //vo를 DAO를 통해서 오라클로 전송
  DataBoardDAO dao=new DataBoardDAO();
  dao.databoardInsert(vo);
  //화면 이동한다 => 목록 (list.jsp)
  response.sendRedirect("../main/main.jsp?mode=5");//mode가 include하는 jsp구분자 
%>

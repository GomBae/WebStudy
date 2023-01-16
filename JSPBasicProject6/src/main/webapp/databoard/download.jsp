<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<%
	String fn=request.getParameter("fn");
	String path="c:\\download";
	try{
		//1. 파일 정보
		File file=new File(path+"\\"+fn);
		response.setContentLengthLong(file.length());//먼저 보내준다 (파일 다운로드 창을 보여준다)
		response.setHeader("Content-Disposition", "attachment;filename="
					+URLEncoder.encode(fn,"UTF-8"));
		out.clear();
		out=pageContext.pushBody();//out (파일을 복사(X) HTML을 작성)
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));//서버에서 파일 읽기
		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());//클라이언트 => 파일복사
		int i=0;
		byte[] buffer=new byte[1024];
		//한번 전송 => 1024byte씩 전송
		while((i=bis.read(buffer, 0, 1024))!=-1)//-1은 EOF (End Of File)
		{
			// i = 읽은 바이트 수
			bos.write(buffer,0,i);
		}

		bis.close();
		bos.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
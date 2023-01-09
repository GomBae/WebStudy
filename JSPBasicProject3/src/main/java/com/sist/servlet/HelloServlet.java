package com.sist.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * MVC ==> Controller(Servlet) ==> Spring
 * 		   -------------------
 * 			요청 ====================> 요청 처리 (Model) : Java
 * 			응답 ====================> 화면 출력 (View) : HSP
 */
@WebServlet("/HelloServlet")
//클라이언트 (브라우저) <=======> 서버
//					주소창 (연결이 가능)
//사용자가 URL주소 ==> 마지막에 /HelloServlet ==> 톰캣이 HelloServlet을 호출
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ==> 톰캣에 의해 호출되는 Callback
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		//멤버 변수의 초기화, 자동 로그인 => 파일 읽기(Cookie) ==> 생성자 역할
		System.out.println("서블릿 초기화 메소드 호출");
	}


	public void destroy() {
		// TODO Auto-generated method stub
		//브라우저 종료, 파일 이동, 새로고침 => 자동 메모리 해제
	}

	/*
	 * HTML
	 * ----
	 *   |
	 *   데이터를 전송 ==> 서버가 받아서 처리
	 *   				-------------- 자바
	 *   	|
	 *   GET / POST / PUT / DELETE
	 *   -----------
	 *        |
	 *      -----
	 *      GET : 데이터 전송 방식 ==> http://localhost/main/main.jsp?no=10; ==> URL뒤에 데이터를 묶어서 전송
	 *      											 --------------
	 *      											 main.jsp로 no값을 전송 => 메소드가 없기 때문에 매개변수를 이용할 수 없다
	 *        ==> 단순한 검색어, 페이지 번호 전송 ... (보안과 관련이 없는 데이터)
	 *      POST : no=10 ==> 감춰서 보낸다 (URL뒤에 데이터가 안보인다)
	 *        ==> 보안 (ID,Password,데이터가 많은 경우(회원가입,글쓰기,상품 입력..)
	 *        
	 *      GET ==> doGet()
	 *      POST ==> doPost()
	 *      		 --------- service(), JSP는 구분이 없다 => 자체 조건문으로 이용 (GET, POST)
	 * 
	 */

	//브라우저 화면을 출력하는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. GET / POST가 지정되지 않는 경우에는 GET이 호출 (default)
		/*
		 * 서버로 전송
		 * --------
		 * HTML
		 *   <a>
		 *   <form>
		 * JavaScript
		 *   <location.href="">
		 *   Ajax
		 *     type=POST,GET
		 * Java
		 *   sendRedirect
		 *   
		 * 
		 */
	}


	//브라우저 화면을 출력하는 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}

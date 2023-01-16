package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.SeoulVO;

public class SeoulDAO {
	//연결 객체 => 미리 생성된 객체의 주소를 가지고 온다
	private Connection conn;
	//오라클과 송수신 (SQL전송 == 결과값 얻기)
	private PreparedStatement ps;
	// DBCP ==> 요청시마다 생성(Connection이 많이 생성), 미리연결된 객체를 사용(반환)
	private static SeoulDAO dao; //싱글턴 패턴 (사용자마다 1개의 DAO만 사용이 가능하게 만든다)
	
	//DBCP 단점 : 
	//1. 미리생성된 Connection주소 얻기
	public void getConnection() {
		try{
			//POOL안에 접근 (JNDI) => 이름으로 디렉토리를 만들고 있다
			Context init=new InitialContext(); //탐색기 연다
			//루트 경로 이용
			Context c=(Context)init.lookup("java://comp/env"); //c드라이버에 접근
			// Connection 객체를 얻어 온다
			DataSource ds=(DataSource)c.lookup("jdbc/oracle"); //해당 파일 찾기
			// 주소
			conn=ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//2. 사용후에 반환
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
			//닫고 => 다시 재사용을 할 수 있게 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//3. 기능
	public ArrayList<SeoulVO> seoulListData(int page,String tab){
		ArrayList<SeoulVO> list=new ArrayList<SeoulVO>();
		try {
			//1. 미리 생성된 객체를 가져오기
			getConnection();
			//2. SQL문장 전송
			String sql="SELECT no,title,poster,num "
					+ "FROM (SELECT no,title,poster, rownum as num "
					+ "FROM (SELECT no,title,poster "
					+ "FROM seoul_"+tab+" ORDER BY no)) "
					+ "WHERE num BETWEEN ? AND ?";
			
			//3. 오라클 전송
			ps=conn.prepareStatement(sql);
			//4. ?에 값 채우기
			int rowSize=20;
			int start=(rowSize*page)-(rowSize-1); //1, 21, 41 .. rownum은 1번부터 시작
			int end=rowSize*page; //20 40 60 
			ps.setInt(1, start);
			ps.setInt(2, end);
			//5. 결과값 받기
			ResultSet rs=ps.executeQuery();
			//6. ArrayList값을 채운다
			while(rs.next()) {
				SeoulVO vo=new SeoulVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
			rs.close();
					
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection(); //반환(재사용) ==> Connection객체 생성을 조절
		}
		return list;
	}
	
	/*
	 * 실행 과정
	 * ------ 
	 * 1. POOL안에서 미리 생성된 Connection 객체를 얻어온다
	 *    톰캣에 의해서 Connection을 10(maxIdle)를 생성해서 => POOL이라는 메모리 공간에 저장을 해둠
	 * 2. 얻어온 Connection을 이용해서 오라클 데이터를 관리 (검색,추가,수정,삭제)'
	 * 3. 사용된 Connection을 POOL안으로 반환 (다른 사용자가 다시 재사용을 한다) ==> 10개만 가지고 사용
	 *    => Connection 생성을 제한 => 메모리 절약, 연결하는 시간을 줄일 수 있다
	 *    => 많은 사용자가 접속을 한다고 해도 쉽게 다운되지 않음
	 *    => 단점 : 오랜시간 기다릴 수 있다
	 *    => 웹 프로그램에서 데이터베이스 사용 일반화
	 */
	//총페이지
	public int seoulTotalPage(String tab) {
		int total=0;
		try{
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/20.0) "
					+ "FROM seoul_"+tab;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return total;
	}
}

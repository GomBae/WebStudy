package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FoodDAO {
	//오라클 연결 객체
		private Connection conn;
		//오라클 송수신 객체
		private PreparedStatement ps;
		//오라클 연결 주소
		private final String URL ="jdbc:oracle:thin:@localhost:1521:XE";
		
		//드라이버 연결
		public FoodDAO() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//오라클 연결
		public void getConnection() {
			try {
				conn=DriverManager.getConnection(URL,"hr","happy");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//오라클 닫기
		public void disConnection() {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		public ArrayList<CategoryVO> categoryListData(int no){
			ArrayList<CategoryVO> list=new ArrayList<CategoryVO>();
			try {
				getConnection();
				int s=0,e=0;
				if(no==1) {
					s=1;
					e=12;
				}else if(no==2) {
					s=13;
					e=18;
				}else if(no==3) {
					s=19;
					e=30;
				}
				
				String sql="SELECT cno,title,subject,poster "
						+ "FROM project_category "
						+ "WHERE cno BETWEEN ? AND ?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, s);
				ps.setInt(2, e);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					CategoryVO vo=new CategoryVO();
					vo.setCno(rs.getInt(1));
					vo.setTitle(rs.getString(2));
					vo.setSubject(rs.getString(3));
					vo.setPoster(rs.getString(4));
					list.add(vo);
				}
				rs.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			return list;
		}
		
		//카테고리별 맛집 목록 출력
		public CategoryVO categoryInfoData(int cno) {
			CategoryVO vo=new CategoryVO();
			try {
				getConnection();
				String sql="SELECT title,subject "
						+ "FROM project_category "
						+ "WHERE cno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, cno);
				ResultSet rs=ps.executeQuery();
				rs.next();
				vo.setTitle(rs.getString(1));
				vo.setSubject(rs.getString(2));
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			return vo;
		}
		
		//맛집 목록
		/*
		 *  CRUD => 요청/응답 => request,response
		 *  실제 경로명 getRealPath()
		 *  ------------------------------------
		 *  include() => 경로, 링크 방법
		 */
		public ArrayList<FoodVO> category_food_list(int cno){
			ArrayList<FoodVO> list=new ArrayList<FoodVO>();
			try {
				getConnection();
				String sql="SELECT fno,cno,name,poster,address,score,type,tel "
						+ "FROM project_food "
						+ "WHERE cno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, cno);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					FoodVO vo=new FoodVO();
					vo.setFno(rs.getInt(1));
					vo.setCno(rs.getInt(2));
					vo.setName(rs.getString(3));
					String poster=rs.getString(4);
					poster=poster.substring(0,poster.indexOf("^"));
					poster=poster.replace("#", "&");
					vo.setPoster(poster);
					String address=rs.getString(5);
					address=address.substring(0,address.indexOf("지"));
					vo.setAddress(address.trim());
					vo.setScore(rs.getDouble(6));
					vo.setType(rs.getString(7));
					vo.setTel(rs.getString(8));
					list.add(vo);
				}
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			return list;
		}
		
		//로그인 처리
		public MemberVO isLogin(String id,String pwd) {
			MemberVO vo=new MemberVO();
			try {
				getConnection();
				String sql="SELECT COUNT(*) FROM jsp_member "
						+ "WHERE id=?";
				ps=conn.prepareStatement(sql);
				//1.아이디 유무 확인
				ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				rs.next();
				int count=rs.getInt(1);
				rs.close();
				
				if(count==0) {//아이디가 없는 상태
					vo.setMsg("NOID");
				}else {//아이디가 있는 상태
					sql="SELECT pwd,name,sex FROM jsp_member "
							+ "WHERE id=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, id);
					rs=ps.executeQuery();
					rs.next();
					String db_pwd=rs.getString(1);
					String name=rs.getString(2);
					String sex=rs.getString(3);
					rs.close();
					
					if(pwd.equals(db_pwd)) {//로그인상태
						vo.setMsg("OK");
						vo.setName(name);
						vo.setSex(sex);
					}else {//비밀번호 틀린상태
						vo.setMsg("NOPWD");
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			return vo;
		}
		
		//상세보기
		public FoodVO foodDetailData(int fno) {
			FoodVO vo=new FoodVO();
			try {
				getConnection();
				String sql="SELECT fno,name,score,poster,tel,type,time,parking,menu,good,soso,bad,price,address "
						+ "FROM project_food "
						+ "WHERE fno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, fno);
				ResultSet rs=ps.executeQuery();
				rs.next();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setScore(rs.getDouble(3));
				vo.setPoster(rs.getString(4));
				vo.setTel(rs.getString(5));
				vo.setType(rs.getString(6));
				vo.setTime(rs.getString(7));
				vo.setParking(rs.getString(8));
				vo.setMenu(rs.getString(9));
				vo.setGood(rs.getInt(10));
				vo.setSoso(rs.getInt(11));
				vo.setBad(rs.getInt(12));
				vo.setPrice(rs.getString(13));
				vo.setAddress(rs.getString(14));
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
			return vo;
		}
}

package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.FoodVO;

public class FoodDAO {

	private Connection conn;
	private PreparedStatement ps;
	
	//POOL안에서 Connection 주소를 얻어오기
	public void getConnection() {
		try {
			//java://comp/env ==> jdbc/oracle
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");//이름으로 객체 찾기
			conn=ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//Connection 사용이 종료 반환
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//사용
	public ArrayList<FoodVO> foodFindData(String addr,int page){
		ArrayList<FoodVO> list=new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql="SELECT fno,name,poster,num "
					+ "FROM (SELECT fno,name,poster,rownum as num "
					+ "FROM (SELECT fno,name,poster "
					+ "FROM food_location WHERE address LIKE '%'||?||'%' ORDER BY fno)) "
					+ "WHERE num BETWEEN ? AND ?";
			
			ps=conn.prepareStatement(sql);
			int rowSize=20;
			int start = (rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setString(1, addr);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				String poster=rs.getString(3);
				poster=poster.substring(0,poster.indexOf("^")).replace("#", "&");
				vo.setPoster(poster);
				
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
	//총페이지
	public int foodFindTotalPage(String addr) {
		int totalpage=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/20.0) FROM food_location "
					+ "WHERE address LIKE '%'||?||'%'"; //LIKE '%aaa%'
			//LIKE CONCAT('%',?,'%') ==> MySQL, MariaDB
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
			ResultSet rs=ps.executeQuery();
			rs.next();
			totalpage=rs.getInt(1);
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return totalpage;
	}
	
	public int foodFindCount(String addr) {
		int totalpage=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM food_location "
					+ "WHERE address LIKE '%'||?||'%'"; //LIKE '%aaa%'
			//LIKE CONCAT('%',?,'%') ==> MySQL, MariaDB
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
			ResultSet rs=ps.executeQuery();
			rs.next();
			totalpage=rs.getInt(1);
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return totalpage;
	}
	
	//상세보기
	public FoodVO foodDetailData(int fno) {
		FoodVO vo=new FoodVO();
		try {
			getConnection();
			String sql="SELECT fno,name,score,poster,tel,type,time,parking,menu,price,address "
					+ "FROM food_location "
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
			vo.setPrice(rs.getString(10));
			vo.setAddress(rs.getString(11));
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
}

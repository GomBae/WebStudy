package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	// DBCP => 웹에서만 사용이 가능 (Connection 생성 => 톰캣에서 생성) => 접속시간을 줄일 수 있다(연결속도 향상), 보안
	//Connection의 갯수를 관리할 수 있기 때문에
	// JDBC = DBCP = ORM
	public void getConnection() { //미리 만들어진 Connection 객체를 가지고 온다
		try {
			// 등록된 위치로 접속
			Context init=new InitialContext(); //JNDI(폴더형식)
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource) c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void disConnection() { //재사용하기 위해 반환
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<CategoryVO> categoryAllData(){
		ArrayList<CategoryVO> list=new ArrayList<CategoryVO>();
		try {
			getConnection();
			String sql="SELECT cno,title,subject,poster "
					+ "FROM project_category "
					+ "ORDER BY cno";
			ps=conn.prepareStatement(sql);
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
}

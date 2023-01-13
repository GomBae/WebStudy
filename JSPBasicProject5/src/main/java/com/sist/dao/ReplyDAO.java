package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDAO {
	//오라클 연결 객체
			private Connection conn;
			//오라클 송수신 객체
			private PreparedStatement ps;
			//오라클 연결 주소
			private final String URL ="jdbc:oracle:thin:@localhost:1521:XE";
			
			//드라이버 연결
			public ReplyDAO() {
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
			//댓글쓰기
			public void replyInsert(ReplyVO vo) {
				
				try {
					getConnection();
					String sql="INSERT INTO jsp_reply(no,fno,id,name,msg) "
							+ "VALUES(jr_no_seq.nextval,?,?,?,?)";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, vo.getFno());
					ps.setString(2, vo.getId());
					ps.setString(3, vo.getName());
					ps.setString(4, vo.getMsg());
					
					ps.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					disConnection();
				}
			}
			//댓글읽기
			public ArrayList<ReplyVO> replyListData(int fno){
				ArrayList<ReplyVO> list=new ArrayList<ReplyVO>();
				try {
					getConnection();
					String sql="SELECT no,fno,id,name,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS'),msg "
							+ "FROM jsp_reply "
							+ "WHERE fno=? "
							+ "ORDER BY no DESC";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, fno);
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {
						ReplyVO vo=new ReplyVO();
						vo.setNo(rs.getInt(1));
						vo.setFno(rs.getInt(2));
						vo.setId(rs.getString(3));
						vo.setName(rs.getString(4));
						vo.setDbday(rs.getString(5));
						vo.setMsg(rs.getString(6));
						
						list.add(vo);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					disConnection();
				}
				return list;
				
			}
			
			public int replyCount(int fno) {
				int count=0;
				try {
					getConnection();
					String sql="SELECT COUNT(*) FROM jsp_reply WHERE fno=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, fno);
					ResultSet rs=ps.executeQuery();
					rs.next();
					count=rs.getInt(1);
					rs.close();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					disConnection();
				}
				return count;
			}
			//댓글수정
			public void replyUpdate(int no,String msg) {
				try {
					getConnection();
					String sql="UPDATE jsp_reply SET "
							+ "msg=? "
							+ "WHERE no=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, msg);
					ps.setInt(2, no);
					
					ps.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					disConnection();
				}
				
			}
			//댓글삭제
			public void replyDelete(int no) {
				
				try {
					getConnection();
					String sql="DELETE FROM jsp_reply "
							+ "WHERE no=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					
					ps.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					disConnection();
				}
			}
			
}

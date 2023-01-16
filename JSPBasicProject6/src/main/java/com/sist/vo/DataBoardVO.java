package com.sist.vo;
import java.util.*;
/*
 * 데이터를 모아서 전송할 목적
 * ---------------------
 *  => JSP : Bean(핵심기능)
 *  => Spring : Value Object (VO)
 *  => MyBatis : Data Transfer Object (DTO)
 *  ----------------------------------------- 같은 개념
 *  1) 변수 : private (데이터 보호)
 *  2) --- 일반 기능 설정
 *         읽기(저장된 데이터 읽기) / 쓰기(메모리 저장)
 * 		   -----------------------------------
 * 			getter				setter
 *  3) 제작 형식
 *     set변수명() ==> setName(),getName()...
 *     boolean ==> set변수명, is변수명() ==> 존재여부 확인
 */
public class DataBoardVO {
	private int no,hit,filesize;
	private  String name,subject,content,pwd,filename,dbday;
	private Date regdate;
	
	
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}

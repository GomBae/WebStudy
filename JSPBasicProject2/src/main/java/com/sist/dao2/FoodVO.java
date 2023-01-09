package com.sist.dao2;
/*
 * FNO        NOT NULL NUMBER         
CNO                 NUMBER         
POSTER     NOT NULL VARCHAR2(1000) 
NAME       NOT NULL VARCHAR2(100)  
SCORE      NOT NULL NUMBER(2,1)    
ADDRESS    NOT NULL VARCHAR2(250)  
TEL        NOT NULL VARCHAR2(20)   
TYPE       NOT NULL VARCHAR2(100)  
PRICE               VARCHAR2(20)   
PARKING             VARCHAR2(100)  
TIME                VARCHAR2(200)  
MENU                VARCHAR2(500)  
JJIM_COUNT          NUMBER         
LIKE_COUNT          NUMBER         
HIT                 NUMBER         
GOOD                NUMBER         
SOSO                NUMBER         
BAD                 NUMBER     
 */
public class FoodVO {
	private int fno,good,soso,bad;
	private double score;
	private String name,address,tel,type,price,parking,time,menu;
	private String poster;
	
	
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getSoso() {
		return soso;
	}
	public void setSoso(int soso) {
		this.soso = soso;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	
	
}

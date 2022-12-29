package com.sist.dao;
/*
 *  GNO             NOT NULL NUMBER         
	CNO                      NUMBER         
	GOODS_NAME      NOT NULL VARCHAR2(4000) 
	GOODS_CONTENT   NOT NULL VARCHAR2(4000) 
	GOODS_PRICE     NOT NULL NUMBER         
	GOODS_PERCENT   NOT NULL NUMBER         
	FIRST_BUY_PRICE NOT NULL NUMBER         
	SEND            NOT NULL VARCHAR2(30)   
	ACCOUNT         NOT NULL NUMBER         
	JJIM_COUNT               NUMBER         
	LIKE_COUNT               NUMBER         
	HIT                      NUMBER         
	GOODS_POSTER    NOT NULL VARCHAR2(260)  
 */
public class GoodsVO {
	private int gno,cno,goods_price,goods_percent,account,jjim_count,like_count,hit,first_buy_price;
	private String goods_name,goods_content,send,goods_poster;
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_percent() {
		return goods_percent;
	}
	public void setGoods_percent(int goods_percent) {
		this.goods_percent = goods_percent;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public int getJjim_count() {
		return jjim_count;
	}
	public void setJjim_count(int jjim_count) {
		this.jjim_count = jjim_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getFirst_buy_price() {
		return first_buy_price;
	}
	public void setFirst_buy_price(int first_buy_price) {
		this.first_buy_price = first_buy_price;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public String getSend() {
		return send;
	}
	public void setSend(String send) {
		this.send = send;
	}
	public String getGoods_poster() {
		return goods_poster;
	}
	public void setGoods_poster(String goods_poster) {
		this.goods_poster = goods_poster;
	}
	

}

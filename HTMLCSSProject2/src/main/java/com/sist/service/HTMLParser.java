package com.sist.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.*;
import java.util.StringTokenizer;
//Document => html문서가 저장된다
public class HTMLParser {
	//구분이 있는 경우
	public void htmlGetData() {
		try {
			/*
			 *  connect() => URL
			 *  parse() => File
			 */
			Document doc=Jsoup.parse(new File("C:\\webDev\\webStudy\\HTMLCSSProject2\\src\\main\\webapp\\css\\css_2.html"));
//			System.out.println(doc.toString());
//			Elements h1=doc.select("div.b h1"); //1개 => Element, 여러개 => Elements
//			System.out.println(h1.toString());
//			for(int i=0;i<h1.size();i++) {
//				System.out.println(h1.get(i).text());//<h1 class="f5">감</h1> => <h1></h1>사이에 있는 데이터를 추출
//			}
			Element name=doc.select("div.a h1").get(2);//0 1 2 3 4
			System.out.println(name.text());
			Element f=doc.select("div.b h1").get(3);//0 1 2 3 4
			System.out.println(f.text());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//구분이 없는 경우 => <table> => <td>, <ul> => <li>, <dl> => <dd>
	public void foodDetailData() {
		try {
			Document doc=Jsoup.parse(new File("C:\\webDev\\webStudy\\HTMLCSSProject2\\src\\main\\webapp\\css\\css_3.html"));
//			System.out.println(doc.toString());
			Elements detail=doc.select("table.info tbody tr th");
			String address="", tel="", type="",price="",parking="",time="",menu="";
			for(int i=0;i<detail.size();i++) {
//				System.out.println(detail.get(i).text());
				/*
				 *  주소
					전화번호
					음식 종류
					가격대
					주차
					영업시간
					휴일
					웹 사이트
					메뉴
				 */
				String label=detail.get(i).text();
				if(label.equals("주소")) {
					Element a=doc.select("table.info tbody tr td").get(i);
					address=a.text();
				}
				else if(label.equals("전화번호")) {
					Element a=doc.select("table.info tbody tr td").get(i);
					tel=a.text();
				}
				else if(label.equals("음식 종류")) {
					Element a=doc.select("table.info tbody tr td").get(i);
					type=a.text();
				}
				else if(label.equals("가격대")) {
					Element a=doc.select("table.info tbody tr td").get(i);
					price=a.text();
				}
				else if(label.equals("주차")) {
					Element a=doc.select("table.info tbody tr td").get(i);
					parking=a.text();
				}
				else if(label.equals("영업시간")) {
					Element a=doc.select("table.info tbody tr td").get(i);
					time=a.text();
				}
				else if(label.equals("메뉴")) {
					Element a=doc.select("table.info tbody tr td").get(i);
					menu=a.text();
				}
			}
			String addr1=address.substring(0,address.indexOf("지"));
			String addr2=address.substring(address.indexOf("지")+3);
			System.out.println("주소 : "+addr1);
			System.out.println("지번 : "+addr2);
			
			System.out.println("전화 : "+tel);
			System.out.println("음식 종류 : "+type);
			System.out.println("가격대 : "+price);
			System.out.println("시간 : "+time);
			System.out.println("주차 : "+parking);
			StringTokenizer st=new StringTokenizer(menu,"원");
			while(st.hasMoreTokens()) {
				System.out.println(st.nextToken()+"원");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 속성값 읽기 <img src="이미지명"> doc.select("~~ img") ==> attr("src")
	public void foodAttributeData() {
		try {
			Document doc=Jsoup.parse(new File("C:\\webDev\\webStudy\\HTMLCSSProject2\\src\\main\\webapp\\css\\css_4.html"));
			Elements image=doc.select("div.list-photo_wrap img.center-croping");
			System.out.println(image.toString());
			for(int i=0;i<image.size();i++) {
				System.out.println(image.get(i).attr("src"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// HTML읽기
	/*
	 * 	<div class="a">
	 *    <span>Hello</span>
	 *    <span>
	 *      <p>HTML/CSS</p>
	 *    </span>
	 *  </div>
	 *  
	 *  doc.select("div.a") => text() ==> Hello HTML/CSS
	 */
	public void htmlData() {
		try {
			Document doc=Jsoup.parse(new File("C:\\webDev\\webStudy\\HTMLCSSProject2\\src\\main\\webapp\\css\\css_5.html"));
			Element div=doc.selectFirst("div.a");
			System.out.println(div.text());
			System.out.println(div.html());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 자바스크립트 읽기
	public void scriptData() {
		try {
			Document doc=Jsoup.parse(new File("C:\\webDev\\webStudy\\HTMLCSSProject2\\src\\main\\webapp\\css\\css_6.html"));
			Element script=doc.selectFirst("script#reviewCountInfo");
			System.out.println(script.data());
			//[{"action_value":1,"count":3},{"action_value":2,"count":12},{"action_value":3,"count":129}]
			String s=script.data();
			JSONParser jp=new JSONParser();
			/*
			 * 1. HTML 데이터 추출 => HTMLParser => Jsoup
			 * 2. JSON 데이터 추출 => JSONParser (Ajax, Vue, React)
			 *    => ArrayList => [] => JSONArray
			 *    => ~VO	   => {} => JSONObject
			 *    
			 * 3. XML 데이터 추출 => DocumentBuilder
			 */
			// ==> Restful
			JSONArray arr=(JSONArray)jp.parse(s);
//			System.out.println(arr.toString());
			for(int i=0;i<arr.size();i++) {
				JSONObject obj=(JSONObject)arr.get(i);
				if(i==0) {
					System.out.print("별로("+obj.get("count")+") ");
				}
				else if(i==1) {
					System.out.print("괜찮다("+obj.get("count")+") ");
				}
				else if(i==2) {
					System.out.print("맛있다("+obj.get("count")+") ");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * text()
	 * attr()
	 * html()
	 * data()
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HTMLParser hp=new HTMLParser();
//		hp.htmlGetData();
//		hp.foodDetailData();
//		hp.foodAttributeData();
//		hp.htmlData();
		hp.scriptData();
	}

}

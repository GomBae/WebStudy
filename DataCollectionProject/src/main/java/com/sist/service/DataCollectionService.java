package com.sist.service;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.CategoryVO;
import com.sist.dao.FoodDAO;
import com.sist.dao.FoodVO;

public class DataCollectionService {
	public static void main(String[] args) {
		DataCollectionService ds=new DataCollectionService();
//		ds.foodCategoryGetData();
//		ds.foodDetailData();
		ds.goodsAllData();
	}
	public void foodCategoryGetData() {
		FoodDAO dao=new FoodDAO();
		try {
			//사이트 연결 => HTML태그 읽기
			Document doc=Jsoup.connect("https://www.mangoplate.com/").get();
//			System.out.println(doc.toString());
			Elements title=doc.select("div.top_list_slide div.info_inner_wrap span.title");
			Elements subject=doc.select("div.top_list_slide div.info_inner_wrap p.desc");
			Elements poster=doc.select("div.top_list_slide img.center-croping");
			Elements link=doc.select("div.top_list_slide a");
//			System.out.println(link.toString());
			/*
			 * text() => <태그명>원하는 데이터</태그명>
			 * attr() => <태그명 속성="원하는 값">
			 * data() => <script></script>
			 * html() => <태그명>
			 *             <태그명>
			 *               원하는 데이터
			 *             </태그명>
			 *           </태그명>
			 *           
			 *       <div class="a">
			 *         <ul>
			 *           <li>
			 *             제목, ...
			 *           </li>
			 *           <li>
			 *             제목...
			 *           </li>
			 *         </ul>
			 *       </div>
			 */
			for(int i=0;i<title.size();i++) {
				System.out.println(i+1);
				System.out.println(title.get(i).text());
				System.out.println(subject.get(i).text());
				System.out.println(poster.get(i).attr("data-lazy"));
				System.out.println(link.get(i).attr("href"));
				System.out.println("====================================");
				CategoryVO vo=new CategoryVO();
				vo.setTitle(title.get(i).text());
				vo.setSubject(subject.get(i).text());
				vo.setPoster(poster.get(i).attr("data-lazy"));
				vo.setLink(link.get(i).attr("href"));
				dao.foodCategoryInsert(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void foodDetailData() {
		FoodDAO dao=new FoodDAO();
		try {
			ArrayList<CategoryVO> list=dao.foodCategoryInfoData();
			for(CategoryVO vo:list) {
//				System.out.println(vo.getCno()+" "+vo.getTitle()+" "+vo.getLink());
				FoodVO fvo=new FoodVO();
				fvo.setCno(vo.getCno());
				System.out.println(vo.getCno()+"."+vo.getTitle());
				Document doc=Jsoup.connect(vo.getLink()).get();
				Elements link=doc.select("section#contents_list span.title a");
				for(int k=0;k<link.size();k++) {
//					System.out.println(link.get(i).attr("href"));
					Document doc2=Jsoup.connect("https://www.mangoplate.com"+link.get(k).attr("href")).get();
					// 1. 이미지
					Elements image=doc2.select("div.list-photo_wrap img.center-croping");
					String poster="";
					for(int j=0;j<image.size();j++) {
						String s=image.get(j).attr("src");
						poster+=s+"^";
					}
					poster=poster.substring(0,poster.lastIndexOf("^"));
					
					poster=poster.replace("&","#");
					fvo.setPoster(poster);
					//System.out.println(poster);
					// 2. 맛집명
					/*
					 * <span class="title">
                        <h1 class="restaurant_name">심학산도토리국수</h1>
                        <strong class="rate-point ">
                         <span>4.4</span>
                         </strong>
					 */
					Element name=doc2.selectFirst("span.title h1.restaurant_name");
					Element score=doc2.selectFirst("strong.rate-point span");
					System.out.println(name.text()+" "+score.text());
					fvo.setName(name.text());
					fvo.setScore(Double.parseDouble(score.text()));
					// 3. 평점
					// 4. 주소, 전화, 음식종류, 가격대, 주차, 영업시간, 메뉴, 좋아요, 괜찮아요, 별로에요
					String address="no",tel="no",type="no",price="no",time="no",menu="no",parking="no";
					Elements detail=doc2.select("table.info tbody tr th");
					for(int i=0;i<detail.size();i++) {
//						System.out.println(detail.get(i).text());
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
							Element a=doc2.select("table.info tbody tr td").get(i);
							address=a.text();
						}
						else if(label.equals("전화번호")) {
							Element a=doc2.select("table.info tbody tr td").get(i);
							tel=a.text();
						}
						else if(label.equals("음식 종류")) {
							Element a=doc2.select("table.info tbody tr td").get(i);
							type=a.text();
						}
						else if(label.equals("가격대")) {
							Element a=doc2.select("table.info tbody tr td").get(i);
							price=a.text();
						}
						else if(label.equals("주차")) {
							Element a=doc2.select("table.info tbody tr td").get(i);
							parking=a.text();
						}
						else if(label.equals("영업시간")) {
							Element a=doc2.select("table.info tbody tr td").get(i);
							time=a.text();
						}
						else if(label.equals("메뉴")) {
							Element a=doc2.select("table.info tbody tr td").get(i);
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
					System.out.println("메뉴 : "+menu);
					
					fvo.setAddress(address);
					fvo.setTel(tel);
					fvo.setTime(time);
					fvo.setType(type);
					fvo.setParking(parking);
					fvo.setMenu(menu);
					fvo.setPrice(price);
					
					Element script=doc2.selectFirst("script#reviewCountInfo");
//					System.out.println(script.data());
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
//					System.out.println(arr.toString());
					for(int i=0;i<arr.size();i++) {
						JSONObject obj=(JSONObject)arr.get(i);
						if(i==0) {
							System.out.print("별로("+obj.get("count")+") ");
							String ss=String.valueOf(obj.get("count"));
							fvo.setBad(Integer.parseInt(ss));
						}
						else if(i==1) {
							System.out.print("괜찮다("+obj.get("count")+") ");
							String ss=String.valueOf(obj.get("count"));
							fvo.setSoso(Integer.parseInt(ss));
						}
						else if(i==2) {
							System.out.println("맛있다("+obj.get("count")+") ");
							String ss=String.valueOf(obj.get("count"));
							fvo.setGood(Integer.parseInt(ss));
						}
					}
					System.out.println("==============================================================================");
					dao.foodDetailInsert(fvo);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/////////////////////////////GOODS
	/*
	 * <li class="common2_sp_list_li"><a href="https://shop.10000recipe.com/goods/goods_view.php?goodsNo=1000032512&utm_source=10k_web&utm_medium=category_list&utm_campaign=g1000032512" class="common2_sp_link"></a><div class="common2_sp_thumb"><img src="https://recipe1.ezmember.co.kr/cache/data/goods/22/12/51/1000032512/1000032512_detail_056.jpg"></div>
                  <div class="common2_sp_caption">
                      <div class="common2_sp_caption_tit line2">[美친특가] 테이스티나인 t9 최현석셰프의 스테이크&구이 특가/블랙앵거스 1+1 클리어런스 세일!</div>
                      <div class="common2_sp_caption_price_box"><span class="common2_sp_caption_per"><b>72</b>%</span> <strong class="common2_sp_caption_price"><span>4,900</span><small>원</small></strong></div><div class="common2_sp_caption_rv2">
                            <span class="caption_rv2_img"></span><b class="caption_rv2_pt">4.3</b><span class="caption_rv2_ea">(21)</span>
                        </div><div class="common2_sp_caption_icon"><span class="icon_free">무료배송</span> </div></div></li><li class="common2_sp_list_li"><a href="https://shop.10000recipe.com/goods/goods_view.php?goodsNo=1000022330&utm_source=10k_web&utm_medium=category_list&utm_campaign=g1000022330" class="common2_sp_link"></a><div class="common2_sp_thumb"><img src="https://recipe1.ezmember.co.kr/cache/data/goods/21/08/34/1000022330/1000022330_detail_010.jpg"></div>
	 */
	public void goodsAllData() {
		try {
			for(int i=1;i<=238;i++) {
				Document doc=Jsoup.connect("https://shop.10000recipe.com/index.php?path=category&sort=popular&page="+i).get();
				Elements link=doc.select("div.s_list_wrap_vt li.common2_sp_list_li a.common2_sp_link");//<a>
				for(int j=0;j<link.size();j++) {
					System.out.println(link.get(j).attr("href"));
					Document doc2=Jsoup.connect(link.get(j).attr("href")).get();
					Element poster=doc2.selectFirst("div.s_view_pic div.s_view_pic_zoom img");
					//Element poster=doc2.select("").get(0)
					System.out.println(poster.attr("src"));
					Element title=doc2.selectFirst("div.s_view_info h3 p");
					System.out.println(title.text());
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/////////////////////////////RECIPE
	/////////////////////////////SEOUL

}

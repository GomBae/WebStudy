<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%
	String fno=request.getParameter("fno");
	FoodDAO dao=new FoodDAO();
	FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
	String address=vo.getAddress();
	String addr1=address.substring(0,address.lastIndexOf("지"));
	addr1=addr1.trim();
	String addr2=address.substring(address.lastIndexOf("지")+3);
	addr2=addr2.trim();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="row">
  <table class="table">
     <tr>
       <%
           String poster=vo.getPoster();
           poster=poster.replace("#", "&");
           StringTokenizer st=new StringTokenizer(poster,"^");
           while(st.hasMoreTokens())
           {
       %>
              <td class="text-center">
               <img src="<%=st.nextToken() %>" style="width:100%">
              </td>
       <%
           }
       %>
     </tr>
   </table>
   </div>
      <div style="height: 10px"></div>
   <div class="row">
    <div class="col-sm-7">
      <table class="table">
       <tr>
        <td colspan="2">
          <h3><%=vo.getName() %>&nbsp;<span style="color:orange"><%=vo.getScore() %></span></h3>
        </td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">주소</span></th>
         <td width="85%"><%=vo.getAddress() %>
         </td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">전화</span></th>
         <td width="85%"><%=vo.getTel() %></td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">음식종류</span></th>
         <td width="85%"><%=vo.getType() %></td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">가격대</span></th>
         <td width="85%"><%=vo.getPrice() %></td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">영업시간</span></th>
         <td width="85%"><%=vo.getTime() %></td>
       </tr>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">주차</span></th>
         <td width="85%"><%=vo.getParking() %></td>
       </tr>
       <%
          if(!vo.getMenu().equals("no"))
          {
       %>
       <tr>
         <th class="text-right"  width=15%><span style="color:gray">메뉴</span></th>
         <td width="85%">
           <ul>
             <%
                st=new StringTokenizer(vo.getMenu(),"원");
                while(st.hasMoreTokens())
                {
             %>
                   <li><%=st.nextToken() %>원</li>
             <%
                }
             %>
           </ul>
         </td>
       </tr>
       <%
          }
       %>
       <tr>
         <td colspan="2" class="text-right">
           <input type=button class="btn btn-xs btn-success" value="찜하기">
           <input type=button class="btn btn-xs btn-info" value="좋아요">
           <input type=button class="btn btn-xs btn-warning" value="예약">
           <input type=button class="btn btn-xs btn-primary" value="목록" onclick="javascript:history.back()">
         </td>
       </tr>
      </table>
  </div>
  <div class="col-sm-5">
	    <div id="map" style="width:100%;height:350px;"></div>
	

	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('<%=addr1%>', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=vo.getName()%></div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
  </div>
  </div>
</body>
</html>
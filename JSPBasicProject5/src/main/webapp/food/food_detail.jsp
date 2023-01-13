<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"/>
<jsp:useBean id="rdao" class="com.sist.dao.ReplyDAO"/>
<%
     String fno=request.getParameter("fno");
     // FoodVO
     FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
     String address=vo.getAddress();
     String addr1=address.substring(0,address.lastIndexOf("지"));
     addr1=addr1.trim();
     
     String addr2=address.substring(address.lastIndexOf("지")+3);
     addr2=addr2.trim();
     
     ArrayList<ReplyVO> list=rdao.replyListData(Integer.parseInt(fno));
     int count=rdao.replyCount(Integer.parseInt(fno));
     //String sex=(String)session.getAttribute("sex");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['리뷰', '현황'],
          ['맛있다',   <%=vo.getGood()%>],
          ['괜찮다',    <%=vo.getSoso()%>],
          ['별로' ,    <%=vo.getBad()%>]
        ]);

        var options = {
          title: '리뷰 현황',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script type="text/javascript">
    // 사용자 Front 처리
    /*
         window.onload=function(){
           // main
         }
    
         jquery는 자바스크립트 라이브러리 
    */
    let i=0;// 자바스크립트 변수 설정 => var(ES5) , let , const(ES6)
    $(function(){
       $('.ups').click(function(){
          $('.updates').hide();// 감추기
          let no=$(this).attr('data-no');
          if(i==0)
          {
             $(this).text("취소");
             $('#r'+no).show();
             i=1;
          }
          else
          {
             $(this).text("수정");
             $('#r'+no).hide();
             i=0;
          }
       })
    })
    </script>
</head>
<body>
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
         <td width="85%"><%=addr1 %>
           <br><sub style="color:gray">지번:<%=addr2 %></sub>
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
      <div style="height: 10px"></div>
      댓글&nbsp;(<%=count %>)
      <hr>
      <%
         String id=(String)session.getAttribute("id");
         if(count==0)
         {
      %>
            <span style="color:gray">등록된 댓글이 없습니다</span>
      <%
         }
         else
         {
      %>
              <table class="table">
                <tr>
                  <td>
                    <%
                       for(ReplyVO rvo:list)
                       {
                    %>
                           <table class="table">
                             <tr>
                               <td class="text-left">◑<%=rvo.getName() %>&nbsp;(<%=rvo.getDbday() %>)</td>
                               <td class="text-right">
                                 <%
                                     if(id!=null)
                                     {
                                        if(id.equals(rvo.getId()))
                                        {
                                  %>
                                            <span class="btn btn-xs btn-primary ups" data-no="<%=rvo.getNo()%>">수정</span>
                                            <%-- 
                                                  Ajax => JavaScript
                                                  실제 처리 데이터 , 화면 변경 
                                                  ------------   -------
                                                    no (delete)   fno(맛집)
                                             --%>
                                            <a href="../reply/reply_delete.jsp?no=<%=rvo.getNo() %>&fno=<%=fno %>" class="btn btn-xs btn-danger">삭제</a>
                                  <%
                                        }
                                     }
                                 %>
                               </td>
                             </tr>
                             <tr>
                               <td colspan="2" class="text-left" valign="top"><pre style="white-space: pre-wrap;background-color: white;border:none"><%=rvo.getMsg() %></pre></td>
                             </tr>
                             <tr style="display: none" id="<%=rvo.getNo()%>" class="updates">
                           <td colspan="2">
                              <form method=post action="../reply/reply_update.jsp">
                               <input type=hidden name=no value="<%=rvo.getNo()%>">
                               <%-- 수정에 필요한 변수 --%>
                               <input type=hidden name=fno value="<%= vo.getFno()%>">
                               <%--화면으로 다시 이동 (맛집 상세보기) --%>
                               <textarea rows="4" cols="50" name="msg" style="float: left"><%=rvo.getMsg() %></textarea>
                               <input type="submit" value="댓글수정" class="btn btn-sm btn-danger" style="float: left;height: 88px">
                              </form>
                            </td>
                          </tr>
                           </table>
                    <%
                       }
                    %>
                  </td>
                </tr>
                
              </table>
      <% 
         }
      %>
      <%
           
           if(id!=null) // 로그인이 되었다면 (세션의 값의 존재여부)
           {
      %>
      <table class="table">
        <tr>
          <td>
            <form method=post action="../reply/reply_insert.jsp">
             <input type=hidden name=fno value="<%= vo.getFno()%>">
             <textarea rows="4" cols="55" name="msg" style="float: left"></textarea>
             <input type="submit" value="댓글쓰기" class="btn btn-sm btn-danger" style="float: left;height: 88px">
            </form>
          </td>
        </tr>
      </table>
      <%
           }
      %>
    </div>
    <div class="col-sm-4">
      <div id="map" style="width:100%;height:350px;"></div>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9965c727d3306713c47391be682e4be9&libraries=services"></script>
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
      
      geocoder.addressSearch("<%=addr1%>", function(result, status) {
      
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
      <div id="piechart_3d" style="width:500px;height:400px;"></div>
    </div>
   </div>
</body>
</html>







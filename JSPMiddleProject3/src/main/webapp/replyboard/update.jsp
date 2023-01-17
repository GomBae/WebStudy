<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.BoardModel"/>
<%
	model.boardUpdateData(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
	margin-top:100px;
}
.row{
	width:800px;
	margin: 0px auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#sendBtn').click(function(){
		let name=$('#name').val();
		let subject=$('#subject').val();
		let content=$('#content').val();
		let pwd=$('#pwd').val();
		let no=$('#sendBtn').attr("data-no");
		if(pwd.trim==""){
			$('#pwd').focus();
			return
		}
		
		$.ajax({
			type:'post',
			url:'update_ok.jsp',
			data:{"name":name,"subject":subject,"content":content,"pwd":pwd,"no":no},
			success:function(res){
				let result=res.trim();
				if(result=='yes'){
					location.href="detail.jsp?no="+no;
				}else{
					alert("비밀번호가 틀립니다!");
					$('#pwd').val("");
					$('#pwd').focus();
				}
			}
		})
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <img src="qna.jpg" style="width: 800px;height: 150px;">
    </div>
    <div style="height: 5px"></div>
    <div class="row">
    <!-- <form method="post" action="update_ok.jsp"> -->
    <table class="table">
      <tr>
        <th width=15% class="text-center success">이름</th>
        <td width=85%>
          <input type=text name=name size=15 class="input-sm" required value="${vo.name }" id="name">
          <input type=hidden name=no value="${vo.no }">
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">제목</th>
        <td width=85%>
          <input type=text name=subject size=45 class="input-sm" required value="${vo.subject }" id="subject">
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">내용</th>
        <td width=85%>
          <textarea rows="10" cols="50" name=content required id="content">${vo.content }</textarea>
        </td>
      </tr>
      
      <tr>
        <th width=15% class="text-center success">비밀번호</th>
        <td width=85%>
          <input type=password name=pwd size=10 class="input-sm" required id="pwd">
        </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type=button value="수정" class="btn btn-sm btn-primary" id="sendBtn" data-no="${vo.no }">
          <input type=button value="취소" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
        </td>
      </tr>
    </table>
    <!--  </form>-->
  </div>
  </div>
</body>
</html>
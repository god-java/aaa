<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#search_div{width:800px; margin:0 auto; margin-top:100px;}
#search_body{width:90%; margin:10px auto; overflow:hidden;}
#member_info{width:20%; height:100px; float:left; border-bottom:1px solid #D8D8D8;}
#member_profile_img{width:77%; height:100%; border-bottom:1px solid #D8D8D8; }
#member_profile_info{width:60%; height:100px; border-bottom:1px solid #D8D8D8; float:left;}
#follow{width:20%; height:100px; border-bottom:1px solid #D8D8D8; float:left; line-height:100px;}

.follow_btn1{width:40%; height:30px; border:none; background: #6CB33E; outline:none; color:white; border-radius: 5px; cursor:pointer;}
.follow_btn2{width:40%; height:30px; border:none; background: #CD3B3B; outline:none; color:white; border-radius: 5px; cursor:pointer;} 
#search_result{width:100%; text-align:center; font-size: 2em; margin-top:100px;}
</style>
</head>
<body>
<c:if test="${member_num==null }">
	<script type="text/javascript">
		alert("잘못된 접근입니다")
		location.href="main"
	</script>
</c:if>

<!-- 팔로우 했을때 #BC2424-->
	<div id="search_result">
	"<span style="font-weight:bolder; font-size:1.5em;">${nickName }</span>"의 검색 결과
	</div>
	<div id="search_div">
		<div id="search_body">
		 <c:if test="${mlist.size()!=0 }">
		<c:forEach var="mlist" items="${mlist }">
			<div id="member_info">
				<div id="member_profile_img">
					<a href="history?member_num=${mlist.member_num }">
						<img src="resources/profile_img/${mlist.profile_img }" style="width:90%; height:90%; margin-left:5%; margin-top:5%; border-radius: 100%;">
					</a>
				</div>
			</div>
			<div id="member_profile_info">
					<span style="font-size:2em; font-weight:bolder; margin-top:5px;">${mlist.nickName }</span><br><br>
					<span style="">안녕하세요 ㅎㅎ</span>
			</div>
			<div id="follow">
				<c:if test="${mlist.follow == 'follow' }">
					<button id="follow_btn2${mlist.member_num }" class="follow_btn2" param="${mlist.member_num }">팔로잉</button>
					<button id="follow_btn1${mlist.member_num }" class="follow_btn1" param="${mlist.member_num }" style="display:none;">팔로우</button>
				</c:if>
				<c:if test="${mlist.follow != 'follow' && mlist.member_num != member_num}">
					<button id="follow_btn1${mlist.member_num }" class="follow_btn1" param="${mlist.member_num }">팔로우</button>
					<button id="follow_btn2${mlist.member_num }" class="follow_btn2" param="${mlist.member_num }" style="display:none;">팔로잉</button>
				</c:if>
				<c:if test="${mlist.member_num == member_num }">
					나당
				</c:if>
			</div>
			
			<script type="text/javascript">
				$(document).ready(function(){
					$(document).on('click','#follow_btn1'+${mlist.member_num },function(){
						
						$("#follow_btn1"+${mlist.member_num}).hide()
						$("#follow_btn2"+${mlist.member_num}).fadeIn()
						
						var follower_num = ${member_num}
						var followee_num = ${mlist.member_num}
						 $.ajax({
							url : 'clickFollow',
							type : 'get',
							data : {'follower_num' : follower_num,
									'followee_num' : followee_num
									},
							success : function(data){
								var res = data
							}
							
						}) 
					})

					$(document).on('click','#follow_btn2'+${mlist.member_num },function(){
						
						$("#follow_btn2"+${mlist.member_num}).hide()
						$("#follow_btn1"+${mlist.member_num}).fadeIn()
						
						var follower_num = ${member_num}
						var followee_num = ${mlist.member_num}
						 $.ajax({
							url : 'clickUnFollow',
							type : 'get',
							data : {'follower_num' : follower_num,
									'followee_num' : followee_num
									},
							success : function(data){
								var res = data
							}
							
						}) 
					})		
				})
			</script>
							

		</c:forEach>
		</c:if>
		<c:if test="${mlist.size()==0 }">
			<div style="width:100%; text-align:center; font-size:1.5em;">
				<img src="resources/검색결과(없음) 아이콘(수정본).jpg" style="width:80%; height:200px;">
			</div>
		</c:if>
		</div>
	</div>
</body>
</html>
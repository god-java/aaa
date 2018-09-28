<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#history{width:800px; margin:100px auto; background:white;}
#writer{width:100%; height:50px; border:1px solid #D8D8D8; line-height:50px;}
#writer_img{width:10%; height:100%; float:left;}
#writer_name{width:90%; height:100%; float:left;}
#image{width:100%; border:1px solid #D8D8D8;}
#like{width:100%; height:40px; border:1px solid #D8D8D8;}
#content{width:100%; height:80px; border:1px solid #D8D8D8;}
#comment_list{width:100%; height:100px; border:1px solid #D8D8D8;}
#comment_div{width:100%; height:40px; border:1px solid #D8D8D8;}
.comment{width:80%; border:none; outline:none; height:90%; margin-left:2%;}
</style>
</head>
<body>



<!-- Best3 - List -->
<c:set var="i" value="0"/>
<div style="position: fixed; width:350px; border-bottom:1px solid gray; border-left:1px solid gray; left:5%; top:15%; border-radius:10px; box-shadow:-5px 5px 20px 1px gray;">
<img src="resources/icon/Top 3.png" style="position:absolute; width:150px; height:50px; left:27%; top:-40px;">
<c:forEach var="bestList" items="${bestList }">
	<c:if test="${i!=2 }">
		<div style="width:100%; height:150px; border-bottom:1px solid #D8D8D8;">
			<div style="width:50%; height:100%; float:left;">
				<a href="historyInfo?member_num=${bestList.member_num }&history_num=${bestList.history_num }">
					<img src="resources/history_upload_file/${bestList.file_name }" style="width:90%; height:90%; border-radius:10px; margin-top:5%; margin-left:5%;">
				</a>
				<c:if test="${i==0 }">
					<img src="resources/icon/GoldMedal.png" style="position: absolute; z-index:2; width:40px; height:40px; left:-30px;">
				</c:if>
				<c:if test="${i==1 }">
					<img src="resources/icon/SilverMedal.png" style="position: absolute; z-index:2; width:40px; height:40px; left:-30px;">
				</c:if>
			</div>
			<div style="width:50%; height:100%; float:left;">
				<div style=" width:30%; height:33.3%; float:left;">
				<a href="history?member_num=${bestList.member_num }">
					<img src="resources/profile_img/${bestList.profile_img }" style="width:80%; height:80%; border-radius:100%; margin-top:15%;">
				</a>
				</div>
				<div style="width:70%; height:33.3%; float:left; line-height:50px;">
				<a href="history?member_num=${bestList.member_num }">
					<span style="font-weight:bold;">${bestList.nickName }(${bestList.name })</span>
				</a>
				</div>
				
				<div style=" width:100%; height:33.3%; float:left; line-height:50px;">
					<span>좋아요 : </span><span style="font-weight:bold;">${bestList.strLike_count }</span>
				</div>
				<div style=" width:100%; height:33.3%; float:left; line-height:50px;">
					<span style="font-weight:bold;">${bestList.write_date }</span>
				</div>
			</div>
			
		</div>
	</c:if>
	<c:if test="${i==2 }">
		<div style="width:100%; height:150px;">
			<div style="width:50%; height:100%; float:left;">
				<a href="historyInfo?member_num=${bestList.member_num }&history_num=${bestList.history_num }">
					<img src="resources/history_upload_file/${bestList.file_name }" style="width:90%; height:90%; border-radius:10px; margin-top:5%; margin-left:5%;">
				</a>
				<c:if test="${i==2 }">
					<img src="resources/icon/BronzeMedal.png" style="position: absolute; z-index:2; width:40px; height:40px; left:-30px;">
				</c:if>

			</div>
			<div style="width:50%; height:100%; float:left;">
				<div style=" width:30%; height:33.3%; float:left;">
				<a href="history?member_num=${bestList.member_num }">
					<img src="resources/profile_img/${bestList.profile_img }" style="width:80%; height:80%; border-radius:100%; margin-top:15%;">
				</a>
				</div>
				<div style="width:70%; height:33.3%; float:left; line-height:50px;">
				<a href="history?member_num=${bestList.member_num }">
					<span style="font-weight:bold;">${bestList.nickName }(${bestList.name })</span>
				</a>
				</div>
				
				<div style=" width:100%; height:33.3%; float:left; line-height:50px;">
					<span>좋아요 : </span><span style="font-weight:bold;">${bestList.strLike_count }</span>
				</div>
				<div style=" width:100%; height:33.3%; float:left; line-height:50px;">
					<span style="font-weight:bold;">${bestList.write_date }</span>
				</div>
			</div>
			
		</div>
	</c:if>
	<c:set var="i" value="${i+1 }"/>
</c:forEach>
</div>











<c:if test="${member_num==null }">
	<script type="text/javascript">
		alert("잘못된 접근입니다")
		location.href="main"
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	var member_num = ${member_num}
	var history_num = 0
	$("#like_img_no").click(function(){
		history_num = $(this).attr("param")
		/*  $.ajax({
			 url : 'clickLike',
			 data : {'member_num' : member_num,
			 		'history_num' : history_num},
			 type : 'get',
			 success : function(data){
			 	var res = data
			 	alert("성공")
			 }
			 }) 		 */
	})
	$("#like_img_yes").click(function(){
		history_num = $(this).attr("param")
		alert(history_num)
		 $.ajax({
			 url : 'clickLikeCancel',
			 data : {'member_num' : member_num,
			 		'history_num' : history_num},
			 type : 'get',
			 success : function(data){
			 	var res = data
			 	alert("성공")
			 }
			 }) 

		
	})
})
</script>

<script type="text/javascript">
$(document).ready(function(){
	var start_row=6
	var end_row=10
	var limit_scroll = 2000
	$(window).scroll(function(){
		var sc_top = $(document).scrollTop()
		if(sc_top>limit_scroll){
			$.ajax({
				url : 'allHistory_add',
				data : {'start_row' : start_row,
						'end_row' : end_row
						},
				dataType : 'json',
				type : 'get',
				success : function(data){
					var hlist = data.hlist
					$.each(hlist,function(i){
						var allHistory_html = ""
						allHistory_html +="<div id='history' style='width:800px; margin:100px auto; background:white;'>"
						allHistory_html +=	"<div id='writer' style='width:100%; height:50px; border:1px solid #D8D8D8; line-height:50px;'>"
						allHistory_html +=		"<div id='writer_img' style='width:10%; height:100%; float:left;'>"
						allHistory_html +=			
						allHistory_html +=		"</div>"
						allHistory_html +=		"<div id='writer_name' style='width:90%; height:100%; float:left;'>"
						allHistory_html +=
						allHistory_html +=		"</div>"
						allHistory_html +=	"</div>"
						allHistory_html +=	"<div id='image' style='width:100%; border:1px solid #D8D8D8;'>"
						allHistory_html +=
						allHistory_html +=
						allHistory_html +="</div>"
						/* $("body").append(allHistory_html) 
						$("body").append($("#add").html()) */
					})
					limit_scroll += 3000
				}
			})
		}
	})
})
</script>
<div id="add">
	<c:forEach var="hlist" items="${hlist }">
	<div id="history">
		<div id="writer">
			<div id="writer_img">
				<img src="resources/profile_img/${hlist.profile_img }" style="width:40px; height:40px; margin-left:5px; margin-top:5px; border-radius: 100%;">
			</div>
			<div id="writer_name">
				<span style="font-size:1.2em; font-weight:bolder;"><a href="history?member_num=${hlist.member_num }">${hlist.nickName }</a></span>
			</div>
		</div>
		<div id="image">
			<c:choose>
				<c:when test="${hlist.extension=='wmv' || hlist.extension=='mp4' || hlist.extension=='avi'}">
				<span style="">
					<video src="resources/history_upload_file/${hlist.history_main_file }" width="100%" height="400" controls style=""></video>
				</span>
				</c:when>
				<c:otherwise>
					<img src="resources/history_upload_file/${hlist.history_main_file }" style="width:100%;">
				</c:otherwise>
			</c:choose>
		</div>
		<div id="like">
			<div style="width:50px;height:100%; display:inline-block;">
				<c:if test="${hlist.like=='push' }">
					<img src="resources/icon/좋아요 아이콘 2.jpg" id="like_img_yes" class="like_img_yes${hlist.history_num }" param="${hlist.history_num }" style="width:100%; height:100%; cursor:pointer;">
					<img src="resources/icon/좋아요 아이콘 1 (2).jpg" class="like_img_no${hlist.history_num }" param="${hlist.history_num }" style="display:none; width:100%; height:100%; cursor:pointer;">
				</c:if>
				<c:if test="${hlist.like!='push' }">
					<img src="resources/icon/좋아요 아이콘 1 (2).jpg" id="like_img_no" class="like_img_no${hlist.history_num }" param="${hlist.history_num }" style="width:100%; height:100%; cursor:pointer;">
					<img src="resources/icon/좋아요 아이콘 2.jpg" class="like_img_yes${hlist.history_num }" param="${hlist.history_num }" style="display:none; width:100%; height:100%; cursor:pointer;">
				</c:if>
			</div>
			<div style="width:50px; height:100%; display:inline-block;">
				<img src="resources/icon/Talk2.jpg" class="comment_img${hlist.history_num }" style="width:100%; height:100%; cursor:pointer;">
			</div>
		</div>
		<div id="content">
			<span style="margin-left:1%;">
				<a href="history?member_num=${hlist.member_num}" style="font-weight:bold;">${hlist.nickName }</a> ${hlist.history_content }
			</span>
		</div>
		<div id="comment_list${hlist.history_num }" style=" width:100%; height:100px; border:1px solid #D8D8D8; overflow-y:scroll;">
			<c:forEach var="clist" items="${clist }">
				<c:if test="${hlist.history_num==clist.history_num }">
				<div style=" height:auto; overflow: hidden;">
						<div style="width:5%; float:left; height:35px; line-height:35px; ">
							<img src="resources/profile_img/${clist.profile_img }" style="margin:5px auto; margin-left:5px; width:30px; height:30px; border-radius:100%;">
						</div>
						<div style="width:10%; height:35px; line-height:35px; float:left; text-align:center;">
							<span style="font-weight:bold"><a href="history?member_num=${clist.member_num}">${clist.nickName }</a></span>
						</div>
						<div style="width:84.1%; line-height:35px; float:left;">
							<span>${clist.comment_content }</span>	
						</div>
						
				</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="comment_div">
			<input type="text" id="comment${hlist.history_num }" class="comment" placeholder="댓글달기">
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on('click','.like_img_no'+${hlist.history_num},function(){
				alert("!!!")
				$(".like_img_no"+${hlist.history_num}).hide()
				$(".like_img_yes"+${hlist.history_num}).fadeIn()
				
				
				$.ajax({
					 url : 'clickLike',
					 data : {'member_num' : ${member_num},
					 		'history_num' : ${hlist.history_num},
					 		'sender_num' : ${member_num},
							'receiver_num' : ${hlist.member_num},
							'type' : '1'
							},
					 type : 'get',
					 success : function(data){
					 	var res = data
					 },
					 error : function(error){
						 alert("error")
					 }
					 }) 

			})
			$(document).on('click','.like_img_yes'+${hlist.history_num},function(){
				$(".like_img_yes"+${hlist.history_num}).hide()
				$(".like_img_no"+${hlist.history_num}).fadeIn()
				
				
				$.ajax({
					 url : 'clickLikeCancel',
					 data : {'member_num' : ${member_num},
					 		'history_num' : ${hlist.history_num}},
					 type : 'get',
					 success : function(data){
					 	var res = data
					 }
					 }) 

			})
			
			$(document).on('click', '.comment_img'+${hlist.history_num}, function(){
				$("#comment"+${hlist.history_num}).focus()
			})
			
			
			$(document).on('keydown', '#comment'+${hlist.history_num}, function(e){
				if(e.keyCode=='13'){
					var history_num = ${hlist.history_num}
					var comment_content = $("#comment"+history_num).val()
					$.ajax({
						url : 'commentWriteOk',
						type : 'get',
						dataType : 'json',
						contentType : 'application/json;charset=UTF-8',
						data : {'member_num' : ${member_num},
								'history_num' :	history_num,
								'comment_content' : comment_content,
								'sender_num' : ${member_num},
								'receiver_num' : ${hlist.member_num},
								'type' : '2'
						},
						success : function(data){
							var res=data.clist
							var html=""
							$("#comment"+history_num).val("")
							$("#comment_list"+history_num).html("")
							$.each(res,function(i){
								html="<div style='height:auto; overflow:hidden;'>"
								html+="<div style='width:5%; float:left; height:35px; line-height:35px;'>"
								html+="<img src='resources/profile_img/"+res[i].profile_img+"'"
								html+="style=' margin:5px auto; margin-left:5px; width:30px; height:30px; border-radius:100%;'></div>"
								html+="<div style='width:10%; height:35px; line-height:35px; float:left; text-align:center;'>"
								html+="<span style='font-weight:bold'><a href='history?member_num="+res[i].member_num+"'>"+res[i].nickName+"</a></span></div>"
								html+="<div style='width:84.1%; line-height:35px; float:left;'>"
								html+="<span>"+res[i].comment_content+"</span></div></div>"
								$("#comment_list"+history_num).append(html)
								
							})
							
						},
						error : function(error){
							alert("실패 ㅠ")
						}
					})
				}
			})
		})
	</script>
	</c:forEach>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

  <!-- <script>
    $(document).ready(function(){
      $('.slider').bxSlider({
    	  slideWidth : '500px',
    	 adaptiveHeight: true
      });
    });
  </script> -->
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click','body',function(){
	 		/* $("#history_view").fadeOut() */
	})
})
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#file").change(function(){
		var file = URL.createObjectURL(event.target.files[0])
		$("#profile_img_view").html("<img src='"+file+"' style='width:70%; height:100%; min-height:100%; max-height:100%;'>")
	})
	$("#profile_img").click(function(){
		var maskWidth = $(document).width()
 		var maskHeight = $(document).height()
 		$("#mask").css({'width':maskWidth,'height':maskHeight})
 		$("#mask").fadeTo('slow',0.5)
		$("#profile_img_add_div").fadeIn()
	})
	
	$("#profile_img_upload_cancel").click(function(){
		$("#mask").hide()
		$("#profile_img_add_div").hide()
	})

 	$("#history_cancel").click(function(){
 		$("#mask").hide()
		$("#history_write").hide()
 	})
 	var num=1;
  	
 	$(document).on("click",".file2", function(){
 		var param = $(this).attr("param")
 		if($("#file2"+param).val()!=""){
 			$(this).parent().remove()
 			return false
 		}
 	})
 	$(document).on("click","#file2_main_img", function(){
 		if($("#file2_main").val()!=""){
 			$("#file2_main_div").remove()
 			return false
 		}
 	})
  	/* var main_html="<div id='file2_main_div' style='width:100px; height:100px; display:inline-block; margin-left:6px; margin-top:5px;'>"
 		main_html+="<input type='file' id='file2_main' name='file2' style='position: absolute; clip:rect(0,0,0,0);'>"
 		main_html+="<label for='file2_main' style='width:100%; height:100%; display:inline-block; cursor:pointer; border:1px solid #EAEAEA; text-align:center; line-height:100px;'>"
 		main_html+="사진 올리기+"
 		main_html+="</label></div>"
 	$("#history_write_img_top").html(main_html) */
 	 
 	$(document).on('click', '#history_info_share', function(){		
		var maskWidth = $(document).width()
		var maskHeight = $(document).height()
		$("#mask2").css({'width':maskWidth,'height':maskHeight,'z-index':'9992'})
		$("#mask2").fadeTo('slow',0.5)
		$("#share_div").show()		
	})
				
	$(document).on('click', '#share_cancel_btn', function(){
		$("#share_div").hide()		
		$("#mask2").fadeOut()
		$("#share_history_content").val("")
	})
 	
 	$(document).on("change", ".file2", function(){
 		var img_view = URL.createObjectURL(event.target.files[0])
 		var param = $(this).attr("param")
 		var html="<div id='file2"+num+"_div' style='width:100px; height:100px;  display:inline-block; margin-left:5px; margin-top:5px;'>"
 		 	html+="<input type='file' name='file2' class='file2' id='file2"+num+"' param='"+num+"' style='position: absolute; clip:rect(0,0,0,0);'>"
 		 	html+="<label id='file2"+num+"_label' for='file2"+num+"' style='width:100%; height:100%; display:inline-block; border:1px solid #EAEAEA; text-align:center; line-height:100px; cursor:pointer;'>사진 올리기+</label></div>"
 	 		$("#file2"+param+"_label").html("<img src='"+img_view+"' style='width:100%; height:100%;'>")
 		 	num++
 		$("#history_write_img_top").append(html)
 		
 	})
 	$(document).on("change", "#file2_main", function(){
 		var img_view = URL.createObjectURL(event.target.files[0])
 		var html="<div id='file2"+num+"_div' style='width:100px; height:100px;  display:inline-block; margin-top:5px;'>"
 		 	html+="<input type='file' name='file2' class='file2' id='file2"+num+"' param='"+num+"' style='position: absolute; clip:rect(0,0,0,0);'>"
 		 	html+="<label id='file2"+num+"_label' for='file2"+num+"' style='width:100%; height:100%; display:inline-block; border:1px solid #EAEAEA; text-align:center; line-height:100px; cursor:pointer;'>사진 올리기+</label></div>"
 		 	$(this).parent().html("<img src='"+img_view+"' id='file2_main_img' style='width:100%; height:100%;'>")
 		 	$("#history_write_img_top").append(html)
 			num++;
 	})
 	$(document).on('click','#history_submit', function(){
 		$("#histroty_f").submit()
 	})
 	var limit=0;
 	$(document).on('click','#add_btn', function(){
 		if(limit==0){
 		var html="<div id='file2"+num+"_div' style='width:100px; height:100px;  display:inline-block; margin-top:5px;'>"
 		 	html+="<input type='file' name='file2' class='file2' id='file2"+num+"' param='"+num+"' style='position: absolute; clip:rect(0,0,0,0);'>"
 		 	html+="<label id='file2"+num+"_label' for='file2"+num+"' style='width:100%; height:100%; display:inline-block; border:1px solid #EAEAEA; text-align:center; line-height:100px; cursor:pointer;'>사진 올리기+</label></div>"
 		 	$("#history_write_img_top").append(html)
 			num++;
 		 	limit++;
 		}
 	})
	
})
</script>

<style type="text/css">
/* div{border:1px solid gray;}
 */#history{width:1260px; border-bottom:1px solid #D8D8D8;}
#history_top{width:100%; height:300px;}
#profile_img{width:250px; height:250px; border:1px solid gray; border-radius:250px; position: relative;
left:80px; top:130px;  cursor:pointer;}
#history_info{width:71%; float:right; height:150px; position: relative; top:-110px;}
#follow_btn{-webkit-transition-duration:0.5s; width:100px; height:30px; border:1px solid black;
 background:white; border-radius: 5px; cursor:pointer; outline:none; margin-left:10px; position: relative;
 top:-5px;}
#follow_btn:hover{background:#EAEAEA; coler:gray; border-color: gray;}
#share_btn, #share_cancel_btn{width:100px; height:30px; background:white; border:1px solid black; outline:none; margin-top:5%;
 border-radius:5px; cursor:pointer; -webkit-transition-duration:0.5s;}



#profile_img_add_div{width:50%; height:70%; border:1px solid gray; position:fixed; left:25%; top:15%; display:none; z-index:9991; background:white;}
#profile_img_add_top{width:100%; height:30px; text-align:center; line-height:30px; border-bottom:1px solid #D8D8D8;}
#profile_img_file_div{width:50%; height:50px; float:left; text-align:center;
line-height:50px;}
#file{position: absolute; clip: rect(0,0,0,0);}
#file_label{width:100%; height:100%; border-right:1px solid #D8D8D8; display: inline-block; curoser:pointer;}
#file_delete{width:100%; height:100%; background:white; outline:none; border:none; border-left:1px solid #D8D8D8;}
#profile_img_file_delete{width:50%; height:50px; text-align:center; float:left; curoser:pointer;
 line-height:50px;}
#profile_img_view{width:100%; text-align:center; height:350px; margin-top:50px;}
#profile_img_btn_div{text-align:center; width:100%; margin-top:15px; height:10%;}
#profile_img_upload_submit,#profile_img_upload_cancel{-webkit-transition-duration:0.5s; width:100px; height:30px; border:1px solid black;
 background:white; border-radius: 5px; cursor:pointer; outline:none; margin-left:10px; position: relative;
 top:-5px;}
 
 
 
 
 #history_write{display:none; width:50%; height:70%; border:1px solid gray; position:fixed; left:25%; top:15%; background:white; z-index:9991;}
 #history_write_img_add{width:60%; height:100%; display:inline-block; float:left;}
 #history_write_form{width:40%; height:100%; display:inline-block; float:left;}
 #history_write_form_header{width:100%; height:20%; float:left; border-left:1px solid gray;}
 #history_write_form_top{width:100%; height:65%; border-left:1px solid gray; display: inline-block; float:left;}
 #history_write_form_bottom{width:100%; height:15%; border-left:1px solid gray; border-top:1px solid gray; display: inline-block; float:left;}
 #history_write_img_top{width:100%; height:90%; overflow-y:scroll; }
 #history_write_img_bottom{width:100%; height:10%;}
 #history_cancel, #history_submit{width:100px; height:30px; background:white; border:1px solid black; outline:none; margin-top:3%;
 border-radius:5px; cursor:pointer; -webkit-transition-duration:0.5s; margin-top:10%;}
 #history_submit{margin-left:22%;}
 #history_cancel{margin-left:3%;}
#history_submit:hover{background:#EAEAEA; color:gray;}
#history_cancel:hover{background:#EAEAEA; color:gray;}
#history_write_ta{width:90%; height:90%; margin-top:5%; margin-left:5%; outline:none; border-radius: 5px;}
#share_history_content{width:90%; height:90%; margin-top:2%; margin-left:4%; outline:none; border-radius: 5px;}
#my_history_img_body{width:100%; border-top:1px solid #D8D8D8; margin-top:100px;}
#my_history_img{-webkit-transition-duration:0.5s; cursor:pointer; margin:0.78% 0.78%; width:23%; height:289.8px; display:inline-block; background:black;}
#my_history_img_view:hover{opacity: 0.7;}




#history_view{display:none; width:50%; height:70%; border:1px solid gray; position:fixed; left:25%; top:15%; background:white; z-index:9991;}
#history_view_file{width:60%; height:100%; display:inline-block; float:left;}
.slider{width:100%; height:100%;}
#history_info_body{width:40%; height:100%; display:inline-block; }
#history_info_header{width:100%; height:10%; float:left; line-height:20%;}
#history_info_addr{width:100%; height:5%; float:left; line-height:20%;}
#history_info_center{width:100%; height:55%; overflow-y:scroll;}
#history_info_bottom{width:100%; height:25%;}
#history_info_content{width:100%; height:200px;}
#history_info_hash_tag{width:100%; height:50px;}
#history_info_comment_list{width:100%;}
#history_info_bottom_body{width:90%; height:100%; border-top:1px solid #D8D8D8; margin:5% auto;}
#history_info_bottom_body_top{width:100%; height:70%; }
#history_info_bottom_body_bottom{width:100%; height:30%;}
#comment_content{width:100%; height:100%; border:none; outline:none;}
#history_info_like_comment{width:100%; height:50%; }
#history_info_like_count{width:100%; height:48%;}
#history_info_like{width:20%; height:100%; display:inline-block;}
#history_info_comment{width:20%; height:100%; display:inline-block;}
#history_info_share{width:20%; height:100%; display:inline-block;}
#history_info_addr_text:hover{color:gray;}


.follow_btn1{width:10%; height:30px; border:none; background: #6CB33E; outline:none; color:white; border-radius: 5px; cursor:pointer;}
.follow_btn2{width:10%; height:30px; border:none; background: #CD3B3B; outline:none; color:white; border-radius: 5px; cursor:pointer;}

.note_send{width:10%; height:30px; background: white; border:1px solid gray; outline:none; border-radius: 5px; cursor:pointer;}
#history_send_note_mask{position: absolute; left:0; top:0; background:black; z-index:9902; display:none;}

</style>
</head>
<body>
<div id="history_send_note_mask"></div>
<script type="text/javascript">
$(document).ready(function(){
	
	$(document).on('click','.note_send',function(){
		var width = $(document).width()
		var height = $(document).height()
		$("#send_note_div").fadeIn()
		$("#history_send_note_mask").css({'width': width, 'height': height})
		$("#history_send_note_mask").fadeTo('slow',0.5)
	})
	
	$(document).on('click','#history_send_note_mask',function(){
		$("#send_note_div").hide()
		$("#history_send_note_mask").hide()
	})
	
	$(document).on('keydown','#send_note_input', function(evt){
		if(evt.keyCode=='13'){
			alert(${mdto.member_num})
			$.ajax({
				url : 'note_reply',
				type : 'get',
				data : {'receiver_num' : ${mdto.member_num},		//ㅇㅇ
						'sender_num' : ${member_num},				//ㅇㅇ
						'note_content' : $("#reply_input").val()
						},
				success : function(data){
					var res = data
					alert()
					if(res==1){
						alert("메시지 전송 완료")
						$("#note_reply_mask").hide()
						$("#reply_div").hide()
						/* var sock = new WebSocket("ws://192.168.51.99:8080/level/echo-ws")
						sock.onopen=function(){
							sock.send("note/"+sender_num)
						} */
					}
				},
				error : function(a){
					alert("error...")
				}
			})
		}
	})
})

</script>
<!-- 쪽지 답장 -->
<script type="text/javascript">
	
</script>
<div id="send_note_div" style="width:30%; height:300px; z-index:9910; position:fixed; left:35%; top:25%; display:none; background:white; border:1px solid gray;">
	<div style="width:100%; height:270px; border-bottom:1px solid #D8D8D8;">
	
	</div>
	<div style="width:100%; height:30px;">
		<input type="text" id="send_note_input" placeholder="메시지 입력..." style="width:99.9%; height:25px; border:none; outline:none;">
	</div>	
</div>
<!-- 쪽지 답장 끝 -->







	<div id="mask" style="position: absolute; left:0; top:0; z-index: 9000; background:black; display:none;"></div>
	<div id="mask2" style="position: absolute; left:0; top:0; z-index: 9000; background:black; display:none;"></div>
	<div id="profile_img_add_div">
		<form action="profile_img_update" method="post" enctype="multipart/form-data">
			<div id="profile_img_add_top">
				<span>프로필 사진 업로드</span>
			</div>
			<div id="profile_img_file_div" style="">
				<label id="file_label" for="file">사진 올리기</label>
		 		<input type="file" id="file" name="file">
		 	</div>
			<div id="profile_img_file_delete">
		 		<input type="button" id="file_delete" value="삭제하기">
			</div>
			<div id="profile_img_view">
				
			</div>
			<div id="profile_img_btn_div">
				<input type="submit" value="업로드" id="profile_img_upload_submit">
				<input type="button" value="취소" id="profile_img_upload_cancel">
			</div>
			<input type="hidden" name="member_num" value="${member_num }">
		</form>
	</div>

<!-- if write button click DDAN -->

<form id="histroty_f" action="historyWriteOk" method="post" enctype="multipart/form-data">
	<div id="history_write">
		<div id="history_write_img_add">
			<div id="history_write_img_top">
			</div>
			<div id="history_write_img_bottom">
				<input type="button" value="사진/동영상" id="add_btn">
			</div>
		</div>
		<div id="history_write_form">
			<div id="history_write_form_header">
				<img src="resources/logo/로고.jpg" style="width:90%; height:90%; margin-top:5%; margin-left:5%;">
			</div>
			<div id="history_write_form_top">
				<textarea id="history_write_ta" name="history_content"></textarea>
			</div>
			<div id="history_write_form_bottom">
				<input type="submit" value="작성" id="history_submit">
				<input type="button" value="취소" id="history_cancel">
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
$(document).ready(function(){
	$("#file2_div3").click(function(){
	})
})
</script>





<script type="text/javascript">
				$(document).ready(function(){
					$(document).on('click','#follow_btn1',function(){
						
						$("#follow_btn1").hide()
						$("#follow_btn2").fadeIn()
						
						var follower_num = ${member_num}
						var followee_num = ${mdto.member_num}
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

					$(document).on('click','#follow_btn2',function(){
						
						$("#follow_btn2").hide()
						$("#follow_btn1").fadeIn()
						
						var follower_num = ${member_num}
						var followee_num = ${mdto.member_num}
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


	<div id="history">
		<div id="history_top">
			<div id="profile_img">
				<img src="resources/profile_img/${mdto.profile_img }" style="width:100%; height:100%; border-radius: 250px;">
			</div>
			<div id="history_info">
			
				<span style="font-size:30px;">${mdto.nickName }</span>
				<c:if test="${mdto.follow=='follow' }">
					<button id="follow_btn2" class="follow_btn2">팔로잉</button>
					<button id="follow_btn1" class="follow_btn1" style="display:none;">팔로우</button>
				</c:if>
				<c:if test="${mdto.follow!='follow' }">
					<button id="follow_btn2" class="follow_btn2" style="display:none;">팔로잉</button>
					<button id="follow_btn1" class="follow_btn1">팔로우</button>
				</c:if>
					<button id="note_send" class="note_send" style="">쪽지 보내기</button><br><br>			
				<span>게시물 ${mdto.history_qtt }</span>
				<span id="follower" style="margin-left:5%; cursor:pointer;">팔로워 ${mdto.follow_qtt }</span>
				<span id="following" style="margin-left:5%; cursor:pointer;">팔로잉 ${mdto.following_qtt }</span><br><br>
				<span style="font-weight:bold;">${mdto.name }</span><br><br>
				<span>안녕하세용 ㅎㅎ</span>
			</div>
		</div>
	</div>
	









<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click', '#mask',function(){
		$("#history_view").hide()
		$("#mask").hide()
		$("#history_info_header").html("")
		$("#history_info_content").html("")
		$("#history_info_comment_list").html("")
		$("#history_info_like_count").html("")
		$("#history_info_like").html("")
		$(".slider").html("<img src='resources/icon/left 2.png' id='file_prev' style='position: absolute; top:45%; left:1.5%; font-size:40px; width:30px; height:30px; cursor:pointer; display:none;'>")
		$("#profile_img_add_div").hide()
		$("#history_write").hide()
		$("#following_div").hide()
		$("#following_list").html("")
		$("#follower_div").hide()
		$("#follower_list").html("")
	})
	
	$(document).on('click', '#mask2',function(){
		$("#share_div").hide()		
		$("#mask2").hide()
		$("#share_history_content").val("")
	})
})
</script>







<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click','#my_history_img_view',function(){
 		var maskWidth = $(document).width()
 		var maskHeight = $(document).height()
 		$("#mask").css({'width':maskWidth,'height':maskHeight})
 		$("#mask").fadeTo('slow',0.5)
		var history_num = $(this).attr("param")
		var file_length = 0;
 		$.ajax({
			url : 'history_view',
			type : 'get',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			data : {'history_num' : history_num,
					'member_num' : ${member_num}	
			},
		
			success : function(data){
				var like_count = data.like_count
				var write_date = data.write_date
				var like_check = data.like_check
				var owner_num = data.owner_num
				var res = data.clist
				var x_pos = data.x_pos
				var y_pos = data.y_pos
				var history_addra = data.history_addr

				$("#history_info_addr_text").html(history_addra) 
				var like_push_html = "<img src='resources/icon/좋아요 아이콘 2.jpg' id='like_push' style='width:80%; height:80%; cursor:pointer;'>"
				var like_not_push_html = "<img src='resources/icon/좋아요 아이콘 1 (2).jpg' id='like_not_push' style='width:80%; height:80%; cursor:pointer;'>"
				
				
				
				var history_addr_html = "<div id='history_view_map' style='width:300px; height:250px; border:1px solid gray; position:relative; z-index:9999; background:white; top:20%; left:-1000%'>"
				var swit=0
				$(document).on('click','#history_info_addr_text',function(){
					if(swit==0){
						$("#history_view_map").animate({left:'0%'},0)
						swit=1
					}else{
						$("#history_view_map").animate({left:'-1000%'},0)
						swit=0
					}
				})
	
					
				history_addr_html += "</div>"
					
				history_addr_html += "<script type='text/javascript' "+"src='//dapi.kakao.com/v2/maps/sdk.js"+"?appkey=82d3c834eb2e51a75bf8c037ad61a3e7"+"'></sc"+"ript>"
				history_addr_html +="<script>"
				history_addr_html += "var markerPosition  = new daum.maps.LatLng("+y_pos+", "+x_pos+");" 

				history_addr_html += "var marker = {position: markerPosition};var staticMapContainer  = document.getElementById('history_view_map')," 
				history_addr_html += "staticMapOption = {center: new daum.maps.LatLng("+y_pos+", "+x_pos+"),level: 3,marker: marker};"    
				history_addr_html += "var history_view_map = new daum.maps.StaticMap(staticMapContainer, staticMapOption);"
				$("#history_info_addr").append(history_addr_html)				
				
				if(like_check=="push"){
					like_not_push_html="<img src='resources/icon/좋아요 아이콘 1 (2).jpg' id='like_not_push' style='width:80%; height:80%; cursor:pointer; display:none;'>"
					$("#history_info_like").append(like_push_html)
					$("#history_info_like").append(like_not_push_html)
				}else{
					like_push_html = "<img src='resources/icon/좋아요 아이콘 2.jpg' id='like_push' style='width:80%; height:80%; cursor:pointer; display:none;'>"
					$("#history_info_like").append(like_not_push_html)
					$("#history_info_like").append(like_push_html)
				}
				
				$(document).on('click','#like_push',function(){
					$("#like_push").hide()
					$("#like_not_push").fadeIn()
					
					$.ajax({
						url : 'clickLikeCancel',
						type : 'get',
						data : {'history_num' : history_num,
								'member_num' : ${member_num}
						},
						dataType : 'json',
						success : function(data){
								var like_count = data.like_count
								$("#history_info_like_count").html("")
								var like_count_html = "<span style='font-size:1.2em; font-weight:bold'>좋아요 "+like_count+"개</span>"
								like_count_html += "<br><sapn style='font-size:0.9em;'>"+write_date+"</span>"
								$("#history_info_like_count").append(like_count_html)
						}
					})
				})
				
				$(document).on('click','#like_not_push',function(){
					$("#like_not_push").hide()
					$("#like_push").fadeIn()
					$.ajax({
						url : 'clickLike',
						type : 'get',
						data : {'history_num' : history_num,
								'member_num' : ${member_num},
								'receiver_num' : owner_num,
								'sender_num' : ${member_num},
								'type' : 1
						},
						dataType : 'json',
						success : function(data){
							var like_count = data.like_count
							$("#history_info_like_count").html("")
							var like_count_html = "<span style='font-size:1.2em; font-weight:bold'>좋아요 "+like_count+"개</span>"
							like_count_html += "<br><span style='font-size:0.9em;'>"+write_date+"</span>"
							$("#history_info_like_count").append(like_count_html)
						}
					})
				})
				
				$(document).on('click', '#share_content_view', function(){
					location.href="history?member_num=" + share_member_num
				})
				
				$(document).on('click', '#share_btn', function(){
 					$.ajax({
 						url : 'historyShareOk',
 						type : 'post',
 						data : { 'member_num' : ${member_num},
 								 'history_content' : $("#share_history_content").val(),
 								 'share_member_num' : owner_num,
 								 'share_history_num' : history_num, 
 						},
 						success : function(data){
 							var res = data
 							alert("공유가 완료되었습니다.")
 							$("#share_div").hide()		
 							$("#mask2").fadeOut()
 							$("#share_history_content").val("")
 							location.href="myHistory?member_num="+${member_num}
 						}
 					})
 				})
				
				var like_count_html = "<span style='font-size:1.2em; font-weight:bold'>좋아요 "+like_count+"개</span>"
				like_count_html += "<br><sapn style='font-size:0.9em;'>"+write_date+"</span>"
				$("#history_info_like_count").append(like_count_html)
				
				
				
				
				var fileName = data.file_name.substring(0,data.file_name.length-1)
				var spFile = fileName.split("/")
				file_length=spFile.length
				if(file_length>1){
					$(".slider").append("<img src='resources/icon/right 2.png' id='file_next' style='position: absolute; top:45%; left:55%; font-size:40px; width:30px; height:30px; cursor:pointer;'>")
				}
				for(var i=0; i<spFile.length; i++){
					if(i==0){
						$(".slider").append("<img src='resources/history_upload_file/"+spFile[i]+"' id='upload_img"+i+"' class='upload_img' param='"+i+"' style='width:100%; height:100%;'>")
					}else{
						$(".slider").append("<img src='resources/history_upload_file/"+spFile[i]+"' id='upload_img"+i+"' class='upload_img' param='"+i+"' style='width:100%; height:100%; display:none;'>")	
					}
				}	
				var profile_img = data.profile_img
				var nickName = data.nickName
				var history_content = data.history_content
				var history_info_header_html="<img src='resources/profile_img/"+profile_img+"'"
				history_info_header_html+="style='width:40px; height:40px; margin:2% 0 0 2%; border-radius:100%;'>"
				history_info_header_html+="<span style='display:inline-block; margin-left:2%; font-weight:bold;"
				history_info_header_html+=" position: relative; top:-15%;'>"+nickName+"</span>"
				$("#history_info_content").html(history_content) 
				
				if(data.share_member_num!=0) { // 공유된 글
					var share_profile_img = data.share_profile_img
					var share_history_num = data.share_history_num
					var share_nickName = data.share_nickName
					var share_member_num = data.share_member_num
					var share_history_content = data.share_history_content
							
					
					
					
					var share_history_html = "<div id='share_content_view' style='z-index:10000; width:90%; height:100px; margin-left:5%; border:1px solid black; background:#f8eec4; margin-top:5px; cursor:pointer;'>" 
						share_history_html +=	"<div id='share_member_info' style='width:100%; height:40%;'>"
						/* share_history_html +=		"<div id='share_member_profile_img' style='width:30%; height:100%;'>" */
						share_history_html +=		"<img src='resources/profile_img/" + share_profile_img + "' style='width:35px; height:35px; border-radius:100%; margin-left:2%; margin-top:2px;'>"
						/* share_history_html +=		"</div>" */
						share_history_html +=		"<span id='share_member_nickName' style='display:inline-block; margin-left:5%; font-weight:bold; position:relative; top:-30%;'>"
						share_history_html +=			share_nickName
						share_history_html +=		"</span>"
						share_history_html +=	"</div>"
						share_history_html +=	"<div id='share_content_info' style='width:100%; height:60%; margin-left:2px; margin-top:2px;'>"
						share_history_html +=		share_history_content
						share_history_html +=	"</div>"
						share_history_html +="</div>"
					
					
					$("#history_info_content").append(share_history_html)
					
					
					
					
				}else{
					var history_share_html = "<div id='history_info_share'>"
						history_share_html +=	"<img src='resources/icon/Talk2.jpg' onclick='share_click()' style='width:80%; height:80%; cursor:pointer;'>"
						history_share_html +="</div>"
					$("#history_info_like_comment").append(history_share_html)	
				}
				
				$("#history_info_header").html(history_info_header_html)
				
				
				// div 추가-----------------------------------------------------------------------------------------------------------------------------------------------------------
				
				var comment_list_html=""
				$.each(res, function(i){
					comment_list_html="<div style='width:100%; height:auto; overflow:hidden'>"
					comment_list_html+="<div style='width:10%; height:35px; line-height:35px; float:left;'><img src='resources/profile_img/"+res[i].profile_img+"'"
					comment_list_html+="style='width:30px; height:30px; margin:2.5px auto; margin-left:5%; border-radius:100%;'></div>"
					comment_list_html+="<div style='width:25%; height:35px; line-height:35px; float:left; text-align:center;'>"
					comment_list_html+="<span style='font-weight:bold;'><a href='history?member_num="+res[i].member_num+"'>"+res[i].nickName+"</a></span>"
					comment_list_html+="</div>"
					comment_list_html+="<div style='width:63%; line-height:35px; float:left;'>"
					comment_list_html+="<span>"+res[i].comment_content+"</span>"
					comment_list_html+="</div>"
					comment_list_html+="</div>"
					$("#history_info_comment_list").append(comment_list_html)

				})
				
				
				$(document).on('keydown','#comment_content',function(e){

					var comment_content=$("#comment_content").val()

					if(e.keyCode=='13'){
						if($("#comment_content").val()!=""){
						$.ajax({
							url : 'commentWriteOk',
							type : 'get',
							dataType : 'json',
							contentType : 'application/json;charset=UTF-8',
							data : {'member_num' : ${member_num},
									'history_num' :	history_num,
									'comment_content' : comment_content,
									'sender_num' : ${member_num},
									'receiver_num' : owner_num,
									'type' : '2'
							},
							success : function(data){
								var res = data.clist
								$("#history_info_comment_list").html("")
								$("#comment_content").val("")
								
								$.each(res, function(i){
									var comment_list_html="<div style='width:100%; height:auto; overflow:hidden'>"
									comment_list_html+="<div style='width:10%; height:35px; line-height:35px; float:left;'><img src='resources/profile_img/"+res[i].profile_img+"'"
									comment_list_html+="style='width:30px; height:30px; margin:2.5px auto; margin-left:5%; border-radius:100%;'></div>"
									comment_list_html+="<div style='width:25%; height:35px; line-height:35px; float:left; text-align:center;'>"
									comment_list_html+="<span style='font-weight:bold;'><a href='history?member_num="+res[i].member_num+"'>"+res[i].nickName+"</a></span>"
									comment_list_html+="</div>"
									comment_list_html+="<div style='width:63%; line-height:35px; float:left;'>"
									comment_list_html+="<span>"+res[i].comment_content+"</span>"
									comment_list_html+="</div>"
									comment_list_html+="</div>"
									$("#history_info_comment_list").append(comment_list_html)
								})
							},
							error : function(error){
								alert("error")
							}
						})
					}
					}
				})
				
				
			},
			error : function(){
				alert("error")
			}
		})
			
		
		
		
		<!-- if > button click DDAN -->
		var limit=0;
		$(document).on('click','#file_next',function(){
			var param = $(this).attr("param")
			param = parseInt(param)
			if(file_length==limit+2){
				$("#file_next").hide()
				$("#file_prev").show()
			}
		 	if(file_length>limit+1 && limit>-1){
				$("#file_next").show()
				$("#file_prev").show()
			} 
		 	if(file_length==limit+2){
		 		$("#file_next").hide()
		 	}
			if(file_length!=limit+1){
				$("#upload_img"+limit).hide()
				$("#upload_img"+(limit+1)).show() 
				limit++;
				/* $("#file_next").hide()
				$("#file_prev").show()
				limit++; */
			}/* else{
				
			} */
		})
		
		<!-- if < button click DDAN -->
		$(document).on('click','#file_prev',function(){
			var param = $(this).attr("param")
			param = parseInt(param)
/* 			if(file_length==1){
				$("#file_prev").hide()
				$("#file_next").hide()
			} */
			 if(limit==1){
				$("#file_prev").hide()
				$("#file_next").show()
			} 
			if(file_length>limit && limit>1){
				$("#file_next").show()
				$("#file_prev").show()
			}
			if(limit==0){
				$("#file_prev").hide()
				$("#file_next").show()
				
			}else{
				$("#upload_img"+limit).hide()
				$("#upload_img"+(limit-1)).show() 
				limit--;
			}
		})
		<!-- window DDAK-->
		var param = $(this).attr("param")
		$("#history_view").fadeIn()
	})
})
</script>
<script type="text/javascript">
	function comment_click(){
		document.getElementById("comment_content").focus()
	}
</script>

<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click','#following',function(){
		var maskWidth = $(document).width()
		var maskHeight = $(document).height()
		$("#mask").css({'width':maskWidth, 'height':maskHeight})
		$("#mask").fadeTo('slow',0.5)
		$("#following_div").fadeIn()
		
		$.ajax({
			url : 'followingList',
			data : {'member_num' : ${mdto.member_num}
					},
			dataType : 'json',
			type : 'get',
			success : function(data){
				var res = data.flist
				var following_list_html=""
				$.each(res, function(i){
					following_list_html="<div style='width:100%;line-height:70px; vertical-align:middle; border-bottom:1px solid #D8D8D8; height:70px; overflow:hidden;'><div style='width:10%;height:100%; float:left;'>"
					following_list_html+="<span><img src='resources/profile_img/"+res[i].profile_img+"'style='width:30px;"
					following_list_html+="height:30px; border-radius:100%; position:relative; z-index:999; top:15%; left:15%;'></span></div>"
					following_list_html+="<div style='width:70% height:100%; line-height:70px; float:left;'><span><a href='history?"
					following_list_html+="member_num="+res[i].member_num+"' style='font-weight:bold; font-size:1.1	em;'>"+res[i].nickName+" ("+res[i].name+")</a></span></div>"
					following_list_html+="<div style='width:20%; float:right; height:100%;'><button style='width:70%; height:30px; border:none; background: #6CB33E; outline:none; color:white; border-radius: 5px; cursor:pointer;'>팔로우</button></div></div>"
					$("#following_list").append(following_list_html)
				})
			}
		})
		
	})
	
	$(document).on('click','#follower',function(){
		var maskWidth = $(document).width()
		var maskHeight = $(document).height()
		$("#mask").css({'width':maskWidth, 'height':maskHeight})
		$("#mask").fadeTo('slow',0.5)
		$("#follower_div").fadeIn()
		
		$.ajax({
			url : 'followerList',
			data : {'member_num' : ${mdto.member_num}
					},
			dataType : 'json',
			type : 'get',
			success : function(data){
				var res = data.flist
				var follower_list_html=""
				$.each(res, function(i){
					follower_list_html="<div style='width:100%;line-height:70px; vertical-align:middle; border-bottom:1px solid #D8D8D8; height:70px; overflow:hidden;'><div style='width:10%;height:100%; float:left;'>"
					follower_list_html+="<span><img src='resources/profile_img/"+res[i].profile_img+"'style='width:30px;"
					follower_list_html+="height:30px; border-radius:100%; position:relative; z-index:999; top:15%; left:15%;'></span></div>"
					follower_list_html+="<div style='width:70% height:100%; line-height:70px; float:left;'><span><a href='history?"
					follower_list_html+="member_num="+res[i].member_num+"' style='font-weight:bold; font-size:1.1	em;'>"+res[i].nickName+" ("+res[i].name+")</a></span></div>"
					follower_list_html+="<div style='width:20%; float:right; height:100%;'><button style='width:70%; height:30px; border:none; background: #6CB33E; outline:none; color:white; border-radius: 5px; cursor:pointer;'>팔로우</button></div></div>"
					$("#follower_list").append(follower_list_html)
				})
			}
		})
		
	})
})
</script>


<div id="following_div" style="z-index:9991; position:relative; background:white; display:none; position:fixed; left:35%; top:10%; width:30%; height:600px; border:1px solid black;">
		<div style="width:100%; height:60px; border:1px solid black; line-height:60px;">
			<span style="margin-left:3%; font-size:1.2em; font-weight:bolder">팔로잉</span>
		</div>
		<div id="following_list" style="width:100%; height:540px; overflow-y:scroll;">
		
		</div>
	</div>

	<div id="follower_div" style="z-index:9991; position:relative; background:white; display:none; position:fixed; left:35%; top:10%; width:30%; height:600px; border:1px solid black;">
		<div style="width:100%; height:60px; border:1px solid black; line-height:60px;">
			<span style="margin-left:3%; font-size:1.2em; font-weight:bolder">팔로워</span>
		</div>
		<div id="follower_list" style="width:100%; height:540px; overflow-y:scroll;">
		
		</div>
	</div>


<div id="history_view">
		<div id="history_view_file">
			<div class="slider">
			<img src="resources/icon/left 2.png" id="file_prev" style="position: absolute; top:45%; left:1.5%; font-size:40px; width:30px; height:30px; cursor:pointer; display:none;">
				<!-- <img src="resources/history_upload_file/박서준.jpg" style="height:500px;">
				<img src="resources/history_upload_file/박서준.jpg" style="height:500px;"> -->
			</div>
		</div>
		<div id="history_info_body">
			<div id="history_info_header">		
			</div>
			<div id="history_info_addr">
			 	<span id="history_info_addr_text" class="history_addr" style="margin-left:2%; cursor:pointer; font-weight:bold">
			 	</span>			 	
			</div>
			<div id="history_info_center">
				<div id="history_info_content">
				</div>
				<div id="history_info_comment_list">
				</div>
			</div>
			<div id="history_info_bottom">
				<div id="history_info_bottom_body">
					<div id="history_info_bottom_body_top">
						<div id="history_info_like_comment">
							<div id="history_info_like">
							</div>
							<div id="history_info_comment">
								<img src="resources/icon/Talk2.jpg" onclick="comment_click()" style="width:80%; height:80%; cursor:pointer;	">
							</div>
						</div>
						<div id="history_info_like_count">
						</div>
					</div>
					<div id="history_info_bottom_body_bottom">
						<input type="text" id="comment_content" name="comment_content" placeholder="댓글 달기...">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="my_history_img_body">
	<c:forEach var="hlist" items="${hlist }">
		<div id="my_history_img">
			<img src="resources/history_upload_file/${hlist.history_main_file }" param="${hlist.history_num }" id="my_history_img_view" param="${hlist.history_num }" class="my_history_img_view${hlist.history_num }" style="width:100%; height:100%;">
		</div>
	</c:forEach>
		
	</div>
	
	<div id="share_div" style="display:none; z-index:9992; width:500px; height:400px; border:1px solid gray; position:fixed; left:37%; top:30%; background:white;">
		<div id="share_div_top" style="display:inline-block; width:100%; height:10%; text-align:center; line-height:40px; vertical-align:middle; font-size:1.5em; font-weight:bolder;">
			공유하기
		</div>
		<div id="share_div_content" style="display:inline-block; width:100%; height:70%;">
			<textarea id="share_history_content" name="share_history_content"></textarea>
		</div>
		<div id="share_div_bottom" style="display:inline-block; width:100%; height:20%; text-align:center; line-height:80px; vertical-align:middle;">
			<input type="button" value="공유하기" id="share_btn"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="취소" id="share_cancel_btn"/>
		</div>
	</div>
	
<script type="text/javascript">
$(document).ready(function(){
	
})
</script>

</body>
</html>
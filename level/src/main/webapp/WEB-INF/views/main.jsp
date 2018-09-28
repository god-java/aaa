<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>level</title>
<script src="resources/jquery/jquery-3.3.1.min..js"></script>
<script src="resources/jquery/sockjs.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82d3c834eb2e51a75bf8c037ad61a3e7&libraries=services"></script>
<script type="text/javascript">
$(document).ready(function(){

	
	
})
	
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#search").keydown(function(e){
		if(e.keyCode=='13'){
			location.href="search?nickName="+$("#search").val()
		}
	})
})
</script>
<style type="text/css">
html,body,div,ul,li,a,span,table,td,font{margin:0; padding:0; outline:0; font-size:13px;}
a{text-decoration:none; color:black;}
a:hover{color:gray;}
#header ul{list-style:none; display:inline-flex; width:100%;}
#header input[type='text']{width:30%; height:30px; outline:none; border-radius:5px; border:1px solid #D8D8D8;}
li{line-height:80px;/*  border:1px solid gray; */}
#header{width:100%; height:80px; border:1px solid #D8D8D8; position:fixed; left:0; top:0; background:white; z-index:10;}
#center{width:1260px; margin:0px auto;}
#bottom{width:100%; height:150px; border-top:1px solid #D8D8D8; text-align:center;}


#follow_access_list{width:10%; height:100%; border-left:1px solid gray; position: fixed; top:81px; right:0; background:white; z-index:9980;}


#chat_box{border:1px solid gray; display:none; background:white; width:300px; height:350px; position: fixed; bottom:0; right:300px; border-radius:5px 5px 0 0; z-index:10000;}
#chat_box_head{width:100%; height:20px; background:#D8D8D8; border-bottom:1px solid gray; overflow: hidden; border-radius:5px 5px 0 0;}
#chat_close{float:right; width:15px; height:100%; font-weight:bold; cursor:pointer;}
#chat_box_body{width:100%; height:290px; overflow-y:scroll;}
#chat_box_bottom{width:100%; height:40px; border-top:1px solid #D8D8D8;}
#chat_input{width:90%; height:90%; border:none; outline:none; margin-left:5px;}
</style>


<!-- news -->


<script type="text/javascript">
$(document).ready(function(){
	$("#news_view").hide()
	$(document).on('click','#news_btn',function(){
		$.ajax({
			url : 'newsClick',
			data : {'receiver_num' : ${member_num}
			},
			type : 'get',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(data){
				var res = data.nlist
				var type1 = "님이 회원님의 게시물에 좋아요를 눌렀습니다."
				var type2 = "님이 회원님의 게시물에 댓글을 남겼습니다."
				var type3 = "님이 회원님을 팔로우 했습니다."
				var type4 = "님이 회원님의 게시물을 공유 했습니다."
				var type5 = "님이 회원님에게 메시지를 보냈습니다."
				var type6 = "님이 history에서 회원님을 태그했습니다."
				var type7 = "님이 댓글에서 회원님을 태그했습니다."
				var news_view_html = ""
				$("#news_view").html("")
				$.each(res, function(i){
					if(res[i].type==1){
						news_view_html = "<a href='historyInfo?member_num="+${member_num}+"&history_num="+res[i].history_num+"'<li style='width:100%; height:50px; float:left; position:relative;  line-height:50px; border-bottom:1px solid #D8D8D8; display:block;'>"
						news_view_html += "<img src='resources/profile_img/"+res[i].profile_img+"'"
						news_view_html += "style='width:30px; height:30px; border-radius:100%;'>"+res[i].nickName+type1+"</li></a>"
					}else if(res[i].type==2){
						news_view_html = "<a href='historyInfo?member_num="+${member_num}+"&history_num="+res[i].history_num+"'<li style='width:100%; height:50px; float:left; position:relative;  line-height:50px; border-bottom:1px solid #D8D8D8; display:block;'>"
						news_view_html += "<img src='resources/profile_img/"+res[i].profile_img+"'"
						news_view_html += "style='width:30px; height:30px; border-radius:100%;'>"+res[i].nickName+type2+"</li></a>"
					}else if(res[i].type==3){
						news_view_html = "<a href='historyInfo?member_num="+${member_num}+"&history_num="+res[i].history_num+"'<li style='width:100%; height:50px; float:left; position:relative;  line-height:50px; border-bottom:1px solid #D8D8D8; display:block;'>"
						news_view_html += "<img src='resources/profile_img/"+res[i].profile_img+"'"
						news_view_html += "style='width:30px; height:30px; border-radius:100%;'>"+res[i].nickName+type3+"</li></a>"
					}else if(res[i].type==7){
						news_view_html = "<a href='historyInfo?member_num="+${member_num}+"&history_num="+res[i].history_num+"'<li style='width:100%; height:50px; float:left; position:relative;  line-height:50px; border-bottom:1px solid #D8D8D8; display:block;'>"
						news_view_html += "<img src='resources/profile_img/"+res[i].profile_img+"'"
						news_view_html += "style='width:30px; height:30px; border-radius:100%;'>"+res[i].nickName+type7+"</li></a>"
						}
					$("#news_view").append(news_view_html)
					$("#news_view").show()
				})
			},
			error : function(error){
				alert("error")
			}
		})
	})
})
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('keyup','#search',function(){
		if(!$("#search").val()){
			$("#member_search_ul").hide()
		}else{
			$("#member_search_ul").show()
			$.ajax({
				url : 'findMember_keyUp',
				type : 'get',
				dataType : 'json',
				data : {'nickName' : $("#search").val(),
						'email' : $("#search").val()
						},
				success : function(data){
					var res = data.mlist
					var member_find_html =""
					/* var member_search_ul_html="<ul id='member_search_ul' style='width:80%; height:300px; border:1px solid gray; background:white; position: relative;"
						member_search_ul_html+="top:-6%; border-radius:5px; display:none; overflow-y:scroll;'></ul>" */
						$("#member_search_ul").html("")
/* 						<ul id="member_search_ul" style="width:80%; height:300px; border:1px solid gray; background:white; position: relative; top:-6%; border-radius:5px; display:none; overflow-y:scroll;">
 */					<!-- <li style="width:100%; height:50px; border:1px solid gray;"></li> -->
						/* </ul> */
					$.each(res,function(i){
						$("#member_search_ul").css({'display':'flex','flex-direction':'column'})
						member_find_html="<li style='width:100%; height:50px; border-bottom:1px solid #D8D8D8; line-height:50px;'>"
						member_find_html+="<a href='history?member_num="+res[i].member_num+"'><div style='width:20%; height:50px; display:inline-block; float:left;'><img src='resources/profile_img/"+res[i].profile_img+"' style="
						member_find_html+="'width:30px; height:30px; border-radius:100%; margin-left:5%; margin-top:10px;'></div>"
						member_find_html+="<div style='width:80%; height:50px; display:inline-block; float:left; font-size:1.5em;'>"+res[i].nickName+"("+res[i].name+")</div></a></li>"
						$("#member_search_ul").append(member_find_html)
					})
				}
						
				
			})
		}
	})
})
</script>
<script type="text/javascript">
 $(document).ready(function(){
	 
	var sock
	var member1_num
	var member2_num
	var date
	if(${member_num}!=null){
		sock = new WebSocket("ws://192.168.51.99:8080/level/echo-ws")
		sock.onopen = function(){
			sock.send("access/"+${member_num})
		}
		
	}
	sock.onmessage = function(evt){
		var message = evt.data
		var sub_message = message.split("/")
		if(sub_message[0]=='main_note'){
			var member_num = evt.data.split("/")
			var member_num_spl = member_num[1]
			$.ajax({ 
				url : 'note_count',
				data : {'member_num': member_num_spl},
				type : 'get',
				success : function(data){
					var res = data
					$("#note_count_div").show()
					var note_count_html= "<span id='note_count' style='color:white; font-weight:bold;'>"+res+"</span>"
					$("#note_count_div").html(note_count_html)
				},
				error : function(error){
					alert("error")
				}
			})
		}else if(evt.data=='list'){
			$.ajax({
				url : 'access_list',
				data : {'member_num' : ${member_num}
						},
				dataType : 'json',
				type : 'get',
				success : function(data){
					var res = data.socList	
					var access_html=""
						$("#access_list").html("")
					   $.each(res, function(i){
						access_html="<div id='access_member' param='"+res[i].member_num+"' style='width:100%; height:60px; line-height:60px; border-bottom:1px solid #D8D8D8; cursor:pointer;'>"
						access_html+="<div style='width:30%; height:100%; float:left;'><img src='resources/profile_img/"+res[i].profile_img+"' style='width:30px; height:30px; border-radius:100%; margin-top:17px; margin-left:17px;'></div>"
						access_html+="<div style='width:60%; height:100%; float:left;'>"+res[i].nickName+"("+res[i].name+")</div>"	
						if (res[i].access_status=='login') {
							 access_html += "<div style='width:10%; height:100%; float:left;'><div style='width:10px; height:10px; border:none; background:green; float:left; margin-top:23px; border-radius:100%;'></div></div>" // 초록불 */
							access_html +="</div>"
						} else {
							access_html += "</div>" // 빨간불
						}
						$("#access_list").append(access_html)
					})
				}	
			})
		}else if(sub_message[0] == 'message'){						////서버로 부터 message 라고 왔을때
			member1_num=sub_message[2]								// [2]에는 보낸 사람이 나를 2번쨰에 넣어놨기 때문에 [2]가 내가 됨
			member2_num=sub_message[1]
			$.ajax({
				url : 'chattingContent',
				type : 'get',
				dataType : 'json',
				data : {'member1_num' : member1_num,
						'member2_num' : member2_num
						},
				success : function(data){
					var res = data.chatList
					var mdto = data.mdto
					$("#chat_name").html("<a href='history?member_num="+mdto.member_num+"'>"+mdto.name+"</a>")
					$("#chat_box").fadeIn(300)
					var chatting_content_html=""
						$("#chat_box_body").html("")
					$.each(res,function(i){
						
						chatting_content_html="<div style='width:100%; overflow:hidden;'>"
						if(i == 0){
							chatting_content_html+="<div style='width:100%; height:30px; text-align:center; line-height:30px;'>"+res[i].send_date.substring(0,10)+"</div>"
						}
						if(date!=res[i].send_date.substring(0,10) && i!=0){
							chatting_content_html+="<div style='width:100%; height:30px; text-align:center; line-height:30px;'>"+res[i].send_date.substring(0,10)+"</div>"
						}
						if(res[i].chatting_sender_num==${member_num}){
							chatting_content_html+=		"<div style='height:30px; float:left;'>"
							chatting_content_html+=		"</div>"
							chatting_content_html+=		"<div style='width:40%; float:right; margin-top:15px; margin-right:5px; border:1px solid gray; border-radius:5px; color:white; background:green;'>"
							chatting_content_html+=			res[i].chatting_content
							chatting_content_html+=		"</div>"
							chatting_content_html+=		"<div style=' float:right; margin-top:15px; line-height:25px; margin-right:5px; color:black; font-size:0.8em;'>"
							chatting_content_html+=			res[i].send_date.substring(11)
							chatting_content_html+=		"</div>"
							chatting_content_html+="</div>"
						}else{
							chatting_content_html+=		"<div style='height:30px; float:left;'>"
							chatting_content_html+=		"</div>"
							chatting_content_html+=		"<div style='width:40%; float:left; margin-top:15px; margin-left:5px; border:1px solid gray; border-radius:5px; color:white; background:blue;'>"
							chatting_content_html+=			res[i].chatting_content
							chatting_content_html+=		"</div>"
							chatting_content_html+=		"<div style=' float:left; margin-top:15px; line-height:25px; margin-left:5px; color:black; font-size:0.8em;'>"
							chatting_content_html+=			res[i].send_date.substring(11)
							chatting_content_html+=		"</div>"
							chatting_content_html+="</div>"						}
						date = res[i].send_date.substring(0,10)
						$("#chat_box_body").append(chatting_content_html)
					})
					$("#chat_box_body").scrollTop($("#chat_box_body")[0].scrollHeight)
				}
			
			})
		}else if(sub_message[0]=='note'){
			var member_num = evt.data.split("/")
			var member_num_spl = member_num[1]
			$.ajax({
				url : 'note_count',
				data : {'member_num': member_num_spl},
				type : 'get',
				success : function(data){
					var res = data
					var news_sound = new Audio("resources/background_sound/포로리야.mp3")
					news_sound.play()
					$("#note_count_div").show()
					var note_count_html= "<span id='note_count' style='color:white; font-weight:bold;'>"+res+"</span>"
					$("#note_count_div").html(note_count_html)
				},
				error : function(error){
					alert("error")
				}
			})
		}
	}
	


		$(document).on('click','#access_member', function(){
			member1_num = ${member_num}
			member2_num = $(this).attr("param")
			$.ajax({
				url : 'chattingContent',
				type : 'get',
				dataType : 'json',
				data : {'member1_num' : ${member_num},
						'member2_num' : member2_num
						},
				success : function(data){
					date=""
					var res = data.chatList
					var mdto = data.mdto
					$("#chat_name").html("<a href='history?member_num="+mdto.member_num+"'>"+mdto.name+"</a>")
					$("#chat_box").fadeIn(300)
					var chatting_content_html=""
						$("#chat_box_body").html("")
					$.each(res,function(i){
						chatting_content_html="<div style='width:100%; overflow:hidden;'>"
						if(i == 0){
							chatting_content_html+="<div style='width:100%; height:30px; text-align:center; line-height:30px;'>"+res[i].send_date.substring(0,10)+"</div>"
						}
						if(date!=res[i].send_date.substring(0,10) && i!=0){
							chatting_content_html+="<div style='width:100%; height:30px; text-align:center; line-height:30px;'>"+res[i].send_date.substring(0,10)+"</div>"
						}
						if(res[i].chatting_sender_num==${member_num}){
							chatting_content_html+=		"<div style='height:30px; float:left;'>"
							chatting_content_html+=		"</div>"
							chatting_content_html+=		"<div style='width:40%; float:right; margin-top:15px; margin-right:5px; border:1px solid gray; border-radius:5px; color:white; background:green;'>"
							chatting_content_html+=			res[i].chatting_content
							chatting_content_html+=		"</div>"
							chatting_content_html+=		"<div style=' float:right; margin-top:15px; line-height:25px; margin-right:5px; color:black; font-size:0.8em;'>"
							chatting_content_html+=			res[i].send_date.substring(11)
							chatting_content_html+=		"</div>"
							chatting_content_html+="</div>"
						}else{
							chatting_content_html+=		"<div style='height:30px; float:left;'>"
							chatting_content_html+=		"</div>"
							chatting_content_html+=		"<div style='width:40%; float:left; margin-top:15px; margin-left:5px; border:1px solid gray; border-radius:5px; color:white; background:blue;'>"
							chatting_content_html+=			res[i].chatting_content
							chatting_content_html+=		"</div>"
							chatting_content_html+=		"<div style=' float:left; margin-top:15px; line-height:25px; margin-left:5px; color:black; font-size:0.8em;'>"
							chatting_content_html+=			res[i].send_date.substring(11)
							chatting_content_html+=		"</div>"
							chatting_content_html+="</div>"
						}
						date = res[i].send_date.substring(0,10)
						$("#chat_box_body").append(chatting_content_html)
					})
					$("#chat_box_body").scrollTop($("#chat_box_body")[0].scrollHeight)
				}
			
			})
		})
		
		$(document).on('keydown','#chat_input',function(evt){
			if(evt.keyCode=='27'){
				$("#chat_box").fadeOut(300)	
				date=""
			}else if(evt.keyCode=='13'){
				$.ajax({
					url : 'chatWrite',
					type : 'get',
					data : {'member1_num' : member1_num,
							'member2_num' : member2_num,
							'chatting_sender_num' : member1_num,
							'chatting_content' : $("#chat_input").val()
							},
					success : function(data){
						
						$("#chat_input").val("")
						sock.send("chatting/"+member1_num+"/"+member2_num)
						$.ajax({
							url : 'chattingContent',
							type : 'get',
							dataType : 'json',
							data : {'member1_num' : ${member_num},
									'member2_num' : member2_num
									},
							success : function(data){
								var res = data.chatList
								var chatting_content_html=""
									$("#chat_box_body").html("")
								$.each(res,function(i){
									
									chatting_content_html="<div style='width:100%; overflow:hidden;'>"
									if(i == 0){
										chatting_content_html+="<div style='width:100%; height:30px; text-align:center; line-height:30px;'>"+res[i].send_date.substring(0,10)+"</div>"
									}
									if(date!=res[i].send_date.substring(0,10) && i!=0){
										chatting_content_html+="<div style='width:100%; height:30px; text-align:center; line-height:30px;'>"+res[i].send_date.substring(0,10)+"</div>"
									}
									if(res[i].chatting_sender_num==${member_num}){	
										chatting_content_html+=		"<div style='height:30px; float:left;'>"
										chatting_content_html+=		"</div>"
										chatting_content_html+=		"<div style='width:40%; float:right; margin-top:15px; margin-right:5px; border:1px solid gray; border-radius:5px; color:white; background:green;'>"
										chatting_content_html+=			res[i].chatting_content
										chatting_content_html+=		"</div>"
										chatting_content_html+=		"<div style=' float:right; margin-top:15px; line-height:25px; margin-right:5px; color:black; font-size:0.8em;'>"
										chatting_content_html+=			res[i].send_date.substring(11)
										chatting_content_html+=		"</div>"
										chatting_content_html+="</div>"
									}else{
										chatting_content_html+=		"<div style='height:30px; float:left;'>"
										chatting_content_html+=		"</div>"
										chatting_content_html+=		"<div style='width:40%; float:left; margin-top:15px; margin-left:5px; border:1px solid gray; border-radius:5px; color:white; background:blue;'>"
										chatting_content_html+=			res[i].chatting_content
										chatting_content_html+=		"</div>"
										chatting_content_html+=		"<div style=' float:left; margin-top:15px; line-height:25px; margin-left:5px; color:black; font-size:0.8em;'>"
										chatting_content_html+=			res[i].send_date.substring(11)
										chatting_content_html+=		"</div>"
										chatting_content_html+="</div>"
									}
									date = res[i].send_date.substring(0,10)
									$("#chat_box_body").append(chatting_content_html)
								})
								$("#chat_box_body").scrollTop($("#chat_box_body")[0].scrollHeight)
							}
						
						})
					}
				})
			}
		})
		

$(document).on('click',"#chat_close",function(){
		date=""
		$("#chat_box").fadeOut(200)
	})
}) 
</script>

<script type="text/javascript">
$(document).ready(function(){
	var note_swit=0;
	var note_html1 = ""
		note_html1 = "<li style='width:100%; height:30px; line-height:30px; border-bottom:1px solid gray;'>"
		note_html1 +=	"<span style='float:left; margin-left:2%;'>"
		note_html1 +=		"<span id='all_note_list' style='cursor:pointer'>전체 쪽지함</span>"
		note_html1 +=	"</span>"
		note_html1 +=	"<span style='float:right; margin-right:2%;'>"
		note_html1 +=		"<span id='receive_note_list' style='cursor:pointer'>받은 쪽지함</span>"
		note_html1 +=	"</span>"
		note_html1 +=	"<span style='float:right; margin-right:2%;'>"
		note_html1 +=		"<span id='send_note_list' style='cursor:pointer'>보낸 쪽지함</span>"
		note_html1 +=	"</span>"
		note_html1 += "</li>"
	$(document).on('click','#note_icon', function(){
		if(note_swit==0){
			$("#note_list").css({'display':'flex', 'flex-direction':'column'})
			note_swit=1
			
			$.ajax({
				url : 'note_list',
				type : 'get',
				data : {'member_num' : ${member_num}
						},
				dataType : 'json',
				success : function(data){
					var res = data.note_list
					var note_html = ""
					$("#note_list").html(note_html1)
					$.each(res,function(i){
						note_html = "<li class='note_list_li' id='note_list_li"+res[i].note_num+"' param='"+res[i].note_num+"' param2='"+res[i].sender_num+"' style='width:100%; height:50px; border-bottom:1px solid #D8D8D8; cursor:pointer;'>"
						if(res[i].read_check=='read'){
							note_html += 	"<div id='note_list_div1"+res[i].note_num+"' style='width:30%; height:100%; float:left; '>"	
						}else{
							note_html += 	"<div id='note_list_div1"+res[i].note_num+"' style='width:30%; height:100%; float:left; background:#EAEAEA;'>"
						}
						
						note_html += 		"<img src='resources/profile_img/"+res[i].profile_img+"' style=' margin-top:-20px; width:30px; height:30px; border-radius:100%'>"
						note_html += 	"</div>"
						if(res[i].read_check=='read'){
							note_html += 	"<div id='note_list_div2"+res[i].note_num+"' style='width:70%; height:100%; float:left; line-height:50px;'>"
						}else{
							note_html += 	"<div id='note_list_div2"+res[i].note_num+"' style='width:70%; height:100%; float:left; line-height:50px; background:#EAEAEA;'>"
						}
						
						note_html +=		 "<span style='font-weight:bold; margin-left:-100px;'>"+res[i].nickName+"</span>님이 쪽지를 남겼습니다."
						note_html += 	"</div>"
						note_html += "</li>"
						$("#note_list").append(note_html)
					})
				}
			})
			
			
		}else{
			$("#note_list").hide()
			$("#note_list").html("")
			note_swit=0
		}
	})
	$(document).on('click','#note_reply', function(){
		$("#reply_div").fadeIn()
		var width=$(document).width()
		var height=$(document).height()
		$("#note_reply_mask").css({'width':width, 'height':height})
		$("#note_reply_mask").fadeTo('slow',0.5)
	})
	
	$(document).on('click','#send_note_list', function(){
		$.ajax({
			url : 'send_note_list',
			data : {'member_num' : ${member_num}
					},
			dataType : 'json',
			type : 'get',
			success : function(data){
				var res = data.send_note_list
				var send_note_list_html =""
					$("#note_list").html(note_html1)
				$.each(res, function(i){
					var year_month_day = res[i].send_date.substring(0,10)
					var h_m_s = res[i].send_date.substring(11)
					send_note_list_html = "<li class='send_note_list_li' id='send_note_list_li"+res[i].note_num+"' param='"+res[i].note_num+"' param2='"+res[i].sender_num+"' style='width:100%; height:50px; border-bottom:1px solid #D8D8D8; cursor:pointer;'>"
					send_note_list_html +=	"<div style='width:10%; height:100%; float:left;'>"
					send_note_list_html +=		"<img src='resources/profile_img/"+res[i].profile_img+"' style='width:30px; height:30px; border-radius:100%; margin-top:-30px;'>"
					send_note_list_html +=	"</div>"
					send_note_list_html +=	"<div style='width:70%; height:100%; line-height:50px; float:left;'>"
					send_note_list_html +=		res[i].nickName+"님에게 쪽지를 보냈습니다."
					send_note_list_html +=	"</div>"
					send_note_list_html +=	"<div style='width:20%; height:100%; line-height:25px; float:left;'>"
					send_note_list_html +=		"<span style='font-size:10px;'>"+year_month_day+"</span><br>"
					send_note_list_html +=		"<span style='font-size:10px;'>"+h_m_s+"</span>"
					send_note_list_html +=	"</div>"
					send_note_list_html += "</li>"
					$("#note_list").append(send_note_list_html)
				})
				$("#note_list").append("!!!")
			}
		})
	})
	$(document).on('click','#receive_note_list', function(){
		alert("!")
	})
	$(document).on('click','#all_note_list', function(){
		location.href="noteList?member_num="+${member_num}
	})
	
	
	
	
	
})
</script>


<!-- 쪽지 script -->

<script type="text/javascript">
var sock = new WebSocket("ws://192.168.51.99:8080/level/echo-ws")
$(document).ready(function(){
	var sender_num
	$(document).on('click','.note_list_li',function(){
		var param = $(this).attr("param")
		sender_num=$(this).attr("param2")
		var width = $(document).width()
		var height = $(document).height()
		$("#note_mask").css({'width':width, 'height':height})
		$("#note_mask").fadeTo('slow',0.5)
		$.ajax({
			url : 'note_info',
			type : 'get',
			data : {'note_num' : param,
					'member_num' : ${member_num}		
			},
			dataType : 'json',
			success : function(data){
				var note_count=data.note_count
				$("#note_count").html(note_count)
				
				
				$("#note_list_div1"+param).css({'background':'white'})
				$("#note_list_div2"+param).css({'background':'white'})
				var res = data.note_info
				$("#note_div").fadeIn()
				var profile_img_html="<img src='resources/profile_img/"+res.profile_img+"' style='width:150px; height:150px; border-radius:100%; margin-top:20px;'>"
				var nick_name_html = "<span style='font-size:1.5em; font-weight:bold;'>"+res.nickName+"</span>"
				var note_content_html = res.note_content
				$("#note_profile_img").html(profile_img_html)
				$("#note_nickName").html(nick_name_html)
				$("#note_content").html(note_content_html)
			},
			error : function(error){
				alert("error")
			}
		})
	})
	<!-- 쪽지 보기 없애기 -->
	$(document).on('click','#note_mask',function(){
		$("#note_mask").hide()
		$("#note_div").hide()
	})
	<!-- 답장 쓰기 없애기 -->
	$(document).on('click','#note_reply_mask',function(){
		$("#note_reply_mask").hide()
		$("#reply_div").hide()
	})
	$(document).on('keydown','#reply_input', function(evt){
		if(evt.keyCode=='13'){
			$.ajax({
				url : 'note_reply',
				type : 'get',
				data : {'receiver_num' : sender_num,		// 나한테 보낸 사람한테 보내야 해서 받는사람이 보낸사람이 됨
						'sender_num' : ${member_num},		// 내가 보내는 거니까 내가 보낸사람
						'note_content' : $("#reply_input").val()
						},
				success : function(data){
					var res = data
					if(res==1){
						alert("메시지 전송 완료")
						$("#note_reply_mask").hide()
						$("#reply_div").hide()
						var sock = new WebSocket("ws://192.168.51.99:8080/level/echo-ws")
						sock.onopen=function(){
							sock.send("note/"+sender_num)
						}
					}
				},
				error : function(a){
					alert("~~")
				}
			})
		}
	})
})
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click','#note_list_li',function(){
		var param = $(this).attr("param")
		$("#note_list_div1"+param).css({'background':'white'})
		$("#note_list_div2"+param).css({'background':'white'})
	})
})
</script>
<!-- news end -->
</head>
<body style="">
<!-- 쪽지 -->
<div id="note_mask" style="position:absolute; left:0; top:0; display:none; background:black; z-index:9900;"></div>
<div id="note_reply_mask" style="position:absolute; left:0; top:0; display:none; background:black; z-index:9902;"></div>


<div id="note_div" style="width:30%; height:400px; position:fixed; left:35%; top:20%; background:white; border:1px solid gray; z-index:9901; display:none;">
	<div id="note_profile_img" style="width:100%; height:180px; text-align:center;">
		
	</div>
	<div id="note_nickName" style="width:100%; height:50px; border-bottom:1px solid gray; text-align:center; line-height:50px;">
		
	</div>
	<div id="note_content" style="Width:80%; height:130px; overflow-y:scroll; margin-left:10%;">
	
	</div>
	<div style="width:100%; height:35px; text-align:center;">
		<button id="note_reply" style="width:20%; height:30px; margin-top:2.5px; border:1px solid gray; border-radius:5px; background:white;">답장</button> 
		<button id="note_cancel" style="width:20%; height:30px; margin-top:2.5px; border:1px solid gray; border-radius:5px; background:white;">취소</button>
	</div>
</div>


<!-- 쪽지 끝 -->
<!-- 쪽지 답장 -->
<script type="text/javascript">
	
</script>
<div id="reply_div" style="width:30%; height:300px; z-index:9903; position:fixed; left:35%; top:25%; display:none; background:white; border:1px solid gray;">
	<div style="width:100%; height:270px; border-bottom:1px solid #D8D8D8;">
	
	</div>
	<div style="width:100%; height:30px;">
		<input type="text" id="reply_input" placeholder="메시지 입력..." style="width:99.9%; height:25px; border:none; outline:none;">
	</div>	
</div>
<!-- 쪽지 답장 끝 -->


<c:if test="${member_num!=null }">
<div id="access_list" style="width:13%;   height:100%; position: absolute; top:80px; border-left:1px solid #D8D8D8; background:white; right:0; overflow-y:scroll; position:fixed;">
	<!-- <div style='width:100%; height:60px; line-height:60px; border-bottom:1px solid #D8D8D8;'>
		<div style='width:30%; height:100%; float:left;'><img src='resources/logo/로고.jpg' style='width:30px; height:30px;'></div>
		<div style='width:60%; height:100%; float:left;'>sssss</div><div style='width:10%; height:100%; float:left;'><div style='width:15px; height:15px; border:none; background:green; float:left; margin-top:21.5px; border-radius:100%;'></div></div>
	</div> -->
</div>

<div id="chat_box">
	<div id="chat_box_head"><span id="chat_name" style=" margin-left:5px; font-weight:bold;"></span><div id="chat_close">X</div></div>
	<div id="chat_box_body"></div>
	<div id="chat_box_bottom"><input type="text" id="chat_input" placeholder="메시지 입력..."></div>
</div>
	<div id="header">
		<ul>
			<li style="width:200px; height:80px; margin-left:5%;">
				<a href="allHistory">
					<img src="resources/로고.jpg" style="width:200px; height:80px;">
				</a>
			</li>
			<li style="width:50%; margin-left:7%;">
				<input type="text" name="nickName" id="search" placeholder="검색">
				<ul id="member_search_ul" style="width:30%; height:300px; border:1px solid gray; background:white; position: relative; top:-6%; border-radius:5px; display:none; overflow-y:scroll;">
					<!-- <li style="width:100%; height:50px; border:1px solid gray;"></li> -->
				</ul>
			</li>
			<li style="width:3%; margin-left:5%; text-align:center;">
				<a href="#">
					<img src="resources/icon/note.png" id="note_icon" style=" width:30px; height:30px; margin-top:25px;">
				</a>
				<c:if test="${note_count>0 }">
					<div id="note_count_div" style="width:15px; height:15px; border:1px solid gray; border-radius:100%; line-height:15px; position: relative; top:-70px; left:30px;background:black; border:black;">
						<span id='note_count' style='color:white; font-weight:bold;'>${note_count }</span>
					</div>
				</c:if>
				<c:if test="${note_count==0 }">
					<div id="note_count_div" style="display:none; width:15px; height:15px; border:1px solid gray; border-radius:100%; line-height:15px; position: relative; top:-70px; left:30px;background:black; border:black;">
						<span id='note_count' style='color:white; font-weight:bold;'>${note_count }</span>
					</div>
				</c:if>
				<ul id="note_list" style="width:800%; height:300px; position:relative; display:none; left:-350%; background:white; top:-2%; overflow-y: scroll; border:1px solid gray;">
				</ul>
			</li>
			<li style="width:3%; display:inline-block; text-align:center;">
				<a href="#" style="margin-left:4%;"><img src="resources/알림 버튼(수정본).jpg" id="news_btn" style="width:30px; height:30px; margin-top:25px;"></a>
				<ul id="news_view" style="width:800%; height:300px; position: relative; left:-350%; background:white; top:-2%; display:block; overflow-y: scroll;">
				</ul>
			</li>
			<li style="width:3%; display:inline-block; text-align:center;">
				<a href="myHistory" style="margin-left:4%;"><img src="resources/마이페이지 이미지(수정본2).jpg" style=" width:30px; height:30px; margin-top:25px;"></a>
			</li>
		</ul>
	</div>
</c:if>
	<div id="center" >
		<jsp:include page="${center }"/>
	</div>
	<div id="bottom">
		<br><span style="font-size:20px;">level</span><br><br>
		<a href="history?member_num=41" id="jn">노준수</a> |
		<a href="#">김승현</a> |
		<a href="#">이주찬</a> |
		<a href="#">이주미</a> |
		<a href="history?member_num=141">인주혜</a> |
		<a href="#">전완익</a>
	</div>
</body>
</html>
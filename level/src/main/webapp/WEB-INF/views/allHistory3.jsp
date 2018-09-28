<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

<style type="text/css">
	.comment{width:80%; border:none; outline:none; height:40px; line-height:40px; vertical-align: middle; margin-left:2%; margin-top:5px;}
	/* .comment{width:80%; height:40px; border:none; outline:none; line-height:40px; vertical-align: middle; border:1px solid gray; background:none; overflow-y:scroll; position:relative; z-index: 5;} */
</style>

<script type="text/javascript">
	$(document).ready(function(){
		var oc1
		var oc2
		$(document).on('click', '.like_img_no',function(){
			var history_num=$(this).attr("param")
			var history_member_num = $(this).attr("param2") 
			$("#like_img_yes"+history_num).fadeIn()	
			$("#like_img_no"+history_num).hide()			
				
			$.ajax({
				url : 'clickLike',
				data : {'member_num' : ${member_num},
			 			'history_num' : history_num,
			 			'sender_num' : ${member_num},
						'receiver_num' : history_member_num,
						'type' : '1'
						},
				type : 'get',
				success : function(data){
					var res = data
				}
			})
		})
		
		$(document).on('click', '.like_img_yes',function(){
			var history_num = $(this).attr("param")
			$("#like_img_no"+history_num).fadeIn()
			$("#like_img_yes"+history_num).hide()

			$.ajax({
				url : 'clickLikeCancel',
				data : {'member_num' : ${member_num},
			 			'history_num' : history_num},
			 	type : 'get',
			 	success : function(data){
			 		var res = data
			 	}
			}) 		
		})
		
		$(document).on('click', '.comment_img', function(){
			var param = $(this).attr("param")
			$("#comment"+param).focus()
		})
		
		
		var comment_param
		$(document).on('click', '.comment', function(){	
			comment_param = $(this).attr("param")
			$("#please_comment"+comment_param).remove()
		})
								
		$(document).on('click', '.please_comment', function(){
			param = $(this).attr("param")
			$("#please_comment"+comment_param).remove()
		})
								
		$(document).click(function(e){
    		if (!$(e.target).is('#comment'+comment_param)) {
    			if(!$("#comment"+comment_param).html()||$("#comment"+comment_param).html()=='<br>'){
    				$("#comment"+comment_param).html("<span id='please_comment"+comment_param+"' class='please_comment' style='color:silver; position:relative; z-index:-1;'>댓글을 입력하세요...</span>")    				
    			}
   			}
		})
				var tag_btn_swit=0
		$(document).on('click', '.tag_btn', function(){ // 친구 태그 버튼 클릭
			var history_num = $(this).attr("param")
			if(tag_btn_swit==0){
				$("#search_div"+history_num).show()
				tag_btn_swit=1
			}else{
				$("#search_div"+history_num).hide()
				tag_btn_swit=0
			}
		})
		
		$(document).on('keyup','.search_tag', function(){
			var history_num = $(this).attr("param")
			$.ajax({
				url : 'findFollower_keyUp',
				type : 'get',
				dataType : 'json',
				data : {'nickName' : $("#search_tag"+history_num).val(),
						'name' : $("#search_tag"+history_num).val(),
						'member_num' : ${member_num}
						},
				success : function(data){
					var res = data.mlist
					var overlap_count = data.overlap_count
					oc1 = overlap_count
					oc2 = overlap_count
					$("#search_follow_div"+history_num).html("")
					$.each(res,function(i){
						var follow_html = "<div id='following_member"+history_num+"' class='following_member' param='"+res[i].nickName+"' param2='"+res[i].member_num+"' param3='"+history_num+"' style='cursor:pointer; width:100%; height:50px;'>"						
							follow_html +=		"<div style='width:30%; height:100%; line-height:50px; float:left'>"
							follow_html +=			"<img src='resources/profile_img/"+res[i].profile_img+"' style='width:30px; height:30px; border-radius:100%; margin-top:10px; margin-left:10px; float:left;'>"
							follow_html +=		"</div>"
							follow_html +=		"<div style='width:70%; height:100%; line-height:50px; float:left'>"
							follow_html +=			res[i].nickName+"("+res[i].name+")"
							follow_html +=		"</div>"
							follow_html += "</div>"
						$("#search_follow_div"+history_num).append(follow_html)
					})
				}
			})
		})
		
		$(document).on('click','.following_member',function(){
			var param3 = $(this).attr("param3") // history_num
			$("#please_comment"+param3).remove()			
			var param = $(this).attr("param") // nickName
			var param2 = $(this).attr("param2") // member_num
			var tag = "<a href='history?member_num="+param2+"' id='param"+oc1+"' style='font-weight:bold'>"+param+"</a>"
			$("#comment"+param3).append(tag)
			$("#append_input"+param3).append("<input type='text' class='index' id='index"+oc1+"' value='"+param+"'>")
			$("#append_input"+param3).append("<input type='text' id='member"+oc1+"' value='"+param2+"'>")
			oc1++;
		})
		
		$(document).on('keyup', '.comment', function(e){
			var history_num = $(this).attr("param")
			$("#please_comment"+history_num).remove()
			if(e.keyCode=='8'){
				for(var j=oc2; j<oc1; j++){
					if($("#index"+j).val()!=$("#param"+j).html()){
						$("#param"+j).remove()
						$("#index"+j).remove()
						$("#member"+j).remove()
					}
				}
			}
		})
		
		$(document).on('keydown', '.comment', function(e){
			var tag="/"
			for(var k=oc2; k<oc1; k++){
				tag += $("#member"+k).val()+"/"
			}
			
			if(e.keyCode=='13'){
				var history_num = $(this).attr("param")
				var history_member_num = $(this).attr("param2") 
				var comment_content = $("#comment"+history_num).html()
				$.ajax({
					url : 'commentWriteOk',
					type : 'get',
					dataType : 'json',
					contentType : 'application/json; charset=UTF-8',
					data : {'member_num' : ${member_num},
							'history_num' :	history_num,
							'tag' : tag,
							'comment_content' : comment_content,
							'sender_num' : ${member_num},
							'receiver_num' : history_member_num,
							'type' : '2',
							'overlap_count' : oc1
					},
					success : function(data){
						var res = data.clist
						$("#comment"+history_num).html("")
						$("#comment_list"+history_num).html("")
						$.each(res, function(i){
							var html =	"<div style='height:auto; overflow: hidden;'>"	
								html += 	"<div style='width:5%; float:left; height:35px; line-height:35px;'>"	
								html += 		"<img src='resources/profile_img/"+res[i].profile_img+"' style='margin:5px auto; margin-left:5px; width:30px; height:30px; border-radius:100%;'>"
								html += 	"</div>"
								html += 	"<div style='width:10%; height:35px; line-height:35px; float:left; text-align:center;'>"	
								html += 		"<span style='font-weight:bold'><a href='history?member_num="+res[i].member_num+"'>"+res[i].nickName+"</a></span>"
								html += 	"</div>"
								html += 	"<div style='width:84.1%; line-height:35px; float:left;'>"
								html += 		"<span>"+res[i].comment_content+"</span>"
								html += 	"</div>"
								html += "</div>"
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

<script type="text/javascript">
	$(document).ready(function() {
		var oc1 = 0
		var oc2 = 0
		var start_row=1
		var end_row=5
		var scroll=2000;
		$(window).scroll(function(){
			var scroll_top = $(document).scrollTop()
			if(scroll_top>scroll){								//이 if문에 들어오면 scroll이 3,000씩 증가됨 start_row, end_row는 5씩 증가(5개씩 빼옴)
																//여기는 6~10번 부터 시작임 1~5번은 아래 아작스임
				$.ajax({
					url : 'allHistory_add',
					type : 'get',
					data : {'start_row' : start_row,
							'end_row' : end_row,
							'member_num' : ${member_num}
							},
					dataType : 'json',
					success : function(data){
						var res = data.hlist
						var clist = data.clist
						var all_history_html = ""
							/* $("#allHistory").html("") */
						$.each(res, function(i){
							all_history_html = ""
								all_history_html += "<div style='width:95%; height:800px; line-height:50px; margin:100px auto;'>"
								all_history_html += 	"<div style='width:100%; height:50px; border:1px solid gray;'>"
								all_history_html += 		"<div style='width:10%; height:100%; float:left;'>"
								all_history_html += 			"<img src='resources/profile_img/"+res[i].profile_img+"' style='width:40px; height:40px; border-radius:100%; margin:5px 0 0 5px;'>"
								all_history_html +=			"</div>"
								all_history_html += 		"<div style='width:70%; height:100%; line-height:50px; float:left;'>"	
								all_history_html += 			res[i].nickName
								all_history_html += 		"</div>"
								all_history_html += 	"</div>"
								all_history_html += 	"<div style='width:100%; height:500px; border:1px solid gray;'>"
								all_history_html +=			"<img src='resources/history_upload_file/"+res[i].history_main_file+"' style='width:100%; height:100%;'>"
								all_history_html += 	"</div>"
								all_history_html += 	"<div style='width:100%; height:50px; border:1px solid gray;'>"
								all_history_html += 		"<div style='width:50px; height:100%; display:inline-block;'>"
														if(res[i].like=='push'){
								all_history_html += 			"<img src='resources/icon/좋아요 아이콘 2.jpg' id='like_img_yes"+res[i].history_num+"' class='like_img_yes' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' style='width:100%; height:100%; cursor:pointer;'>"
								all_history_html +=				"<img src='resources/icon/좋아요 아이콘 1 (2).jpg' id='like_img_no"+res[i].history_num+"' class='like_img_no' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' style='display:none; width:100%; height:100%; cursor:pointer;'>"
														}else{
								all_history_html +=				"<img src='resources/icon/좋아요 아이콘 1 (2).jpg' id='like_img_no"+res[i].history_num+"' class='like_img_no' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' style='width:100%; height:100%; cursor:pointer;'>"
								all_history_html += 			"<img src='resources/icon/좋아요 아이콘 2.jpg' id='like_img_yes"+res[i].history_num+"' class='like_img_yes' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' style='display:none; width:100%; height:100%; cursor:pointer;'>"
														}
								all_history_html +=			 "</div>"								
								all_history_html +=			 "<div style='width:50px; height:100%; display:inline-block;'>"
								all_history_html +=			 	"<img src='resources/icon/Talk2.jpg' id='comment_img'"+res[i].history_num+" class='comment_img' param='"+res[i].history_num+"' style='width:100%; height:100%; cursor:pointer;'>"
								all_history_html +=			 "</div>" 
								all_history_html += 	"</div>"
								all_history_html += 	"<div style='width:100%; height:80px; border:1px solid #D8D8D8;'>"
								all_history_html +=			"<span style='margin-left:1%;'>"
								all_history_html +=				"<a href='history?member_num='"+res[i].member_num+"' style='font-weight:bold'>"+res[i].nickName+"</a>"+res[i].history_content+""
								all_history_html += 		"</span>"
								all_history_html += 	"</div>"
								all_history_html += 	"<div id='comment_list"+res[i].history_num+"' style='width:100%; height:150px; border:1px solid gray; overflow-y:scroll;'>" // 댓글리스트
															$.each(clist, function(j){
																if(res[i].history_num == clist[j].history_num){
								all_history_html += 				"<div style='height:auto; overflow: hidden;'>"	
								all_history_html += 					"<div style='width:5%; float:left; height:35px; line-height:35px;'>"	
								all_history_html += 						"<img src='resources/profile_img/"+clist[j].profile_img+"' style='margin:5px auto; margin-left:5px; width:30px; height:30px; border-radius:100%;'>"
								all_history_html += 					"</div>"
								all_history_html += 					"<div style='width:10%; height:35px; line-height:35px; float:left; text-align:center;'>"	
								all_history_html += 						"<span style='font-weight:bold'><a href='history?member_num="+clist[j].member_num+"'>"+clist[j].nickName+"</a></span>"
								all_history_html += 					"</div>"
								all_history_html += 					"<div style='width:84.1%; line-height:35px; float:left;'>"
								all_history_html += 						"<span>"+clist[j].comment_content+"</span>"
								all_history_html += 					"</div>"
								all_history_html += 				"</div>"
																}
															})								
								all_history_html += 	"</div>"
								all_history_html += 	"<div style='width:100%; height:50px; border:1px solid gray; display: flex; flex-direction: row;'>"
								all_history_html += 		"<div contenteditable='true' id='comment"+res[i].history_num+"' class='comment' param='"+res[i].history_num+"' param2='"+res[i].member_num+"'>"
								all_history_html += 			"<span id='please_comment"+res[i].history_num+"' class='please_comment' style='color:silver; position:relative; z-index:-1;'>댓글을 입력하세요...</span>"
								all_history_html += 		"</div>"
								all_history_html += 		"<button id='tag_btn"+res[i].history_num+"' class='tag_btn' param='"+res[i].history_num+"'  style='height:42px; margin-left:3%; margin-top:4px; border:1px solid gray; background:white;'>친구태그</button>"
								/* all_history_html += 		"<input type='text' id='comment"+res[i].history_num+"' class='comment' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' placeholder='댓글달기'>" */
								all_history_html += 	"</div>"								
								all_history_html += 	""
								all_history_html += 	"<div id='append_input"+res[i].history_num+"' class='append_input'>"
								all_history_html += 	"</div>"
															
								all_history_html += 	"<div id='search_div"+res[i].history_num+"' style='display: none; width:200px; height:400px; border:1px solid gray; background:white; z-index:10; position: relative; left:67.3%; top:-4px;'>"
								all_history_html += 		"<div style='width:100%; height:50px; border-bottom:1px solid #D8D8D8; line-height:50px;'>"
								all_history_html += 			"<input type='text' id='search_tag"+res[i].history_num+"' param='"+res[i].history_num+"' class='search_tag' style='width:100%; height:80%; border:none; outline:none;' placeholder='이름or닉네임 입력...'>"
								all_history_html += 		"</div>"
								all_history_html += 		"<div id='search_follow_div"+res[i].history_num+"' class='search_follow_div' style='width:100%; height:350px; border-bottom:1px solid #D8D8D8; overflow-y:scroll;'>"
								all_history_html += 		"</div>"
								all_history_html += 	"</div>"
								all_history_html += ""
								all_history_html += ""
								all_history_html += ""
								all_history_html += ""
								all_history_html += ""
								all_history_html += "</div>"
								$("#allHistory").append(all_history_html)
								
								
						})
					},
					error : function(error){
						alert("error")
					}
				})
				scroll +=3000						//여기서 증가
				start_row+=5
				end_row+=5
			}
		})
		
		$.ajax({										//페이지 로딩시에 바로 가져오는 아작스 1~5번까지 가져옴
			url : 'allHistory_add',
			type : 'get',
			data : {'start_row' : start_row,
					'end_row' : end_row,
					'member_num' : ${member_num}
					},
			dataType : 'json',
			success : function(data){
				oc1 = data.overlap_count
				alert(oc1)
				oc2 = data.overlap_count
				var res = data.hlist
				var clist = data.clist
				var all_history_html = ""
					/* $("#allHistory").html("") */
				$.each(res, function(i){
					all_history_html = ""
					all_history_html += "<div style='width:95%; height:800px; line-height:50px; margin:100px auto;'>"
					all_history_html += 	"<div style='width:100%; height:50px; border:1px solid gray;'>"
					all_history_html += 		"<div style='width:10%; height:100%; float:left;'>"
					all_history_html += 			"<img src='resources/profile_img/"+res[i].profile_img+"' style='width:40px; height:40px; border-radius:100%; margin:5px 0 0 5px;'>"
					all_history_html +=			"</div>"
					all_history_html += 		"<div style='width:70%; height:100%; line-height:50px; float:left;'>"	
					all_history_html += 			res[i].nickName
					all_history_html += 		"</div>"
					all_history_html += 	"</div>"
					all_history_html += 	"<div style='width:100%; height:500px; border:1px solid gray;'>"
					all_history_html +=			"<img src='resources/history_upload_file/"+res[i].history_main_file+"' style='width:100%; height:100%;'>"
					all_history_html += 	"</div>"
					all_history_html += 	"<div style='width:100%; height:50px; border:1px solid gray;'>"
					all_history_html += 		"<div style='width:50px; height:100%; display:inline-block;'>"
											if(res[i].like=='push'){
					all_history_html += 			"<img src='resources/icon/좋아요 아이콘 2.jpg' id='like_img_yes"+res[i].history_num+"' class='like_img_yes' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' style='width:100%; height:100%; cursor:pointer;'>"
					all_history_html +=				"<img src='resources/icon/좋아요 아이콘 1 (2).jpg' id='like_img_no"+res[i].history_num+"' class='like_img_no' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' style='display:none; width:100%; height:100%; cursor:pointer;'>"
											}else{
					all_history_html +=				"<img src='resources/icon/좋아요 아이콘 1 (2).jpg' id='like_img_no"+res[i].history_num+"' class='like_img_no' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' style='width:100%; height:100%; cursor:pointer;'>"
					all_history_html += 			"<img src='resources/icon/좋아요 아이콘 2.jpg' id='like_img_yes"+res[i].history_num+"' class='like_img_yes' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' style='display:none; width:100%; height:100%; cursor:pointer;'>"
											}
					all_history_html +=			 "</div>"								
					all_history_html +=			 "<div style='width:50px; height:100%; display:inline-block;'>"
					all_history_html +=			 	"<img src='resources/icon/Talk2.jpg' id='comment_img'"+res[i].history_num+" class='comment_img' param='"+res[i].history_num+"' style='width:100%; height:100%; cursor:pointer;'>"
					all_history_html +=			 "</div>" 
					all_history_html += 	"</div>"
					all_history_html += 	"<div style='width:100%; height:80px; border:1px solid #D8D8D8;'>"
					all_history_html +=			"<span style='margin-left:1%;'>"
					all_history_html +=				"<a href='history?member_num='"+res[i].member_num+"' style='font-weight:bold'>"+res[i].nickName+"</a>"+res[i].history_content+""
					all_history_html += 		"</span>"
					all_history_html += 	"</div>"
					all_history_html += 	"<div id='comment_list"+res[i].history_num+"' style='width:100%; height:150px; border:1px solid gray; overflow-y:scroll;'>" // 댓글리스트
												$.each(clist, function(j){
													if(res[i].history_num == clist[j].history_num){
					all_history_html += 				"<div style='height:auto; overflow: hidden;'>"	
					all_history_html += 					"<div style='width:5%; float:left; height:35px; line-height:35px;'>"	
					all_history_html += 						"<img src='resources/profile_img/"+clist[j].profile_img+"' style='margin:5px auto; margin-left:5px; width:30px; height:30px; border-radius:100%;'>"
					all_history_html += 					"</div>"
					all_history_html += 					"<div style='width:10%; height:35px; line-height:35px; float:left; text-align:center;'>"	
					all_history_html += 						"<span style='font-weight:bold'><a href='history?member_num="+clist[j].member_num+"'>"+clist[j].nickName+"</a></span>"
					all_history_html += 					"</div>"
					all_history_html += 					"<div style='width:84.1%; line-height:35px; float:left;'>"
					all_history_html += 						"<span>"+clist[j].comment_content+"</span>"
					all_history_html += 					"</div>"
					all_history_html += 				"</div>"
													}
												})								
					all_history_html += 	"</div>"
					all_history_html += 	"<div style='width:100%; height:50px; border:1px solid gray; display: flex; flex-direction: row;'>"
					all_history_html += 		"<div contenteditable='true' id='comment"+res[i].history_num+"' class='comment' param='"+res[i].history_num+"' param2='"+res[i].member_num+"'>"
					all_history_html += 			"<span id='please_comment"+res[i].history_num+"' class='please_comment' style='color:silver; position:relative; z-index:-1;'>댓글을 입력하세요...</span>"
					all_history_html += 		"</div>"
					all_history_html += 		"<button id='tag_btn"+res[i].history_num+"' class='tag_btn' param='"+res[i].history_num+"' style='height:42px; margin-left:3%; margin-top:4px; border:1px solid gray; background:white;'>친구태그</button>"
					/* all_history_html += 		"<input type='text' id='comment"+res[i].history_num+"' class='comment' param='"+res[i].history_num+"' param2='"+res[i].member_num+"' placeholder='댓글달기'>" */
					all_history_html += 	"</div>"								
					all_history_html += 	""
					all_history_html += 	"<div id='append_input"+res[i].history_num+"' class='append_input'>"
					all_history_html += 	"</div>"
												
					all_history_html += 	"<div id='search_div"+res[i].history_num+"' style='display: none; width:200px; height:400px; border:1px solid gray; background:white; z-index:10; position: relative; left:67.3%; top:-4px;'>"
					all_history_html += 		"<div style='width:100%; height:50px; border-bottom:1px solid #D8D8D8; line-height:50px;'>"
					all_history_html += 			"<input type='text' id='search_tag"+res[i].history_num+"' class='search_tag' param='"+res[i].history_num+"' style='width:100%; height:80%; border:none; outline:none;' placeholder='이름or닉네임 입력...'>"
					all_history_html += 		"</div>"
					all_history_html += 		"<div id='search_follow_div"+res[i].history_num+"' class='search_follow_div' style='width:100%; height:350px; border-bottom:1px solid #D8D8D8; overflow-y:scroll;'>"
					all_history_html += 		"</div>"
					all_history_html += 	"</div>"
					all_history_html += ""
					all_history_html += ""
					all_history_html += ""
					all_history_html += ""
					all_history_html += ""
					all_history_html += "</div>"
					$("#allHistory").append(all_history_html)
				})
				start_row+=5		//로딩되면 바로 5씩 증가
				end_row+=5
			},
			error : function(error){
				alert("error")
			}
		})
		
		
	})
</script>
</head>
<body>
	<div id="allHistory" style="width: 800px; margin: 200px auto; overflow: hidden;"></div>
	
	
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
	
	
	
</body>
</html>
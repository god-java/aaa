<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#history_view{ width:100%; height:800px; border:1px solid gray; margin:200px auto; background:white; z-index:9991;}
#history_view_file{width:60%; height:100%; display:inline-block; float:left;}
.slider{width:100%; height:100%;}
#history_info_body{width:40%; height:100%; display:inline-block; }
#history_info_header{width:100%; height:10%; float:left; line-height:20%;}
#history_info_addr{width:100%; height:5%; float:left; line-height:20%;}
#history_info_center{width:100%; height:55%; overflow-y:scroll;}
#history_info_bottom{width:100%; height:25%;}
#history_info_content{width:100%; height:100px;}
#history_info_hash_tag{width:100%; height:100px;}
#history_info_comment_list{width:100%;}
#history_info_bottom_body{width:90%; height:100%; border-top:1px solid #D8D8D8; margin:5% auto;}
#history_info_bottom_body_top{width:100%; height:70%; }
#history_info_bottom_body_bottom{width:100%; height:30%;}
#comment_content{width:80%; height:40px; border:none; outline:none; line-height:40px; vertical-align: middle; border:1px solid gray; background:none; overflow-y:scroll; position:relative; z-index: 5;}
#history_info_like_comment{width:100%; height:50%; }
#history_info_like_count{width:100%; height:48%;}
#history_info_like{width:20%; height:100%; display:inline-block;}
#history_info_comment{width:20%; height:100%; display:inline-block;}

#history_info_addr_text:hover{color:gray;}







#map_div{width:50%; height:570px; position: fixed;; z-index: 9997; top:23%; left:-1000%; border:1px solid black;}
#map_view{width:100%; height:500px;}
#map_view_bottom{width:100%; height:70px; background: white; text-align:center;}
#map_view_btn_ok,#map_view_btn_cancel{width:100px; height:30px; background:white; border:1px solid black; outline:none; margin-top:2%;
 border-radius:5px; cursor:pointer; -webkit-transition-duration:0.5s;}






</style>
</head>
<body>

<div id="history_view">
		<div id="history_view_file">
			<div class="slider">
				
				<c:set var="i" value="0"/>
				<c:forEach var="img_list" items="${img_list }">
					<c:if test="${i==0 }">
						<img src="resources/history_upload_file/${img_list }" id="img${i }" style=" top:45%; left:1.5%; font-size:40px; width:100%; height:100%; cursor:pointer;">
					</c:if>
					<c:if test="${i!=0 }">
						<img src="resources/history_upload_file/${img_list }" id="img${i }" style=" top:45%; left:1.5%; font-size:40px; width:100%; height:100%; cursor:pointer; display:none;">
					</c:if>
					<c:set var="i" value="${i+1 }"/>
				</c:forEach>
				<img src="resources/icon/left 2.png" id="file_prev" style="position: absolute; top:65%; left:18.5%; font-size:40px; width:40px; height:40px; cursor:pointer; display:none;">
				<c:if test="${img_list.size()>1}">
					<img src="resources/icon/right 2.png" id="file_next" style="position: absolute; top:65%; left:53.5%; font-size:40px; width:40px; height:40px; cursor:pointer; z-index:10000;">
				</c:if>
				
				<script type="text/javascript">
					$(document).ready(function(){
						var limit=0;
						var file_length = ${img_list.size()}
						$(document).on('click', '#file_next', function(){
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
								$("#img"+limit).hide()
								$("#img"+(limit+1)).show() 
								limit++;
							}
						})
						
						$(document).on('click','#file_prev',function(){
							var param = $(this).attr("param")
							param = parseInt(param)
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
								$("#img"+limit).hide()
								$("#img"+(limit-1)).show() 
								limit--;
							}
						})
					})					
				</script>
				
				
				
			</div>
		</div>
		<div id="history_info_body">
			<div id="history_info_header">
				<img src="resources/profile_img/${odto.profile_img }" style="width:40px; height:40px; margin:2% 0 0 2%; border-radius:100%;">
				<span style="display:inline-block; margin-left:2%; font-weight:bold; position: relative; top:-15%;">${odto.nickName }</span>
			</div>
			<div id="history_info_addr">
			 	<span id="history_info_addr_text" class="history_addr" style="margin-left:2%; cursor:pointer; font-weight:bold">
			 	</span>
			 	
			 	
			</div>
			<div id="history_info_center">
				<div id="history_info_content">
					${odto.history_content }
				</div>
				<div id="history_info_hash_tag">
					asdasdas${odto.write_date } / ${odto.history_num } / ${odto.member_num }
				</div>

				<c:forEach var="clist" items="${clist }">
					<div id="history_info_comment_list">
						<div style='width:100%; height:auto; overflow:hidden'>
							<div style='width:10%; height:35px; line-height:35px; float:left;'>				
								<img src="resources/profile_img/${clist.profile_img }" style="width:30px; height:30px; margin:2.5px auto; margin-left:5%; border-radius:100%;">
							</div>
							<div style="width:25%; height:35px; line-height:35px; float:left; text-align:center;">
								<span style="font-weight:bold;">
									<a href="history?member_num=${clist.member_num}">${clist.nickName }</a>
								</span>
							</div>
							<div style="width:63%; line-height:35px; float:left;">
								<span>${clist.comment_content}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="history_info_bottom">
				<div id="history_info_bottom_body">
					<div id="history_info_bottom_body_top">
						<div id="history_info_like_comment">
							<div id="history_info_like">
							
							
							<script type="text/javascript">
								$(document).ready(function(){
									
									var history_num = ${history_num}
									var owner_num = ${odto.member_num}
									var write_date = "${odto.write_date}"
									$(document).on('click', '#like_on', function(){
										$("#like_on").hide()
										$("#like_off").show()
										
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
												like_count_html += "<br><span style='font-size:0.9em;'>"+write_date+"</span>"
												$("#history_info_like_count").append(like_count_html)
											},
											error : function(error){
												alert(error)
											}
										})
									})
									$(document).on('click', '#like_off', function(){										
										$("#like_off").hide()
										$("#like_on").show()
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
								})
							</script>			
							
							
							<c:if test="${odto.like=='push' }">
								<img src="resources/icon/좋아요 아이콘 2.jpg" id="like_on" style="width:80%; height:80%; cursor:pointer;	">
								<img src="resources/icon/좋아요 아이콘 1 (2).jpg" id="like_off" style="width:80%; height:80%; cursor:pointer; display:none;">
							</c:if>
							<c:if test="${odto.like!='push' }">
								<img src="resources/icon/좋아요 아이콘 1 (2).jpg" id="like_off" style="width:80%; height:80%; cursor:pointer;	">
								<img src="resources/icon/좋아요 아이콘 2.jpg" id="like_on" style="width:80%; height:80%; cursor:pointer; display:none;">
							</c:if>
							</div>
							<div id="history_info_comment">
								<img src="resources/icon/Talk2.jpg" onclick="comment_click()" style="width:80%; height:80%; cursor:pointer;	">
							</div>
						</div>
						<div id="history_info_like_count">
							<span style="font-size:1.2em; font-weight:bold">좋아요 ${like_count }개</span>
							<br><span style='font-size:0.9em;'>${odto.write_date }</span>
						</div>
					</div>
					<div id="history_info_bottom_body_bottom" style="display: flex; flex-direction: row;">
						<div contenteditable="true" id="comment_content" style=""><span id="please_comment" style="color:silver; position:relative; z-index:-1;">댓글을 입력하세요...</span></div>
						<button style="height:42px; margin-left:3%; border:1px solid gray; background:white;">친구태그</button>
						<script type="text/javascript">
							$(document).ready(function(){
								var ff
								$(document).on('click', '#comment_content', function(){					
									$("#please_comment").remove()
								})
								
								$(document).on('click', '#please_comment', function(){
									$("#please_comment").remove()
								})
								
								$(document).click(function(e){
    								if (!$(e.target).is('#comment_content')) {
    									if(!$("#comment_content").html()||$("#comment_content").html()=='<br>'){
    										$("#comment_content").html("<span id='please_comment' style='color:silver; position:relative; z-index:30;'>댓글을 입력하세요...</span>")
    									}
   									}
								});
							})
						</script>
					</div>
					<div>
					
					<script type="text/javascript">
					$(document).ready(function(){
						$(document).on('keyup','#search_tag', function(){
							$.ajax({
								url : 'findFollower_keyUp',
								type : 'get',
								dataType : 'json',
								data : {'nickName' : $("#search_tag").val(),
										'name' : $("#search_tag").val(),
										'member_num' : ${member_num}
										},
								success : function(data){
									var res = data.mlist
									var follow_html = ""
										$("#search_follow_div").html("")
									$.each(res,function(i){
										follow_html = ""
										follow_html +="<div id='following_member' param='"+res[i].nickName+"' param2='"+res[i].member_num+"' style='cursor:pointer; width:100%; height:50px;'>"						
										follow_html +="<div style='width:30%; height:100%; line-height:50px; float:left'>"
										follow_html +=	"<img src='resources/profile_img/"+res[i].profile_img+"' style='width:30px; height:30px; border-radius:100%; margin-top:10px; margin-left:10px; float:left;'>"
										follow_html +="</div>"
										follow_html +="<div style='width:70%; height:100%; line-height:50px; float:left'>"
										follow_html +=	res[i].nickName+"("+res[i].name+")"
										follow_html +="</div>"
										follow_html +="</div>"
										$("#search_follow_div").append(follow_html)
									})
								
									
								}
										
								
							})
						})
					})
					</script>
					<script type="text/javascript">
					$(document).ready(function(){
						var i=${overlap_count}
						var p=${overlap_count}
						$(document).on('click','#following_member',function(){
							$("#please_comment").remove()
							
							var param = $(this).attr("param")
							var param2 = $(this).attr("param2")
						 	var tag = "<a href='history?member_num="+param2+"' id='param"+i+"' style='font-weight:bold'>"+param+"</a>"
						 	$("#comment_content").append(tag)
						 	$("#append_input").append("<input type='text' class='index' id='index"+i+"' value='"+param+"'>")
						 	$("#append_input").append("<input type='text' id='member"+i+"' value='"+param2+"'>")
						 	i++;
						})
						$(document).on('keyup', '#comment_content', function(e){
							$("#please_comment").remove()
							if(e.keyCode=='8'){
								for(var j=p; j<=i; j++){
									if($("#index"+j).val()!=$("#param"+j).html()){
										$("#param"+j).remove()
										$("#index"+j).remove()
										$("#member"+j).remove()
									}
								}
							}
						})
						$(document).on('keydown','#comment_content',function(e){
							var aa="/"
							for(var k=p; k<i; k++){
								aa+=$("#member"+k).val()+"/"
							}
							if(e.keyCode=='13'){
								alert("!!")
								$.ajax({
									url : 'commentWriteOk',
									data : {'comment_content' : $("#comment_content").html(),
											'tag'	: aa,
											'type' : 2,
											'sender_num' : ${member_num},
											'receiver_num' : ${odto.member_num},
											'history_num' : ${odto.history_num},
											'member_num' : ${member_num},
											'overlap_count' : i
											},
									type : 'get',
									success : function(data){
										alert("!")
									}
								})
							}
						})
					})
					</script>
						<div id="append_input">
						</div>
					
						<div style="width:200px; height:400px; border:1px solid gray; background:white; z-index:10; position: relative; left:53.9%; top:-19px;">
							<div style="width:100%; height:50px; border-bottom:1px solid #D8D8D8; line-height:50px;">
								<input type="text" id="search_tag" style="width:100%; height:80%; border:none; outline:none;" placeholder="이름or닉네임 입력...">
							</div>
							<div id="search_follow_div" style="width:100%; height:350px; border-bottom:1px solid #D8D8D8; overflow-y:scroll;">

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
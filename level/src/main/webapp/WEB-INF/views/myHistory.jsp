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

 	$("#history_info_update").click(function(){
 		var maskWidth = $(document).width()
 		var maskHeight = $(document).height()
 		$("#mask").css({'width':maskWidth,'height':maskHeight})
 		$("#mask").fadeTo('slow',0.5)
 		$("#history_write").fadeIn()
 	})
 	$("#history_cancel").click(function(){
 		$("#mask").hide()
		$("#history_write").hide()
 	})
 	var num=1;
 
 	$(document).on("click", "#file_add_btn", function(){
 		$("#history_wirte_img_top").append(html)
 	})
 	
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
 	
  	/* var main_html="<div id='file2_main_div' style='width:100px; height:100px; display:inline-block; margin-left:6px; margin-top:5px;'>"
 		main_html+="<input type='file' id='file2_main' name='file2' style='position: absolute; clip:rect(0,0,0,0);'>"
 		main_html+="<label for='file2_main' style='width:100%; height:100%; display:inline-block; cursor:pointer; border:1px solid #EAEAEA; text-align:center; line-height:100px;'>"
 		main_html+="사진 올리기+"
 		main_html+="</label></div>"
 	$("#history_write_img_top").html(main_html) */
 	 
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
#follow_btn, #logout_btn{-webkit-transition-duration:0.5s; width:100px; height:30px; border:1px solid black;
 background:white; border-radius: 5px; cursor:pointer; outline:none; margin-left:10px; position: relative;
 top:-5px;}
#follow_btn:hover{background:#EAEAEA; coler:gray; border-color: gray;}
#history_info_update{width:50px; height:50px; border:none; background:white; margin-top:-50px; margin-right:10px;}




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
 #history_write_form_top{width:100%; height:60%; border-left:1px solid gray; display: inline-block; float:left;}
 #history_write_form_center{width:100%; height:5%; border-left:1px solid gray; display: inline-block; float:left; text-align:center;}
 #history_write_form_bottom{width:100%; height:15%; border-left:1px solid gray; border-top:1px solid gray; display: inline-block; float:left;}
 #history_write_img_top{width:100%; height:90%; overflow-y:scroll; }
 #history_write_img_bottom{width:100%; height:10%; text-align:center;}
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
#add_btn,#map_btn{width:100px; height:30px; background:white; border:1px solid black; outline:none; margin-top:5%;
 border-radius:5px; cursor:pointer; -webkit-transition-duration:0.5s;}
#share_btn, #share_cancel_btn{width:100px; height:30px; background:white; border:1px solid black; outline:none; margin-top:5%;
 border-radius:5px; cursor:pointer; -webkit-transition-duration:0.5s;}
#map_div{width:50%; height:570px; position: fixed;; z-index: 9997; top:23%; left:-1000%; border:1px solid black;}
#map_view{width:100%; height:500px;}
#map_view_bottom{width:100%; height:70px; background: white; text-align:center;}
#map_view_btn_ok,#map_view_btn_cancel{width:100px; height:30px; background:white; border:1px solid black; outline:none; margin-top:2%;
 border-radius:5px; cursor:pointer; -webkit-transition-duration:0.5s;}




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




.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:5px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:5px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}








</style>
</head>
<body>
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
<!-- if write button click DDAN -->
<!-- if write button click DDAN -->
<!-- if write button click DDAN -->
<!-- if write button click DDAN -->
<script type="text/javascript">
$(document).ready(function(){

	$(document).on('click','#map_btn',function(){
		var maskWidth = $(document).width()
		var maskHeight = $(document).height()
		$("#mask2").css({'width':maskWidth,'height':maskHeight,'z-index':'9992'})
		$("#mask2").fadeTo('slow',0.5)
		$('#map_div').animate({left:'25%'},0)
	})
	$(document).on('click','#mask2',function(){
		$("#map_div").animate({left:'-1000%'},0)
		$("#mask2").fadeOut()
	})
	$(document).on('click','#map_view_btn_cancel',function(){
		$("#map_div").animate({left:'-1000%'},0)
		$("#mask2").fadeOut()
	})
	$(document).on('click','#map_view_btn_ok',function(){
		$("#map_div").animate({left:'-1000%'},0)
		$("#mask2").fadeOut()
	})
	$(document).on('click','#delete_addr',function(){
        $("#addr").html("")
        $("#x_pos").val("")
        $("#y_pos").val("")
        $("#history_addr").val("")
    })
})


</script>

<form id="histroty_f" action="historyWriteOk" method="post" enctype="multipart/form-data">
	<div id="history_write">
		<div id="history_write_img_add">
			<div id="history_write_img_top">
			</div>
			<div id="history_write_img_bottom">
				<input type="button" value="사진/동영상" id="add_btn">
				<input type="button" value="지도 보기" id="map_btn">
				
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#history_write_ta").keyup(function(){
					if($("#history_write_ta").val().charAt(0)=='@'){
						$("#history_write_ta").css({'font-weight':'bold'})
					}
				})
			})
		</script>
		<div id="history_write_form">
			<div id="history_write_form_header">
				<img src="resources/logo/로고.jpg" style="width:90%; height:90%; margin-top:5%; margin-left:5%;">
			</div>
			<div id="history_write_form_top">
				<textarea id="history_write_ta" name="history_content"></textarea>
			</div>
			<div id="history_write_form_center">
				<span id="addr" style="margin:2.5%;"></span>
			</div>
			<div id="history_write_form_bottom">
				<input type="hidden" id="x_pos" name="x_pos">
				<input type="hidden" id="y_pos" name="y_pos">
				<input type="hidden" id="history_addr" name="history_addr">
				<input type="submit" value="작성" id="history_submit">
				<input type="button" value="취소" id="history_cancel">
			</div>
		</div>
	</div>
</form>


<!-- map_btn click DDAN! -->

<div id="map_div" >
<div class="map_wrap">
    <div id="map_view" style="width:100%; height:500px; position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                	 키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82d3c834eb2e51a75bf8c037ad61a3e7&libraries=services"></script>
<script>
	var addr
	var history_addr, place_name, x_pos, y_pos;
	var markers = [];
	
	var mapContainer = document.getElementById('map_view'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3
	    };  
	
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	var ps = new daum.maps.services.Places();  
	
	var infowindow = new daum.maps.InfoWindow({zIndex:9998});
	
	var marker2 = new daum.maps.Marker(),
    infowindow = new daum.maps.InfoWindow({zindex:1});
    var geocoder = new daum.maps.services.Geocoder();

	searchPlaces();
	
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	function placesSearchCB(data, status, pagination) {
	    if (status === daum.maps.services.Status.OK) {
	        displayPlaces(data);
	        displayPagination(pagination);
		
	        $(document).on('click','#map_view_btn_ok',function(){
            	$("#addr").html(addr)
            	$("#history_addr").val(history_addr)
            })
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;	
	    } else if (status === daum.maps.services.Status.ERROR) {	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;	
	    }
	}
	
	function displayPlaces(places) {	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new daum.maps.LatLngBounds(), 
	    listStr = '';
	    
	    removeAllChildNods(listEl);
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); 
	
	        bounds.extend(placePosition);	       
	            
	        (function(marker, title) {
	            daum.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            daum.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };	           
	            
	            daum.maps.event.addListener(marker, 'click', function() {
	            	displayInfowindow(marker, title);
	            	marker2.setMap(null);
	            	
	            	$.each(places, function(i){
	                	var place_name2 = places[i].place_name
	                	
	                	if (place_name2 == title){
	                		history_addr = places[i].address_name
	                		place_name = places[i].place_name
	                		addr = "위치정보 : "+places[i].address_name+" <div id='delete_addr' style='cursor:pointer; font-weight:bold; margin-left:5%;'>X<div>"
	                		document.getElementById('x_pos').value = places[i].x
	                        document.getElementById('y_pos').value = places[i].y
	                	}
	                })
	            });
		            
	            
	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    map.setBounds(bounds);
	}
	
	function getListItem(index, places) {
		
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	function addMarker(position, idx, title) {
	    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', 
	        imageSize = new daum.maps.Size(36, 37),  
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), 
	            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), 
	            offset: new daum.maps.Point(13, 37)
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position,
	            image: markerImage 
	        });
	
	    marker.setMap(map);
	    markers.push(marker);
	
	    return marker;
	}
	
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:9999;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}

	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === daum.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            <!-- this is address infomation-->
				var style = ""
				history_addr=result[0].address.address_name
            	addr = "위치정보 : "+result[0].address.address_name+" <div id='delete_addr' style='cursor:pointer; font-weight:bold; margin-left:5%;'>X<div>"
            	console.log("history_addr2" + history_addr)
          		var geocoder = new daum.maps.services.Geocoder();

           		var callback = function(result, status) {
                if (status === daum.maps.services.Status.OK) {
                    $(document).on('click','#map_view_btn_ok',function(){
                    	$("#addr").html(addr)
                    	$("#history_addr").val(history_addr)
                    })
                                       
                    document.getElementById('x_pos').value=result[0].x
                    document.getElementById('y_pos').value=result[0].y
            	}
            };
            geocoder.addressSearch(addr, callback);
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">법정동 주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';

	            marker2.setPosition(mouseEvent.latLng);
	            marker2.setMap(map);
	            infowindow.setContent(content);
	            infowindow.open(map, marker2);
	        }   
	    });
	});
	
	function searchAddrFromCoords(coords, callback) {
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}

	function searchDetailAddrFromCoords(coords, callback) {
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
</script>
	
	</div>
	<div id="map_view_bottom">
		<input type="button" value="확인" onclick="map_view_btn_ok()" id="map_view_btn_ok">
		<input type="button" value="취소" id="map_view_btn_cancel"> 
	</div>
</div>




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
			data : {'member_num' : ${member_num}
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
			data : {'member_num' : ${member_num}
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


	<div id="history">
		<div id="history_top">
			<div id="profile_img">
				<img src="resources/profile_img/${mdto.profile_img }" style="width:100%; height:100%; border-radius: 250px;">
			</div>
			<div id="history_info">
				<span style="font-size:30px;">${mdto.nickName }</span><button id="logout_btn" onclick="location.href='logout'">로그아웃</button> <button id="logout_btn" onclick="location.href='delete_modify'">정보수정</button><br><br>
				<span>게시물 ${mdto.history_qtt }</span>
				<span id="follower" style="margin-left:5%; cursor:pointer;">팔로워 ${mdto.follow_qtt }</span>
				<span id="following" style="margin-left:5%; cursor:pointer;">팔로잉 ${mdto.following_qtt }</span><br><br>
				<span style="font-weight:bold;">${mdto.name }</span><br><br>
				<span style="-webkit-animation: hsr_subject_blink 5s linear infinite;">안녕하세용 ㅎㅎ</span>
				<span style="float:right;"><button id="history_info_update">+</button></span>
			</div>
		</div>
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


	<div id="history_view_share_div">
		<div id="share_profile_img"></div>
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
		$("#history_info_share").remove()
		$("#history_view_map").remove()		
	})
	
	$(document).on('click', '#mask2', function(){
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
				history_info_header_html+="<button id='delete_history' style='float:right; border:1px solid black; margin:15px 5px 0 0; background:#EAEAEA; border-radius:5px; cursor:pointer;'>삭제</button>"		
				$("#history_info_content").html(history_content) 
				$(document).on('click','#delete_history',function(){
					if(confirm("삭제하시겠습니까?")==1){
						location.href="history_delete?history_num="+history_num
					}else{
						return false
					}
				})
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
						history_share_html +=	"<img src='resources/icon/share_icon.PNG' onclick='share_click()' style='width:80%; height:80%; cursor:pointer;'>"
						history_share_html +="</div>"
					$("#history_info_like_comment").append(history_share_html)	
				}
				
				$("#history_info_header").append(history_info_header_html)
				
				
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
			
		
		
		
		<!-- if button click DDAN -->
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
	
<!-- <div id="share_content_view" style="position:absolute; z-index:10000; width:90%; height:100%; margin-left:5%; border:1px solid black; background:white;">
	<div id="share_member_info" style="width:100%; height:40%; border:1px solid red;">
		<span id="share_member_profile_img" style="width:30%">profile_img</span>
		<span id="share_member_nickName">nickName</span>
	</div>
	<div id="share_content_info" style="width:100%; height:60%">
		history_content
	</div>
</div> -->
	
	
<!-- if img_view click DDAN -->



<div id="history_view">
		<div id="history_view_file">
			<div class="slider">
			<img src="resources/icon/left 2.png" id="file_prev" style="position: absolute; top:45%; left:1.5%; font-size:40px; width:30px; height:30px; cursor:pointer; display:none;">
				<!-- <img src="resources/history_upload_file/박서준.jpg" style="height:500px;">
				<img src="resources/history_upload_file/박서준.jpg" style="height:500px;"> -->
			</div>
		</div>
		<div id="history_info_body">
			<div id="history_info_header" >
				
			</div>
			<div id="history_info_addr">
			 	<span id="history_info_addr_text" class="history_addr" style="margin-left:2%; cursor:pointer; font-weight:bold">
			 	</span>			 	
			</div>
			<div id="history_info_center">
				<div id="history_info_content">
				</div>
				<div id="history_info_hash_tag">
				aaaaaa
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
							
							
							
							
							
							
							<!-- <div id="history_info_share">
								<img src="resources/icon/Talk2.jpg" onclick="share_click()" style="width:80%; height:80%; cursor:pointer;">
							</div> -->
							
							
							
							
							
							
							
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
<script type="text/javascript">
$(document).ready(function(){
	
})
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style media="screen">
 *{margin:0; padding:0;}
body{overflow-y:hidden;}
div{ width: 100vw;height: 100vh;}
#contents1{ background: #63C3B0; /* fallback for old browsers */
 /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to right, #63C3B0, #CDEDE4);  }
#contents2{ background: #77a1d3; /* fallback for old browsers */
 /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to right, #77a1d3, #79cbca); }
#contents3{ background: #DDC8EC; /* fallback for old browsers */
 /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to right, #DDC8EC, #FAEFF7); }
#contents4{ background: #B2D4DA; /* fallback for old browsers */
 /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to right, #B2D4DA, #F6ECE8); }
    </style>
    <style type="text/css">
       span {
      font-size: 3em;
      font-style: normal;
      color: #fff;
   }
      h1 {
      font-size: 5em;
      font-style: normal;
      color: #fff;
   }
        h2 {
      font-size: 1em;
      font-style: normal;
      color: #fff;
   }


button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:5%;
  width:15%;
  font-size:0.5em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

//////////////////////////////////////////////
@keyframes fadeInUp {    from {        transform: translate3d(0,100%,0)    }
    to {        transform: translate3d(0,0,0);        opacity: 1    }}

@-webkit-keyframes fadeInUp {    from {        transform: translate3d(0,100%,0)    }
    to {        transform: translate3d(0,0,0); opacity: 1 }}

.animatedFadeInUp { opacity: 0}

.fadeInUp { opacity: 0; animation-name: fadeInUp; -webkit-animation-name: fadeInUp;}






@-webkit-keyframes lightSpeedIn {  from {    -webkit-transform: translate3d(100%, 0, 0) skewX(-30deg);    transform: translate3d(100%, 0, 0) skewX(-30deg);   opacity: 0; }
  60% {   -webkit-transform: skewX(20deg);    transform: skewX(20deg);   opacity: 1; }

  80% {  -webkit-transform: skewX(-5deg);  transform: skewX(-5deg);}

  to {  -webkit-transform: translate3d(0, 0, 0); transform: translate3d(0, 0, 0); }}

@keyframes lightSpeedIn {
  from {    -webkit-transform: translate3d(100%, 0, 0) skewX(-30deg);    transform: translate3d(100%, 0, 0) skewX(-30deg);    opacity: 0;  }
  60% {   -webkit-transform: skewX(20deg);   transform: skewX(20deg);  opacity: 1;  } 
  80% {  -webkit-transform: skewX(-5deg);   transform: skewX(-5deg);  }
  to {   -webkit-transform: translate3d(0, 0, 0);  transform: translate3d(0, 0, 0);  }}

.lightSpeedIn { -webkit-animation-name: lightSpeedIn; animation-name: lightSpeedIn; -webkit-animation-timing-function: ease-out; animation-timing-function: ease-out;}





#content {    
  position:absolute;
  height:13%; 
  width:30%;
  margin:-200px 0px 0px -400px;
  top: 50%; 
  left: 50%;
  background-color: #f5f5f5;
  border: 1px dotted #000000;
  padding:15px;
}



@-webkit-keyframes flipInY {
  from { -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 90deg);  transform: perspective(400px) rotate3d(0, 1, 0, 90deg);  -webkit-animation-timing-function: ease-in;   animation-timing-function: ease-in;   opacity: 0;}

  40% {    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -20deg);   transform: perspective(400px) rotate3d(0, 1, 0, -20deg);   -webkit-animation-timing-function: ease-in;   animation-timing-function: ease-in; }

  60% {    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 10deg);    transform: perspective(400px) rotate3d(0, 1, 0, 10deg);    opacity: 1; }

  80% {   -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -5deg);    transform: perspective(400px) rotate3d(0, 1, 0, -5deg); }

  to {    -webkit-transform: perspective(400px);   transform: perspective(400px); }}

@keyframes flipInY {
  from {   -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 90deg);   transform: perspective(400px) rotate3d(0, 1, 0, 90deg);   -webkit-animation-timing-function: ease-in;   animation-timing-function: ease-in;    opacity: 0;  }

  40% {   -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -20deg);   transform: perspective(400px) rotate3d(0, 1, 0, -20deg);   -webkit-animation-timing-function: ease-in;   animation-timing-function: ease-in; }

  60% {    -webkit-transform: perspective(400px) rotate3d(0, 1, 0, 10deg);    transform: perspective(400px) rotate3d(0, 1, 0, 10deg);    opacity: 1;  }

  80% { -webkit-transform: perspective(400px) rotate3d(0, 1, 0, -5deg);    transform: perspective(400px) rotate3d(0, 1, 0, -5deg);  }

  to {   -webkit-transform: perspective(400px);    transform: perspective(400px);  }}

.flipInY {  -webkit-backface-visibility: visible !important;  backface-visibility: visible !important;  -webkit-animation-name: flipInY;  animation-name: flipInY;}

.img img:nth-of-type(1) { animation-delay: 0.5s;}
.img img:nth-of-type(2) { animation-delay: 0.8s;}
.img img:nth-of-type(3) { animation-delay: 1.1s;}
.img img:nth-of-type(6) { animation-delay: 1.4s;}
.img img:nth-of-type(5) { animation-delay: 1.7s;}
.img img:nth-of-type(4) { animation-delay: 2s;}
.img h2:nth-of-type(1) { animation-delay: 0.5s;}
.img h2:nth-of-type(2) { animation-delay: 0.8s;}
.img h2:nth-of-type(3) { animation-delay: 1.1s;}
.img h2:nth-of-type(6) { animation-delay: 1.4s;}
.img h2:nth-of-type(5) { animation-delay: 1.7s;}
.img h2:nth-of-type(4) { animation-delay: 2s;}

    </style>
<meta charset="EUC-KR"> <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
<script src="resources/jquery/jquery-3.3.1.min..js"></script><!--jquery 등록  -->
 <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
   $(document).on("mouseover","#fy",function(){
      $("#img").fadeIn()
   })
})
</script>
<script type="text/javascript">
$(document).ready(function () {
   var count=0;// 페이지 마다 행동을 다르게 주기위함
   var move=0;//이동에 제약을 주기 위함
    $("body").on('mousewheel',function(c){
       c.preventDefault();
       var m=c.originalEvent.wheelDelta;
       var sb=$("#contents1").height();
       var body=$("html,body");
      if(m>1 && move==0 &&count >=1 ){
         move=1;
         count--;
         $("#foo1").html("")
         $("#foo2").html("")
         $("#foo3").html("")
         $("#foo4").html("")
         scroll(count);
   
      }else if(m<1 && move==0 &&count < 3 ){
         move=1;
         count++;
      //   alert("work?")
         scroll(count);
         
      }
      
      function scroll(count){
         $("#foo1").html("")
          $("#foo2").html("")
          $("#foo3").html("")
          $("#foo4").html("")
         body.stop().animate({scrollTop:sb*count},700)
         $.when(body).then(function() {
           // alert(count)
             //   alert("\(o.o)/````\(@.@)/`````\(6.6)/")
                move=0;
                var htmla="";
               if(count==0){
                    //   $("#foo2").html("")
                  htmla="<h1 class='animated animatedFadeInUp fadeInUp' style='position:absolute; align:center; top:40%; left:30%;'>Well Come To Level</h1>"
                     htmla+="<span style='position:relative; width:350px; top:60%; left:40%;'><button id='login'>로그인</button></span><br><span style=' position: relative; top:65%; left:40%;'><button id='login'>회원가입</button></span>"
                              $("#foo1").append(htmla);
                  }
               else  if(count==1){
               //   alert("\(1.1)/````\(@.@)/`````\(6.6)/")
                     htmla="<h1 class='animated animatedFadeInUp fadeInUp' style='position:absolute; align:center; top:140%; left:35%;'>What's This?</h1><span class='animated animatedFadeInUp fadeInUp' style='position:absolute; align:center; top:151%; left:32%;'>당신의 일상을 공유하세요!</span>"
                     htmla+="<div class='img' ><img id='fy'class='animated flipInY' src='resources/icon/picture.png' style='position: absolute;width:10%; height:10%; top:145%; left:10%;'><h2 class='animated flipInY'style='position: absolute;align:center; top:156%; left:14%;'>사진</h2><img class='animated flipInY' src='resources/icon/video.png' style='position: absolute;width:10%; height:10%; top:115%; left:32%;'><h2 class='animated flipInY'style='position: absolute;align:center; top:126%; left:35%;'>비디오</h2><img  class='animated flipInY'src='resources/icon/text.png'style='position: absolute;width:10%; height:10%; top:115%; left:60%;'><h2 class='animated flipInY'style='position: absolute;align:center; top:126%; left:64.5%;'>글</h2>"
                     htmla+="<img  class='animated flipInY'src='resources/icon/chat.png' style='position: absolute;width:10%; height:10%; top:175%; left:32%;''><h2 class='animated flipInY'style='position: absolute;align:center; top:186%; left:36%;'>채팅</h2><img  class='animated flipInY'src='resources/icon/map.png' style='position: absolute;width:10%; height:10%; top:175%; left:60%;'><h2 class='animated flipInY'style='position: absolute;align:center; top:186%; left:64%;'>매핑</h2><img  class='animated flipInY'src='resources/icon/mail.png' style='position: absolute;width:10%; height:10%; top:145%; left:80%;'><h2 class='animated flipInY'style='position: absolute;align:center; top:156%; left:84%;'>쪽지</h2></div>"
                   $("#foo2").append(htmla);
                }else if(count==2){
                //    alert("\(2.2)/````\(@.@)/`````\(6.6)/")
                          htmla="<h1 class='animated animatedFadeInUp fadeInUp' style='position:absolute; align:center; top:240%; left:40%;'>You Got It?</h1><span class='animated animatedFadeInUp fadeInUp' style='position:absolute; align:center; top:251%; left:42%;'>어때요? 참 쉽죠!</span>"
                           htmla+="<div ><img id='fy'class='animated flipInY' src='resources/icon/picture.png' style='position: absolute;width:10%; height:10%; top:145%; left:10%;'><h2 class='animated flipInY'style='position: absolute;align:center; top:156%; left:14%;'>사진</h2><img class='animated flipInY' src='resources/icon/video.png' style='position: absolute;width:10%; height:10%; top:115%; left:32%;'><h2 class='animated flipInY'style='position: absolute;align:center; top:126%; left:35%;'>비디오</h2><img  class='animated flipInY'src='resources/icon/text.png'style='position: absolute;width:10%; height:10%; top:115%; left:60%;'><h2 class='animated flipInY'style='position: absolute;align:center; top:126%; left:64.5%;'>글</h2>"
                           htmla+="<img  class='animated flipInY'src='resources/icon/up.png' style='position: absolute;width:7%; height:7%; top:205%; left:65%;''><h1 class='animated flipInY'style='position: absolute;align:center; top:202%; left:73%;'>NO!</h1><img  class='animated flipInY'src='resources/icon/down.png' style='position: absolute;width:7%; height:7%; top:285%; left:65%;'><h1 class='animated flipInY'style='position: absolute;align:center; top:282%; left:73%;'>Yes!</h1></div>"
                         $("#foo3").append(htmla);
                }else if(count==3){
                //   alert("\(3.3)/````\(@.@)/`````\(6.6)/")
                    htmla="<h1 class='animated animatedFadeInUp fadeInUp' style='position:absolute; align:center; top:330%; left:35%;'>Get Set Ready?</h1>"
                       htmla+="<span style='position:relative; width:350px; top:50%; left:43%;'><button id='login'>로그인</button></span><br><span style=' position: relative; top:55%; left:43%;'><button id='login'>회원가입</button></span>"
                                    $("#foo4").append(htmla);
                        }
            });
         };
      
         
    })//mousewheel
     if(count==0){
        htmla="<h1 class='animated animatedFadeInUp fadeInUp' style='position:absolute; align:center; top:40%; left:30%;'>Well Come To Level</h1>"
           htmla+="<span style='position:relative; width:350px; top:60%; left:40%;'><button id='login'>로그인</button></span><br><span style=' position: relative; top:65%; left:40%;'><button id='login'>회원가입</button></span>"
           $("#foo1").append(htmla);
        }
});//ready
    </script> 
    <script type="text/javascript">
    $(document).ready(function(){
    	$(document).on('click','#login',function(){
    		location.href="main"
    	})
    })
    </script>
</head>
<body>
   <div id="container" >
      <div id="contents1" class="height_fix">
      <div id="foo1" >
      
      </div>
        </div>     
      <div id="contents2" class="height_fix">2
      <div id="foo2" ></div>
        </div>
      <div id="contents3" class="height_fix">3
      <div id="foo3" ></div>
      </div>
      <div id="contents4" class="height_fix">4
      <div id="foo4" ></div></div>
   </div>
</body>
</html>
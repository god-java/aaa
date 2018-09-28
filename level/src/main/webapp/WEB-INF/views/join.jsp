<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#join{width:800px; margin:200px auto;}
#join_div div{height:50px;}
#join_div input[type='text'],#join_div input[type='password'],#join_div input[type='email']{width:100%; height:30px;}
#joinOk_btn,#loginOk_btn{width:74px; height:41px; position: relative; top:81px; left:113px; border-radius: 30px; outline:none; border:none;
background:white; cursor:pointer; -webkit-transition-duration:0.5s; line-height:41px; font-size:1.5em; font-weight: bold;}
#joinOk_btn:hover{background:#EAEAEA; color:gray;}
#loginOk_btn:hover{background:#EAEAEA; color:gray;}
#login_btn, #join_btn{border:none; outline:none; background:white; cursor:pointer;}
</style>
<script type="text/javascript">
if(${member_num}!=null){
	location.href="allHistory"	
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#joinOk_btn").click(function(){
		if(!$("#email").val()){
			alert("이메일을 입력해주세요")
			$("#email").focus()
		}else if(!$("#name").val()){
			alert("이름을 입력해주세요")
			$("#name").focus()
		}else if(!$("#nickName").val()){
			alert("닉네임을 입력해주세요")
			$("#nickName").focus()
		}else if(!$("#password").val()){
			alert("비밀번호를 입력해주세요")
			$("#password").focus()
		}else if(!$("#phone2").val()){
			alert("전화번호를 입력해주세요")
			$("#phone2").focus()
		}else if(!$("#phone3").val()){
			alert("전화번호를 입력해주세요")
			$("#phone3").focus()
		} 
	})
/* 	$("#phone3").keydown(function(e){
		if(e.keyCode=='13'){
			$.ajax({
				url : 'joinOk',
				type : 'post',
				data : {'email' : $("#email").val(),
						'name' : $("#name").val(),
						'nickName' : $("#nickName").val(),
						'password' : $("#password").val(),
						'phone1' : $("#phone1").val(),
						'phone2' : $("#phone2").val(),
						'phone3' : $("#phone3").val(),},
				success : function(data){
					var res = data
					if(res==0){
						
						location.href="myHistory"
					}else{
						alert("중복된 아이디가 있습니다.")
					}
				}
			})
		}
	}) */
	$("#joinOk_btn").click(function(){
		$.ajax({
			url : 'joinOk',
			type : 'post',
			dataType : 'json',
			data : {'email' : $("#email").val(),
					'name' : $("#name").val(),
					'nickName' : $("#nickName").val(),
					'password' : $("#password").val(),
					'phone1' : $("#phone1").val(),
					'phone2' : $("#phone2").val(),
					'phone3' : $("#phone3").val(),},
			success : function(data){
				var res = data

				if(res==0){
					location.href="myHistory"
					return false;
				}else{
					alert("중복된 아이디가 있습니다.")
				}
			}
		})
	})
	
	
	
	$("#login_btn").click(function(){
		$("#join_window").hide()
		$("#login_window").fadeIn()
		$("#joinOk_btn").hide()
		$("#loginOk_btn").fadeIn()
		$("#find_email").hide()
		$("#findOk_email_btn").hide()
		$("#find_pw").hide()
		$("#findOk_pw_btn").hide()
	})
	$("#join_btn").click(function(){
		$("#login_window").hide()
		$("#join_window").fadeIn()
		$("#loginOk_btn").hide()
		$("#joinOk_btn").fadeIn()
		$("#find_email").hide()
		$("#findOk_email_btn").hide()
		$("#find_pw").hide()
		$("#findOk_pw_btn").hide()
	})
	$("#find_email_btn").click(function(){
		$("#login_window").hide()
		$("#join_window").hide()
		$("#loginOk_btn").hide()
		$("#joinOk_btn").hide()
		$("#find_email").fadeIn()
		$("#findOk_email_btn").fadeIn()
		$("#find_pw").hide()
		$("#findOk_pw_btn").hide()
	})
	$("#find_pw_btn").click(function(){
		$("#login_window").hide()
		$("#join_window").hide()
		$("#loginOk_btn").hide()
		$("#joinOk_btn").hide()
		$("#find_email").hide()
		$("#findOk_email_btn").hide()
		$("#find_pw").fadeIn()
		$("#findOk_pw_btn").fadeIn()
	})
	
	$("#loginOk_btn").click(function(){
		
		var regExp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		$.ajax({
			url : 'loginOk',
			type : 'post',
			dataType : 'json',
			data : {'email' : $("#login_email").val(),
					'password' : $("#login_password").val()},
			success : function(data){
				var res = data.res
				var member_num = data.member_num
				alert(JSON.stringify(data))

				if(res==0){
					alert("존재하지 않는 계정입니다.")
					return false;
				}else if(res==1){
					var sock = new WebSocket("ws://211.173.168.66:8181/level/echo-ws")
					sock.onopen = function(){
						sock.send("access/"+member_num)
					}
					
					location.href="allHistory"
				}else{
					alert("비밀번호가 틀렸습니다.")

					return false;
				}
			}
		})
	})
	$("#login_password").keydown(function(e){
		if(e.keyCode=='13'){
			$.ajax({
				url : 'loginOk',
				type : 'post',
				data : {'email' : $("#login_email").val(),
						'password' : $("#login_password").val()},
				success : function(data){
					var res = data
					if(res==0){
						alert("존재하지 않는 계정입니다.")
						return false;
					}else if(res==1){
						location.href="allHistory"
					}else{
						alert("비밀번호가 틀렸습니다.")
						return false;
					}
				}
			})
		}
	})
	$(document).on('click','#findOk_email_btn', function(){
		$.ajax({
			url : 'findOk_email',
			type : 'get',
			data : {'nickName' : $("#find_email_nickName").val(),
				'name' : $("#find_email_name").val(),
				'phone1' : $("#find_email_phone1").val(),
				'phone2' : $("#find_email_phone2").val(),
				'phone3' : $("#find_email_phone3").val()},
			success : function(data){
				var res = data
				if(res!='x'){
					alert("입력하신 닉네임에 해당하는 이메일은 [" + data + "] 입니다.")
				}else{
					alert("존재하지 않는 닉네임입니다.")
					return false;
				}
			},
			error : function(error){
				alert("error")
			}
		})
	})
	$(document).on('click','#findOk_pw_btn', function(){
		$.ajax({
			url : 'findOk_password',
			type : 'get',
			data : {'name' : $("#find_pw_name").val(),
					'email' : $("#find_pw_email").val(),
					'nickName' : $("#find_pw_nickName").val(),
					'phone1' : $("#find_pw_phone1").val(),
					'phone2' : $("#find_pw_phone2").val(),
					'phone3' : $("#find_pw_phone3").val()},
			success : function(data){
				var res = data
				if(res!='x'){
					alert("입력하신 이메일로 비밀번호가 발송 되었습니다.")
				}else{
					alert("존재하지 않는 계정입니다.")
					return false;
				}
			},
			error : function(error){
				alert("error")
			}
		})
	})
})
</script>
<!-- <script type="text/javascript">
$(document).ready(function(){
	$(document).('keyup',"#password2", function(){
		
	})
})
</script> -->
</head>
<body>
<img src="resources/background_img/background 10.png" style="position: absolute; left:0; top:0; width:100%; height:100%; z-index:-1;">
<div id="join">
	<img src="resources/스마트폰.png" style="width:700px; height:700px;">
	<form>
	<div id="join_div" style="width:300px; position: relative; top:-600px; left:200px;">
		<div style="height:120px;">
			<img src="resources/로고.jpg" style="width:100%; height:90px;">
		</div>
		<div id="join_window" style="height:345px;"> 
			<div style=" /* line-height:100px;  */text-align:center;">
				<span style="font-size:2em;">회원가입</span>
			</div>
			<div>
				<input type="email" placeholder="이메일 주소" name="email" id="email">
			</div>
			<div>
				<input type="text" placeholder="성명" name="name" id="name">
			</div>
			<div>
				<input type="text" placeholder="닉네임" name="nickName" id="nickName">
			</div>
			<div>
				<input type="password" placeholder="비밀번호" name="password" id="password">
			</div>
			<div>
				<input type="password" placeholder="비밀번호 확인" name="password2" id="password2">
			</div>
			<div>
				<select name="phone1" style="width:20%; height:35px;" id="phone1">
					<option>010</option>
				</select>-
				<input type="text" id="phone2" placeholder="xxxx" name="phone2" style="width:33%;">-
				<input type="text" id="phone3" placeholder="xxxx" name="phone3" style="width:33%;">
			</div>
			
		</div>
		<div id="login_window" style="display:none; height:345px;">
			<div style="height:100px; line-height:100px; text-align:center;">
				<span style="font-size:2em;">로그인</span>
			</div>
			<div>
				<input type="email" placeholder="이메일 주소" name="email" id="login_email">
			</div>
			<div>
				<input type="password" placeholder="비밀번호" name="password" id="login_password">
			</div>
		</div>
		<div id="find_email" style="display:none; height:345px;">
			<div style="height:100px; line-height:100px; text-align:center;">
				<span style="font-size:2em;">이메일 찾기</span>
			</div>
			<div>
				<input type="text" placeholder="성명" name="name" id="find_email_name">
			</div>
			<div>
				<input type="text" placeholder="닉네임" name="nickName" id="find_email_nickName">
			</div>
			<div>
				<select name="phone1" style="width:20%; height:35px;" id="find_email_phone1">
					<option>010</option>
				</select>-
				<input type="text" id="find_email_phone2" placeholder="xxxx" name="phone2" style="width:33%;">-
				<input type="text" id="find_email_phone3" placeholder="xxxx" name="phone3" style="width:33%;">
			</div>
		</div>
		<div id="find_pw" style="display:none; height:345px;">
			<div style="height:100px; line-height:100px; text-align:center;">
				<span style="font-size:2em;">비밀번호 찾기</span>
			</div>
			<div>
				<input type="email" placeholder="이메일 주소" name="email" id="find_pw_email">
			</div>
			<div>
				<input type="text" placeholder="닉네임" name="nickName" id="find_pw_nickName">
			</div>
			<div>
				<input type="text" placeholder="성명" name="name" id="find_pw_name">
			</div>
			<div>
				<select name="phone1" style="width:20%; height:35px;" id="find_pw_phone1">
					<option>010</option>
				</select>-
				<input type="text" id="find_pw_phone2" placeholder="xxxx" name="phone2" style="width:33%;">-
				<input type="text" id="find_pw_phone3" placeholder="xxxx" name="phone3" style="width:33%;">
			</div>
		</div>
		<div style="width:100%; text-align:center; height:1px; border-top:1px solid #D8D8D8; line-height:30px;">
			<span><input type="button" id="login_btn" value="로그인"></span> | <span><input type="button" id="join_btn" value="회원가입"></span><br>
			<span><input type="button" id="find_email_btn" value="이메일 찾기"></span> | <span><input type="button" id="find_pw_btn" value="비밀번호 찾기"></span>
		</div>
		<div>
			<input type="submit" value="JOIN" id="joinOk_btn">
			<input type="button" id="loginOk_btn" style="display:none;" value="LOGIN">
			<input type="button" id="findOk_email_btn" value="E_F" style="display:none;"><!-- F_E_O</button> -->
			<input type="button" id="findOk_pw_btn" value="P_F" style="display:none;">
		</div>
	</div>
	</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#delete_modify{position:relative; border:1px solid #D8D8D8; width:100%; height:800px; margin:100px auto; display:flex; flex-direction: row;}
#delete_modify_left{ width:20%; height:100%; border-right:1px solid #D8D8D8;}
#delete_modify_right{ width:80%; height:100%; }
#td_left{width:20%; height:90px; text-align:center; line-height:50px; font-weight:bolder;}
#td_right{width:80%; height:90px;}
input[type='text']{width:100px; height:35px;}
#delete_main_table td{text-align:center; line-height:50px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	// -- 각각 취소 버튼을 눌렀을시 delete_modify화면을 띄움 -- 
	
	 $("#profile_modify_main_cancle_btn").click(function(){
		location.href="delete_modify"
	}) 
	$("#delete_main_cancle_btn").click(function(){
		location.href="delete_modify"
	})
	$("#password_modify_main_cancle_btn").click(function(){
		location.href="delete_modify"
	})
	$("#delete_main_cancle_btn2").click(function(){
		location.href="delete_modify"
	})
	$("#password_modify_main_cancle_btn2").click(function(){
		location.href="delete_modify"
	})
	
	// -- 왼쪽의 버튼을 선택했을시 오른쪽 화면의 변경 -- 
	
	$("#profile_modify_btn").click(function(){
		$("#profile_modify_main").fadeIn()
		$("#delete_main").hide()
		$("#password_modify_main").hide()
	})
	$("#delete_btn").click(function(){
		$("#profile_modify_main").hide()
		$("#delete_main").fadeIn()
		$("#password_modify_main").hide()
	})
	$("#password_modify_main_btn").click(function(){
		$("#profile_modify_main").hide()
		$("#delete_main").hide()
		$("#password_modify_main").fadeIn()
	})
	
	// -- 해당 값을 입력하지 않을시 메세지 문 출력 후 그 값으로 focus를 준다.
	
	$("#profile_modify_main_btn").click(function(){
		if(!$("#profile_modify_main_name").val()){
			alert("이름을 입력해주세요")
			$("#profile_modify_main_name").focus()
		}else if(!$("#profile_modify_main_phone2").val()){
			alert("전화번호를 입력해주세요")
			$("#profile_modify_main_phone2").focus()
		}else if(!$("#profile_modify_main_phone3").val()){
			alert("전화번호를 입력해주세요")
			$("#profile_modify_main_phone3").focus()
		} 
	})
	$("#delete_main_btn").click(function(){
		if(!$("#delete_main_password").val()){
			alert("비밀번호를 입력해주세요")
			$("#delete_main_password").focus()
		}
	})
	$("#password_modify_mainOk_btn").click(function(){
		if(!$("#password_modify_main_pw").val()){
			alert("현재 비밀번호를 입력해주세요")
			$("#password_modify_main_pw").focus()
		}
	})
	
	
	$(document).on('click', '#profile_modify_main_btn', function(){
		$.ajax({
			url : 'profile_modifyOk',
			type : 'post',
			dateType: 'json',
			data : {
				'name' : $("#profile_modify_main_name").val(),
				'member_num' : ${member_num},
				'introduce' : $("#profile_modify_main_introduce").val(),
				'phone1' : $("#profile_modify_main_phone1").val(),
				'phone2' : $("#profile_modify_main_phone2").val(),
				'phone3' : $("#profile_modify_main_phone3").val()
			},
			success : function(data){
				alert("수정이 완료되었습니다.")
				location.href="myHistory"
			}
		})
	})
	
	$(document).on('click', '#delete_main_btn', function(){
	 	$.ajax({
			url : 'delete_member',
			type : 'post',
			data : {
				'member_num' : ${member_num},
				'password' : $("#delete_main_password").val()
			},
			success : function(data){
				var res = data
				if(res!='x'){
					alert("인증번호가 발송되었습니다.")
					$("#delete_main_Ok").fadeIn()
				}else{
					alert("비밀번호가 틀렸습니다.")
				}
				
			}
		})
	})
	
	$(document).on('click', '#delete_main_Ok_btn', function(){
		$.ajax({
			url : 'delete_Ok_member',
			type : 'post',
			data : {
				'member_num' : ${member_num},
				'leave_code' : $("#delete_main_Ok_code").val()
			},
			success : function(data){
				var res = data
				if(res!='x'){
					alert("탈퇴되었습니다.")
					location.href="main"
				}else{
					alert("인증번호가 맞지 않습니다.")
				}
			}
		})
	})
	
	
	
	
	
	
	
	
	
	$(document).on('click', '#password_modify_mainOk_btn', function(){
		$.ajax({
			url : 'password_modifyOk',
			type : 'post',
			data : {
				'member_num' : ${member_num},
				'password' : $("#password_modify_main_pw").val()
			},
			success : function(data){
				var res = data
				if(res!='x'){
					alert("비밀번호 확인이 완료되었습니다.")
					$("#password_modify_main2").fadeIn()
				}else if(!$("#password_modify_main_pw").val()){
					alert("비밀번호를 입력해주세요.")
				}else if(res=='x'){
					alert("비밀번호가 틀렸습니다.")
				}
			}
		})
	})
	
	$(document).on('click', '#password_modify_mainOk_btn2', function(){
		$.ajax({
			url : 'password_modifyOk2',
			type : 'post',
			data : {
				'member_num' : ${member_num},
				'password' : $("#password_modify_main_pw2").val()
			},
			success : function(data){
					alert("비밀번호가 재설정되었습니다.")
					location.href="main"
			}
		})
	})
})








</script>
</head>
<body>
<div id="delete_modify">
	<div id="delete_modify_left">
		<div id="profile_modify" align="center" style="width:100%; height:5%; border-bottom:1px solid #D8D8D8; margin:25px auto;">
			<button id="profile_modify_btn" style="border:none; background:white; cursor:pointer; outline:#D8D8D8;">프로필 수정</button>
		</div>
		<div id="delete" align="center" style="width:100%; height:5%; border-bottom:1px solid #D8D8D8; margin:25px auto;">
			<button id="delete_btn" style="border:none; background:white; cursor:pointer; outline:silver;">회원탈퇴</button>
		</div>
		<div id="password_modify" align="center" style="width:100%; height:5%; border-bottom:1px solid #D8D8D8; margin:25px auto">
			<button id="password_modify_main_btn" style="border:none; background:white; cursor:pointer; outline:silver;">비밀번호 변경</button>
		</div>
	</div> 
	
	
	<div id="delete_modify_right">
		<div id="profile_modify_main">
			<table style="width:100%; height:100%;">
				<tr>
					<td id="td_left">
					<img src="resources/profile_img/${mdto.profile_img }" style="width:70px; height:70px; border-radius: 100%; margin-top:15px;">
					</td>
					<td id="td_right"><input type="text" value="${mdto.nickName }" style="border:none; background:white;" disabled="disabled"></td>
				</tr>
				<tr>
					<td id="td_left">이름</td>
					<td id="td_right"><input type="text" id="profile_modify_main_name" placeholder="이름" style="width:30%;"></td>
				</tr>
				<tr>
					<td id="td_left">이메일</td>
					<td id="td_right"><input type="text" value="${mdto.email }" style="border:none; width:30%; background:white;" disabled="disabled"></td>
				</tr>
				<tr>
					<td id="td_left">소개글</td>
					<td id="td_right"><textarea id="profile_modify_main_introduce" rows="12" cols="69" placeholder="소개글" name="introduce"></textarea></td>
				</tr>
				<tr>
					<td id="td_left">전화번호</td>
					<td id="td_right">
					<select name="phone1" style="width:90px; height:41.5px;" id="profile_modify_main_phone1">
					<option>010</option>
					</select>-
					<input type="text" id="profile_modify_main_phone2" placeholder="xxxx" name="phone2" style="width:90px; height:35px;">-
					<input type="text" id="profile_modify_main_phone3" placeholder="xxxx" name="phone3" style="width:90px; height:35px;"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id="profile_modify_main_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">프로필 수정</button>  |  
						<button id="profile_modify_main_cancle_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">취소</button>
					</td>
				</tr>
			</table>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<div id="delete_main" style="display:none;">
			<table style="width:100%; height:100%;">
				<tr>
					<td id="td_left">
					<img src="resources/profile_img/${mdto.profile_img }" style="width:70px; height:70px; border-radius: 100%; margin-top:15px;">
					</td>
					<td id="td_right"><input type="text" value="${mdto.nickName }" style="border:none; background:white;" disabled="disabled"></td>
				</tr>
				<tr>
					<td id="td_left">이름</td>
					<td id="td_right"><input type="text" value="${mdto.name }" style="border:none; background:white;" disabled="disabled"></td>
				</tr>
				<tr>
					<td id="td_left">이메일</td>
					<td id="td_right"><input type="text" value="${mdto.email }" style="border:none; width:30%; background:white;" disabled="disabled"></td>
				</tr>
				<tr>
					<td id="td_left" style="height:30px; color:red; ">*주의 사항*</td>
					<td id="td_right" style="height:30px;">1. 계정을 삭제함으로써 생기는 모든 불이익은 본인에게 책임이 있습니다.</td>
				</tr>
				<tr>
					<td id="td_left" style="height:30px;"></td>
					<td id="td_right" style="height:30px;">2. level은 계정 삭제이후 생기는 그 어떠한 일에도 책임을 지지 않습니다.</td>
				</tr>
				<tr>
					<td id="td_left" style="height:30px;"></td>
					<td id="td_right" style="height:30px;">3. level에 업로드하였던 사진이나 게시글등은 계정탈퇴 이후 자동으로 삭제가 되며 차후 재가입을 하더라도 복구되지 않습니다.</td>
				</tr>
				<tr>
					<td id="td_left" style="height:30px;"></td>
					<td id="td_right" style="height:30px; color:red;">4. 탈퇴하기 위해서는 비밀번호를 반드시 입력해야합니다.</td>
					
				</tr>
				<tr>
					<td id="td_left" style="height:30px;"></td>
					<td id="td_right" style="height:30px; color:red; font-weight:bold;">5. 인증번호 전송이 느릴수도 있으니 기다려주시기바랍니다.</td>
					
				</tr>
				<tr>
					<td id="td_left">비밀번호</td>
					<td id="td_right"><input type="text" id="delete_main_password" placeholder="비밀번호" style="width:30%;"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id="delete_main_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">인증번호 받기</button>  |  
						<button id="delete_main_cancle_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">취소</button>
					</td>
				</tr>
			</table>
		</div>
		<div id="delete_main_Ok" style="position: fixed; width:30%; height:30%; top:35%; background:white; left:35%; border:1px solid gray; display:none;">
			<table id="delete_main_table" style="margin: 0 auto; width:100%; height:100%;">
				<tr>
					<td style="width:100%; height:50px;">인증번호 입력</td>
				</tr>
				<tr>
					<td style="width:100%; height:50px;"><input type="text" id="delete_main_Ok_code" placeholder="인증번호 입력..." style="width:80%;"></td>
				</tr>
				<tr>
					<td style="width:100%; height:50px;">
						<button id="delete_main_Ok_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">회원 탈퇴</button>
						<button id="delete_main_cancle_btn2" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">취소</button>
						
					</td>
				</tr>
			</table>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<div id ="password_modify_main" style="display:none;">
			<table style="width:100%; height:100%;">
				<tr>
					<td id="td_left">현재 비밀번호 입력</td>
					<td id="td_right">
						<input type="text" placeholder="현재 비밀번호" style="width:30%;" id="password_modify_main_pw">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id="password_modify_mainOk_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">변경</button>  |  
						<button id="password_modify_main_cancle_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">취소</button>
					</td>
				</tr>
			</table>
		</div>
			
		<div id ="password_modify_main2" style="display:none;">
			<table style="width:100%; height:100%;">
				<tr>
					<td id="td_left">비밀번호 재설정</td>
					<td id="td_right">
						<input type="text" placeholder="재설정하고자 하는 비밀번호" style="width:30%;" id="password_modify_main_pw2">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id="password_modify_mainOk_btn2" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">변경 완료</button>  |  
						<button id="password_modify_main_cancle_btn2" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">취소</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>
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
	
	// -- ���� ��� ��ư�� �������� delete_modifyȭ���� ��� -- 
	
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
	
	// -- ������ ��ư�� ���������� ������ ȭ���� ���� -- 
	
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
	
	// -- �ش� ���� �Է����� ������ �޼��� �� ��� �� �� ������ focus�� �ش�.
	
	$("#profile_modify_main_btn").click(function(){
		if(!$("#profile_modify_main_name").val()){
			alert("�̸��� �Է����ּ���")
			$("#profile_modify_main_name").focus()
		}else if(!$("#profile_modify_main_phone2").val()){
			alert("��ȭ��ȣ�� �Է����ּ���")
			$("#profile_modify_main_phone2").focus()
		}else if(!$("#profile_modify_main_phone3").val()){
			alert("��ȭ��ȣ�� �Է����ּ���")
			$("#profile_modify_main_phone3").focus()
		} 
	})
	$("#delete_main_btn").click(function(){
		if(!$("#delete_main_password").val()){
			alert("��й�ȣ�� �Է����ּ���")
			$("#delete_main_password").focus()
		}
	})
	$("#password_modify_mainOk_btn").click(function(){
		if(!$("#password_modify_main_pw").val()){
			alert("���� ��й�ȣ�� �Է����ּ���")
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
				alert("������ �Ϸ�Ǿ����ϴ�.")
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
					alert("������ȣ�� �߼۵Ǿ����ϴ�.")
					$("#delete_main_Ok").fadeIn()
				}else{
					alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.")
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
					alert("Ż��Ǿ����ϴ�.")
					location.href="main"
				}else{
					alert("������ȣ�� ���� �ʽ��ϴ�.")
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
					alert("��й�ȣ Ȯ���� �Ϸ�Ǿ����ϴ�.")
					$("#password_modify_main2").fadeIn()
				}else if(!$("#password_modify_main_pw").val()){
					alert("��й�ȣ�� �Է����ּ���.")
				}else if(res=='x'){
					alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.")
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
					alert("��й�ȣ�� �缳���Ǿ����ϴ�.")
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
			<button id="profile_modify_btn" style="border:none; background:white; cursor:pointer; outline:#D8D8D8;">������ ����</button>
		</div>
		<div id="delete" align="center" style="width:100%; height:5%; border-bottom:1px solid #D8D8D8; margin:25px auto;">
			<button id="delete_btn" style="border:none; background:white; cursor:pointer; outline:silver;">ȸ��Ż��</button>
		</div>
		<div id="password_modify" align="center" style="width:100%; height:5%; border-bottom:1px solid #D8D8D8; margin:25px auto">
			<button id="password_modify_main_btn" style="border:none; background:white; cursor:pointer; outline:silver;">��й�ȣ ����</button>
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
					<td id="td_left">�̸�</td>
					<td id="td_right"><input type="text" id="profile_modify_main_name" placeholder="�̸�" style="width:30%;"></td>
				</tr>
				<tr>
					<td id="td_left">�̸���</td>
					<td id="td_right"><input type="text" value="${mdto.email }" style="border:none; width:30%; background:white;" disabled="disabled"></td>
				</tr>
				<tr>
					<td id="td_left">�Ұ���</td>
					<td id="td_right"><textarea id="profile_modify_main_introduce" rows="12" cols="69" placeholder="�Ұ���" name="introduce"></textarea></td>
				</tr>
				<tr>
					<td id="td_left">��ȭ��ȣ</td>
					<td id="td_right">
					<select name="phone1" style="width:90px; height:41.5px;" id="profile_modify_main_phone1">
					<option>010</option>
					</select>-
					<input type="text" id="profile_modify_main_phone2" placeholder="xxxx" name="phone2" style="width:90px; height:35px;">-
					<input type="text" id="profile_modify_main_phone3" placeholder="xxxx" name="phone3" style="width:90px; height:35px;"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id="profile_modify_main_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">������ ����</button>  |  
						<button id="profile_modify_main_cancle_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">���</button>
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
					<td id="td_left">�̸�</td>
					<td id="td_right"><input type="text" value="${mdto.name }" style="border:none; background:white;" disabled="disabled"></td>
				</tr>
				<tr>
					<td id="td_left">�̸���</td>
					<td id="td_right"><input type="text" value="${mdto.email }" style="border:none; width:30%; background:white;" disabled="disabled"></td>
				</tr>
				<tr>
					<td id="td_left" style="height:30px; color:red; ">*���� ����*</td>
					<td id="td_right" style="height:30px;">1. ������ ���������ν� ����� ��� �������� ���ο��� å���� �ֽ��ϴ�.</td>
				</tr>
				<tr>
					<td id="td_left" style="height:30px;"></td>
					<td id="td_right" style="height:30px;">2. level�� ���� �������� ����� �� ��� �Ͽ��� å���� ���� �ʽ��ϴ�.</td>
				</tr>
				<tr>
					<td id="td_left" style="height:30px;"></td>
					<td id="td_right" style="height:30px;">3. level�� ���ε��Ͽ��� �����̳� �Խñ۵��� ����Ż�� ���� �ڵ����� ������ �Ǹ� ���� �簡���� �ϴ��� �������� �ʽ��ϴ�.</td>
				</tr>
				<tr>
					<td id="td_left" style="height:30px;"></td>
					<td id="td_right" style="height:30px; color:red;">4. Ż���ϱ� ���ؼ��� ��й�ȣ�� �ݵ�� �Է��ؾ��մϴ�.</td>
					
				</tr>
				<tr>
					<td id="td_left" style="height:30px;"></td>
					<td id="td_right" style="height:30px; color:red; font-weight:bold;">5. ������ȣ ������ �������� ������ ��ٷ��ֽñ�ٶ��ϴ�.</td>
					
				</tr>
				<tr>
					<td id="td_left">��й�ȣ</td>
					<td id="td_right"><input type="text" id="delete_main_password" placeholder="��й�ȣ" style="width:30%;"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id="delete_main_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">������ȣ �ޱ�</button>  |  
						<button id="delete_main_cancle_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">���</button>
					</td>
				</tr>
			</table>
		</div>
		<div id="delete_main_Ok" style="position: fixed; width:30%; height:30%; top:35%; background:white; left:35%; border:1px solid gray; display:none;">
			<table id="delete_main_table" style="margin: 0 auto; width:100%; height:100%;">
				<tr>
					<td style="width:100%; height:50px;">������ȣ �Է�</td>
				</tr>
				<tr>
					<td style="width:100%; height:50px;"><input type="text" id="delete_main_Ok_code" placeholder="������ȣ �Է�..." style="width:80%;"></td>
				</tr>
				<tr>
					<td style="width:100%; height:50px;">
						<button id="delete_main_Ok_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">ȸ�� Ż��</button>
						<button id="delete_main_cancle_btn2" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">���</button>
						
					</td>
				</tr>
			</table>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<div id ="password_modify_main" style="display:none;">
			<table style="width:100%; height:100%;">
				<tr>
					<td id="td_left">���� ��й�ȣ �Է�</td>
					<td id="td_right">
						<input type="text" placeholder="���� ��й�ȣ" style="width:30%;" id="password_modify_main_pw">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id="password_modify_mainOk_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">����</button>  |  
						<button id="password_modify_main_cancle_btn" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">���</button>
					</td>
				</tr>
			</table>
		</div>
			
		<div id ="password_modify_main2" style="display:none;">
			<table style="width:100%; height:100%;">
				<tr>
					<td id="td_left">��й�ȣ �缳��</td>
					<td id="td_right">
						<input type="text" placeholder="�缳���ϰ��� �ϴ� ��й�ȣ" style="width:30%;" id="password_modify_main_pw2">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id="password_modify_mainOk_btn2" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">���� �Ϸ�</button>  |  
						<button id="password_modify_main_cancle_btn2" style="border:none; background:white; cursor:pointer; outline:silver; margin:100px auto;">���</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>
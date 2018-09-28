<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#noteList{width:100%; height:700px; border:1px solid gray; margin:100px auto; display: inline-flex; flex-direction: row;}
#send_list_table{border-collapse: collapse; width:80%; margin:0 auto;}
#send_list_table th{ border-bottom:2px solid gray;}
#send_list_table th:first-child {width:5%;}
#send_list_table th:nth-child(2) {width:10%;}
#send_list_table th:nth-child(3) {width:60%;}
#send_list_table th:last-child {width:25%;}

#send_list_table td{text-align:center; height:30px; border-bottom:1px solid #D8D8D8;}
</style>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	var receive = ${receive}
	var send = ${send}
	var member_num = ${member_num}
	if(send==1){
		$("#send_list").show()
	}
	$(document).on('click','#send_note_list_btn', function(){
		 location.href="noteList?member_num="+member_num+"&send=1&receive=0" 
	})
	$(document).on('click','#receive_note_list_btn', function(){
		 location.href="noteList?member_num="+member_num+"&send=0&receive=1"  
	})
})
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click','#all_send_check', function(){
		if($(".note_send_check").prop('checked')){
			$(".note_send_check").prop('checked',false)
		}else{
			$(".note_send_check").prop('checked',true)
		}
	})
})
</script>
<script type="text/javascript">
	function all_delete(){
		delete_send_note_form.action = "all_delete_send_note"
			delete_send_note_form.submit()
	}
</script>
	<div id="noteList">
		<div style="width:20%; height:100%; border-right:1px solid #D8D8D8;">
			<div style="width:100%; height:50px; border-bottom:1px solid #D8D8D8; text-align:center;">
				<input type="text" style="width:80%; height:20px; margin-top:13px;" placeholder="닉네임 or 이름...">
			</div>
			<div style="width:100%; height:50px; border-bottom:1px solid #D8D8D8; text-align:center; vertical-align: middle; line-height:50px;">
				<button id="send_note_list_btn" style="border:none; background:white; cursor:pointer;">보낸 쪽지함</button>
			</div>
			<div style="width:100%; height:50px; border-bottom:1px solid #D8D8D8; text-align:center; vertical-align: middle; line-height:50px;">
				<button id="receive_note_list_btn" style="border:none; background:white; cursor:pointer;">받은 쪽지함</button>
			</div>
		</div>
		<div style="width:80%; height:100%;">
		<form name="delete_send_note_form" action="delete_send_note" method="get">
			<div id="send_list" style="width:100%; height:100%; display:none;">
				<div style="width:100%; height:95%;">
					<div style="width:100%; height:5%;">
						<span style="font-size:1.5em; font-weight:bold; margin-left:10px; margin-top:10px;">보낸 쪽지함</span>
					</div>
					<div style="width:100%; height:5%;">
						<button id="delete_btn">삭제</button>
						<input type="button" id="all_delete_btn" value="모두 삭제" onclick="javascript:all_delete()">
					</div>
					
					<table id="send_list_table">
						<tr>
							<th><input type="checkbox" id="all_send_check"></th>
							<th>WRITER</th>
							<th>SUBJECT</th>
							<th>DATE</th>
						
						</tr>
						<c:forEach var="nlist" items="${nlist }">
							<tr>
								<td><input type="checkbox" name="note_num" id="note_send_check" class="note_send_check" value="${nlist.note_num }"></td>
								<td>${nlist.nickName }</td>
								<td></td>
								<td>${nlist.send_date }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div style="width:100%; height:5%; border:1px solid #D8D8D8; line-height:35px; text-align:center;">
					<c:if test="${startPage>10 }">
						<a href="noteList?member_num=${member_num }&receive=0&send=1&pageNum=${startPage-10}">이전</a>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<a href="noteList?member_num=${member_num }&receive=0&send=1&pageNum=${i}">${i }</a>
					</c:forEach>
					<c:if test="${endPage<pageCount }">
						<a href="noteList?member_num=${member_num }&receive=0&send=1&pageNum=${endPage+1}">다음</a>
					</c:if>
				</div>
			</div>
			<input type="hidden" name="member_num" value="${member_num }">
			</form>
		</div>
	</div>
</body>
</html>
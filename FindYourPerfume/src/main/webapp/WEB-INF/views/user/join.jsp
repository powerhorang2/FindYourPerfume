<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>회원가입</title>
 <div class="container">
 <h1>회원가입</h1>
	<form id="frm" class="frm" action="/user/join" method="post" enctype="multipart/form-data" onsubmit="return userChk()">
	<table>
		<tr>
			<th>아이디</th>
			<td><div id="idChkResult" class="msg"></div>
				<div><input type="text" name="user_id" placeholder="아이디" onchange="idValue()">
				<button type="button" onclick="chkId()">중복체크</button>
			</div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="user_pw" placeholder="비밀번호"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="user_pwre" placeholder="비밀번호 확인"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nm" placeholder="닉네임"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="date" name="bd"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input type="radio" name="gender" value="1">남</td>
			<td><input type="radio" name="gender" value="2">여</td>
		</tr>
		
		<tr>
			<td>프로필 이미지</td>
			<!-- <td><input type="file" name="profile_img" accept="image/*" onchange="previewImage(this)" ><br></td> -->
			 <td><input type="file" name="file" accept="image/*" onchange="previewImage(this)" ><br></td>
			<td><div id="preview"></div></td>
		</tr>
		<tr>
			<th>선호 노트</th>
			<td>
				<input type="checkbox" name="note" onclick="count_ck(this);" value="1">시트러스
				<input type="checkbox" name="note" onclick="count_ck(this);" value="2">아로마
				<input type="checkbox" name="note" onclick="count_ck(this);" value="3">플로랄<br>
				<input type="checkbox" name="note" onclick="count_ck(this);" value="4">그린
				<input type="checkbox" name="note" onclick="count_ck(this);" value="5">과일
				<input type="checkbox" name="note" onclick="count_ck(this);" value="6">스파이시<br>
				<input type="checkbox" name="note" onclick="count_ck(this);" value="7">우드
				<input type="checkbox" name="note" onclick="count_ck(this);" value="8">발사믹
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div>
	           		<input type="reset" value="초기화">
 					<input type="submit" value="회원가입"> 
					<input type="hidden" id="idchk" value="1">
				</div>
			<td>
        </tr>
	</table>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
		//노트 
		function count_ck(obj){
		var chkbox = document.getElementsByName("note");
		var chkCnt = 0;
		for(var i=0;i<chkbox.length; i++){
			if(chkbox[i].checked){
				chkCnt++;
			}
		}
		if(chkCnt>3) {
			alert("최대 3개까지 선택 할 수있습니다.");
			obj.checked = false;
			return false;
		}
	}
	
	//회원가입 체크
	function userChk(){
		if(frm.user_id.value.length == ''){
			alert('아이디를 입력해주세요')
			return false
		}
		
		if(idchk.value == 3 || idchk.value == 1) {
			alert('중복체크해주세요')
			return false
		}
		
		if(frm.user_id.value < 5){
			alert('아이디는 5글자 이상입니다.')
			return false
		}
		if(frm.user_pw.value.length < 5){
			alert('비밀번호는 5글자 이상입니다')
			return false
		}
		
		if(frm.user_pw.value != frm.user_pwre.value){
			alert('비밀번호가 일치하지 않습니다.')
			return false
		}
		if(frm.nm.value == ''){
			alert('닉네임을 입력해주세요')
			return false
		}
		if(frm.bd.value == ''){
			alert('생년월일을 선택해 주세요')
			return false
		}
		if(frm.gender.value == ''){
			alert('성별을 선택해 주세요')
			return false
		}
	}
	
	function chkId() {
		const user_id = frm.user_id.value
		
		axios.post('/user/ajaxIdChk', {
			user_id: user_id
		}).then(function(res) {
			console.log(res)
			if(res.data == '2') { //아이디 없음
				idChkResult.innerText = '사용할 수 있는 아이디입니다.'
				idchk.value = 2
			}
			if(res.data == '3') { //아이디 중복됨
				idChkResult.innerText = '이미 사용중입니다.'
				idchk.value = 3
			}
			if(res.data == '4'){
				idChkResult.innerText = '아이디를 입력해주세요'
			}
		
		})
	}
	
	//아이디 다시 입력했을때 중복체크 띄우기
    function idValue() {
   		var a = document.getElementById('idchk')
   		a.value = 1
   		console.log('value = ' + a.value)
    }
	
	
	//이미지 미리보기
    function previewImage(f){
    	var file = f.files;
    	// 확장자 체크
    	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
    		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
    		// 선택한 파일 초기화
    		f.outerHTML = f.outerHTML;
    		document.getElementById('preview').innerHTML = '';
    	}
    	else {
    		// FileReader 객체 사용
    		var reader = new FileReader();
    		// 파일 읽기가 완료되었을때 실행
    		reader.onload = function(rst){
    			document.getElementById('preview').innerHTML = '<img src="' + rst.target.result + '">';
    		}
    		// 파일을 읽는다
    		reader.readAsDataURL(file[0]);
    	}
    }
		
</script>
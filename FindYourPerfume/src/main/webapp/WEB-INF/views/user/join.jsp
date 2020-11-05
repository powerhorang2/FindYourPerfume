<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<div class="joinContainer">
	<div>
	<form name="frm" id="frm" action="/user/join" method="post" enctype="multipart/form-data" onsubmit="return userChk()">
	<div id="joinHeader">
		<h1>회원가입<span>Create an account</span></h1>
		<span class="material-icons" onclick="moveToPage(`/common/main`)" id="btnReturn">home</span>
	</div><hr>
	<div id="joinMain">
		<div id="basicInf">
			<div id="title">기본정보</div>
			<div id="user_id">
				<div id="idChk">
					<div>아이디<span>ID</span></div>
					<div id="idChkResult" class="msg"></div>
					<button class="button" type="button" onclick="chkId()">중복체크</button>
				</div>
				<div><input type="text" name="user_id" placeholder="5~12자의 영소문자와 숫자로 입력해주세요" onchange="idValue()" id="user_id"></div>
			</div>
			<div>
				<div>비밀번호<span>Password</span></div>
				<div><input type="password" name="user_pw" placeholder="비밀번호를 입력해주세요" id="pw"></div>		
			</div>
			<div>
				<div id="pwBox">비밀번호 확인<span>Confirm Password</span><span id="show_txt"></span></div>
				<div><input type="password" name="user_pwre" placeholder="비밀번호를 확인해주세요" id="pw_confirm"></div>		
			<div>
				<div id="nmBox">닉네임<span>Nickname</span><span id="show_nm"></span></div>
				<div><input type="text" name="nm" placeholder="8자 이내로 입력해주세요" id="nm"></div>	
			</div>
			<div>
				<div>생년월일<span>Date of Birth</span></div>
				<div><input type="date" name="bd" placeholder="yyyy-mm-dd"></div>		
			</div>
			<div>
				<div>성별<span>Gender</span></div>
				<div id="selectGender">
					<div><label><input type="radio" name="gender" value="1">남<span>Male</span></label></div>
					<div><label><input type="radio" name="gender" value="2">여<span>Female</span></label></div>				
				</div>
			</div>
		</div>
		</div>
		<div id="additionalInf">
			<div id="title">추가정보</div>
			<div id="profileImgContainer">
				<div>프로필 이미지<span>Profile Image</span></div>
				<div id="uploadProfileImg">
					<div id="profileImg"></div>
				</div>
				<div class="btn" id="btn">
					<label for="profile_image">사진선택</label>
					<input type="file" id="profile_image" name="file" accept="image/*" onchange="previewImage(this)" value="사진선택"><br>					
				</div>
			</div>
			<div id="noteContainer">
				<div id="noteContainerTitle">선호 노트<span>Preferred scent</span></div>
				<div id="noteList">
					<div>
						<div><label><input type="checkbox" name="nt_m_c" value="1">시트러스<span>Citrus</span></label></div>
						<div><label><input type="checkbox" name="nt_m_c" value="2">아로마<span>Aromatics</span></label></div>
						<div><label><input type="checkbox" name="nt_m_c" value="3">플로랄<span>Floral</span></label></div>
					</div>
					<div>
						<div><label><input type="checkbox" name="nt_m_c" value="4">그린<span>Green</span></label></div>
						<div><label><input type="checkbox" name="nt_m_c" value="5">과일<span>Fruity</span></label></div>
						<div><label><input type="checkbox" name="nt_m_c" value="6">스파이시<span>Spices</span></label></div>
					</div>
					<div>
						<div><label><input type="checkbox" name="nt_m_c" value="7">우드<span>Wooded</span></label></div>
						<div><label><input type="checkbox" name="nt_m_c" value="8">발사믹<span>Balsamic</span></label></div>				
					</div>
				</div>			
			</div>
		</div>
	</div><hr>
	<div id="joinFooter">
		<input class="button" type="reset" value="초기화">
		<input class="button" type="submit" value="회원가입"> 
		<input type="hidden" id="idchk" value="1">
	</div>
	</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	function moveToPage(p) {
		location.href = p
	}
	
	//회원가입 체크 alert
	function userChk(){
		const user_id = frm.user_id.value
		const user_pw = frm.user_pw.value
		const user_pwre = frm.user_pwre.value
		const nm = frm.nm.value
		const bd = frm.bd.value
		const gender = frm.gender.value

		
		if(user_id.length == ''){
			alert('아이디를 입력해주세요')
			return false
		}
		
		if(idchk.value == 3 || idchk.value == 1) {
			alert('아이디를 확인해주세요')
			return false
		}
		
		if(user_pw.length < 5){
			alert('비밀번호는 5글자 이상입니다')
			return false
		}
		
		if(user_pw != user_pwre){
			alert('비밀번호가 일치하지 않습니다.')
			return false
		}
		if(nm == ''){
			alert('닉네임을 입력해주세요')
			return false
		}
		if(nm.length > 9){
			alert('닉네임을 확인해 주세요')
			return false
		}
		if(bd == ''){
			alert('생년월일을 선택해 주세요')
			return false
		}
		if(gender == ''){
			alert('성별을 선택해 주세요')
			return false
		}

	}
	
	//아이디체크 ajax
	function chkId() {
		const user_id = frm.user_id.value
		
		axios.post('/user/ajaxIdChk', {
			user_id: user_id
		}).then(function(res) {
			console.log(" dfsadsf : " + res.data)
			if(res.data == '2') { //아이디 없음
				idChkResult.innerText = '사용할 수 있는 아이디입니다.'
				idchk.value = 2
			}
			if(res.data == '3') { //아이디 중복됨
				idChkResult.innerText = '이미 사용중입니다.'
				idchk.value = 3
			}
			if(res.data == '4'){ //아이디 비어있음
				idChkResult.innerText = '아이디를 입력해주세요'
			}
			if(res.data == '5'){ //아이디 5글자 미만
				idChkResult.innerText = '아이디는 5글자 이상입니다.'
			}
			if(res.data == '7'){ //공백 금지
				idChkResult.innerText = '공백은 포함할수 없습니다.'
			}
			if(res.data == '8'){ //아이디 유효성검사 실패
				idChkResult.innerText = '아이디를 확인해주세요'
			}
		})
	}
	
	var id = document.getElementById("user_id");
    var pw = document.getElementById("pw");
    var re = /^[a-zA-Z0-9]{4,12}$/
	
	//아이디 다시 입력했을때 중복체크 띄우기
    function idValue() {
   		var a = document.getElementById('idchk')
   		a.value = 1
// 		console.log('value = ' + a.value) 
   	}
 
	//비밀번호 체크 제이쿼리 
	$("#pw_confirm").blur(function(){
		
		var pw = $("#pw").val();
		var pw_confirm_pw = $("#pw_confirm").val();
		
		if(pw == "" || pw_confirm_pw == ""){
			$("#show_txt").text("비밀번호가 비어있습니다.")
		}else if(pw != pw_confirm_pw){
			$("#show_txt").text("비밀번호가 일치하지 않습니다.")
		}else { 
			$("#show_txt").text("비밀번호가 일치합니다.")
		}
	})
	
	//닉네임 길이 제이쿼리
	 $("#nm").blur(function(){
		
		var nm = $("#nm").val();
	
		if(nm == ""){
			$("#show_nm").text("닉네임을 입력해주세요.")
		} else if(nm.length > 9){
			$("#show_nm").text("닉네임을 확인해주세요.")
		}else{
			$("#show_nm").text("사용 가능한 닉네임입니다.")
		} 
	}) 
	
	//이미지 미리보기
    function previewImage(f){
    	var file = f.files;
    	// 확장자 체크
    	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
    		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
    		// 선택한 파일 초기화
    		f.outerHTML = f.outerHTML;
    		document.getElementById('profileImg').innerHTML = '';
    	}
    	else {
    		// FileReader 객체 사용
    		var reader = new FileReader();
    		// 파일 읽기가 완료되었을때 실행
    		reader.onload = function(rst){
    			document.getElementById('profileImg').innerHTML = '<img src="' + rst.target.result + '">';
    		}
    		// 파일을 읽는다
    		reader.readAsDataURL(file[0]);
    	}
    }
		
</script>
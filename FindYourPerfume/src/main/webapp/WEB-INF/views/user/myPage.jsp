<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="adminContainer">
	<div id="adminLeft">
		안녕
	</div>
	<div id="adminRight">
		<form name="uptUserFrm" id="uptFrm" action="/user/uptUser" enctype="multipart/form-data" method="post">
			<div id="sectionProfile">
				<div id="containerImg">
					<c:if test="${loginUser.profile_img == null}">
						<div id="profileImg">
							<img class="profile" src="/res/img/profileImg/default_img.jpg">					
						</div>
					</c:if>
					<c:if test="${loginUser.profile_img != null}">
						<div id="profileImg">
							<img class="profile" src="/res/img/profileImg/${loginUser.profile_img}">	
						</div>
					</c:if>
	 				<div class="btn">
						<label for="file">사진선택</label>
						<input type="file" id="file" name="profile_pic" accept="image/*" onchange="previewImage(this)" value="사진추가">
					</div> 
				</div>
				<div id="containerInfo">
					<div>
						<h2>${loginUser.nm}님의 마이페이지</h2>
						<div>
							<p>닉네임<span>Nickname</span></p>
							<input type="text" value="${loginUser.nm}" name="nm">			
						</div>
						<div>
							<p>비밀번호 변경<span>Password</span></p>
							<input type="password" name="user_pw">
						</div>
						<div>
							<p>비밀번호 확인<span>Password check</span></p>
							<input type="password" name="user_pwre">
						</div>
						<div>
							<p>생년월일<span>Birthday</span></p>
							${loginUser.bd}
						</div>
					</div>
					<div id="submitProfile"><input class="button" type="button" value="수정완료" onclick="checkUptUser()"></div>
				</div>
			</div>
		</form><hr>
		<div id="sectionFavPerfume">
			<div id="title">찜한 향수</div>
			<div id="detailSection">
			</div>
		</div>
	</div>
</div>
<script>
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
				document.getElementById('profileImg').innerHTML = '<img src="' + rst.target.result + '" width="100%" height="100%">';
			}
	
			// 파일을 읽는다
			reader.readAsDataURL(file[0]);
		}
	}
	
	function checkUptUser() {
		uptUserFrm = document.uptUserFrm
		
		if(uptUserFrm.user_pw.value.length < 5){
			alert('비밀번호는 5글자 이상입니다')
			return false
		}
		if(uptUserFrm.user_pw.value != uptUserFrm.user_pwre.value) {
			alert('비밀번호가 일치하지 않습니다')
			return
		}
		
		uptUserFrm.submit();
	}

</script>
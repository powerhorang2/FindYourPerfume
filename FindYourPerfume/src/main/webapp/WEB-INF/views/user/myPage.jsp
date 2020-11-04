<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="myPageContainer">
	<div id="myPageRight">
		<form name="uptUserFrm" id="uptFrm" action="/user/uptUser" enctype="multipart/form-data" method="post">
			<div id="sectionProfile">
				<div id="containerImg">
					<!-- 프로필사진 미등록시 : default_img -->
					<c:if test="${loginUser.profile_img == null}">
						<div id="profileImg">
							<img class="profile" src="/res/img/default_img.jpg">					
						</div>
					</c:if>
					<!-- 프로필사진 등록시 -->
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
					</div>
					<div id="infoContents">
						<div id="nickNameBox">
							<div>
								<p>닉네임<span>Nickname</span></p>
								<input class="longInput" type="text" value="${loginUser.nm}" name="nm" required>			
							</div>
							<div>
								<p>생년월일<span>Date of Birth</span></p>
								<p class="ml10" id="bd_data">${loginUser.bd}</p>
							</div>
							<div id="r_dt">
								<p>가입일자<span>Date of Join</span></p>
								<p class="ml10" id="r_dt_data">${loginUser.r_dt}</p>
							</div>	
						</div>
						<div>
							<div>
								<p>비밀번호 변경<span>Password</span></p>
								<input class="longInput" type="password" name="user_pw">
							</div>
							<div>
								<p>비밀번호 확인<span>Password check</span></p>
								<input class="longInput" type="password" name="user_pwre">
							</div>					
						</div>
					</div>
					<div id="submitProfile">
						<input class="button" type="button" value="수정완료" onclick="checkUptUser()">
					</div>
				</div>
			</div>
		</form><hr>
		<div id="sectionFavPerfume">
			<div id="title">찜한 향수</div>
			<div id="detailSection">
			<!-- 나만의 향수 데이터가 없을 경우 -->
			<c:if test="${empty data}">
				<div id="emptyMsg">
					<div>
						<p>나만의 향수들을 추가해보세요</p>
					</div>
				</div>
			</c:if>
			<!-- 나만의 향수 데이터가 있을 경우 -->
			<c:if test="${!empty data}">
				<c:forEach items="${data}" var="item">
				<div id="favPerfume" onclick="moveToDetail(${item.i_p})">
					<div id="favPerfumeImg">
						<img class="perfumeImg" src="${item.p_pic}">
					</div>
					<div id="favPerfumeDetail">
						<p>${item.b_nm_eng}</p>
						<p id="p_nm">${item.p_nm}<p>
						<div>
							<span id="p_size">${item.p_size}ml</span>${item.p_price}원						
						</div>
					</div>
				</div>
				</c:forEach>							
			</c:if>
			</div>
		</div><hr>
		<div id="sectionFavNote">
			<div id="title">선호 노트</div>
			<div id="noteContainer">
				<div id="noteList">
					<div>
						<div>
							<label><input type="checkbox" id="nt_m_c_1" name="nt_m_c" value="1" onchange="uptFavNotes(this.id, this.value)">시트러스<span>Citrus</span></label>
							<p class="arrow_box">레몬, 만다린, 베르가못</p>
						</div>
						<div>
							<label><input type="checkbox" id="nt_m_c_2" name="nt_m_c" value="2" onchange="uptFavNotes(this.id, this.value)">아로마<span>Aromatics</span></label>
							<p class="arrow_box">아니스, 라벤더, 레몬그라스</p>
						</div>
						<div>
							<label><input type="checkbox" id="nt_m_c_3" name="nt_m_c" value="3" onchange="uptFavNotes(this.id, this.value)">플로랄<span>Floral</span></label>
							<p class="arrow_box">장미, 자스민, 라일락</p>
						</div>
					</div>
					<div>
						<div>
							<label><input type="checkbox" id="nt_m_c_4" name="nt_m_c" value="4" onchange="uptFavNotes(this.id, this.value)">그린<span>Green</span></label>
							<p class="arrow_box">그라스, 스톤, 리프</p>
						</div>
						<div>
							<label><input type="checkbox" id="nt_m_c_5" name="nt_m_c" value="5" onchange="uptFavNotes(this.id, this.value)">과일<span>Fruity</span></label>
							<p class="arrow_box">라즈베리, 배, 복숭아</p>
						</div>
						<div>
							<label><input type="checkbox" id="nt_m_c_6" name="nt_m_c" value="6" onchange="uptFavNotes(this.id, this.value)">스파이시<span>Spices</span></label>
							<p class="arrow_box">클로브, 너트맥, 시나몬</p>
						</div>
					</div>
					<div>
						<div>
							<label><input type="checkbox" id="nt_m_c_7" name="nt_m_c" value="7" onchange="uptFavNotes(this.id, this.value)">우드<span>Wooded</span></label>
							<p class="arrow_box">삼나무, 파촐리, 이끼</p>
						</div>
						<div>
							<label><input type="checkbox" id="nt_m_c_8" name="nt_m_c" value="8" onchange="uptFavNotes(this.id, this.value)">발사믹<span>Balsamic</span></label>
							<p class="arrow_box">바닐라, 헬리오트로프, 통카빈</p>
						</div>				
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>

	// 페이지 실행시 선호 노트정보 체크박스에 뿌리기	
	favNoteChk()

	// 프로필 사진 업데이트시 미리보기
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
	
	// 회원정보 수정시 비밀번호 체크
	function checkUptUser() {
		if(uptUserFrm.user_pw.value.length > 0) {			
			if(uptUserFrm.user_pw.value.length < 5){
				alert('비밀번호는 5글자 이상입니다')
				return false
			}
			if(uptUserFrm.user_pw.value != uptUserFrm.user_pwre.value) {
				alert('비밀번호가 일치하지 않습니다')
				return
			}
		}
		uptUserFrm.submit();
	}
	
	// DB에 저장되어 있는 선호 노트 불러오기
	function favNoteChk() {
		chkboxNote = document.getElementsByName('nt_m_c')

		var notes = new Array()
		<c:forEach items="${favNotes}" var="item">
			notes.push(${item.nt_m_c})
		</c:forEach>

  		for(var i=0; i<chkboxNote.length; i++) {
			for(var j=0; j<notes.length; j++) {
				if(chkboxNote[i].value == notes[j]){
					chkboxNote[i].checked = true
				}
			}
		}  	
	}
	
	// 선호노트 업데이트
	function uptFavNotes(note, nt_m_c) {

		var chk = document.getElementById(note) 
		
		if(chk.checked) {
			axios.post('/user/ajaxAddFavNotes', {
				nt_m_c : nt_m_c
			})				
		} else {
			axios.post('/user/ajaxDelFavNotes', {
				nt_m_c : nt_m_c
			})	
		}
	}
	
	// 향수 디테일 페이지로 이동
	function moveToDetail(i_p) {
		location.href = '/common/detail?i_p=' + i_p
	}
</script>
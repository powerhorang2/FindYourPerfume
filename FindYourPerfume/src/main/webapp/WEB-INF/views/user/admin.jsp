<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="adminContainer">
	<div id="adminRight">
		<form name="uptUserFrm" id="uptFrm" action="/user/uptUser" enctype="multipart/form-data" method="post">
		<input type="hidden" name="user_type" value="2">
		<div id="sectionProfile">
			<div id="containerImg">
				<c:if test="${loginUser.profile_img == null}">
				<div id="profileImg">
					<img class="profile" src="/res/img/default_img.jpg">					
				</div>
				</c:if>
				<c:if test="${loginUser.profile_img != null}">
				<div id="profileImg">
					<img class="profile" src="/res/img/profileImg/${loginUser.profile_img}">
				</div>
				</c:if>
 				<div class="btn">
					<label for="profile_pic">사진선택</label>
					<input type="file" id="profile_pic" name="profile_pic" accept="image/*" onchange="previewProfileImage(this)" value="사진추가">
				</div> 
			</div>
			<div id="containerInfo">
				<div>
					<h2>${loginUser.nm}님의 관리자페이지</h2>
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
				<div id="submitProfile"><input class="button" type="button" value="수정완료" onclick="checkUptUser()"></div>
			</div>
		</div>
		</form><hr>
		<div id="sectionAddAdmin">
			<div id="title">관리자 권한 부여</div>
			<div id="addAdminContainer">
				<div id="addAuth">
					<p>관리자 권한 부여</p>
					<form name="AuthFrm" id="AuthFrm" action="/user/changeAuth" method="post">
					<input type="hidden" name="user_type" value="1">
					<select class="longInput" id="user_id" name="i_user">
						<option value="0">유저 선택하기</option>
						<c:forEach items="${userList}" var="item">
							<option value="${item.i_user}">${item.user_id}</option>
						</c:forEach>
					</select>
					<input class="button" type="submit" value="권한부여">
					</form>
				</div>
				<div id="removeAuth">
					<p>관리자 권한 제거</p>
					<form name="AuthFrm" id="AuthFrm" action="/user/changeAuth" method="post">	
					<input type="hidden" name="user_type" value="2">
					<select class="longInput" id="user_id" name="i_user">
						<option value="0">관리자 선택하기</option>
						<c:forEach items="${adminList}" var="item">
							<option value="${item.i_user}">${item.user_id}</option>
						</c:forEach>
					</select>
					<input class="button" type="submit" value="권한제거">
					</form>
				</div>
			</div>
		</div><hr>
		<div id="sectionAddPerfume">
			<div id="title">향수 추가</div>
			<div id="detailSection">
				<form name="addPerfumeFrm" id="addFrm" action="/user/addPerfume" enctype="multipart/form-data" method="post">
					<div id="containerPerfumeImg">
						<div id="perfumeImg"></div>
						<div class="btn">
							<label for="p_pic">사진선택</label>
							<input type="file" id="p_pic" name="p_pic" accept="image/*" onchange="previewPerfumeImage(this)" value="사진추가">
						</div>
					</div>
					<div id="containerPerfumeInfo">
						<div id="mainInfo">
							<div>
								<p>이름<span>Name</span></p>
								<input class="longInput" type="text" name="p_nm">
							</div>
							<div>
								<p>브랜드<span>Brand</span></p>
								<select class="longInput" name="p_brand">
									<option value="0">브랜드 선택하기</option>
									<c:forEach items="${brandList}" var="item">
										<option value="${item.p_brand}">${item.b_nm_eng}</option>
									</c:forEach>
								</select>
							</div>
							<div>
								<p>용량<span>Size</span></p>
								<input class="shortInput" type="text" name="p_size">
							</div>
							<div>
								<p>가격<span>Price</span></p>
								<input class="normalInput" type="text" name="p_price">
							</div>
						</div>
						<div id="notesInfo">
							<p>노트<span>Notes</span></p>
							<div>
							<c:forEach items="${noteList}" var="data">
								<div>
									<label><input id="p_note" type="checkbox" name="p_note" value="${data.nt_d_c}" required>${data.nt_d_nm}</label>
								</div>
							</c:forEach>
							</div>
						</div>
						<div id="submitPerfume">
							<input class="button" type="button" value="등록완료" onclick="checkAddPerfume()">
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="sectionDelPerfume">
			<div id="title">향수 삭제</div>
			<div id="delPerfumeContainer">
				<div id="containerDelPerfumeImg">
					<div id="delPerfumeImg"></div>
				</div>
				<div id="delPerfume">
					<form name="delPerfumeFrm" id="delPerfumeFrm" action="/common/delPerfume" method="post">
					<input type="hidden" name="user_type" value="1">
					<select class="longInput" id="p_brand" name="p_brand" onchange="selPerfume(this.value)">
						<option value="0">브랜드 선택하기</option>
						<c:forEach items="${brandList}" var="item">
							<option value="${item.p_brand}">${item.b_nm_eng}</option>
						</c:forEach>
					</select>
					<select class="longInput ml10" id="p_nm" name="i_p" onchange="selDelPerfumePic(this.value)">
						<option value="0">향수 선택하기</option>
					</select>
					<div id="submitDelPerfume">
						<input class="button" type="button" onclick="confirmDelPerfume()" value="삭제">
					</div>
					</form>
				</div>
			</div>
		</div><hr>
	</div>
</div>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	//향수 이미지 띄우기 - url 주소 값일 때는 그대로 , 아닐 때는 로컬 주소 찾아서, 없을 때는 default 
	function loadPerfumeImg(p_pic) {
		if(p_pic == undefined) {
			return "/res/img/default_perfume.png"
		} else if(p_pic.indexOf("https://") != -1) {
			return p_pic
		} else if(p_pic.indexOf("http://") != -1) {
			return p_pic
		} else {
			return "/res/img/perfume/" + p_pic
		}
	}

	function selPerfume(p_brand) {
			axios.get('/common/ajaxSelBrandPerfume', {
			params : {
				p_brand
			}
		}).then(function(res) {
			p_nm.innerText = ''
			console.log(res.data.length)
			
			var option = document.createElement('option')
			option.value = 0
			option.name = 'i_p'
			option.innerHTML = '향수 선택하기'

			p_nm.append(option)
			
			for(i=0; i<res.data.length; i++) {
				console.log(res.data[i].i_p)
				console.log(res.data[i].p_nm)
				
				var option = document.createElement('option')
				option.value = res.data[i].i_p
				option.name = 'i_p'
				option.innerHTML = res.data[i].p_nm
	
				p_nm.append(option)
			}
		}) 
	}
	
	function selDelPerfumePic(i_p) {
		axios.get('/common/ajaxSelPerfumePic', {
			params : {
				i_p
			}
		}).then(function(res) {
			document.getElementById('delPerfumeImg').innerHTML = '<img src="' + loadPerfumeImg(res.data.p_pic) + '" width="100%" height="100%">';
		})	
	} 

 	function confirmDelPerfume() {
		var chk = confirm('삭제하시겠습니까?')
		if(chk == true) {
			document.delPerfumeFrm.submit()		
		}
		return
	} 
	
	function checkUptUser() {
		uptUserFrm = document.uptUserFrm
		
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
	
	function previewProfileImage(f){
		var file = f.files;
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
			alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
			f.outerHTML = f.outerHTML;
			document.getElementById('preview').innerHTML = '';
		}
		else {
			var reader = new FileReader();
			reader.onload = function(rst){
				console.log(f)
				document.getElementById('profileImg').innerHTML = '<img src="' + rst.target.result + '" width="100%" height="100%">';
			}
			reader.readAsDataURL(file[0]);
		}
	}

	function previewPerfumeImage(f){
		var file = f.files;
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
			alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
			f.outerHTML = f.outerHTML;
			document.getElementById('preview').innerHTML = '';
		}
		else {
			var reader = new FileReader();
			reader.onload = function(rst){
				console.log(f)
				document.getElementById('perfumeImg').innerHTML = '<img src="' + rst.target.result + '" width="100%" height="100%">';
			}
			reader.readAsDataURL(file[0]);
		}
	}
	
 	function previewDelPerfumeImage(f){
		var reader = new FileReader();
		reader.onload = function(rst){
			console.log(f)
			document.getElementById('perfumeImg').innerHTML = '<img src="' + rst.target.result + '" width="100%" height="100%">';
		}
		reader.readAsDataURL(file[0]);
	} 

	function checkAddPerfume(){
		AddPerfume = document.addPerfumeFrm
		
		if(AddPerfume.p_nm.value=='') {
			alert('향수명을 입력해주세요.')
			return AddPerfume.p_nm.focus()
		}
		
		if(AddPerfume.p_brand.value=='0') {
			alert('브랜드를 선택해주세요.')
			return AddPerfume.p_brand.focus()
		}
		
		if(AddPerfume.p_size.value=='') {
			alert('용량을 입력해주세요.')
			return AddPerfume.p_size.focus()
		}
		
		if(AddPerfume.p_price.value=='') {
			alert('가격을 입력해주세요.')
			return AddPerfume.p_price.focus()
		}
		var checked = 0;
		for (var i = 0; i < p_note.length; i++) {
			if(p_note[i].checked == true){
				checked += 1
			}
		}
		if(checked < 1) {
			alert("노트를 1개 이상 선택해주세요.")
			return
		}
		AddPerfume.submit()
	}
</script>
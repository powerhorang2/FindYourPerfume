<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
 <div class="adminContainer">
	<div id="adminLeft">
		안녕
	</div>
	<div id="adminRight">
		<div id="sectionProfile">
			<div id="containerImg">
				<div id="profileImg"></div>
				<div><input class="button" type="submit" value="사진변경"></div>
			</div>
			<div id="containerInfo">
				<div>
					<h2>??님의 관리자페이지</h2>
					<p>닉네임<span>Nickname</span></p>
					<p>굔도쿠짱짱맨</p>a
					<p>생년월일<span>Birthday</span></p>
					<p>1991년 1월 22일</p>
				</div>
				<div id="submitProfile"><input class="button" type="submit" value="수정완료"></div>
			</div>
		</div><hr>
		<div id="sectionAddPerfume">
			<div id="title">향수 추가</div>
			<div id="detailSection">
				<form name="addPerfumeFrm" id="addFrm" action="/user/addPerfume" enctype="multipart/form-data" method="post">
					<div id="containerPerfumeImg">
						<div id="perfumeImg"></div>
						<div class="btn">
							<label for="file">사진선택</label>
							<input type="file" id="file" name="p_pic" accept="image/*" onchange="previewImage(this)" value="사진추가">
						</div>
					</div>
					<div id="containerPerfumeInfo">
						<div id="mainInfo">
							<div>
								<p>이름<span>Name</span></p>
								<input type="text" name="p_nm">
							</div>
							<div>
								<p>브랜드<span>Brand</span></p>
								<select name="p_brand">
									<option value="0">브랜드 선택하기</option>
									<c:forEach items="${brandList}" var="item">
										<option value="${item.p_brand}">${item.engNm}</option>
									</c:forEach>
								</select>
							</div>
							<div>
								<p>용량<span>Size</span></p>
								<input type="text" name="p_size">
							</div>
							<div>
								<p>가격<span>Price</span></p>
								<input type="text" name="p_price">
							</div>
						</div>
						<div id="notesInfo">
							<c:forEach items="${noteList}" var="data">
								<div>
									<label><input id="p_note" type="checkbox" name="p_note" value="${data.nt_d_c}" required>${data.nt_d_nm}</label>
								</div>
							</c:forEach>
						</div>
						<div id="submitPerfume"><input class="button" type="button" value="등록완료" onclick="checkAddPerfume()"></div>
					</div>
				</form>
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
				document.getElementById('perfumeImg').innerHTML = '<img src="' + rst.target.result + '" width="100%" height="100%">';
			}
	
			// 파일을 읽는다
			reader.readAsDataURL(file[0]);
		}
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
			
		AddPerfume.submit();
		
		
	}
</script>
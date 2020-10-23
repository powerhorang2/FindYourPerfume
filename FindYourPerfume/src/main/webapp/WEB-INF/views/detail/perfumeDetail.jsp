<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="detailContainer">
	<c:if test="${loginUser != null}">
		<span id="favorite" class="material-icons">
			<c:choose>
				<c:when test="${loginUser.i_user == perfume.i_user}">favorite</c:when>
				<c:otherwise>favorite_border</c:otherwise>
			</c:choose>
		</span>
	</c:if>
	
	<div><img src="${perfume.p_pic}"></div>
	<div>${perfume.p_nm}</div>
	<div>${perfume.p_size}ml</div>
	<div>${perfume.b_nm_eng}</div>
	<div>${perfume.p_price}원</div>
	<h2>노트정보</h2>
	<span>
		<c:forEach items="${noteList}" var="item">
			${item.nt_d_nm_kor}(${item.nt_d_nm}),
		</c:forEach>
	</span>
	<div>=====================================================================================================</div>
	<div id="cmtContainer">
		<div class="cmt_cnt">
			<div>
				<span class="cmt_cnt_text">회원 후기</span>
				<span class="cmt_cnt_content"></span>
			</div>
		</div>
		<div id="cmtContents">
		
		</div>
	</div>
	<c:if test="${loginUser != null}">
		<form id="frm" class="frm" action="/cmt/insCmt?i_p=${perfume.i_p}" method="post">
			<p><textarea cols="50" rows="10" name="cmt" placeholder="후기를 남겨보세요 (50자 이내)"></textarea></p>
		    <p><input type="submit" value="Submit"></p>
		</form>
	</c:if>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
	
	// cmtList 생성 함수 호출
	ajaxSelCmtList()
	
	// 로그인 유저의 변수 생성 후 값 설정 
	var i_user = `${loginUser.i_user}`
	
	i_user = Number(i_user);
	
	var loginUser = new Object();
	
	function setLoginUser(loginUser) {
		loginUser.i_user = i_user;
	}
	
	setLoginUser(loginUser)
	
	// cmtList 생성 함수 - 비동기
	function ajaxSelCmtList() {
		axios.get('/cmt/ajaxSelCmtList', {
			params : {}
		}).then(function(res) {
				cmtContents.innerText = ''
				var cmt_cnt_content = document.querySelector(".cmt_cnt_content");
				cmt_cnt_content.innerText = '(' + res.data.length + ')';
				
				res.data.forEach(function(item) {					
					createCmt(item)
					if(loginUser.i_user == item.i_user) {
						createCmtUpd(item);
						createCmtDel(item);
					}
				})
		})
	}
	
	// cmt 생성 함수
	function createCmt(item) {
		var cmt = document.createElement('div');
		var cmt_userData = document.createElement('div');
		var cmt_userData_i_cmt = document.createElement('div');
		var cmt_userData_i_cmt_p = document.createElement('p');
		var cmt_userData_userNm = document.createElement('div');
		var cmt_userData_userNm_p = document.createElement('p');
		var cmt_userData_userNm_img = document.createElement('img');
		var cmt_userData_userAge = document.createElement('div');
		var cmt_userData_userAge_p = document.createElement('p');
		var Cmt_userData_userI_user = document.createElement('div');
		var cmt_cmt = document.createElement('div');
		var cmt_cmt_div = document.createElement('div');
		var cmt_cmt_div_p = document.createElement('p');
		
		cmt.setAttribute('class', 'cmt');
		cmt_userData.setAttribute('class', 'cmt_userData_' + item.i_cmt);
		cmt_userData_i_cmt.setAttribute('class', 'cmt_userData_i_cmt');
		cmt_userData_i_cmt_p.setAttribute('class', 'cmt_userData_i_cmt_p');
		cmt_userData_userNm.setAttribute('class', 'cmt_userData_userNm');
		cmt_userData_userNm_p.setAttribute('class', 'cmt_userData_userNm_p');
		cmt_userData_userNm_img.setAttribute('class', 'cmt_userData_userNm_img');
		cmt_userData_userAge.setAttribute('class', 'cmt_userData_userAge');
		cmt_userData_userAge_p.setAttribute('class', 'cmt_userData_userAge_p');
		cmt_cmt.setAttribute('class', 'cmt_cmt');
		cmt_cmt_div.setAttribute('class', 'cmt_cmt_div');
		cmt_cmt_div_p.setAttribute('class', 'cmt_cmt_div_p');
		
		cmt_userData_i_cmt_p.innerText = item.i_cmt + '번 후기'
		cmt_userData_userNm_img.src = '/res/img/profileImg/' + item.profile_img
		cmt_userData_userNm_p.innerText = item.nm
		cmt_userData_userAge_p.innerText = item.ageGroup + '/' + item.gender
		cmt_cmt_div_p.innerText = item.cmt

		cmt.append(cmt_userData)
		cmt.append(cmt_cmt)
		cmt_userData.append(cmt_userData_i_cmt)
		cmt_userData.append(cmt_userData_userNm)
		cmt_userData.append(cmt_userData_userAge)
		cmt_userData_i_cmt.append(cmt_userData_i_cmt_p)
		cmt_userData_userNm.append(cmt_userData_userNm_p)
		cmt_userData_userNm_p.append(cmt_userData_userNm_img)
		cmt_userData_userAge.append(cmt_userData_userAge_p)
		cmt_cmt.append(cmt_cmt_div)
		cmt_cmt_div.append(cmt_cmt_div_p)

		cmtContents.append(cmt)
	}
	
	// cmt 수정 생성 함수
	function createCmtUpd(item) {
		var cmt_userData = document.querySelector('.cmt_userData_' + item.i_cmt);
		
		var cmt_userData_ud = document.createElement('div');
		var cmt_upd = document.createElement('div');
		var cmt_upd_bt = document.createElement('span');
		
		cmt_userData_ud.setAttribute('class', 'cmt_userData_ud_'+ item.i_cmt)
		cmt_upd.setAttribute('class', 'cmt_upd');
		cmt_upd_bt.setAttribute('class', 'cmt_upd_bt');
		
		cmt_upd_bt.innerText = '수정';
		
		// cmt_upd_bt.setAttribute('onclick', 'ajaxUpdCmt('+item+')');
		cmt_upd_bt.addEventListener('click', event => ajaxUpdCmt(item));
		
		cmt_upd.append(cmt_upd_bt)
		cmt_userData_ud.append(cmt_upd)
		cmt_userData.append(cmt_userData_ud)
	}
	
	// cmt 수정 함수
	function ajaxUpdCmt(item) {
		
	}
	
	// cmt 삭제 생성 함수
	function createCmtDel(item) {
		var cmt_userData = document.querySelector('.cmt_userData_' + item.i_cmt);
		
		var cmt_userData_ud = document.querySelector('.cmt_userData_ud_'+ item.i_cmt)
		
		var cmt_del = document.createElement('div');
		var cmt_del_bt = document.createElement('span');
		
		cmt_del.setAttribute('class', 'cmt_del');
		cmt_del_bt.setAttribute('class', 'cmt_del_bt');
		
		cmt_del_bt.innerText = '삭제';
		
		// cmt_del_bt.setAttribute('onclick', 'ajaxDelCmt('+item+')');
		cmt_del_bt.addEventListener('click', event => ajaxDelCmt(item));
		
		cmt_del.append(cmt_del_bt)
		cmt_userData_ud.append(cmt_del)
	}
	
	// cmt 삭제 함수
	function ajaxDelCmt(item) {
		
	}
	
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springriders.perfume.FileUtils" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="detailContainer">
	<div id="sidebar">
		<div id="loginContainer">
			<!-- 로그아웃 상태 -->
			<c:choose>
				<c:when test="${loginUser.i_user == null}">
					<div id="loginBox">
						<div class="msg">${data.msg}</div>
						<form class="frm" action="/common/main" method="post">
							<div>
								<div>
									<input class="loginBar" type="text" name="user_id" placeholder="아이디를 입력해주세요"
										value="${data.user_id}">
								</div>
								<div>
									<input class="loginBar" type="password" name="user_pw" placeholder="비밀번호를 입력해주세요">
								</div>
							</div>
							<div id="loginBtnBox">
								<input type="submit" class="button" value="LOGIN">
								<input type="button" onclick="moveToPage(`/user/join`)" class="button" value="JOIN">
							</div>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 로그인 상태 -->
					<c:choose>
						<c:when test="${loginUser.user_type == '2'}">
							<div id="loginBox">
								<div id="profileImgBox" style="background: #BDBDBD;">
										<img id="sidebarImg"
											src="/res/img/profileImg/${loginUser.profile_img}">
								</div>
								<div id="welcomeMsg"><b>${loginUser.nm}</b>님 환영합니다.</div>
								<div id="loginBtnBox">
									<input type="button" onclick="moveToPage(`/user/admin`)" class="button" value="ADMIN">
									<input type="button" onclick="moveToPage(`/user/logout`)" class="button" value="LOGOUT">
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div id="loginBox">
								<div id="profileImgBox" style="background: #BDBDBD;">
									<img id="sidebarImg"
										src="/res/img/profileImg/${loginUser.profile_img}">
								</div>
								<div id="welcomeMsg"><b>${loginUser.nm}</b>님 환영합니다</div>
								<div id="loginBtnBox">
									<input type="button" onclick="moveToPage(`/user/myPage`)" class="button" value="MYPAGE">
									<input type="button" onclick="moveToPage(`/user/logout`)" class="button" value="LOGOUT">
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
			
		<!--알파벳 클릭  -->
		<div id="selBrandAlphabet">
			<div>
				<p onclick="choiceAlphabetMain('ALL')">ALL</p>	
				<c:forEach items="${brandAlphabet}" var="item">
					<p onclick="choiceAlphabetMain(`${item}`)">${item}</p>
				</c:forEach>
				<p onclick="choiceAlphabetMain('ETC')">ETC</p>
			</div>
		</div>
		<div id="selBrand">
		</div>
	</div>
	<div>
		<div id="infoContainer"> 
			<div id="infoSection">
				<div id="detailPic">
					<c:set var="img" value="${perfume.p_pic}" scope="request" />
					<jsp:include page="/WEB-INF/views/components/imgComp.jsp" />
				</div>
				<div id="detailInfo">
					<div id="userFavorite"></div>
					<div id="info">
						<div id="b_nm">${perfume.b_nm_eng}</div>
						<div id="p_nm">${perfume.p_nm}</div>
						<div id="p_size_price"><span>${perfume.p_size}ml</span><fmt:formatNumber type="number" maxFractionDigits="3" value="${perfume.p_price}" />원</div>
					</div><hr id="sectionHr_s">
					<div id="noteInfo">
						<div id="title">노트 정보</div>
						<div id="note">
						<c:forEach items="${noteList}" var="item">
							<span>${item.nt_d_nm_kor}</span>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<hr id="sectionHr_m">
	 		<div id="cmtSection">
				<div id="cmtContainer">
					<div class="cmt_cnt">
						<div>
							<div class="cmt_cnt_text">회원 후기<span class="cmt_cnt_content"></span></div>
						</div>
					</div>
					<div id="cmtContents">
					</div>
					<div id="pageGroup">
					</div>
				</div>
				<div class="cmt_box">
	               <c:if test="${loginUser != null}">
	                  <div id="cmtInput">
	                     <div>
	                        ${loginUser.nm}/
	                        <c:choose>
	                           <c:when test="${loginUser.ageGroup == 1}">10세미만/</c:when>
	                           <c:when test="${loginUser.ageGroup == 100}">100세이상/</c:when>
	                           <c:otherwise>${loginUser.ageGroup}대/</c:otherwise>
	                        </c:choose>
	                        ${loginUser.strGender}
	                     </div>
	                     <div>
	                        <textarea id="cmt_val" cols="50" rows="10" name="cmt"
	                           placeholder="댓글을 등록해보세요. (50자 이내)"></textarea>
	                     </div>
	                     <div id="cmtInputBtn">
	                        <input type="button" class="button" value="등록"
	                           onclick="return cmtChk()">
	                     </div>
	                  </div>
	               </c:if>
	            </div>
			</div>
			<hr id="sectionHr_l">
			<div id="target"></div>
			<div id="selDivContainer">
				<div id="sel_div">
					<div id="brandAlphabet" class="perfumeMain">
					</div>
				</div>
			</div>
			<div id="paging">
				<div id="moreDiv">
					<button id="more" class="button" onclick="more()">더보기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<!-- 사이드바 기능 -->
<script>
	var sIdx = 5;
	var eIdx = 10;
	var brandList = new Array();
	var rowAllCnt = 0
	function BrandVO(b_nm_eng, i_p, i_user, p_brand, p_nm, p_pic, p_price, p_size){
		this.b_nm_eng = b_nm_eng
		this.i_p = i_p
		this.i_user = i_user
		this.p_brand = p_brand
		this.p_nm = p_nm
		this.p_pic = p_pic
		this.p_price = p_price
		this.p_size = p_size
	}
	
	choiceAlphabetMain('ALL')
	//향수 컨테이너 담는 arrayList 만들기
	function makeArrayList(tempArr){
		for (var i = 0; i < tempArr.length; i++) {
		var brandVO = new BrandVO(tempArr[i].b_nm_eng, tempArr[i].i_p, tempArr[i].i_user, tempArr[i].p_brand,
					tempArr[i].p_nm, tempArr[i].p_pic, tempArr[i].p_price, tempArr[i].p_size)
		
		brandList.push(brandVO)
		}
	}
	
	//더 보기 버튼 눌렀을 때 idx 증가하면서, 뒤의 배열 추가
	function more(b_nm_eng) {
		if (b_nm_eng == null) {
			// 235
   	 		if((rowAllCnt-1) - sIdx < 5){eIdx = rowAllCnt}
   	 	
   			for (sIdx; sIdx < eIdx; sIdx++) {
   				console.log(sIdx)
   				var div = document.createElement('div');
   				div.setAttribute('onclick', 'moveToDetail('+brandList[sIdx].i_p+')');
   				div.setAttribute('class', 'brandAlphabet');
   				
   				var img = document.createElement('img');
   				img.src = brandList[sIdx].p_pic
   				div.append(img)
   				
   				var div_eng = document.createElement('div');
   				div_eng.setAttribute('id', 'brandNm');
   				div_eng.innerText = brandList[sIdx].b_nm_eng
   				div.append(div_eng)
   				
   				var div_kor = document.createElement('div');
				div_kor.setAttribute('id', 'perfumeNm');
   				div_kor.innerText = brandList[sIdx].p_nm
   				div.append(div_kor)
   				
   				var div_size = document.createElement('div');
   				div_size.innerText = brandList[sIdx].p_size + 'ml'
   				div.append(div_size)
   				
   				var div_price = document.createElement('div');
   				div_price.innerText = numberFormat(brandList[sIdx].p_price) + '원'
   				div.append(div_price)
   				sel_div.append(div)
   				
   				// sIdx가 리스트의 길이값과 같아질 때  마지막 향수 생성하고 더보기 지우기
   				if(rowAllCnt-1 == sIdx) {
   					document.getElementById('moreDiv').style.display= 'none'
   				}
   			}
   			if(rowAllCnt - sIdx >= 5){
   				eIdx += 5
   				console.log("eIdx : "+eIdx)
   			}
			
		} else {
			var pick_brandList = new Array();
	   		for(var i=0; i<brandList.length; i++) {
	   			if(brandList[i].b_nm_eng == b_nm_eng) {
	   				pick_brandList.push(brandList[i])
	   			}
	   		}
	   		console.log(pick_brandList);
	   		
	   		if((pick_brandList.length-1) < sIdx) {
	   			document.getElementById('more').style.display = 'none'	
			} else {
				
				if((pick_brandList.length-1) - sIdx < 5){eIdx = pick_brandList.length}
		   	 	
	   			for (sIdx; sIdx < eIdx; sIdx++) {
	   				console.log(sIdx)
	   				var div = document.createElement('div');
	   				div.setAttribute('onclick', 'moveToDetail('+pick_brandList[sIdx].i_p+')');
	   				div.setAttribute('class', 'brandAlphabet');
	   				
	   				var img = document.createElement('img');
	   				img.src = pick_brandList[sIdx].p_pic
	   				div.append(img)
	   					   				
	   				var div_eng = document.createElement('div');
	   				div_eng.setAttribute('id', 'brandNm');
	   				div_eng.innerText = pick_brandList[sIdx].b_nm_eng
	   				div.append(div_eng)
	   				
	   				var div_kor = document.createElement('div');
					div_kor.setAttribute('id', 'perfumeNm');
	   				div_kor.innerText = pick_brandList[sIdx].p_nm
	   				div.append(div_kor)
	   				
	   				var div_size = document.createElement('div');
	   				div_size.innerText = pick_brandList[sIdx].p_size + 'ml'
	   				div.append(div_size)
	   				
	   				var div_price = document.createElement('div');
	   				div_price.innerText = numberFormat(pick_brandList[sIdx].p_price) + '원'
	   				div.append(div_price)
	   				sel_div.append(div)
	   				
	   				// sIdx가 리스트의 길이값과 같아질 때  마지막 향수 생성하고 더보기 지우기
	   				if(pick_brandList.length-1 == sIdx) {
	   					document.getElementById('moreDiv').style.display= 'none'
	   				}
	   			}
	   			if(pick_brandList.length - sIdx >= 5) {
	   				eIdx += 5
	   				console.log("eIdx : "+eIdx)
   				}
			}	
		}
	}

		
	function choiceAlphabetMain(b_nm_initial) {
		idx = 0;
		sIdx = 5;
		eIdx = 10;
		var more = document.querySelector('#more');
		more.setAttribute('onclick', "more()")
		document.getElementById('moreDiv').style.display= 'inline'
		axios.get('/common/ajaxSelBrandAlphabet', {
			params : {
				b_nm_initial : b_nm_initial
			}
		}).then(function(res) {
					sel_div.innerText = ''
					for (var i = 0; i < res.data.length; i++) {					
						
						var div = document.createElement('span');
						div.setAttribute('onclick', `moveToDetail(\'\${res.data[i].i_p}\')`);
						div.setAttribute('id', 'list');
						div.setAttribute('class', 'brandAlphabet');
						
						var div_kor = document.createElement('div');
						div_kor.setAttribute('id', 'perfumeNm');
						div_kor.innerText = res.data[i].p_nm
						
						var div_eng = document.createElement('div');
						div_eng.setAttribute('id', 'brandNm');
						div_eng.innerText = res.data[i].b_nm_eng
						
						var div_size = document.createElement('div');
						div_size.innerText = res.data[i].p_size + 'ml'
						
						var div_price = document.createElement('div');
						div_price.innerText = numberFormat(res.data[i].p_price) + '원'
						
						var img = document.createElement('img');
						img.src = res.data[i].p_pic
						
						div.append(img)
						div.append(div_eng)
						div.append(div_kor)
						div.append(div_size)
						div.append(div_price)
						sel_div.append(div)
					}
				})
		axios.get('/common/ajaxSelBrandNm',{
			params : {
				b_nm_initial : b_nm_initial
			}
		}).then(function(res){
			selBrand.innerText = '' 
			for (var i = 0; i < res.data.length; i++){
				var b_nm_eng = res.data[i].b_nm_eng
				var div = document.createElement('span'); 
				var div_eng = document.createElement('div');
				div.setAttribute('onclick', `choiceAlphabetFullNm(\'\${res.data[i].b_nm_eng}\')`);
				div.setAttribute('class', 'brandAlphabet');
				div_eng.innerText = b_nm_eng
				div.append(div_eng)
				selBrand.append(div)	
			}
		})
		axios.get('/common/ajaxSelBrandAlphabet', {
			params : {
				b_nm_initial : b_nm_initial
			}
		}).then(function(res) {
				var tempArr = res.data.selBrandAlpahbet
				console.log(`length : \${tempArr.length}`)
				brandList = new Array();
				console.log(res)
				rowAllCnt = res.data.rowAllCnt
				
				console.log(rowAllCnt)
		 		if(b_nm_initial != undefined){makeArrayList(tempArr)} 
				
				sel_div.innerText = ''
				
				for (var i = 0; i < 5; i++) {
					var div = document.createElement('div');
					div.setAttribute('onclick', `moveToDetail(\'\${tempArr[i].i_p}\')`);
					div.setAttribute('class', 'brandAlphabet');		
					
					var img = document.createElement('img');
					img.src = tempArr[i].p_pic
					div.append(img)
					
					var div_eng = document.createElement('div');
					div_eng.setAttribute('id', 'brandNm');
					div_eng.innerText = tempArr[i].b_nm_eng
					div.append(div_eng)
	
					var div_kor = document.createElement('div');
					div_kor.innerText = tempArr[i].p_nm
					div_kor.setAttribute('id', 'perfumeNm');
					div.append(div_kor)
					
					var div_size = document.createElement('div');
					div_size.innerText = tempArr[i].p_size + 'ml'
					div.append(div_size)
					
					var div_price = document.createElement('div');
					div_price.innerText = numberFormat(tempArr[i].p_price) + '원'
					div.append(div_price)
					sel_div.append(div)
					idx = 5
					// sIdx가 리스트의 길이값과 같아질 때  마지막 향수 생성하고 더보기 지우기
	   				if(res.data.length-1 == sIdx) {
	   					document.getElementById('moreDiv').style.display= 'none'
	   				}
				}
			})
	}
	//디테일페이지 이동
	function moveToDetail(i_p) {
		console.log(i_p)
		location.href="/common/detail?i_p=" + i_p
	}
	
	//브랜드 이름 클릭
	function choiceAlphabetFullNm(b_nm_eng){
		sIdx = 5;
		eIdx = 10;
		var more = document.querySelector('#more');
		more.setAttribute('onclick', "more("+"'"+b_nm_eng+"'"+")")
		document.getElementById('moreDiv').style.display= 'inline'
		
		axios.get('/common/ajaxSelBrandFullAp',{
			params : {
				b_nm_eng : b_nm_eng
			}
		}).then(function(res){
				sel_div.innerText = ''
			/* hiddenSwiper.innerText = '' */
			if(res.data.length <= 5) {
				document.getElementById('moreDiv').style.display= 'none'
			} else {
				document.getElementById('moreDiv').style.display= 'inline'
			}
			for (var i = 0; i < 5; i++){
				var div = document.createElement('div');
				div.setAttribute('onclick', `moveToDetail(\'\${res.data[i].i_p}\')`);
				div.setAttribute('class', 'brandAlphabet');
				var div_kor = document.createElement('div');
				var div_eng = document.createElement('div');
				var div_size = document.createElement('div');
				var div_price = document.createElement('div');
				var img = document.createElement('img');
				
				var img = document.createElement('img');
				img.src = res.data[i].p_pic
				div.append(img)
				
				var div_eng = document.createElement('div');
				div_eng.setAttribute('id', 'brandNm');
				div_eng.innerText = res.data[i].b_nm_eng
				div.append(div_eng)
				var div_kor = document.createElement('div');
				div_kor.setAttribute('id', 'perfumeNm');
				div_kor.innerText = res.data[i].p_nm
				div.append(div_kor)
				
				var div_size = document.createElement('div');
				div_size.innerText = res.data[i].p_size + 'ml'
				div.append(div_size)
				
				var div_price = document.createElement('div');
				div_price.innerText = numberFormat(res.data[i].p_price) + '원'
				div.append(div_price)
				sel_div.append(div)
			}
		})
	}
 
	//가격에 쉼표 붙이기
	function numberFormat(inputNumber) {
		return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
<script type="text/javascript">
	// by - 유빈
	
	//로그인 유저의 pk값 변수 생성 후 값 설정 
	var loginUserI_user = `${loginUser.i_user}`
	
	// 타입 변환 (String => int)
	loginUserI_user = Number(loginUserI_user);
	
	// 로그인 유저 변수 생성 후 pk값 설정 - 시작
	var loginUser = new Object();
	
	function setLoginUser(loginUser) {
	   loginUser.i_user = loginUserI_user;
	}
	
	setLoginUser(loginUser)
	// 끝
	
	// 향수 관련 변수 생성 후 값 설정
	var perfumeI_user = `${perfume.i_user}`
	var i_p = `${perfume.i_p}`
	
	// 타입 변환 (String => int)
	perfumeI_user = Number(perfumeI_user);
	i_p = Number(i_p);
	
	// 향수 변수 생성 후 향수 관련 값 설정 - 시작
	var perfume = new Object();
	
	function setPerfume(perfume) {
		perfume.i_user = perfumeI_user;
 		perfume.i_p = i_p;
	}
	
	setPerfume(perfume)
	// 끝
	
	// UserFavorite 생성 함수 호출
	if(loginUser.i_user > 0) {
		createUserFavorite()
	}
	
	// 페이지 번호 생성
	ajaxSelPageCnt(i_p)
	
	// 처음 페이지 변수 생성 후 선택 표시 !
	var first_page = 1;
	
	// cmtList 생성 함수 호출
	ajaxSelPage(perfume.i_p, first_page)
	
	// 현재 페이지 변수 생성
	var now_page = 1;
	
	// 댓글 수정 온 오프 변수 생성
	const updOn = 1;
	const updOff = 0;
	var now_upd_situation = 0;
	
		
	function ajaxDelUserFavorite() {
		axios.post('/user/ajaxDelUserFavorite', {
			i_p : perfume.i_p
		}).then(function(res) {
			if(res.data == 1) {
		    	favorite.innerText = 'favorite_border';
		    	perfume.i_user = null;
	      	} else {
				alert('좋아요 취소에 실패하셨습니다.')
	      	} 
		})
	}
	
	function ajaxInsUserFavorite() {
		axios.post('/user/ajaxInsUserFavorite', {
			i_p : perfume.i_p
		}).then(function(res) {
			if(res.data == 1) {
				favorite.innerText = 'favorite';
				perfume.i_user = loginUser.i_user;
			} else {
				alert('좋아요에 실패하셨습니다.')
			}
		})
	}
	
	function changeFavorite() {
		if(favorite.innerText == 'favorite') {
			ajaxDelUserFavorite()
		} else if(favorite.innerText == 'favorite_border') {
			ajaxInsUserFavorite()
		}
	   
	}
	
	function createUserFavorite() {
	   
		var span = document.createElement('span');
	   
		span.setAttribute('id', 'favorite');
		span.setAttribute('class', 'material-icons');
	   
		if(loginUser.i_user == perfume.i_user) {
			span.innerText = 'favorite';
		} else {
			span.innerText = 'favorite_border';
		}
		span.addEventListener('click', event => changeFavorite());
	   
		userFavorite.append(span)
	}
	
	// cmt 생성 함수 (수정본) 
	function createCmt(item) {
		var cmt = document.createElement('div');
		cmt.setAttribute('class', 'cmt');
	   
		var cmt_user_img = document.createElement('div');
		cmt_user_img.setAttribute('class', 'cmt_user_img');
		
		var cmt_user_img_img = document.createElement('img');
		if(item.profile_img == '') {
			cmt_user_img_img.src = '/res/img/default_img.jpg'
		}
		cmt_user_img_img.src = '/res/img/profileImg/' + item.profile_img
		
		var cmt_userData = document.createElement('div');
		
		cmt_userData.setAttribute('class', 'cmt_userData cmt_userData_' + item.i_cmt);
		
		var cmt_userData_userNm = document.createElement('div');
		cmt_userData_userNm.setAttribute('class', 'cmt_userData_userNm');
		
		var cmt_userData_userNm_p = document.createElement('p');
		cmt_userData_userNm_p.setAttribute('class', 'cmt_userData_userNm_p');
		cmt_userData_userNm_p.innerText = item.nm
		
		var cmt_userData_userAge = document.createElement('div');
		cmt_userData_userAge.setAttribute('class', 'cmt_userData_userAge');
		
		var cmt_userData_userAge_p = document.createElement('p');
		cmt_userData_userAge_p.setAttribute('class', 'cmt_userData_userAge_p');
		if(item.ageGroup == 1) {
			cmt_userData_userAge_p.innerText = '10세 미만/' + item.gender
		} else if(item.ageGroup == 100) {
			cmt_userData_userAge_p.innerText = '100세 이상/' + item.gender
		} else {
			cmt_userData_userAge_p.innerText = item.ageGroup + '대/' + item.gender
		}
		
		var cmt_cmt = document.createElement('div');
		cmt_cmt.setAttribute('class', 'cmt_cmt cmt_cmt_' + item.i_cmt);
		
		var cmt_cmt_data = document.createElement('div');
		cmt_cmt_data.setAttribute('class', 'cmt_cmt_data');
		
		var cmt_cmt_data_p = document.createElement('p');
		cmt_cmt_data_p.setAttribute('class', 'cmt_cmt_data_' + item.i_cmt);
		cmt_cmt_data_p.innerText = item.cmt
		
		cmt.append(cmt_user_img)
		cmt.append(cmt_userData)
		cmt.append(cmt_cmt)
		cmt_user_img.append(cmt_user_img_img)
		cmt_userData.append(cmt_userData_userNm)
		cmt_userData.append(cmt_userData_userAge)
		cmt_userData_userNm.append(cmt_userData_userNm_p)
		cmt_userData_userAge.append(cmt_userData_userAge_p)
		cmt_cmt.append(cmt_cmt_data)
		cmt_cmt_data.append(cmt_cmt_data_p)
		cmtContents.append(cmt)
	}
	
	// cmt 수정 생성 함수
	function createCmtUpd(item) {
		var cmt_cmt = document.querySelector('.cmt_cmt_' + item.i_cmt);
	   
		var cmt_userData_ud = document.createElement('div');
		cmt_userData_ud.setAttribute('class', 'cmt_userData_ud cmt_userData_ud_'+ item.i_cmt)
		
		var cmt_upd = document.createElement('div');
		cmt_upd.setAttribute('class', 'cmt_upd_' + item.i_cmt);
		
		var cmt_upd_bt = document.createElement('span');
		cmt_upd_bt.setAttribute('class', 'button cmt_upd_bt_' + item.i_cmt);
		
		cmt_upd_bt.innerText = '수정';
		
		// cmt_upd_bt.setAttribute('onclick', 'cmtUpdExe('+item+')');
		// cmt_upd_bt.addEventListener('click', event => cmtUpdExe(item, cmt_upd_bt));
		
		
		cmt_upd_bt.onclick = function() {
			cmtUpdExe(item)
		}
		
		cmt_upd.append(cmt_upd_bt)
		cmt_userData_ud.append(cmt_upd)
		cmt_cmt.append(cmt_userData_ud)
	}
	
	// cmt 삭제 생성 함수
	function createCmtDel(item) {
		var cmt_cmt = document.querySelector('.cmt_cmt_' + item.i_cmt);
		
		var cmt_userData_ud = document.querySelector('.cmt_userData_ud_'+ item.i_cmt)
		
		var cmt_del = document.createElement('div');
		var cmt_del_bt = document.createElement('span');
		
		cmt_del.setAttribute('class', 'cmt_del_' + item.i_cmt);
		cmt_del_bt.setAttribute('class', 'button cmt_del_bt_' + item.i_cmt);
		
		cmt_del_bt.innerText = '삭제';
		
		// cmt_del_bt.setAttribute('onclick', 'ajaxDelCmt('+item+')');
		// cmt_del_bt.addEventListener('click', event => cmtDel(item));
		
		cmt_del_bt.onclick = function() {
			cmtDel(item)
		}
		
		cmt_del.append(cmt_del_bt)
		cmt_userData_ud.append(cmt_del)
	}
	
	function ajaxSelPageCnt(i_p) {
		axios.get('/cmt/ajaxSelPageCnt', {
			params : {
				i_p : i_p
			}
		}).then(function(res) {
	      
			var cmt_cnt_content = document.querySelector(".cmt_cnt_content");
			
			cmt_cnt_content.innerText = '';
			
			pageGroup.innerText = '';
			
			cmt_cnt_content.innerText = '(' + res.data.cmt_cnt + ')';
			
			let pagingCnt = res.data.page_cnt;
			
			for(let page = 1; page <= pagingCnt; page++) {
				var span = document.createElement('span');
				
				span.classList.add('cmt_page', 'page_' + page)
				
				span.innerText = page;
				
				span.addEventListener('click', event => ajaxSelPage(perfume.i_p, page, pagingCnt));
				span.addEventListener('click', event => selPage(page, pagingCnt));
				
				pageGroup.append(span);
			}
			if(now_page == 1) {
				var first = document.querySelector('.page_'+ first_page)
				first.classList.add('on');
			} else {
				var nowPage = document.querySelector('.page_'+ now_page)
				nowPage.classList.add('on');
			}
		})
	}
	
	function selPage(page, pagingCnt) {
		// by-유빈 / 수정 중 페이지 이동 시 처리 / 2020-11-17
		if(now_upd_situation == updOn) {
			return;
  	    }
		var all_page = document.querySelectorAll('.cmt_page');
		for(var i=0; i<pagingCnt; i++) {
			all_page[i].classList.remove('on');
		}
	   
		var this_page = document.querySelector('.page_'+ page)
		this_page.classList.add('on');
	   
		// 페이지 선택했을 때 현재 페이지 값 변경
		now_page = page;
	}
	
	function ajaxSelPage(i_p, page, pagingCnt) {
		   axios.get('/cmt/ajaxSelPage', {
		      params : {
		         i_p : i_p,
		         page : page
		      }
		   }).then(function(res) {
			  // by-유빈 / 수정 중 페이지 이동 시 처리 / 2020-11-17
			  if(now_upd_situation == updOn) {
				  alert('댓글 수정 중에는 페이지 이동이 불가능합니다. 수정을 완료한 후 다시 시도해주세요.');
				  return;
		  	  }
		      if(res.data.length == 0 && now_page != 1) {
		         now_page -= 1
		         selPage(now_page, pagingCnt)
		         ajaxSelPage(i_p, now_page)
		      } else if(res.data.length == 0 && now_page == 1) {
		    	 emptyCmt()
			     selPage(now_page, pagingCnt)
		      }
		       
		      cmtContents.innerText = ''
		      
		      res.data.forEach(function(item) {
		         console.log(item.cmt)
		         item.i_p = this.i_p
		         createCmt(item)
		         if(loginUser.i_user == item.i_user) {
		            createCmtUpd(item);
		            createCmtDel(item);
		         }
		      })
		      
		      if(res.data.length == 0 && now_page == 1) {
		    	  emptyCmt()
		      }
		   })
		}
		
	function emptyCmt() {
			var cmtContents = document.querySelector('#cmtContents')
			
			let div = document.createElement('div');
			div.classList.add('emptyCmtContainer')
			
			let div2 = document.createElement('div')
			div2.classList.add('emptyCmtBox')
			
			let div3 = document.createElement('div')
			div3.classList.add('emptyCmtContent')
			div3.innerText = '첫번째 댓글을 남겨보세요'
			
			div2.append(div3)
			div.append(div2)
			
			cmtContents.append(div)
		}
	function cmtDel(item) {
		
			if(now_upd_situation == updOn) {
				alert('댓글 수정 중에는 삭제 기능을 이용 할 수 없습니다.')
				return false;
			}
			if (confirm("댓글을 삭제 하시겠습니까??") == true) {    //확인
		      	ajaxDelCmt(item)
			}else {   //취소
		       	return false;
		   	}
		
	}
	
	// cmt 수정 완료
	function CmtUpdSuccessChk(item) {
		var cmt_val_i_cmt = document.querySelector('#cmt_val_'+ item.i_cmt)
	   	var insCmt = cmt_val_i_cmt.value
		
		if(cmt_val_i_cmt.value == '') {
			alert('수정을 위해 댓글을 입력해주세요.')
			return false
	   	}
	   
	   	if(cmt_val_i_cmt.value.length > 50) {
	      	alert('수정을 위해 댓글은 50자 이하로 입력해주세요.')
	      	cmt_val_i_cmt.value = insCmt.substr(0, 50)
	      	return false
	   	}
	   
	   	if(cmt_val_i_cmt.value == item.cmt) {
	      	alert('변경된 사항이 없습니다. 댓글을 다시 수정해주세요.')
	      	return false
	   	}
	   
	   	if (confirm("댓글을 수정 하시겠습니까??") == true) {    //확인
	      	item.cmt = cmt_val_i_cmt.value
	      	ajaxUpdCmt(item)
   		}else {   //취소
	       	return false;
	   	}
	   
	}
	
	// cmt 수정 취소
	function CmtUpdReturnChk(item) {
	   
		if (confirm("댓글 수정을 취소 하시겠습니까??") == true) {    //확인
	  		now_upd_situation = updOff
	  		ajaxSelPageCnt(perfume.i_p)
	       	ajaxSelPage(perfume.i_p, now_page)
	   	}else {   //취소
	       	return false;
	   	}
	}
	
	// cmt 수정 -> 완료 생성 함수
	function changeCmtUpdSuccess(item) {
	   
		var cmt_suc = document.querySelector('.cmt_upd_' + item.i_cmt);
		cmt_suc.className = 'cmt_suc_' + item.i_cmt;
		
		var cmt_suc_bt = document.querySelector('.cmt_upd_bt_' + item.i_cmt);
		cmt_suc_bt.className = 'button cmt_suc_bt_' + item.i_cmt;
		
		cmt_suc_bt.innerText = '완료';
		
		// cmt_suc_bt.addEventListener('click', event => CmtUpdSuccessChk(item))
		cmt_suc_bt.onclick = function() {
			CmtUpdSuccessChk(item)
		}
		
	}
	
	// cmt 삭제 -> 취소 변경 함수
	function changeCmtUpdReturn(item) {
	   
		var cmt_ret = document.querySelector('.cmt_del_' + item.i_cmt);
		cmt_ret.className = 'cmt_ret_' + item.i_cmt;
		
		var cmt_ret_bt = document.querySelector('.cmt_del_bt_' + item.i_cmt);
		cmt_ret_bt.className = 'button cmt_ret_bt_' + item.i_cmt;
	   
	    cmt_ret_bt.innerText = '취소';
	   
	    // cmt_ret_bt.addEventListener('click', event => CmtUpdReturnChk(item));
	    cmt_ret_bt.onclick = function() {
	    	CmtUpdReturnChk(item)
		}
	    
	}
	
	// 댓글 수정 기능 변경(수정, 삭제 -> 완료, 취소)
	function changeCmtUpdFunction(item) {
			
		// 수정, 삭제 버튼을 감싸고있는 div의 클래스 변경 
	    var cmt_userData_sr = document.querySelector('.cmt_userData_ud_'+ item.i_cmt)
	    cmt_userData_sr.className = 'cmt_userData_sr'
		cmt_userData_sr.classList.add('cmt_userData_sr_' + item.i_cmt)
		
		changeCmtUpdSuccess(item)
		changeCmtUpdReturn(item)
	
	}
	
	// cmt 수정 실행
	function cmtUpdExe(item) {
		
			if(now_upd_situation == updOff) {
				var cmt_cmt_data = document.querySelector('.cmt_cmt_data_' + item.i_cmt);
				   
			    cmt_cmt_data.innerText = '';
			   
			    var div = document.createElement('div');
			    var textarea = document.createElement('textarea');
			   
			    textarea.setAttribute('id', 'cmt_val_' + item.i_cmt);
			    textarea.setAttribute('cols', '50');
			    textarea.setAttribute('rows', '10');
			    textarea.setAttribute('name', 'cmt');
			    textarea.setAttribute('style', 'width: 260px; height: 90px; font-family: "Montserrat"; font-size: 16px;');
			   
			    textarea.setAttribute('placeholder', '댓글 수정 중... (50자 이내)');
			   
			    textarea.innerText = item.cmt;
			   
			    div.append(textarea);
			    cmt_cmt_data.append(div);
			   
			    changeCmtUpdFunction(item)
			    
			    now_upd_situation = updOn
			} else if(now_upd_situation == updOn) {
				alert('이미 다른 댓글을 수정중입니다. 수정을 완료한 후 다시 시도해주세요.');
			} else {
				alert('특수한 상황입니다. 관리자에게 문의해주세요.')
			}
		
	}
	
	// cmt 등록 함수
	function ajaxInsCmt(cmt) {
   		axios.post('/cmt/ajaxInsCmt', {
      		cmt : cmt,
	      	i_p : perfume.i_p
	   	}).then(function(res) {
	      	console.log(res.data)
	      	if(res.data == 1) {
	         	alert('댓글이 정상적으로 등록되었습니다.')
	         	cmt_val.value = '';
	         	// 리스트 다시 불러오기
	         	now_page = 1
	         	ajaxSelPageCnt(perfume.i_p)
	         	ajaxSelPage(perfume.i_p, first_page)
     		} else {
	         alert('댓글 등록에 실패했습니다.')
      		}
	   	})
	}
	
	// cmt 수정 함수
	function ajaxUpdCmt(item) {
	   	axios.post('/cmt/ajaxUpdCmt', {
	      	i_cmt : item.i_cmt,
	      	cmt : item.cmt,
   			i_p : perfume.i_p
	   	}).then(function(res) {
	      	console.log(res.data)
	      	if(res.data == 1) {
	         	alert('댓글이 정상적으로 수정되었습니다.')
	         	// 리스트 다시 불러오기
	         	now_upd_situation = updOff
	         	ajaxSelPageCnt(perfume.i_p)
	         	ajaxSelPage(perfume.i_p, now_page)
	      	} else {
         		alert('댓글 수정에 실패했습니다.')
	      	}
   		})
	}
	
	// cmt 삭제 함수
	function ajaxDelCmt(item) {
		axios.post('/cmt/ajaxDelCmt', {
			i_cmt : item.i_cmt,
			i_p : perfume.i_p
		}).then(function(res) {
			console.log(res.data)
			if(res.data == 1) {
				alert('댓글이 정상적으로 삭제되었습니다.')
				// 리스트 다시 불러오기
				ajaxSelPageCnt(perfume.i_p)
				ajaxSelPage(perfume.i_p, now_page)
			}else {
				alert('댓글 삭제에 실패했습니다.')
			}
		})
	}
	
	function cmtChk() {
		if(now_upd_situation == updOn) {
			alert('댓글 수정 중에는 댓글 쓰기 기능을 이용 할 수 없습니다.')
			return false;
		}
		var InsCmt = cmt_val.value
		if(InsCmt.length == ''){
			alert('댓글을 입력해주세요.')
			return false
		}
	   
		if(InsCmt.length > 50){
			alert('댓글은 50자 이하로 입력해주세요.')
			cmt_val.value = InsCmt.substr(0, 50)
			return false
		}
	  	// 
		ajaxInsCmt(InsCmt)
	}
</script>
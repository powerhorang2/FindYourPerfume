<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>${title}</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,500;1,500;1,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/res/css/common.css?ver=1">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<c:forEach items="${css}" var="item">
	<link rel="stylesheet" type="text/css" href="/res/css/${item}.css?ver=2">
</c:forEach>
</head>
<body>
	<div id="container">
		<header>
			<div id="headerLeft">
				<div class="ml15" id="main" style="font-family:'Montserrat', sans-serif; font-style: italic;"><a href="/common/main">FindYourPerfume</a></div>	
			</div>
			<div id="headerRight">
				<a class="ml15" href="/user/myPage">
					<svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M33.3333 16.6666C33.3333 21.2708 29.6041 24.9999 24.9999 24.9999C20.3958 24.9999 16.6666 21.2708 16.6666 16.6666C16.6666 12.0624 20.3958 8.33325 24.9999 8.33325C29.6041 8.33325 33.3333 12.0624 33.3333 16.6666ZM8.33325 37.4999C8.33325 31.9582 19.4374 29.1666 24.9999 29.1666C30.5624 29.1666 41.6666 31.9582 41.6666 37.4999V39.5832C41.6666 40.7291 40.7291 41.6666 39.5833 41.6666H10.4166C9.27075 41.6666 8.33325 40.7291 8.33325 39.5832V37.4999Z" fill="#F2F2F2"/>
					</svg>
				</a>
			</div>
		</header>
		<section>
		<div id="commonContainer">
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
						<p onclick="choiceAlphabetMain()">ALL</p>	
						<c:forEach items="${brandAlphabet}" var="item">
							<p onclick="choiceAlphabetMain(`${item}`)">${item}</p>
						</c:forEach>
						<p onclick="choiceAlphabetMain('ETC')">ETC</p>
					</div>
				</div>
				<div id="selBrand">
				</div>
			</div>
			<div id="mainContainer">		
				<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
			</div>
		</div>
		</section>
		<footer>
			<span></span>
		</footer>
	</div>
	<script>
		function moveToPage(p) {
			location.href = p;
		}
		
		var brandList = []
		
	 	choiceAlphabetMain(undefined)

		function choiceAlphabetMain(b_nm_initial) {
			console.log(b_nm_initial)
			axios.get('/common/ajaxSelBrandAlphabet', {
				params : {
					b_nm_initial : b_nm_initial
				}
			}).then(function(res) {
						sel_div.innerText = ''
						for (var i = 0; i < res.data.length; i++) {	
							
							var div = document.createElement('span');
							div.setAttribute('onclick', `moveToDetail(\'\${res.data[i].i_p}\')`);
							var div_kor = document.createElement('div');
							var div_eng = document.createElement('div');
							var div_size = document.createElement('div');
							var div_price = document.createElement('div');
							var img = document.createElement('img');
							div.setAttribute('class', 'brandAlphabet');

							img.src = res.data[i].p_pic
							div_eng.innerText = '향수 브랜드 : ' + res.data[i].b_nm_eng
							div_kor.innerText = '향수 이름 : ' + res.data[i].p_nm
							div_size.innerText = '향수 용량 : ' + res.data[i].p_size + 'ml'
							div_price.innerText = '향수 가격 : '
									+ numberFormat(res.data[i].p_price) + '원'

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
					console.log(res.data[i])
					var b_nm_eng = res.data[i].b_nm_eng
					var div = document.createElement('span'); 
					var div_eng = document.createElement('div');
					div.setAttribute('onclick', `choiceAlphabetFullNm(\'\${res.data[i].b_nm_eng}\')`);
					div_eng.innerText = b_nm_eng
					div.append(div_eng)

					selBrand.append(div)	
				}
			})
					
		}
		
		function choiceAlphabetFullNm(b_nm_eng){
			console.log('ㅎㅎ : ' + b_nm_eng);
			
			axios.get('/common/ajaxSelBrandFullAp',{
				params : {
					b_nm_eng : b_nm_eng
				}
			}).then(function(res){
				sel_div.innerText = ''
				hiddenSwiper.innerText = ''
				for (var i = 0; i < res.data.length; i++){
					var div = document.createElement('div');
					var div_kor = document.createElement('div');
					var div_eng = document.createElement('div');
					var div_size = document.createElement('div');
					var div_price = document.createElement('div');
					var img = document.createElement('img');
					
					img.src = res.data[i].p_pic
					div_eng.innerText = '향수 브랜드 : ' + res.data[i].b_nm_eng
					div_kor.innerText = '향수 이름 : ' + res.data[i].p_nm
					div_size.innerText = '향수 용량 : ' + res.data[i].p_size
					div_price.innerText = '향수 가격 : '
							+ numberFormat(res.data[i].p_price) + '원'

					div.append(img)
					div.append(div_eng)
					div.append(div_kor)
					div.append(div_size)
					div.append(div_price)

					sel_div.append(div)
				}
			})
		}

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
		   		if(b_nm_eng == null) {
		   			if (rowAllCnt == sIdx){
		   				alert('마지막입니다.')
		   			} else {
		   			// 235
		   	   	 		if((rowAllCnt-1) - sIdx < 5){eIdx = rowAllCnt}
		   	   	 	
		   	   			for (sIdx; sIdx < eIdx; sIdx++) {
		   	   				console.log(sIdx)
		   	   				var div = document.createElement('div');
		   	   				div.setAttribute('onclick', 'moveToDetail('+brandList[sIdx].i_p+')');//수정해야됨
		   	   				div.setAttribute('class', 'brandAlphabet');
		   	   				
		   	   				var img = document.createElement('img');
		   	   				img.src = brandList[sIdx].p_pic
		   	   				div.append(img)
		   	   				
		   	   				var div_kor = document.createElement('div');
		   	   				div_kor.innerText = '향수 이름 : ' + brandList[sIdx].p_nm
		   	   				div.append(div_kor)
		   	   				
		   	   				var div_eng = document.createElement('div');
		   	   				div_eng.innerText = '향수 브랜드 : ' + brandList[sIdx].b_nm_eng
		   	   				div.append(div_eng)
		   	   				
		   	   				var div_size = document.createElement('div');
		   	   				div_size.innerText = '향수 용량 : ' + brandList[sIdx].p_size + 'ml'
		   	   				div.append(div_size)
		   	   				
		   	   				var div_price = document.createElement('div');
		   	   				div_price.innerText = '향수 가격 : '+ numberFormat(brandList[sIdx].p_price) + '원'
		   	   				div.append(div_price)
		   	   				sel_div.append(div)
		   	   			}
		   	   			if(rowAllCnt - sIdx >= 5){
		   	   				eIdx += 5
		   	   				console.log("eIdx : "+eIdx)
		   	   			}
		   			}
		   			
		   		} else {
		   			var pick_brandList = new Array();
		   	   		for(var i=0; i<brandList.length; i++) {
		   	   			if(brandList[i].b_nm_eng == b_nm_eng) {
		   	   				pick_brandList.push(brandList[i])
		   	   			}
		   	   		}
		   	   		console.log(pick_brandList);
		   	   		
		   	   		if(pick_brandList.length == sIdx) {
						alert('마지막입니다.')
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
			   				
			   				var div_kor = document.createElement('div');
			   				div_kor.innerText = '향수 이름 : ' + pick_brandList[sIdx].p_nm
			   				div.append(div_kor)
			   				
			   				var div_eng = document.createElement('div');
			   				div_eng.innerText = '향수 브랜드 : ' + pick_brandList[sIdx].b_nm_eng
			   				div.append(div_eng)
			   				
			   				var div_size = document.createElement('div');
			   				div_size.innerText = '향수 용량 : ' + pick_brandList[sIdx].p_size + 'ml'
			   				div.append(div_size)
			   				
			   				var div_price = document.createElement('div');
			   				div_price.innerText = '향수 가격 : '+ numberFormat(pick_brandList[sIdx].p_price) + '원'
			   				div.append(div_price)
			   				sel_div.append(div)
			   			}
			   			if(pick_brandList.length - sIdx >= 5){
			   				eIdx += 5
			   				console.log("eIdx : "+eIdx)
			   			}
					}
		   	   		
		   			
		   		}
			}
		 	
			function choiceAlphabetMain(b_nm_initial) {
				console.log(b_nm_initial)
				idx = 0;
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
								var div_kor = document.createElement('div');
								var div_eng = document.createElement('div');
								var div_size = document.createElement('div');
								var div_price = document.createElement('div');
								var img = document.createElement('img');
								div.setAttribute('class', 'brandAlphabet');
								img.src = res.data[i].p_pic
								div_eng.innerText = '향수 브랜드 : ' + res.data[i].b_nm_eng
								div_kor.innerText = '향수 이름 : ' + res.data[i].p_nm
								div_size.innerText = '향수 용량 : ' + res.data[i].p_size + 'ml'
								div_price.innerText = '향수 가격 : '
										+ numberFormat(res.data[i].p_price) + '원'
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
					sel_brand.innerText = ''
					for (var i = 0; i < res.data.length; i++){
						var b_nm_eng = res.data[i].b_nm_eng
						var div = document.createElement('span'); 
						var div_eng = document.createElement('div');
						div.setAttribute('onclick', `choiceAlphabetFullNm(\'\${res.data[i].b_nm_eng}\')`);
						div_eng.innerText = b_nm_eng
						div.append(div_eng)
						sel_brand.append(div)	
					}
				})
				axios.get('/common/ajaxSelBrandAlphabet', {
		/*  			console.log(listMore) */
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
			
							var div_kor = document.createElement('div');
							div_kor.innerText = '향수 이름 : ' + tempArr[i].p_nm
							div.append(div_kor)
							
							var div_eng = document.createElement('div');
							div_eng.innerText = '향수 브랜드 : ' + tempArr[i].b_nm_eng
							div.append(div_eng)
							
							var div_size = document.createElement('div');
							div_size.innerText = '향수 용량 : ' + tempArr[i].p_size + 'ml'
							div.append(div_size)
							
							var div_price = document.createElement('div');
							div_price.innerText = '향수 가격 : '+ numberFormat(tempArr[i].p_price) + '원'
							div.append(div_price)
							sel_div.append(div)
							idx = 5
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
				
				axios.get('/common/ajaxSelBrandFullAp',{
					params : {
						b_nm_eng : b_nm_eng
					}
				}).then(function(res){
					sel_div.innerText = ''
					hiddenSwiper.innerText = ''
					
					for (var i = 0; i < 5; i++){
						var div = document.createElement('div');
						div.setAttribute('onclick', `moveToDetail(\'\${res.data[i].i_p}\')`);
						var div_kor = document.createElement('div');
						var div_eng = document.createElement('div');
						var div_size = document.createElement('div');
						var div_price = document.createElement('div');
						var img = document.createElement('img');
						
						var img = document.createElement('img');
						img.src = res.data[i].p_pic
						div.append(img)
						
						var div_kor = document.createElement('div');
						div_kor.innerText = '향수 이름 : ' + res.data[i].p_nm
						div.append(div_kor)
						
						var div_eng = document.createElement('div');
						div_eng.innerText = '향수 브랜드 : ' + res.data[i].b_nm_eng
						div.append(div_eng)
						
						var div_size = document.createElement('div');
						div_size.innerText = '향수 용량 : ' + res.data[i].p_size
						div.append(div_size)
						
						var div_price = document.createElement('div');
						div_price.innerText = '향수 가격 : '
								+ numberFormat(res.data[i].p_price) + '원'
						div.append(div_price)
						sel_div.append(div)
					}
				})
			}
			 
			//가격에 쉼표 붙이기
			function numberFormat(inputNumber) {
				return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}

		<!-- Initialize Swiper -->

			var swiper = new Swiper('.swiper-container', {
				slidesPerView : 5,
				spaceBetween : 30,
				slidesPerGroup : 5,
				loop : true,
				loopFillGroupWithBlank : true,
				pagination : {
					el : '.swiper-pagination',
					clickable : true,
				},
				navigation : {
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				},
			});
	</script>	
</body>
</html>
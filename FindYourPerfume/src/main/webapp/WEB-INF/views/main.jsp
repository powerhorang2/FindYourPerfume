<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <div class="brandContainer"> -->
<%-- 	<div id="brandLeft">
		<div>
			<div class="msg">${data.msg}</div>
			<div class="loginUser">
				<c:choose>
					<c:when test="${loginUser.i_user == null}">
						<div class="loginUserInfo">
							<form class="frm" action="/common/main" method="post">
								<div>
									<input type="text" name="user_id" placeholder="아이디"
										value="${data.user_id}">
								</div>
								<div>
									<input type="password" name="user_pw" placeholder="비밀번호">
								</div>
								<div>
									<input type="submit" value="로그인">
								</div>
							</form>
						</div>
						<div></div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${loginUser.user_type == '2'}">
								<div class="loginUserInfo">
									<div class="loginMsg">
										<div class="box" style="background: #BDBDBD;">
											<img class="profile"
												src="/res/img/profileImg/${loginUser.profile_img}">
										</div>
									</div>
									<div>${loginUser.nm}관리자님환영합니다.</div>
									<div>
										<a href="/user/admin" id="btnLogout">Admin</a> <a
											href="/user/logout" id="btnLogout">Logout</a>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="loginUserInfo">
									<div class="box" style="background: #BDBDBD;">
										<img class="profile"
											src="/res/img/profileImg/${loginUser.profile_img}">
									</div>
									<div>${loginUser.nm}님환영합니다.</div>
									<div>
										<a href="/user/myPage" id="btnLogout">My Page</a> <a
											href="/user/logout" id="btnLogout">Logout</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<c:if test="${loginUser.i_user == null}">
					<a href="/user/join" id="btnLogout">회원가입 하러가기</a>
				</c:if>

				
			<!--알파벳 클릭  -->
				<div id="selBrandAlphabet">
						<p onclick="choiceAlphabetMain('ALL')">ALL</p>	
						
					<c:forEach items="${brandAlphabet}" var="item">
						<p onclick="choiceAlphabetMain(`${item}`)">${item}</p>
					</c:forEach> 
					<p onclick="choiceAlphabetMain('ETC')">ETC</p>
				</div>
				<div id="sel_brand">
					<div id="SelBrandNm">
 						<div>
							 <c:forEach items="${brandEnm}" var="data">
								<p>${data.b_nm_eng}</p>
							</c:forEach> 
						 	<c:forEach items="${brandFullNm}" var="item">
								<p onclick="choiceAlphabetFullNm(`${item}`)">${item}</p>
							</c:forEach>
						</div> 
					</div>
				</div>
			</div>
		</div>
		<!-- 작업주우우우우우우우우우우우우우우웅 -->
	</div> --%>
<!-- 	<div id="brandRight">
		<div class="topPerfume">
		<div id="hiddenSwiper"> -->
<div id="brandContainer">
	<div id="hiddenSwiper">
		<div id="topPerfume">
			<div id="topPerfumeTitle">MOST LOVED PERFUMES</div>
			<div id="topPerfumeList">
			<c:forEach items="${topPerfume}" var="item">
				<div id="topPerfumeItem">
					<div id="topPImg">
						<img src="${item.p_pic}">
					</div>
					<div><b>${item.b_nm_eng}</b></div>
					<div id="topPerfumeNm">${item.p_nm}</div>
					<div>${item.p_size}ml | ${item.p_price}</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<div id="recPerfume">
	 		<c:if test="${loginUser != null}">
				<div id="recPerfumeTitle">RECOMMENDS YOU MIGHT LIKE</div>
				<!-- Slider main container -->
				<div class="swiper-container">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper">
						<!-- Slides -->
						<c:forEach items="${recPerfume}" var="item">
							<div class="swiper-slide">
								<div id="topPImg">
									<img src="${item.p_pic}">
								</div>
								<div><b>${item.b_nm_eng}</b></div>
								<div id="topPerfumeNm">${item.p_nm}</div>
								<div>${item.p_size}ml | ${item.p_price}</div>
							</div>
						</c:forEach>
					</div>
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>
	
					<!-- If we need navigation buttons -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</c:if>
		</div>
	</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div id="filter">
			<div>
				필터링~~~~~!~!~!~!~!~!~!~!~!~!~!~!~!~!~!
			</div>
		</div>
		<div id="sel_div">
			<div id="brandAlphabet" class="perfumeMain">
			</div>
		</div>
		<div id="paging">
		<hr>
			<div class="more">
				<button id="more" onclick="more()">더보기</button>
			</div>
		</div> 	
	</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
	   				div.setAttribute('onclick', 'moveToDetail('+pick_brandList[sIdx].i_p+')');//수정해야됨
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
			selBrand.innerText = '' 
			for (var i = 0; i < res.data.length; i++){
				var b_nm_eng = res.data[i].b_nm_eng
				var div = document.createElement('span'); 
				var div_eng = document.createElement('div');
				div.setAttribute('onclick', `choiceAlphabetFullNm(\'\${res.data[i].b_nm_eng}\')`);
				div_eng.innerText = b_nm_eng
				div.append(div_eng)
				selBrand.append(div)	
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

</script>
<!-- <script>
	function a(){
  	  $("#sel_div>div").hide();
   	  $("#sel_div>div").slice(0,3).show();
	}
	function more(){
  	  $("#sel_div>div").slice(3,6).show();
	}
</script> -->

<!-- Initialize Swiper -->
<script>
	var swiper = new Swiper('.swiper-container', {
		slidesPerView : 3,
		spaceBetween : 30,
		slidesPerGroup : 1,
		loop : false,
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
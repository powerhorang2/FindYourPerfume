<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="brandContainer">
	<div id="brandLeft">
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
					<%-- <div id="SelBrandNm">
 						<div>
							 <c:forEach items="${brandEnm}" var="data">
								<p>${data.b_nm_eng}</p>
							</c:forEach> 
						 	<c:forEach items="${brandFullNm}" var="item">
								<p onclick="choiceAlphabetFullNm(`${item}`)">${item}</p>
							</c:forEach>
						</div> 
					</div> --%>
				</div>
			</div>
		</div>
		<!-- 작업주우우우우우우우우우우우우우우웅 -->
	</div>
	<div id="brandRight">
		<div class="topPerfume">
		<div id="hiddenSwiper">
			<c:forEach items="${topPerfume}" var="item">
				<div>향수 이름 : ${item.p_nm}</div>
				<div>향수 용량 : ${item.p_size}ml</div>
				<div>
					<img src="${item.p_pic}">
				</div>
				<div>향수 브랜드 : ${item.b_nm_eng}</div>
				<div>향수 가격 : ${item.p_price}</div>
				<div>------------------------------------------</div>
			</c:forEach>
			<div>===================분리선=================</div>
		</div>
		<c:if test="${loginUser != null}">
			<!-- Slider main container -->
			<div class="swiper-container">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
					<c:forEach items="${recPerfume}" var="item">
						<div class="swiper-slide">
							<span>향수 이름 : ${item.p_nm}</span> <span>향수 용량 :
								${item.p_size}ml</span> <span><img src="${item.p_pic}"></span> <span>향수
								브랜드 : ${item.b_nm_eng}</span> <span>향수 가격 : ${item.p_price}</span>
						</div>
					</c:forEach>
				</div>
				<!-- If we need pagination -->
				<div class="swiper-pagination"></div>

				<!-- If we need navigation buttons -->
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>

				<!-- If we need scrollbar -->
				<div class="swiper-scrollbar"></div>
			</div>
		</c:if>
		</div>
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
			<button onclick="more()" style="width: 300px;">더보기</button>
		</div> 	
	</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

	var brandList = new Array();
	var sIdx = 5;
	var eIdx = 10;
/*  	 $(document).ready(function(){
	 $("#list").slice(0,1).show();
	
 })  */
 	

  	$(function(){
 		$("#sel_div").slice(0,1).show();
	$("#more").click(function(e){
		console.log($("#sel_div").length)
		console.log($("#sel_div:hidden").length)
		e.preventDefault();
		$("#sel_div").slice(0,1).show();
		if($("#sel_div:none").length == 0) {
			alert("no more sibal");
		}
	})
})
 
 
/*  function more() {
	 console.log('1')
	 console.log('2')
 }  */
/*   function more(){
	 $("#list").show();
 }  */

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
  /* 	function more() {
 			
 			//이전에 디비접속해서 갯수를 알아온다음
 			//select count(*) from ~~~~; //갯수
 			//var db_count=0;
 			/*
 			if(db_count < count){
 				
 			} else {
 				
 			}
 			*/
 			
 			//var count=0; 생성 총갯수를 위한 변수
 		
 /* 			for (var i = sIdx; i < eIdx; i++) {
		
			console.log(brandList[i])
			var div = document.createElement('div');
			div.setAttribute('onclick', 'moveToDetail(${brandList[i].i_p})');
			div.setAttribute('class', 'brandAlphabet');
			
			var img = document.createElement('img');
			img.src = brandList[i].p_pic
			div.append(img)
			
			var div_kor = document.createElement('div');
			div_kor.innerText = '향수 이름 : ' + brandList[i].p_nm
			div.append(div_kor)
			
			var div_eng = document.createElement('div');
			div_eng.innerText = '향수 브랜드 : ' + brandList[i].b_nm_eng
			div.append(div_eng)
			
			var div_size = document.createElement('div');
			div_size.innerText = '향수 용량 : ' + brandList[i].p_size + 'ml'
			div.append(div_size)
			
			var div_price = document.createElement('div');
			div_price.innerText = '향수 가격 : '+ numberFormat(brandList[i].p_price) + '원'
			div.append(div_price)


			sel_div.append(div)
		}
			sIdx = sIdx + 5
			eIdx = eIdx + 5 
			
			//count=count*10;
			
	}  */
 	 choiceAlphabetMain(undefined) 

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
				var tempArr = res.data
				brandList = new Array();
				
		 		if(b_nm_initial != undefined){makeArrayList(tempArr)} 
				
				sel_div.innerText = ''
				
				for (var i = 0; i < 5; i++) {
					var div = document.createElement('div');
					div.setAttribute('onclick', `moveToDetail(\'\${tempArr[i].i_p}\')`);
					div.setAttribute('class', 'brandAlphabet');				

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
					div_size.innerText = '향수 용량 : ' + res.data[i].p_size + 'ml'
					div.append(div_size)
					
					var div_price = document.createElement('div');
					div_price.innerText = '향수 가격 : '+ numberFormat(res.data[i].p_price) + '원'
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
				div.setAttribute('id', 'list');
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


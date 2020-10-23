<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
											href="/common/logout" id="btnLogout">Logout</a>
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
											href="/common/logout" id="btnLogout">Logout</a>
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
						<p onclick="choiceAlphabetMain()">ALL</p>	
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
	<%-- 페이징	<div id="page">
		<c:forEach begin="1" end="${pagingNum}" var="item">
			<c:choose>
				<c:when test="${page == item}">
					<span class="pagingFont pageSelected">${item}</span>
				</c:when>
				<c:otherwise>
					<span class="pagingFont">
						<a href="#"></a>
					</span>
				</c:otherwise>
				</c:choose>
			</c:forEach>
		</div> --%>
	</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
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
			sel_brand.innerText = ''
			for (var i = 0; i < res.data.length; i++){
				console.log(res.data[i])
				var b_nm_eng = res.data[i].b_nm_eng
				var div = document.createElement('span'); 
				var div_eng = document.createElement('div');
				div.setAttribute('onclick', `choiceAlphabetFullNm(\'\${res.data[i].b_nm_eng}\')`);
				div_eng.innerText = b_nm_eng
				div.append(div_eng)

				sel_brand.append(div)	
			}
		})
				
	}
	
	function moveToDetail(i_p) {
		console.log(i_p)
		location.href="/common/detail?i_p=" + i_p
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
	 
	
	function choiceAlphabet(b_nm_initial) {
		console.log(b_nm_initial)

	}
	
	//가격에 , 붙이기
	function numberFormat(inputNumber) {
		return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>

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

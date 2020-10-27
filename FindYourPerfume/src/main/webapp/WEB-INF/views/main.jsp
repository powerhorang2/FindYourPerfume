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
		<div id="filter">
			<div>
				필터링~~~~~!~!~!~!~!~!~!~!~!~!~!~!~!~!~!
			</div>
		</div>
		<c:if test="${loginUser != null}">
			<!-- 클래스명은 변경하면 안 됨 -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach items="${recPerfume}" var="item">
						<div class="swiper-slide">
							<span>향수 이름 : ${item.p_nm}</span>
							<span>향수 용량 :${item.p_size}ml</span>
							<span><img src="${item.p_pic}"></span>
							<span>향수 브랜드 : ${item.b_nm_eng}</span>
							<span>향수 가격 : ${item.p_price}</span>
						</div>
					</c:forEach>
				</div>
			
				<!-- 네비게이션 -->
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</div>
			<div style="text-align:center; margin-top:5px;">랜덤사진 갤러리</div>
		</c:if>
		</div>
		<div id="sel_div">
			<div id="brandAlphabet" class="perfumeMain">
			</div>
		</div>

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
						
						var div = document.createElement('div');
						var div_kor = document.createElement('div');
						var div_eng = document.createElement('div');
						var div_size = document.createElement('div');
						var div_price = document.createElement('div');
						var img = document.createElement('img');
						div.setAttribute('class', 'brandAlphabet');

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
	new Swiper('.swiper-container', {
	
		slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 30, // 슬라이드간 간격
		slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
	
		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,
	
		loop : false, // 무한 반복
	
		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
</script>

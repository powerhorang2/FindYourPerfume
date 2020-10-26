<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="brandContainer">
	<div id="brandRight">
		<div id="hiddenSwiper">
		<div class="topPerfume">
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
<%-- 		<c:if test="${loginUser != null}">
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
		</c:if> --%>
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
		   페이지이잉
		</div> 	
	</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	function moveToDetail(i_p) {
		console.log(i_p)
		location.href="/common/detail?i_p=" + i_p
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

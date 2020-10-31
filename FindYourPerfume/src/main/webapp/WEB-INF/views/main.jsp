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
</div>
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
				<a id="myBtn" class="ml15" onclick="viewLayer()">
					<svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M33.3333 16.6666C33.3333 21.2708 29.6041 24.9999 24.9999 24.9999C20.3958 24.9999 16.6666 21.2708 16.6666 16.6666C16.6666 12.0624 20.3958 8.33325 24.9999 8.33325C29.6041 8.33325 33.3333 12.0624 33.3333 16.6666ZM8.33325 37.4999C8.33325 31.9582 19.4374 29.1666 24.9999 29.1666C30.5624 29.1666 41.6666 31.9582 41.6666 37.4999V39.5832C41.6666 40.7291 40.7291 41.6666 39.5833 41.6666H10.4166C9.27075 41.6666 8.33325 40.7291 8.33325 39.5832V37.4999Z" fill="#F2F2F2"/>
					</svg>
				</a>
				<div id="pop">
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
			</div>
		</header>
		<section>
			<div id="mainContainer">		
				<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
			</div>
		</section>
		<footer>
			<span></span>
		</footer>
	</div>
	<script>
		viewLayer()
	
 		function moveToPage(p) {
			location.href = p;
		}
 	    function viewLayer(){
 	        if(document.getElementById('pop').style.display=='none'){
 	           document.getElementById('pop').style.display='inline'
 	        }else{
 	           document.getElementById('pop').style.display='none'
 	        }
 	     }
	</script>
</body>
</html>
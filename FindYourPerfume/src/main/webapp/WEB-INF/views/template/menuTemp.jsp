<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page import="com.springriders.perfume.FileUtils" %>
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
				<c:if test="${loginUser.i_user == null}">
				<a id="myBtn" class="ml15" onclick="moveToPage('/user/login')">				
				</c:if>
				<c:if test="${loginUser.i_user != null}">
				<a id="myBtn" class="ml15" onclick="viewLayer()">
				</c:if>
					<svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M33.3333 16.6666C33.3333 21.2708 29.6041 24.9999 24.9999 24.9999C20.3958 24.9999 16.6666 21.2708 16.6666 16.6666C16.6666 12.0624 20.3958 8.33325 24.9999 8.33325C29.6041 8.33325 33.3333 12.0624 33.3333 16.6666ZM8.33325 37.4999C8.33325 31.9582 19.4374 29.1666 24.9999 29.1666C30.5624 29.1666 41.6666 31.9582 41.6666 37.4999V39.5832C41.6666 40.7291 40.7291 41.6666 39.5833 41.6666H10.4166C9.27075 41.6666 8.33325 40.7291 8.33325 39.5832V37.4999Z" fill="#F2F2F2"/>
					</svg>
				</a>
				<div id="pop">
					<div id="popLoginBox">
						<div id="profileImgContainer">
							<c:if test="${loginUser.profile_img == null}">
								<div id="profileImgBox">
									<img id="sidebarImg" class="profile" src="/res/img/default_img.jpg">					
								</div>
							</c:if>
							<!-- 프로필사진 등록시 -->
							<c:if test="${loginUser.profile_img != null}">
								<div id="profileImgBox">
									<img id="sidebarImg" class="profile" src="/res/img/profileImg/${loginUser.profile_img}">	
								</div>
							</c:if>
						</div>
						<div id="profileInfoBox">
							<div id="welcomeMsg"><b>${loginUser.nm}</b>님</div>
							<div id="loginBtnBox">
							<c:choose>
								<c:when test="${loginUser.user_type == '2'}">
									<input type="button" onclick="moveToPage(`/user/admin`)" class="button" value="ADMIN">
								</c:when>
								<c:otherwise>
									<input type="button" onclick="moveToPage(`/user/myPage`)" class="button" value="MYPAGE">
								</c:otherwise>												
							</c:choose>
								<input type="button" onclick="moveToPage(`/user/logout`)" class="button" value="LOGOUT">
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<section>
			<div id="mainContainer">		
				<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
				<div id="sidebox">
					<span class="material-icons" onclick="moveToTop()">arrow_drop_down_circle</span>
				</div>	
			</div>
		</section>
		<footer>
			<span></span>
		</footer>
	</div>
	<script>
		//페이지 띄울시 display:none 속성주기
		viewLayer()
		
		//팝업창 띄우기
 	    function viewLayer(){
			
 	        if(document.getElementById('pop').style.display=='none'){
 	           document.getElementById('pop').style.display='inline'
 	        }else{
 	           document.getElementById('pop').style.display='none'
 	        }
 	    } 	    	  
	
		//페이지 최상위로가기 
   		function moveToTop() {
	    	window.scrollTo({top:0, behavior:'smooth'});
	    }
		var currentPosition = parseInt($("#sidebox").css("top")); 
		$(window).scroll(function() { 
			var position = $(window).scrollTop(); 
			$("#sidebox").stop().animate({"top":position+currentPosition+"px"},700)
		})
	
		//페이지 이동
 		function moveToPage(p) {
			location.href = p;
		}
 		
	</script>
</body>
</html>
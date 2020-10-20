<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,500;1,500;1,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/res/css/common.css?dkd12kdk=10">
<c:forEach items="${css}" var="item">
	<link rel="stylesheet" type="text/css" href="/res/css/${item}.css">
</c:forEach>
</head>
<body>
	<div id="container">
		<header>
			<div id="headerLeft">
				<div class="ml15" id="main" style="font-family:'Montserrat', sans-serif; font-style: italic;"><a href="#">FindYourPerfume</a></div>	
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
			<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
		</section>
		<footer>
			<span></span>
		</footer>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<div>
	<h1>메인페이지</h1>
	<div class="msg">${data.msg}</div>
		<c:choose>
			<c:when test="${loginUser.i_user == null}">
				<form class="frm" action="/common/main" method="post">
				 	<div><input type="text" name="user_id" placeholder="아이디" value="${data.user_id}"></div>
				 	<div><input type="password" name="user_pw" placeholder="비밀번호"></div>
					<div>
						<input type="submit" value="로그인">
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${loginUser.user_type == '2'}" >
						<div class="loginMsg">
							<div class="box" style="background: #BDBDBD;">
								<img class="profile" src="/res/img/profileImg/${loginUser.profile_img}">
							</div>
						</div>
						<div>${loginUser.nm}관리자님 환영합니다.</div>
						<div>
							<a href="/user/admin" id="btnLogout">Admin</a>
							<a href="/common/logout" id="btnLogout">Logout</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="box" style="background: #BDBDBD;">
							<img class="profile" src="/res/img/profileImg/${loginUser.profile_img}">
						</div>
						<div>${loginUser.nm}님 환영합니다.</div>
						<div><a href="/user/myPage" id="btnLogout">My Page</a>
							<a href="/common/logout" id="btnLogout">Logout</a>
						</div>
					</c:otherwise>				
				</c:choose>
			</c:otherwise>
		</c:choose>
		<c:if test="${loginUser.i_user != null}">
			<a href="/user/join" id="btnLogout">회원가입 하러가기</a>
		</c:if>
		<c:forEach items="${perfume}" var="item">
			<c:if test="${loginUser != null}">
				<span id="favorite" class="material-icons">
					<c:choose>
						<c:when test="${loginUser.i_user == item.i_user}">favorite</c:when>
						<c:otherwise>favorite_border</c:otherwise>
					</c:choose>
				</span>
			</c:if>
			<div>향수 이름 : ${item.p_nm}</div>
			<div>향수 용량 : ${item.p_size}ml</div>
			<div><img src="${item.p_pic}"></div>
			<div>향수 브랜드 : ${item.engNm}</div>
			<div>향수 가격 : ${item.p_price}</div>
			<div>------------------------------------------</div>
		</c:forEach>
	</div>

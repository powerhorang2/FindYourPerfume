<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="loginContainer">
	<div>
		<div id="loginHeader">
			<h1>로그인<span>Login</span></h1>
			<span class="material-icons" onclick="moveToPage(`common/main`)" id="btnReturn">home</span>
		</div>
		<form id="frm" class="frm" action="/user/login" method="post">
			<div id="loginMain"><hr>
				<div class="msg">${data.msg}</div>
			 	<div><input type="text" name="user_id" placeholder="아이디" value="${data.user_id}"></div>
			 	<div><input type="password" name="user_pw" placeholder="비밀번호"></div>
			</div><hr>
			<div id="loginFooter">
				<input class="button" type="button" onclick="moveToPage(`/user/join`)" value="회원가입">	
				<input class="button" type="submit" value="로그인">
			</div>
		</form>
	</div>
</div>
<script>
	function moveToPage(p) {
		location.href = p
	}
</script>
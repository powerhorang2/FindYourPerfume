<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.container { 
  position: absolute;
  width: 400px; 
  height: 400px; 
  text-align: center; 
  margin-left: -200px; 
  margin-top: -200px; 
  left: 50%; 
  top: 50%; 
}
</style>
<div class="container">
<h1>로그인</h1>
	<div class="msg">${data.msg}</div>
	<form class="frm" action="/user/login" method="post">
	 	<div><input type="text" name="user_id" placeholder="아이디" value="${data.user_id}"></div>
	 	<div><input type="password" name="user_pw" placeholder="비밀번호"></div>
		<div><input type="submit" value="로그인"></div>
	</form>
	<a href="/user/join">회원가입 하러가기</a>
</div>
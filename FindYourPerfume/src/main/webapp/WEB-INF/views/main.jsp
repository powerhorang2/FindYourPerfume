<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
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
					 	<div><input type="text" name="user_id" placeholder="아이디" value="${data.user_id}"></div>
					 	<div><input type="password" name="user_pw" placeholder="비밀번호"></div>
						<div>
						<input type="submit" value="로그인">
					</div>
				</form>
			</div>
			<div>	
			</div>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${loginUser.user_type == '2'}" >
					<div class="loginUserInfo">
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
					</div>
					</c:when>
					<c:otherwise>
					<div class="loginUserInfo">
						<div class="box" style="background: #BDBDBD;">
							<img class="profile" src="/res/img/profileImg/${loginUser.profile_img}">
						</div>
						<div>${loginUser.nm}님 환영합니다.</div>
						<div><a href="/user/myPage" id="btnLogout">My Page</a>
							<a href="/common/logout" id="btnLogout">Logout</a>
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
		<div>
		<div id="selBrandList">
		</div>
		
		<div id="brandList">
		</div>
	</div>
	</div>
	
		</div>
	</div>
	<!-- 작업주우우우우우우우우우우우우우우웅 -->
	<div id="brandRight">
	<div class="choiceBrand">
		
	
	</div>
		<div class="perfumeMain">	
		<c:forEach items="${perfume}" var="item">
			<div class="perfumePic">
				<c:if test="${loginUser != null}">
					<span id="favorite" class="material-icons">
						<c:choose>
							<c:when test="${loginUser.i_user == item.i_user}">favorite</c:when>
							<c:otherwise>favorite_border</c:otherwise>
						</c:choose>
					</span>
				</c:if>
				<div class="brandImg">
					<div><img src="${item.p_pic}"></div>
					<div>향수 브랜드 : ${item.b_nm_eng}</div>
					<div>향수 이름 : ${item.p_nm}</div>
					<div>
						향수 용량 : ${item.p_size}ml
						향수 가격 : ${item.p_price}
					</div>
				</div>
				</div>
		</c:forEach>
		<div>
	</div>
</div>
</div>
</div>
<script>
	function AtoZ() {
		for(var i = 65; i < 91; i++) {
			var div = document.createElement('div')
			var a = document.createElement('a')
			div.setAttribute('class', 'brandName')
			a.setAttribute('href', 'ajaxChoicePerfume')
			a.innerText = String.fromCharCode(i)
			div.appendChild(a)
			brandList.append(div)
		}
	}
	AtoZ()
	
	function selAtoZ(){
		for(var i = 65; i < 91; i++) {
			var a = document.createElement('a')
			a.setAttribute('href', 'ajaxSelAlphabet')
			a.innerText = String.fromCharCode(i)
			selBrandList.append(a)
		}
	}
	selAtoZ()
	
	
	
</script>
		
		


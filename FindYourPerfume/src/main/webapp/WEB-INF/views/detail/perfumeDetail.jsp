<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="detailContainer">
	<c:if test="${loginUser != null}">
		<span id="favorite" class="material-icons">
			<c:choose>
				<c:when test="${loginUser.i_user == perfume.i_user}">favorite</c:when>
				<c:otherwise>favorite_border</c:otherwise>
			</c:choose>
		</span>
	</c:if>
	
	<div><img src="${perfume.p_pic}"></div>
	<div>${perfume.p_nm}</div>
	<div>${perfume.p_size}ml</div>
	<div>${perfume.b_nm_eng}</div>
	<div>${perfume.p_price}원</div>
	<h2>노트정보</h2>
	<span>
		<c:forEach items="${noteList}" var="item">
			${item.nt_d_nm_kor}(${item.nt_d_nm}),
		</c:forEach>
	</span>
	<div>=====================================================================================================</div>
	<div id="cmtContainer">
		<div class="cmt_cnt">
			<div>
				<span class="cmt_cnt_text">회원 후기</span>
				<span class="cmt_cnt_content">(2)</span>
			</div>
		</div>
		<div id="cmtContents">
			<div class="cmt">
				
				<div class="cmt_userData">
					<div class="cmt_userData_i_cmt">
						<p class="cmt_userData_i_cmt_p">1번 후기</p>
					</div>
					<div class="cmt_userData_userNm">
						<p class="cmt_userData_userNm_p"><img class="cmt_userData_userNm_img" src="/res/img/profileImg/"> 경덕이형 옆자리</p>
					</div>
					<div class="cmt_userData_userAge">
						<p class="cmt_userData_userAge_p">20대/남자</p>
					</div>
				</div>
				<div class="cmt_cmt">
					<div class="cmt_cmt_div">
						<p class="cmt_cmt_div_p">이 향수 비추합니다. 냄새가 경덕이형 발냄새 같네요.</p>
					</div>
				</div>
			</div>
				
			<div class="cmt">
				
				<div class="cmt_userData">
					<div class="cmt_userData_i_cmt">
						<p class="cmt_userData_i_cmt_p">1번 후기</p>
					</div>
					<div class="cmt_userData_userNm">
						<p class="cmt_userData_userNm_p"><img class="cmt_userData_userNm_img" src="/res/img/profileImg/"> 경덕이형 옆자리</p>
					</div>
					<div class="cmt_userData_userAge">
						<p class="cmt_userData_userAge_p">20대/남자</p>
					</div>
				</div>
				<div class="cmt_cmt">
					<div class="cmt_cmt_div">
						<p class="cmt_cmt_div_p">이 향수 비추합니다. 냄새가 경덕이형 발냄새 같네요.</p>
					</div>
				</div>
			</div>
		</div>
		
	
	<!--
	<c:forEach items="${cmtList}" var="item">
		<div class="cmt">
			<div class="cmt_i_cmt">
				<div>
					<p>${item.i_cmt}</p>
				</div>
			</div>
			<div class="cmt_userData">
				<div>
					<p>${item.nm}</p>
					<img src="/res/img/profileImg/${item.profile_img}">
				</div>
				<div>
					<p>${item.ageGroup}대/${item.gender}</p>
				</div>
			</div>
			<div class="cmt_cmt">
				<div>
					<p>${item.cmt}</p>
				</div>
			</div>
			
		</div>
	</c:forEach>-->
	</div>
	<c:if test="${loginUser != null}">
		<form id="frm" class="frm" action="/cmt/insCmt?i_p=${perfume.i_p}" method="post">
			<p><textarea cols="50" rows="10" name="cmt" placeholder="후기를 남겨보세요 (50자 이내)"></textarea></p>
		    <p><input type="submit" value="Submit"></p>
		</form>
	</c:if>
</div>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
	
	ajaxSelCmtList()
	function ajaxSelCmtList() {
		axios.get('/common/ajaxSelCmtList', {
			params : {}
		}).then(function(res) {
			console.log(res.data)
				cmtContents.innerText = ''
				var cmt_cnt_content = document.querySelector(".cmt_cnt_content");
				cmt_cnt_content.innerText = '(' + res.data.length + ')'
			
				for (var i = 0; i < res.data.length; i++) {
					var cmt = document.createElement('div');
					var cmt_userData = document.createElement('div');
					cmt_cmt.setAttribute('class', 'cmt_cmt');
					
					cmt.append(cmt_userData)
					cmt.append(cmt_cmt)
					
					div_eng.innerText = '향수 브랜드 : ' + res.data[i].b_nm_eng
					div_kor.innerText = '향수 이름 : ' + res.data[i].p_nm
					div_size.innerText = '향수 용량 : ' + res.data[i].p_size
					div_price.innerText = '향수 가격 : '
							+ numberFormat(res.data[i].p_price) + '원'

					div.append(img)
					div.append(div_kor)
					div.append(div_eng)
					div.append(div_size)
					div.append(div_price)

					cmtContents.append(div)
				}
		})
	}
	function name() {
		
	}
</script>

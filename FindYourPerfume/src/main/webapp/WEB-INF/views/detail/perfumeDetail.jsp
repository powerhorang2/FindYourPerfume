<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<!--<c:forEach items="${perfumeCmt}" var="item">
	<div class="cmt">
		<div>${item.nm}</div>
		<div>${item.cmt}</div>
		<div>${item.r_dt}</div>
	</div>
</c:forEach>-->
<c:if test="${loginUser != null}">
	<form id="frm" class="frm" action="/cmt/insCmt?i_p=${perfume.i_p}" method="post">
		<p><textarea cols="50" rows="10" name="cmt" placeholder="후기를 남겨보세요 (50자 이내)"></textarea></p>
	    <p><input type="submit" value="Submit"></p>
	</form>
</c:if>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div>${perfume.p_nm}</div>
<div>${perfume.p_size}</div>
<div><img src="${perfume.p_pic}"></div>
<div>${perfume.b_nm_eng}</div>
<div>${perfume.p_price}</div>
<c:forEach items="${note}" var="item">
	<div>${item.nt_d_nm}</div>
	<div>${item.nt_d_nm_kor}</div>
</c:forEach>

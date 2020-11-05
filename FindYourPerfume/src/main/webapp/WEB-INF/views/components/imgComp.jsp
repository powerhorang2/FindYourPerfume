<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:choose>
	<c:when test="${fn:contains(img, 'http://')}">
		<img src="${img}">
	</c:when>
	<c:when test="${fn:contains(img, 'https://')}">
		<img src="${img}">
	</c:when>   
	<c:when test="${empty img}">
		<img src="/res/img/default_perfume.png">
	</c:when>
	<c:otherwise>
		<img src="/res/img/perfume/${img}">
	</c:otherwise>
</c:choose>

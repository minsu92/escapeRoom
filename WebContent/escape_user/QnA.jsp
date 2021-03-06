<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Minsu">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css\footer.css?o">
<link rel="stylesheet" href="css\header.css?o">
<link rel="stylesheet" href="css\board.css?a">
<title>QnA</title>
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>
<div id="title">
<p>QnA</p>
</div>
<div id="contents">
<h2>QnA 목록</h2>
<form name="lookUpForm" method="post" action="QnA.do">
<select name="t" id="t">
	<option value="1" ${((q!=null)&&(t eq "1"))? "selected" : ""}>제목</option>
	<option value="2" ${((q!=null)&&(t eq "2"))? "selected" : ""}>제목 + 내용</option>
	<option value="3" ${((q!=null)&&(t eq "3"))? "selected" : ""}>아이디</option>
</select>
<input type="text" name="q" value="${q}" id="q">
<input type="submit" value="검색" id="search_btn">

<c:choose>
	<c:when test="${idSession!=null}">
		<a href="writeQnA.do" class="writeBtn">글쓰기</a>
	</c:when>
	<c:otherwise>
		<a href="login.do" class="writeBtn">글쓰기</a>
	</c:otherwise>
</c:choose>
</form>
<table id="board">
	<thead>
		<td width='15%'>번호</td>
		<td id="titletd" width='45%'>제목</td>
		<td width='15%'>아이디</td>
		<td width='15%'>등록일</td>
		<td width='10%'>조회</td>
	</thead>
	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.qa_noti=="Y"? "<strong>공지</strong>" : list.qa_no}</td>
			<td class="tdtitle"><a href="QnAview.do?no=${list.qa_no}">
				<c:choose>
					<c:when test="${list.qa_noti=='Y'}">
						<img src="image/notice.png" id="notiImg"><strong>${list.qa_title}</strong>
					</c:when>
					<c:otherwise>
						${list.qa_title}
					</c:otherwise>
				</c:choose>
			</a></td>
			<td>
				<c:choose>
					<c:when test="${list.qa_noti=='Y'}">
						<strong>관리자</strong><img src="image/admin.jpg" id="adminImg">
					</c:when>
					<c:otherwise>
						${list.qa_id}
					</c:otherwise>
				</c:choose>
			</td>
			<td>${list.qa_wTime}</td>
			<td>${list.qa_hit}</td>
		</tr>
	</c:forEach>
</table>
<c:forEach var="num" begin="1" end="${numOfPage}">
		<p id="page"><a href="QnA.do?page=${num}&t=${t}&q=${q}">${num}</a>&nbsp;</p>
</c:forEach>
</div>
<%--footer --%>
<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/css/common.css">
<title>Atelier</title>
</head>
<body>

	<div class="col"></div>
		<div class="col-10">
			<div class="row my-3">			
			<div class="col">
				<div>	
			</div>
		</div>
	</div>
</div>

	<h1><p class="text-center">공지사항 등록 / 수정</p></h1>	
	<form action="./registNoticeProcess" method="post">
		제목 : <input name="admin_notice_title" type="text"><br>
		작성일 : 2022-01-15
		<br>
		<textarea name="admin_notice_content" rows="10" cols="40">${data.notice.notice_content }</textarea>
		<input type="hidden" name="admin_notice_no" value="${data.notice.notice_no }">
		<br>
		
		<div class="col mt-1">
		<ul class="pagination justify-content-end"> <a href="./noticeList" class="btn btn-warning btn-lg" style="font-size: small">취소</a>  <a href="" class="btn btn-warning btn-lg" style="font-size: small">수정완료</a>
		</div>
	
	</form>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
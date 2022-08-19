<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Atelier</title>
</head>
<body>

	<h1>공지사항 수정</h1>
	
	<form action="./updateNoticeProcess" method="post">
		작성자 : ${data.adminNotice.admin_no }<br>
		제목 : <input name="admin_notice_title" type="text" value="${data.Notice.admin_notice_title }"><br>
		내용 : <br>
		<textarea name="admin_notice_content" rows="10" cols="40">${data.Notice.admin_notice_content }</textarea>
		<input type="hidden" name="admin_no" value="${data.Notice.admin_no }">
		<br>
		<input type="submit" value="수정">
	</form>

</body>
</html>




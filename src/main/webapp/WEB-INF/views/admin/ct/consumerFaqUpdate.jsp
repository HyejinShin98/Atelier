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

	<h1>자주 묻는 질문 수정</h1>
	
	<form action="./consumerFaqUpdateProcess" method="get">
		작성번호 : ${data.Faq.admin_faq_no }<br>
		제목 : <input name="admin_notice_title" type="text" value=""><br>
		내용 : <br>
		<textarea name="admin_notice_content" rows="10" cols="40"></textarea>
		<input type="hidden" name="admin_no" value="${data.notice.notice_no }">
		<br>
		<input type="submit" value="수정">
	</form>

</body>
</html>
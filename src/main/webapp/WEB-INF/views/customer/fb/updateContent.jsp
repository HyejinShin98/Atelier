<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/commons.css">
<title>Insert title here</title>
<script type="text/javascript" src="../../resources/js/common.js"></script>
</head>
<body>
<div class="container-fluid px-3">
	<c:choose>
		<c:when test="${customer != null}">
	<div class="row">
           <div class="col">
               <div class="row">
                   <div class="col-3"></div>
                   <div class="col-6 fs-4 fw-bold text-center" >수정 페이지</div>
                   <div class="col-3"></div>
               </div>
               <hr class="my-2">
               <h1 class="display-1"></h1>
           </div>  
	</div>
	<div>
		<form action="./updateContentProcess" method="post" enctype="multipart/form-data">
			<div class="row">	
				<div class="mb-3">						
					  <label for="freeboard_title" class="form-label" >제목</label>
					  <input name="freeboard_title" type="text" class="form-control" id="freeboard_title" value="${data.FreeBoardVo.freeboard_title }">
				</div>
				<div class="mt-2">
					  <label for="freeboard_content" class="form-label">내용</label>
					  <textarea input type name ="freeboard_content" class="form-control mt-1" id="exampleFormControlTextarea1" rows="8">${data.FreeBoardVo.freeboard_content}</textarea>				 	
				</div>
			</div>
			<div class="row">
               	<div class="mt-2">
                   <label for="files" class="form-label">작성글에 이미지 첨부하기</label>
                   <input class="form-control" type="file" name="files" multiple accept="image/*">
           		</div>
       		</div>
       		<div class="row">
          		<div class="col d-grid mt-3">
            		<button input type="submit" value="수정하기" class="form-control" href="./mainContent" style="color:white; background-color: #FFCA28;">수정하기</button>
            	</div>
            
            	
       		</div>						
		</form>
	</div>	
		</c:when>
		<c:otherwise>
			비회원입니다.
			<a href="../lg/login">로그인하기</a>
		</c:otherwise>
	</c:choose>
</div>	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
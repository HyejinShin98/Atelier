<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.btnnn {
  border: none;
  background-color: inherit;
 
  display: inline-block;
  }
</style>
<meta charset="UTF-8">
<title>내 문의 내역</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
	<link rel="stylesheet" href="../../resources/css/common.css">
</head>
<body>

	<div class="container-fluid px-3">
		<div class="row">
			<div class="col mt-3">
				<div class="col text-center">
					<h3>나의 문의 리스트</h3>
				</div>
			</div>
		</div>
		
		<div class="row mx-0 mt-3 bg-warning bg-opacity-50">
      		<div class="col"><img src="../../resources/img/together.png" class="rounded-circle" alt="..." 
            width="75" height="75" ></div><div class="col-6 text-center"  style="justify-content; margin :auto;  align-items : center;">함께 공유하는 공방!<br> <span class=" fw-bold fs-5">Atelier Community</span></div><div class="col-2"></div>
   		</div>
		
		<div class="row mt-2">
			<div class="col">
				<div class="input-group">
					<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">상태</button>
					<ul class="dropdown-menu">
					  <li><a class="dropdown-item" href="#">처리중</a></li>
					  <li><a class="dropdown-item" href="#">답변 완료</a></li>
					</ul>
					<input type="text" class="form-control" aria-label="Text input with dropdown button">
				  	<button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
				  </div>				  
			</div>
		</div>
		<div class="row py-2">
			<div class="col d-grid">
				<table class="table">					
					<c:forEach items="${cusQna}" var="cusQna">
					<tbody>	        			
						<tr>
						<td style="width: 80%">
						<c:choose>				            				
							<c:when test="${cusQna.cus_center_category_yn == 'y'}">
							<span class="badge text-bg-primary" class="btn btn-primary">답변 완료</span>
							</c:when>
							<c:otherwise>
							<span class="badge text-bg-secondary" class="btn btn-primary">처리중</span>
							</c:otherwise>
						</c:choose>
						<a href="./askWriteToAdminDetail?cusCenterNo=${cusQna.cus_center_no}"  style="text-decoration:none">
						<span class="text-secondary">${cusQna.cus_center_title }</span></a>						
						</td>
						<td><fmt:formatDate value="${cusQna.cus_center_writedate }" pattern="yy.MM.dd"/></td>
						</tr>				      
					</tbody>
					</c:forEach>
				</table>
			</div>
		</div>			
		
		
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	</div>
<footer class="fixed-bottom"><div class="row py-2">
			<div class="col">
				<div class="float-start">
					<a href="../m/myInfomation"><button type="button" class="btnnn text-secondary ">돌아가기</button></a>
				</div>
			</div>
			<div class="col">
				<div class="float-end">
					<a href="./askWriteToAdmin"><button type="button" class="btnnn text-secondary ">문의하기</button></a>
				</div>
			</div>
		</div></footer>
</body>
</html>
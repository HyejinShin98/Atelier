<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
    <link rel="stylesheet" href="../../resources/css/common.css"> 
<title>구매자 문의 리스트</title>
</head>
<body>
	<div class="container-fluid px-3">
		<div class="row">
			<div class="col mt-3">
				<div class="col text-center">
					<h3>구매자 문의 리스트</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col d-grid">
			<hr class="mb-1">
			<h1 class="display-1"></h1>
			</div>
		</div>
		<div class="row">
			<div class="col d-grid">
				<table class="table">					
					<tbody>	        			
						<tr>
						</tr>
					<c:forEach items="${conAskList }" var="conAskList">				
						<tr>
							<td style="width: 10%">${conAskList.consumerCenter.con_center_no }</td>
							<td style="width: 50%">
								<c:choose>				            				
									<c:when test="${conAskList.consumerCenter.con_center_category_yn == 'y'}">
									<span class="badge text-bg-primary" class="btn btn-primary">답변 완료</span>
									</c:when>
									<c:otherwise>
									<span class="badge text-bg-secondary" class="btn btn-primary">처리중</span>
									</c:otherwise>
									</c:choose>
								<a href="./consumerAskDetail?conCenterNo=${conAskList.consumerCenter.con_center_no }">${conAskList.consumerCenter.con_center_title }</a>
																									
								<div class="form-control-sm mx-0" >
									<span style="color: #6C6C6C">
										${conAskList.consumer.consumer_nickname}
									</span>
									<span style="color: #6C6C6C">
										<fmt:formatDate value="${conAskList.consumerCenter.con_center_writedate }" pattern="yy.MM.dd"/>
									</span>
								</div>											
						</tr>				      
					</c:forEach>
					</tbody>					
				</table>
			</div>
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
			
		<div class="row mt-3">
			<div class="col">
				<div class="float-start">
					<button type="button" class="btn btn-primary" onclick="history.back()">돌아가기</button>
				</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	</div>
	 
</body>
</html>
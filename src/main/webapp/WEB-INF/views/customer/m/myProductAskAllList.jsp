<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">	
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>

<style type="text/css">
.btnnn {
  border: none;
  background-color: inherit;
 
  display: inline-block;
}</style>
</head>
<body>	
	
	
	
	
	<div class="container-fluid">
		<div class="fixed-top">
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
		<div class="row" style="height:60px;"></div>
		
		<div class="row bg-warning bg-opacity-50">
				
			<div class="col"><img src="../../resources/img/together.png" class="rounded-circle" alt="..." 
					width="75" height="75" ></div><div class="col-6 text-center"  style="justify-content; margin :auto;  align-items : center;"><a  class="nav-link active" aria-current="page"href="../rent/rentAtelierList">함께 공유하는 공방! <span class=" fw-bold fs-5">Atelier Community</span></a></div><div class="col-2">
					</div>
				
			</div>
			
			
		<div class="row py-2 text-secondary fs-4"><span>전체 문의</span></div>	
		<c:forEach items= "${ask}" var ="ask">
			<c:forEach items= "${ask.inner}" var ="inner">
				<div class="row border-bottom py-2">
				<div class="col-7 text-secondary">	
				<span>닉네임 : ${inner.consumer.consumer_nickname}</span><br>
				<span>문의 : ${inner.productAsk.product_ask_content}</span><br>
				<span>상품 : ${inner.product.product_name}</span>
				</div>
				<div class="col"></div>
				<c:choose>
				<c:when test="${inner.productAsk.product_ask_comment_content==null}">
				<div class="col-3 py-1 my-2 ps-1">
				<button type="button" class="btnnn" data-bs-toggle="modal" data-bs-target="#customerModal">
					<span class="text-danger text-opacity-50 fs-5">답변하기</span>
				</button>
				
				</div>
				
				</c:when>
				<c:otherwise>
				
				<div class="col-3 py-1 my-2 ps-1">
				
				<button type="button" class="btnnn" data-bs-toggle="modal" data-bs-target="#customerModal">
					<span class="text-success  text-opacity-50 fs-5">답변완료</span>
				</button>
				</div>
				</c:otherwise>
				</c:choose>
				</div>
				
		</c:forEach>
			</c:forEach>
		
	</div>
	
	<jsp:include page="../common/navbarBottom.jsp"></jsp:include>
	
<!-- customer Modal -->
<div class="modal fade" id="customerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header"> 
       <h3 class="modal-title" id="staticBackdropLabel" style="text:pink;">하다하다</h3>님의 문의
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">


		<div class="container-fluid" id = "containerBox">
				<form action="./profileModifyProcess" method="post">
					
					<div class="input-group input-group-sm mb-3">
					  <span class="fs-5 text-dark text-opacity-50">문의내용 :</span>	<span class="ms-1 my-1 text-secondary">   재입고 언제 되나요???</span>
					
				<textarea rows="3px" cols="100px"></textarea>
				
					</div>
					
			
				<input name ="customer_no" type ="hidden" value="${customer.customer_no}">
				<div class="d-grid gap-2">
					<input type="submit" value="답장하기" class="btn btn-warning opacity-50">				
				</div>
				</form>
				</div>
		</div>
		</div>
		
			</div>	
	</div>
	
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
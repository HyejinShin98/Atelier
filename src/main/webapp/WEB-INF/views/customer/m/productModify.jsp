<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>

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
			
			
			<div class="row py-3 ">
				
					<form action="./productModifyProcess" method="post">
			
				<div class="row py-3 border-bottom">
				<div class="col-3 ">상품 이름 : </div>
				<div class="col-7 "><input  class="form-control" name = "product_name" type = "text"></div>
				<div class="col-2"></div>
				</div>
					<div class="row py-3 border-bottom">
				<div class="col-3">가격 : </div>
				<div class="col-7"><input  class="form-control" name = "product_price" type = "text"></div>
				<div class="col-2"></div>
				</div>
					<div class="row py-3 border-bottom">
				<div class="col-3">상세 설명 : </div>
				<div class="col-7"><textarea  class="form-control" name = "product_description"></textarea></div>
				<div class="col-2"></div>
				</div>
					<div class="row py-3 border-bottom">
				<div class="col-3">배송비</div>
				<div class="col-7"><input  class="form-control" name = "product_post_price" type = "text"></div>
				<div class="col-2"></div>
				</div>
				대표 이미지 설정
					<div class="row py-3 ">
					
					<c:forEach items="${detail.ProductImage}" var="pi">
					<div class="col-4">
							<input type="radio" class="rounded" style="--bs-btn-padding-y: .75px; --bs-btn-padding-x: .75px; --bs-btn-font-size: .75rem;"
							value="${pi.pi_path}" name="pi_path"> 
					<img src="/uploadFiles/${pi.pi_path}" class="rounded-circle" style="outline : solid 1px grey;" alt="..." 
						width="75" height="75"> 
						</div>
					</c:forEach>
				
				</div>
		
			<div class="row py-3 "><input type="submit" value="수정요청" class="btn btn-warning opacity-50">		</div>
				</form>
				
				</div>
			<div class="row" style="height:70px;"></div>			
			</div>

	<footer class="fixed-bottom">
		<div class="container-fluid">
			
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
		</footer>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
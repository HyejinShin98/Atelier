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
	
				<div class="row my-5"></div>
		
		<div class="row mx-3">
			<div class="col">
			
				<div class="row mb-3">
					<div class="col-1"></div>
					<div class="col border-bottom border-top border-secondary border-opacity-25 text-center py-2">
					
						<div class="row">
							<div class="col">
								<span class="text-warning opacity-50 fw-bold">W</span><span class="text-secondary">e</span>&nbsp;
								<span class="text-warning opacity-50 fw-bold">H</span><span class="text-secondary">and</span>&nbsp;
								<span class="text-warning opacity-50 fw-bold">M</span><span class="text-secondary">ade</span>
							</div>
						</div>
						
					</div>	
					<div class="col-1"></div>				
				</div>
				
				
				<div class="row pt-3">
					<div class="col px-0">
						
						<div class="row" style="width: 230px; margin: 0 auto;">
							<div class="col"><img class="img-fluid" src="../../resources/img/logoA.png"></div>
						</div>
		<div class="row" style="height:35px;"></div>
		
	</div>
	
	
			</div>
			</div>
			</div>
				<!--  -->
				<div class="row py-3 border-bottom">
				
				</div>	
				
			
			
			<div class="row py-3 border-bottom">
			
			<span class="fs-3 text-secondary">스토어 등록 후 이용 가능합니다!</span>
			
			</div>
					<form action="../m/profileRegisterProcess" method="post">
				<div class="row py-3 text-secondary">
					
				Store : <input class="form-control" name = "store_name" type = "text">
				Profile : <textarea class="form-control my-2" name = "store_profile"></textarea>
				<input name ="customer_no" type ="hidden" value="${customer.customer_no}">
				
				<input type="submit" value="등록하기" class="btn btn-warning opacity-50">				
				</div>
				</form>
				
				
				</div>
				

	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
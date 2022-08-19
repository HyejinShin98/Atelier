<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
    <link rel="stylesheet" href="../../resources/css/common.css">
    
    <title>관리 메뉴</title>
</head>

<style>
	
	.btnnn {
	  border: none;
	  background-color: inherit;
	 
	  display: inline-block;
	}

	.bgc{
	
		background-color: #dddddd;
		line-height: 5rem;
	}
	
</style>


<script>
	
	window.addEventListener("DOMContentLoaded", function() {
			
	});
</script>

</head>

<body>

	<c:choose>
		<c:when test="${admin != null}">
	
	<div class="container-fluid px-4">
        <div class="row">
            <div class="row mt-3">	
                <div class="col-3"></div>
                <div class="col d-grid">
                    <img src="../../resources/img/logoA.png" class="img-fluid" alt="..." >
                </div>
                <div class="col-3"></div>
            </div>	
        </div>
        <div class="row">
            <div class="col d-grid">
			<hr class="mb-1">
			<h1 class="display-1"></h1>
			</div>
		</div>
        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col d-grid bgc"> 
                <div class="card-body">
                    <p class="card-text" style="min-height: 5rem;" >${admin.admin_id} 님                              
                        <span class="float-end"><a href="./logout">로그아웃</a></span>
                    </p>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
    <div class="row">
    	<div class="col-1"></div>
    		<div class="col">
		        <div class="row">        
		            <div class="col d-grid">               
		                <button class="btnnn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="min-height: 5rem;">
		                회원 관리
		                </button>               
		            </div>
		            <div class="collapse" id="collapseExample">
		                <div class="card card-body text-center" onclick="location.href='../mmgt/totalConsumerList'">
		                    일반 회원 리스트
		                </div>
		                <div class="card card-body text-center" onclick="location.href='../mmgt/totalCustomerList'">
		                    사업자 회원 리스트
		                </div>
		            </div>
		        </div>
		        <div class="row">        
		            <div class="col d-grid">               
		                <button class="btnnn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample" style="min-height: 5rem;">
		                상점 관리
		                </button>               
		            </div>
		            <div class="collapse" id="collapseExample2">
		                <div class="card card-body text-center" onclick="location.href='../st/storeList'">
		                    상점 리스트
		                </div>
		                <div class="card card-body text-center" onclick="location.href='../st/productList'">
		                    상품 리스트 및 상품 등록 요청 관리
		                </div>
		                <div class="card card-body text-center">
		                    상점 매출 통계
		                </div>
		            </div>
		        </div>
		        <div class="row">        
		            <div class="col d-grid">               
		                <button class="btnnn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample" style="min-height: 5rem;">
		                주문 관리 및 통계
		                </button>               
		            </div>
		            <div class="collapse" id="collapseExample3">
		                <div class="card card-body text-center">
		                    주문 리스트
		                </div>
		                <div class="card card-body text-center">
		                    환불 요청 리스트
		                </div>
		                <div class="card card-body text-center">
		                    주문 통계
		                </div>
		            </div>	            	
		        </div>
		        <div class="row">        
		            <div class="col d-grid">               
		                <button class="btnnn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExampleA" aria-expanded="false" aria-controls="collapseExample" style="min-height: 5rem;">
		                쿠폰 관리
		                </button>               
		            </div>
		            <div class="collapse" id="collapseExampleA">
		                <div class="card card-body text-center">
		                    쿠폰 관리
		                </div>
		                <div class="card card-body text-center" onclick="location.href='../mmgt/couponMain'">
		                    쿠폰 리스트
		                </div>
		            </div>
		        </div>
		        <div class="row">        
		            <div class="col d-grid">               
		                <button class="btnnn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample4" aria-expanded="false" aria-controls="collapseExample" style="min-height: 5rem;">
		                고객센터 관리
		                </button>               
		            </div>
		            <div class="collapse" id="collapseExample4">
		                <div class="card card-body text-center">
		                    자주 묻는 질문 관리                 
		                </div>
			            <div class="card card-body text-center" onclick="location.href='../ct/consumerAskList'">
			                    일반 회원 1:1 문의 관리
			            </div>
		                <div class="card card-body text-center" onclick="location.href='../ct/customerAskList'">
		                    사업자 회원 1:1 문의 관리
		                </div>
		            </div>
		        </div>
		        <div class="row">        
		            <div class="col d-grid">               
		                <button class="btnnn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample" style="min-height: 5rem;">
		                공지사항 관리
		                </button>               
		            </div>
		            <div class="collapse" id="collapseExample5">
		                <div class="card card-body text-center">
		                    일반 회원 공지사항                 
		                </div>
		                <div class="card card-body text-center">
		                    사업자 회원 공지사항
		                </div>
		            </div>
		        </div>
		       </div>
		    <div class="col-1"></div> 
		 </div>
	</div>
 		       
    </c:when>
		<c:otherwise>
			비회원입니다.
			<a href="./login">로그인하기</a>
		</c:otherwise>
	</c:choose>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
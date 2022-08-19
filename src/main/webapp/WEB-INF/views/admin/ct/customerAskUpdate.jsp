<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 답변 페이지</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
	<link rel="stylesheet" href="../../resources/css/common.css"> 
</head>
<body>
	 <div class="container-fluid px-3">
	    <div class="row mt-3">
	        <div class="col d-grid text-center">
                <h3>고객 문의 자세히 보기</h3>
            </div>
	    </div>
		<div class="row">
			<div class="col d-grid">
			<hr class="my-1">
			<h1 class="display-1"></h1>
			</div>
		</div>
	     <div class="row">
	        <div class="col d-grid">
				<div class="input-group">
					<div class="form-floating" style="width: 100%">
						<input type="email" readonly class="form-control-plaintext" id="floatingPlaintextInput" placeholder="" value="이 고객님께서 문의하셨습니다.">
						<label for="floatingPlaintextInput">판매자 이름</label>
					</div>
				</div>	
			</div>
	    </div>
	    <div class="row mt-2">
	        <div class="col d-grid">
	            <div class="card">
	                <div class="card-body mt-2">
	                  <div class="card-text">                      
	                    ${upCusData.customer.customer_name}
	                  </div>
	                </div>
	            </div>
	        </div>
	    </div>		
	    <div class="row">
	        <div class="col d-grid">
				<div class="input-group">
					<div class="form-floating" style="width: 100%">
						<input type="email" readonly class="form-control-plaintext" id="floatingPlaintextInput" placeholder="" value="고객님의 문의글 제목입니다.">
						<label for="floatingPlaintextInput">문의글 제목</label>
					</div>
				</div>	
			</div>
	    </div>
	    <div class="row mt-2">
	        <div class="col d-grid">
	            <div class="card">
	                <div class="card-body mt-2">
	                  <div class="textarea card-text">                      
	                      ${upCusData.customerCenter.cus_center_title }
	                  </div>
	                </div>
	            </div>
	        </div>
	    </div>		
	    <div class="row mt-2">
	        <div class="col d-grid">
				<div class="input-group" >
					<div class="form-floating" style="width: 100%">
						<input type="email" readonly class="form-control-plaintext" id="floatingPlaintextInput" placeholder="" value="고객님이 다음과 같이 문의하셨습니다.">
						<label for="floatingPlaintextInput">문의글 내용</label>
					</div>
				</div>	
			</div>
	    </div>
	    <div class="row">
	    	<div class="col d-grid">
	            <div class="card mt-2">
	                <div class="card-body">
	                  <div class="card-text" style="min-height: 10rem;">
	                  ${upCusData.customerCenter.cus_center_content }
	                  </div>
	                </div>
	            </div>
	        </div>
	    </div>  
		<div class="row mt-3">			
			<div class="col d-grid text-center">
				<h3>문의 답변하기</h3>
			</div>
		</div>
		<div class="row">
			<div class="col d-grid">
			<hr class="my-2">
			<h1 class="display-1"></h1>
			</div>
		</div>			
    <form action = "./customerAskUpdateProcess" method="post">
    	<div class="row">
	        <div class="col">
		        <input type="hidden" name="cus_center_no" value ="${upCusData.customerCenter.cus_center_no }">
		        <input type="hidden" name="admin_no" value ="${admin.admin_no }">
	        </div>  
	    </div>
	    <div class="row mt-2">
	        <div class="col d-grid">
				<div class="input-group" >
					<div class="form-floating" style="width: 100%">
						<input type="email" readonly class="form-control-plaintext" id="floatingPlaintextInput" placeholder="" value="고객님께 다음과 같이 답변합니다.">
						<label for="floatingPlaintextInput">문의글 답변 작성하기</label>
					</div>
				</div>	
			</div>
	    </div>
	    <div class="row">
	    	<div class="col d-grid">
	            <textarea class="form-control" id="exampleFormControlTextarea1" name="cus_center_comment_by_admin" rows="8" placeholder="답변을 입력해주세요."></textarea>
	        </div>
	    </div>  
    <div class="row mt-3">
		<div class="col d-grid">					
			<button type="submit" type="button" class="btn btn-warning">답변 등록하기</button>				
		</div>				
	</div>    
  </form>	
	<div class="row mt-3">
		<div class="col d-grid">					
			<a href="./customerAskList" type="button" class="btn btn-warning">문의 목록으로</a>					
		</div>				
	</div>    
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</div>
</body>
</html>
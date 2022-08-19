<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>내 문의 상세</title>
    
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
    	<link rel="stylesheet" href="../../resources/css/common.css">
</head>
<body>
	<body>
	  <div class="container-fluid px-3">
	    <div class="row mt-3">
	        <div class="col d-grid text-center">
                <h3>내 문의</h3>
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
						<input type="email" readonly class="form-control-plaintext" id="floatingPlaintextInput" placeholder="" value="문의하신 글의 제목입니다.">
						<label for="floatingPlaintextInput">문의글 제목</label>
					</div>
				</div>	
			</div>
	    </div>
	    <div class="row mt-2">
	        <div class="col d-grid">
	            <div class="card">
	                <div class="card-body mt-2">
	                  <div class="card-text">                      
	                    ${askData.consumerCenter.con_center_title }
	                  </div>
	                </div>
	            </div>
	        </div>
	    </div>		
	    <div class="row mt-2">
	        <div class="col d-grid">
				<div class="input-group" >
					<div class="form-floating" style="width: 100%">
						<input type="email" readonly class="form-control-plaintext" id="floatingPlaintextInput" placeholder="" value="다음과 같이 문의하셨습니다.">
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
	                  ${askData.consumerCenter.con_center_content }
	                  </div>
	                </div>
	            </div>
	        </div>
	    </div>
		<c:choose>    
		<c:when test="${askData.admin.admin_no == null}">
			<div class="row mt-3">	
				<div class="col d-grid mt-1 text-center">	
					<div class="card">
					  <i class="bi bi-chat-left-dots fs-1"></i> 
					  <div class="card-body">
					    <p class="card-text">아직 답변이 등록되지 않았습니다.</p>
					  </div>
					</div>
		        </div>
	    	</div>            
	    	<div class="row mt-3">
		        <div class="col d-grid">					
					<a href="./deleteMyAskProcess?conCenterNo=${askData.consumerCenter.con_center_no}" type="button" class="btn btn-warning">문의 삭제</a>					
				</div>                  					
            </div>
            <div class="row mt-3">
            	<div class="col d-grid mt-1 text-center">	
	            	<div class="card">
						 <i class="bi bi-exclamation-square fs-1"></i> 
							<div class="card-body">
						    	<p class="card-text">답변이 등록되지 않은 문의는 삭제 가능합니다.</p>
						  	</div>
					</div>
				</div>	
            </div>
		</c:when>
		<c:otherwise>
			<div class="row mt-3">			
				<div class="col d-grid text-center">
				<h3>문의 답변</h3>
				</div>
			</div>
			<div class="row">
				<div class="col d-grid">
				<hr class="my-2">
				<h1 class="display-1"></h1>
				</div>
			</div>			
	    <div class="row mt-3">
	        <div class="row mt-1">
				<div class="col d-grid">
					<div class="input-group">
						<div class="form-floating" style="width: 100%">
							<input type="email" readonly class="form-control-plaintext" id="floatingPlaintextInput" placeholder="" value="아래 관리자가 답변했습니다.">
							<label for="floatingPlaintextInput">답변자</label>
						</div>
					</div>	
				</div>				
			</div>
	    </div>
	    <div class="row mt-2">
	        <div class="col d-grid">
	            <div class="card">
	                <div class="card-body">
	                  <div class="card-text">
	                   ${askData.admin.admin_nick } 
	                  </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="row mt-2">
	        <div class="col d-grid">
				<div class="input-group">
					<div class="form-floating" style="width: 100%">
						<input type="email" readonly class="form-control-plaintext" id="floatingPlaintextInput" placeholder="" value="문의해주신 내용에 대한 답변입니다.">
						<label for="floatingPlaintextInput">답변 내용</label>
					</div>
				</div>	
			</div>
	    </div>
	    <div class="row mt-2">
	        <div class="col d-grid">
	            <div class="card">
	                <div class="card-body">
	                  <div class="card-text" style="min-height: 10rem;">                                      
	                  ${askData.consumerCenter.con_center_comment_by_admin } 
	                  </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    </c:otherwise>
	</c:choose>
	<div class="row mt-3">	
		<div class="col d-grid">
			<img src="../../resources/img/honsul.jpg" class="img-fluid" alt="..." >
		</div>
	</div>	
	
	
	<div class="row mt-3">
		<div class="col d-grid">					
			<a href="./myAskList" type="button" class="btn btn-warning">문의 목록으로</a>					
		</div>				
	</div>    
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
		</div>
		
</body> 
</html>
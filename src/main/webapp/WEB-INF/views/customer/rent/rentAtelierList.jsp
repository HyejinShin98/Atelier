<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
    .word {
   
   
        overflow: hidden;
         width: 30px;
        text-overflow: ellipsis;
        white-space: nowrap;
</style>
<meta charset="UTF-8">
<title>공방 대여 커뮤니티</title>
</head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../../resources/css/common.css"> 
<body>

 <div class="container-fluid px-3">
	  <div class="row mt-3">
	        <div class="col d-grid text-center">
                <h3>공방 대여 커뮤니티</h3>
            </div>
	    </div>
		<div class="row">
			<div class="col d-grid">
			<hr class="my-1">
			<h1 class="display-1"></h1>
			</div>
		</div>
            
            <div class="row">
                <div class="col">
                    <table class="table">				
                        <tbody>
                        <c:forEach items="${rentList }" var="rentList">
                          <tr>
                            <th scope="row" style="width: 10%">${rentList.rentAtelier.rent_atelier_no }</th>
                            <td style="width: 80%"><a class="text-secondary fs-5 word" style="text-decoration:none;" href="./rentAtelierDetail?rentAtelierNo=${rentList.rentAtelier.rent_atelier_no }">${rentList.rentAtelier.rent_atelier_title }</a>
                            	<div class="form-control-sm mx-0">
									<span style="color: #6C6C6C">
	                            		${rentList.customer.customer_name }
	                            	</span>
	                            	<span class="ms-1" style="color: #6C6C6C">
	                            		${rentList.rentAtelier.rent_atelier_location }
	                            	</span>
                            	</div>
                            </td>	
                            <td><fmt:formatDate value="${rentList.rentAtelier.rent_atelier_writedate }" pattern="yy.MM.dd"/>
                            	<span style="color: #6C6C6C">
	                            	상태보기
	                            </span>
                            </td>                		
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
					  <li><a class="dropdown-item" href="#">제목</a></li>
					  <li><a class="dropdown-item" href="#">내용</a></li>
					  <li><a class="dropdown-item" href="#">작성자</a></li>
					</ul>
					<input type="text" class="form-control" aria-label="Text input with dropdown button">
				  	<button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
				  </div>				  
			</div>
		</div>
		<div class="row mx-0 mt-3 bg-warning bg-opacity-50">
      		<div class="col"><img src="../../resources/img/together.png" class="rounded-circle" alt="..." 
            width="75" height="75" ></div><div class="col-6 text-center"  style="justify-content; margin :auto;  align-items : center;">함께 공유하는 공방!<br> <span class=" fw-bold fs-5">Atelier Community</span></div><div class="col-2"></div>
   		</div>           
            <div class="row mt-3">
				<div class="col">
					<div class="float-start">
						<a href="../fb/mainContent"><button type="button" class="btn btn-primary">돌아가기</button></a>
					</div>
				</div>
				<div class="col">
					<div class="float-end">
	            		<a href="./writeRentAtelier" class="btn btn-primary">글쓰기</a>
	            	</div>    
	        	</div>
	        </div>	
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    
   </div>   
</body>
</html>
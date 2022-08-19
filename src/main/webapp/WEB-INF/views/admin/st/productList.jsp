<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 상품 리스트</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
    <link rel="stylesheet" href="../../resources/css/common.css">
    <style>

        .pagination{
            justify-content : center;
        }

    </style>

</head>
<body>
    <div class="container-fluid px-3">
        <div class="row mt-3">	
                <div class="col d-grid text-center">
                    <h3>전체 상품 리스트</h3>
                </div>
        </div>        
        <div class="row">
            <div class="col d-grid">
                <hr class="mb-1">
                <h1 class="display-1"></h1>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">상점</span>
                    <input name="rent_atelier_title" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="상점 입력">
                </div>
            </div>
            <div class="col-6">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">제품</span>
                    <input name="rent_atelier_title" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="제품 입력">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">승인</span>
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" type="button">승인</button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">완료</a></li>
                            <li><a class="dropdown-item" href="#">거절</a></li>
                            <li><a class="dropdown-item" href="#">대기</a></li>
                        </ul>                    
                </div>
            </div>    
            <div class="col">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">상태</span>
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" type="button">판매중</button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">판매중</a></li>
                            <li><a class="dropdown-item" href="#">일시정지</a></li>
                            <li><a class="dropdown-item" href="#">판매중지</a></li>
                        </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <table class="table">
                    <thead>
                      <tr class="table-secondary">
                        <th scope="col">번호</th>
                        <th scope="col">상품명</th>
                        <th scope="col">상점 이름</th>
                        <th scope="col">등록일자</th>
                        <th scope="col">상품가</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${productList}" var="productList">
                        <tr>
                        <th scope="row">${productList.product.product_no }</th>
                        <td>${productList.product.product_name }</td>
                        <td>${productList.store.store_name }</td>
                        <td><fmt:formatDate value="${productList.product.product_date }" pattern="yy년 MM월 dd일"/></td>
                        <td>${productList.product.product_price }</td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
            </div>
        </div>
        <div class="row">
            <div class="col d-grid">
                <nav aria-label="...">
                    <ul class="pagination">
                      <li class="page-item disabled">
                        <a class="page-link">이전</a>
                      </li>
                      <li class="page-item active" aria-current="page">
                        <a class="page-link" href="#">1</a>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>                      
                      </li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#">다음</a>
                      </li>
                    </ul>
                  </nav>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>    
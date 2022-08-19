<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상점 리스트</title>
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
                <h3>전체 상점 리스트</h3>
            </div>
        </div>    
        <div class="row">
            <div class="col d-grid">
                <hr class="mb-1">
                <h1 class="display-1"></h1>
            </div>
        </div>
        <div class="row">
            <div class="input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">상점명</span>
                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="상점명 입력">
            </div>
        </div>
        <div class="row d-gird">
            <div class="col">
                <div class="input-group">
                    <span class="input-group-text" id="inputGroup-sizing-default">등급</span>
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" type="button">VIP 등급</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">GOLD</a></li>
                        <li><a class="dropdown-item" href="#">SILVER</a></li>
                        <li><a class="dropdown-item" href="#">Bronze</a></li>
                    </ul>
                </div>
            </div>
            <div class="col"><button type="button" class="btn btn-primary">검색하기</button></div>            
        </div>
        <div class="row mt-3">
            <div class="col">
                <table class="table">
                    <thead>
                      <tr class="table-secondary">
                        <th scope="col">번호</th>
                        <th scope="col">상점명</th>
                        <th scope="col">등급</th>
                        <th scope="col">개설일자</th>
                        <th scope="col">판매액</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${storeList}" var="storeList">
                        <tr>
                        <th scope="row">${storeList.store_no }</th>
                        <td>${storeList.store_name }</td>
                        <td>${storeList.store_tier_no }</td>
                        <td><fmt:formatDate value="${storeList.store_date }" pattern="yy년 MM월 dd일"/></td>
                        <td>${storeList.store_total_sales_amount }</td>
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

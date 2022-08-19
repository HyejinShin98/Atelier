<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<title>일반 회원 리스트</title>
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
                    <h3>일반 회원 리스트</h3>
                </div>
        </div>    
        <div class="row">
            <div class="col d-grid">
                <hr class="mb-1">
                <h1 class="display-1"></h1>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="input-group mb-3">
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" type="button">상태</button>
                    <!-- <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">활동</a></li>
                        <li><a class="dropdown-item" href="#">탈퇴</a></li>
                    </ul>  -->  
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" type="button">구분</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">이름</a></li>
                        <li><a class="dropdown-item" href="#">ID</a></li>
                        <li><a class="dropdown-item" href="#">닉네임</a></li>
                    </ul>    
                    <input type="text" class="form-control" placeholder="" aria-label="Example text with two button addons">
                    <button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>                
                </div>
            </div>      
        </div>
        <div class="row">
            <div class="col">
                <table class="table">
                    <thead>
                      <tr class="table-secondary">
                        <th scope="col">번호</th>
                        <th scope="col">아이디</th>
                        <th scope="col">닉네임</th>
                        <th scope="col">이름</th>
                      </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${conList}" var="conList">
                       <tr>
                        <th scope="row">${conList.consumer_no }</th>
                        <td>${conList.consumer_id }</td>
                        <td>${conList.consumer_nickname }</td>
                        <td>${conList.consumer_name }</td>
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
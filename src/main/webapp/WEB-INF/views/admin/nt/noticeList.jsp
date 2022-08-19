<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" href="../../resources/css/common.css">
<title>Atelier</title>
</head>
<body>

<div class="row">
	<div class="col"></div>
		<div class="col-10">
			<div class="row my-3">			
			<div class="col">
				<div class="row">
				<div class="col">
				</div>	
			</div>
		</div>
	</div>
</div>

	<h1><p class="text-center">공지사항 목록</p></h1>
		<table class="table">
			  <thead>
			    <tr>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td colspan="1"> 
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="..."> 
			      고객센터 운영시간 변경안내</td>
			    </tr>
			    <tr>
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="..."> 
			      농협카드 청구할인 이벤트 안내</td>     
			    </tr>
			    <tr>  
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      카드사 무이자 할부 안내</td>
			    </tr>
			    <tr>  
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      개인정보처리방침 개정 안내 (2022년 06월 20일)</td>
			    </tr>
			    <tr>
			      <td colspan="1"> 
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      첫 결제 5천원 포인트 지급</td>
			    </tr>
			    <tr>  
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      카카오페이 생애 첫 결제 해택</td>
			    </tr>
				<tr>  
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      아틀리에 등급별 적립금 정책변경 안내</td>
			    </tr>
			    <tr>
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      아틀리에 구매후기 정책변경 안내</td>
			    </tr>
			    <tr>  
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      아틀리에 지식재산권 보호절차 안내</td>
			    </tr>
			    <tr>  
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      아틀리에 이용약관 개정 안내</td>
			    </tr>
			    <tr>  
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      개인정보처리방침 개정안내 (2022년 01월 01일) </td>
			    </tr>
			    <tr>  
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      사입 및 판매 부적합 작품 제보 절차 안내</td>
			    </tr>
			    <tr>  
			      <td colspan="1">
			      <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="noticeList" aria-label="..."> 
			      회원 등급 및 구매시 적립 혜택 안내</td>
			    </tr>
			  </tbody>
			</table>		
	</div>
	<br>

		<div class="row">
		<div class="col"></div>
			<div class="col">
				<nav aria-label="Page navigation example">
		             <ul class="pagination pt-3" style="place-content: center;">
						<li class="page-item">
			                 <a class="page-link" href="#" aria-label="Previous">
			                    <span aria-hidden="true">&laquo;</span>
			                 </a>
							</li>
			                 <li class="page-item"><a class="page-link" href="#">1</a></li>
			                 <li class="page-item"><a class="page-link" href="#">2</a></li>
			                 <li class="page-item"><a class="page-link" href="#">3</a></li>
			                 <li class="page-item">
			                   <a class="page-link" href="#" aria-label="Next">
			                     <span aria-hidden="true">&raquo;</span>
			                   </a>
							</li>
	               		</ul>
	             	</nav>
				</div>
				
				<br>
				
				<div class="col mt-1">
					<a href="./registNotice" class="btn btn-warning btn-lg" style="font-size: small">공지 등록</a>
				</div>
			</div>
	
	<c:if test="${!empty sessionUserInfo && sessionUserInfo.admin_no == data.Admin.admin_no }">
		<a href="./deleteNoticeProcess?admin_no=${data.Notice.admin_no }">선택삭제</a>
		<a href="./updateNotice?admin_no=${data.Notice.admin_no }">수정</a>
	</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
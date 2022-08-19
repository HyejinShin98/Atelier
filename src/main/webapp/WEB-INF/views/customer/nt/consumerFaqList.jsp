<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../resources/css/common.css">
<title>Atelier</title>
</head>
<body>
	
<div class="container-fluid">

<div class="row py-2">
<div class="col-3 text-center text-secondary my-1 fs-5">
   <a  class="nav-link active" aria-current="page"href="../m/myInfomation">
     			<i class="bi bi-house "></i>
   			</a>	
</div>
<div class="col-6 text-center my-0"><h1>자주 묻는 질문</h1></div>
<div class="col-3 text-center text-secondary my-1 fs-5 ">
  <a  class="nav-link active" aria-current="page"href="./noticeList"><i class="bi bi-question-circle-fill"></i>공지</a>	
</div>
</div>
			    <div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    회원 서비스 : 회원 가입/탈퇴/로그인
					  </button>
					 <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">회원 가입</a></li>
					    <li><a class="dropdown-item" href="#">탈퇴</a></li>
					    <li><a class="dropdown-item" href="#">로그인</a></li>
					 </ul>
				</div>
				
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    회원 서비스 : 계정 정보
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">비밀번호 변경</a></li>
					    <li><a class="dropdown-item" href="#">회원정보 변경</a></li>
					 </ul>
					</div>
				
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    회원 서비스 : 할인 쿠폰
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">쿠폰 사용방법</a></li>
					 </ul>
					</div>	
					
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    회원 서비스 : 적립금/회원등급
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">적립금</a></li>
					    <li><a class="dropdown-item" href="#">회원등급</a></li>
					 </ul>
				</div>	
				
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    회원 서비스 : 구매 후기
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">구매후기 작성</a></li>
					    <li><a class="dropdown-item" href="#">구매후기 수정</a></li>
					 </ul>
				</div>		
				 
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    판매자 문의 : 메시지 기능
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">메시지 기능</a></li>
					 </ul>
				</div> 
				
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    주문/결제 : 주문/배송 조회
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">메시지 기능</a></li>
					 </ul>
				</div> 
				
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    주문/결제 : 결제/환불
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">결제</a></li>
					    <li><a class="dropdown-item" href="#">환불</a></li>
					 </ul>
				</div>
					
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    주문/결제 : 취소/반품/교환
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">취소</a></li>
					    <li><a class="dropdown-item" href="#">반품</a></li>
					    <li><a class="dropdown-item" href="#">교환</a></li>
					 </ul>
				</div>	
				
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    주문/결제 : 영수증 조회 및 출력 방법
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">영수증 조회</a></li>
					    <li><a class="dropdown-item" href="#">영수증 출력</a></li>
					 </ul>
				</div>
				
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    자유게시판
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">게시글 작성 및 수정</a></li>
					 </ul>
				</div>
				
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    공방 커뮤니티
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">공방 커뮤니티...</a></li>
					 </ul>
				</div>
				
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    시스템 : 알림
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">앱 푸시</a></li>
					    <li><a class="dropdown-item" href="#">메시지 알림</a></li>
					 </ul>
				</div>
					
				<div class="dropdown-center">
					  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    시스템 : 오류
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">접속 오류</a></li>
					 </ul>
				</div>	
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
			                 <li class="page-item">
			                   <a class="page-link" href="#" aria-label="Next">
			                     <span aria-hidden="true">&raquo;</span>
			                   </a>
							</li>
	               		</ul>
	             	</nav>
				</div>
				<div class="col"></div>	
				
			</div>

		<br>
	
	</div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>		
</body>
</html>
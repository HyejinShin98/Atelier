<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
</head>
<body>
   <div class="container-fluid px-3">
   		<div class="row"><!--상단메뉴-->
           <div class="col-1"><i class="bi bi-backspace"></i></div><!--뒤로가기-->
           <div class="col-9"></div>
           <div class="col-1"><i class="bi bi-house"></i></div>
           <div class="col-1"><i class="bi bi-cart"></i></div>
       </div>
       <div class="row">
           <div class="col">
               <div class="row">
                   <div class="col-3"></div>
                   <div class="col-6 fs-4 fw-bold text-center" >공동 대여 제안</div>
                   <div class="col-3"></div>
               </div>
               <hr class="my-2">
               <h1 class="display-1"></h1>
           </div>  
       </div>
    <form action="./rentAtelierWriteProcess" method="post">
       <div class="row">
           <div class="input-group mb-3">
               <input type name="rent_atelier_title" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="제목을 입력하세요.">
           </div>
       </div>
       <div class="row">
           <div class="input-group mb-3">
               <span class="input-group-text" id="inputGroup-sizing-default">공방 위치</span>
               <input type name="rent_atelier_location" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="공방의 위치를 입력하세요.">
            </div>
       </div>
       <div class="row">
           <div class="col">
               <div class="input-group mb-3">
                   <span class="input-group-text" id="inputGroup-sizing-default">대여료</span>
                   <input input type name="rent_atelier_price" type="text" class="form-control"  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="단위: 만원">
               </div>
           </div>
           <div class="col">    
               <div class="input-group mb-3">
                   <span class="input-group-text" id="inputGroup-sizing-default">모집인원</span>
                   <input input type name="rent_atelier_max_no" type="text" class="form-control"  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="단위: 명">
               </div>
           </div>    
       </div>
       <div class="row">
           <div class="col-4"><span class="input-group-text" id="inputGroup-sizing-default">일시 선택</span></div>
           <div class="col d-grid"><input input name="rent_atelier_plan" type="date"></div>
       </div>
       <div class="row">
           <div class="col">
               <div class="mt-2">
                   <label for="exampleFormControlTextarea1" class="form-label">모집글 자세히 작성하기</label>
                   <textarea input type name ="rent_atelier_content" class="form-control mt-1" id="exampleFormControlTextarea1" rows="8" placeholder="모집글의 내용을 입력해주세요."></textarea>
                 </div>
           </div>
       </div>
       <div class="row">
           <div class="col">
               <div class="mt-2">
                   <label for="formFileMultiple" class="form-label">작성글에 이미지 첨부하기</label>
                   <input class="form-control" type="file" id="formFileMultiple" multiple>
                 </div>
           </div>
       </div>
       <div class="row">
           <div class="col d-grid mt-3">
               <button input type="submit" type="button" class="btn btn-primary">모집글 올리기</button>
           </div>
       </div>
	</form>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>	
</body>
</html>
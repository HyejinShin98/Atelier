<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/common.css">	
<script type="text/javascript">

function cal(){
	var a = document.getElementById("resultBox");
	var controlBox =document.getElementById("controlBox");
	a.innerHTML = "";
	
	
	
	var b1 = eval(${model.store.store_total_sales_amount} + "/" + ${model.rank.store_tier_next_point});
	var c1  = eval(b1 + "*" + 100);
	var d1 = Math.round(c1);
	controlBox.style="width:"+d1+"%";
	a.innerText=c1 + "%";
} 


window.addEventListener("DOMContentLoaded" , function (){
	//사실상 처음 실행하는 코드 모음...
	 cal();
	
	//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
	
});
</script>
<style type="text/css">




.silver {
  animation: flux 2s linear infinite;
  -moz-animation: flux 2s linear infinite;
  -webkit-animation: flux 2s linear infinite;
  -o-animation: flux 2s linear infinite;
}

@keyframes flux {
  0%,
  100% {
    box-shadow: 0 0 1vw #B7B7B7, 0 0 3vw #C9C9C9, 0 0 10vw #DBDBDB, 0 0 10vw #EDEDED, 0 0 .4vw #FFFFFF, .5vw .5vw .1vw #FFFFFF;
    color: #FFFFFF;
  }
  50% {
    box-shadow: 0 0 .5vw #B7B7B7, 0 0 1.5vw #C9C9C9, 0 0 5vw #DBDBDB, 0 0 5vw #EDEDED, 0 0 .2vw #FFFFFF, .5vw .5vw .1vw #FFFFFF;
    color: #FFFFFF;
  }
}



.bronze {
  animation: flux2 2s linear infinite;
  -moz-animation: flux2 2s linear infinite;
  -webkit-animation: flux2 2s linear infinite;
  -o-animation: flux2 2s linear infinite;
}

@keyframes flux2 {
  0%,
  100% {
    box-shadow: 0 0 1vw #FFCC97, 0 0 3vw #FFBA85, 0 0 10vw #FFA873, 0 0 10vw #F09661, 0 0 .4vw #DE844F, .5vw .5vw .1vw #CC723D;
    color: #CC723D;
  }
  50% {
    box-shadow: 0 0 .5vw #FFCC97, 0 0 1.5vw #FFBA85, 0 0 5vw #FFA873, 0 0 5vw #F09661, 0 0 .2vw #DE844F, .5vw .5vw .1vw #CC723D;
    color: #CC723D;
  }
}



.gold {
  animation: flux3 2s linear infinite;
  -moz-animation: flux3 2s linear infinite;
  -webkit-animation: flux3 2s linear infinite;
  -o-animation: flux3 2s linear infinite;
}

@keyframes flux3 {
  0%,
  100% {
    box-shadow: 0 0 1vw #FFFFD7, 0 0 3vw #FFFFC5, 0 0 10vw #FFFFA1, 0 0 10vw #FFFF8F, 0 0 .4vw #FAED7D, .5vw .5vw .1vw #E8DB6B;
    color: #E8DB6B;
  }
  50% {
    box-shadow: 0 0 .5vw #FFFFC5, 0 0 1.5vw #FFFFB3, 0 0 5vw #FFFFA1, 0 0 5vw #E8DB6B, 0 0 .2vw #D6C959, .5vw .5vw .1vw #B2A535;
    color: #E8DB6B;
  }
}


.pla {
  animation: flux4 2s linear infinite;
  -moz-animation: flux4 2s linear infinite;
  -webkit-animation: flux4 2s linear infinite;
  -o-animation: flux4 2s linear infinite;
}

@keyframes flux4 {
  0%,
  100% {
    box-shadow: 0 0 1vw #E8FFFF, 0 0 3vw #C4FDFF, 0 0 10vw #A0D9E2, 0 0 10vw #7CB5BE, 0 0 .4vw #6AA3AC, .5vw .5vw .1vw #58919A;
    color: #E8FFFF;
  }
  50% {
    box-shadow: 0 0 .5vw #FFFFC5, 0 0 1.5vw #FFFFB3, 0 0 5vw #FFFFA1, 0 0 5vw #E8DB6B, 0 0 .2vw #D6C959, .5vw .5vw .1vw #B2A535;
    color: #58919A;
  }
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>

</head>
<body>	
	

	<div class="container-fluid">
		<div class="fixed-top">
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
		<div class="row" style="height:80px;"></div>
		
			
		
				<div>
						<c:choose>
							<c:when test="${model.store.store_tier_no==1 }">
							<div class="row my-2" style="color:#6C6C6C;">
							<div class="col-4"></div>
							<div class="col-4 py-3 text-center" >
     						<img class="rounded-circle bronze"style="background: #DE844F;" src="../../resources/img/whiteTro.png"  width="100" height="100"alt="...">			
   							 </div> 
   							 <div class="col-4"></div>
   							</div>
   						
							</c:when>
							
							
							
							
							<c:when test="${model.store.store_tier_no==2 }">
							<div class="row my-2" style="color:#6C6C6C;">
							<div class="col-4"></div>
							<div class="col-4 py-3 text-center" >
     						<img class="bg-light rounded-circle silver" src="../../resources/img/whiteTro.png"  width="100" height="100"alt="...">			
   							 </div> 
   							 <div class="col-4"></div>
   							</div>
   					
							</c:when>
							
							
							
							
							<c:when test="${model.store.store_tier_no ==3}">
							<div class="row my-2" style="color:#6C6C6C;">
							<div class="col-4"></div>
							<div class="col-4 py-3 text-center" >
     							<img class="bg-warning rounded-circle gold" src="../../resources/img/whiteTro.png"  width="100" height="100"alt="...">		
   							 </div> 
   							 <div class="col-4"></div>
   							</div>
   					
							</c:when>
							
								<c:when test="${model.store.store_tier_no ==6}">
							<div class="row my-2" style="color:#6C6C6C;">
							<div class="col-4"></div>
							<div class="col-4 py-3 text-center" >
     							<img class="rounded-circle" src="../../resources/img/noTro.JPG"  width="100" height="100"alt="...">		
   							 </div> 
   							 <div class="col-4"></div>
   							</div>
   					
							</c:when>
							
							<c:otherwise>
							<div class="row my-2" style="color:#6C6C6C;">
							<div class="col-4"></div>
							<div class="col-4 py-3 text-center" >
     							<img class="bg-primary rounded-circle pla" src="../../resources/img/whiteTro.png"  width="100" height="100"alt="...">			
   							 </div> 
   							 <div class="col-4"></div>
   							</div>
   							
							</c:otherwise>
						</c:choose>
					
					
			</div>
			
			<div class="row py-3"></div>
			
			<div class="row py-2"><div class="progress">
  <div class="progress-bar bg-warning bg-opacity-50" id="controlBox" role="progressbar" aria-label="Example with label" style="width: 25%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
	<div id="resultBox"></div>
  </div>
</div></div>
				<span class="text-secondary">당신의 등급은 :</span> <span class="fx-bold fs-4">${model.rank.store_tier_name }</span> 입니다<br>
			  	<span class="text-secondary">다음 등급 목표치 :</span> ${model.rank.store_tier_next_point} <br>
			  	<span class="text-secondary">현재 포인트는 :</span> ${model.store.store_total_sales_amount } <br>
				<span class="text-secondary">현재 수수료감면 :</span> ${model.rank.store_tier_commition}%<br>
	
			<div class="row" style="height:20px;"></div>
		<div class="row bg-warning bg-opacity-50">
		<div class="col-3"><img src="../../resources/img/memberShip.png" class="rounded-circle" alt="..." 
					width="75" height="75" ></div><div class="col text-center"  style="justify-content; margin :auto;  align-items : center;">더 많은 포인트 쌓는 방법?<br> <span class=" fw-bold fs-5">Atelier MemberShip</span></div>
	<div class="col-1"></div>				
	</div>
	<div class="row" style="height:60px;"></div>
	<div class="row" >
			 <span class="fx-bold fs-4 text-secondary border-bottom py-2">Atelier 등급</span>
			 </div>
			
			
			
			
			
							<div class="row my-2 border-bottom py-2">
							<div class="col-4  py-3 text-center"><img  src="../../resources/img/bronze.JPG"  alt="...">	</div>
							<div class="col-6" style="color:#6C6C6C;">수수료 감면률 <br>
												 <span class="fx-bold fs-4 text-warning text-opacity-50">10%</span><br><br>
												 등급조건<br>
												 <span class="fx-bold fs-5 text-dark">10만원 이상 판매시</span>
   							 </div> 
   							 <div class="col-2"></div>
   							</div>
   								
							
							
							<div class="row my-2 border-bottom py-2">
							<div class="col-4 py-3 text-center"><img  src="../../resources/img/silver.JPG"  alt="...">		</div>
							<div class="col-6" >수수료 감면률 <br>
												 <span class="fx-bold fs-4 text-warning text-opacity-50">20%</span><br><br>
												 등급조건<br>
												 <span class="fx-bold fs-5 text-dark">50만원 이상 판매시</span>
   							 </div> 
   							 <div class="col-2"></div>
   							</div>
   							
							
										
							
							
							<div class="row my-2 border-bottom py-2">
							<div class="col-4  py-3 text-center"> 	<img  src="../../resources/img/gold.JPG"  alt="..."></div>
							<div class="col-6" >수수료 감면률 <br>
												 <span class="fx-bold fs-4 text-warning text-opacity-50">30%</span><br><br>
												 등급조건<br>
												 <span class="fx-bold fs-5 text-dark">100만원 이상 판매시</span>
   							 </div> 
     								
   							 </div> 
   							 
   							 		
   							 
   							<div class="row my-2 border-bottom py-4">
							<div class="col-4  py-3 text-center"> 	<img  src="../../resources/img/pla.JPG"  alt="..."></div>
							<div class="col-6" >수수료 감면률 <br>
												 <span class="fx-bold fs-4 text-warning text-opacity-50">40%</span><br><br>
												 등급조건<br>
												 <span class="fx-bold fs-5 text-dark">500만원 이상 판매시</span>
   							 </div> 
     								
   							 </div> 
   							 
   							 		
   							 
							 <span class="fx-bold fs-1 text-dark text-opacity-75">안내사항</span>
							 <div class="row" style="height:10px;"></div>
						
						<div class="row border border-1 bg-secondary bg-opacity-10">
						 <span class="text-secondary text-opacity-75">▶회원 등급은 최근 1달간 결제 금액을 산정하여 매 달 10일마다 변경됩니다.<br>
						▶ 결제 금액은 구매자가 최종확정한 상품만 포인트로 적립이 되며 배송비, 후원비등 기타 금액은 포인트로 산정되지 않습니다.<br>
						▶ 회원 등급 산정 및 혜택은 당사 사정에 의해 변경될 수 있습니다.<br>
						</span></div>
						
							
						
		
		<div class="row" style="height:70px;"></div>
		<div class="row"><jsp:include page="../common/bottomInfo.jsp"></jsp:include></div>
		<div class="row" style="height:65px;"></div>

</div>
<jsp:include page="../common/navbarBottom.jsp"></jsp:include>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
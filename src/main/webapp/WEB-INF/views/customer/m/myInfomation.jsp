<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">	
<script type="text/javascript">


		//내 결제화면 modal로 구현.
	function payPage(){
	
		var customerNo = document.getElementById("customerNo").value;
	
		console.log("customerNo",customerNo);
		//AJAX : 자바스크립트로 리퀘스트한다...
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				//client side rendering => hell...
				//AJAX는 restapi를 호출한다뿐 ... 단 필연적으로 client side rendering이 필요함..
				var payPageResultBox = document.getElementById("payPageResultBox");
				payPageResultBox.innerHTML = "";
				
				
				console.log("시작");
			 	var titleBox = document.createElement("div");
				titleBox.classList.add("row");
				titleBox.classList.add("py-2");
				titleBox.classList.add("my-1");
				payPageResultBox.appendChild(titleBox);
				
				var titleSpanBox = document.createElement("span");
				titleSpanBox.classList.add("fs-5");
				titleSpanBox.classList.add("fw-bold");
				titleSpanBox.classList.add("text-secondary");
				titleSpanBox.classList.add("text-opacity-50");
				if(result.customerWallet ==null){
					titleSpanBox.innerText = "입금 예정 : " + result.fail;
				}else{
					titleSpanBox.innerText="입급 예정 : " + result.centerBank.center_bank_saving_money + "원";
				}
				titleBox.appendChild(titleSpanBox);
				
				var accountBox = document.createElement("div");
				titleBox.classList.add("row");
				titleBox.classList.add("py-2");
				titleBox.classList.add("my-1");
				payPageResultBox.appendChild(accountBox);
				

				var accountSpanBox = document.createElement("span");
				accountSpanBox.classList.add("fw-bold");
				if(result.customerWallet ==null){
					accountSpanBox.innerText = "주 통장 : " +result.fail;
				}else{
					accountSpanBox.innerText = "주 통장 : " + result.customerWallet.customer_wallet_bank_name + " " + result.customerWallet.customer_wallet_account;
				}
				accountBox.appendChild(accountSpanBox);
				
				
				var accountButtonBox = document.createElement("button");
				accountButtonBox.classList.add("btn");
				accountButtonBox.classList.add("ms-2");
				accountButtonBox.classList.add("btn-primary");
				accountButtonBox.type = "button";
				accountButtonBox.setAttribute("data-bs-toggle","collapse"); 
				accountButtonBox.setAttribute("data-bs-target","#accountCollapse");
				accountButtonBox.innerText = "계좌 설정";
				accountButtonBox.ariaExpanded="false";
				accountButtonBox.ariaControls="accountCollapse";
				
				accountBox.appendChild(accountButtonBox);
				
				
				
				
				var collapseResultBox = document.getElementById("collapseResultBox");
				collapseResultBox.innerHTML="";
				
				var inputNameRowBox = document.createElement("div");
				inputNameRowBox.classList.add("row");
				inputNameRowBox.classList.add("py-2");
				inputNameRowBox.classList.add("my-2");
				
				collapseResultBox.appendChild(inputNameRowBox);
				
				var formNameRowBox = document.createElement("form");
				formNameRowBox.name ="formBox";
				formNameRowBox.id = "formBox";
				
				inputNameRowBox.appendChild(formNameRowBox);
				
				var inputSelectColBox1 = document.createElement("select");
				inputSelectColBox1.classList.add("form-select");
				inputSelectColBox1.ariaLabel="Default select example";
				inputSelectColBox1.id = "selectInput";
				inputSelectColBox1.name = "selectInput";
				formNameRowBox.appendChild(inputSelectColBox1);
				
				
				var optionBox1 =  document.createElement("option");
				
				optionBox1.selected;
				optionBox1.innerText = "은행";
				inputSelectColBox1.appendChild(optionBox1);
				
				var optionBox2 =  document.createElement("option");
				
				optionBox2.value="신한";
				optionBox2.innerText ="신한";
				inputSelectColBox1.appendChild(optionBox2);
				
				var optionBox3 =  document.createElement("option");
				
				optionBox3.value="우리";
				optionBox3.innerText = "우리";
				inputSelectColBox1.appendChild(optionBox3);
				
				
				

				var inputNameRowBox2 = document.createElement("div");
				inputNameRowBox2.classList.add("row");
				inputNameRowBox2.classList.add("py-2");
				inputNameRowBox2.classList.add("my-2");
				
				formNameRowBox.appendChild(inputNameRowBox2);
				
				var inputBox = document.createElement("input");
				inputBox.classList.add("py-2");
				inputBox.classList.add("my-2");
				inputBox.type="text";
				inputBox.id="accountId";
				inputBox.name="accountId";
				inputBox.setAttribute("placeholder","계좌번호를 입력해주세요");
				inputNameRowBox2.appendChild(inputBox);
				
				var inputHiddenBox = document.createElement("input");
				inputHiddenBox.type="hidden";
				inputHiddenBox.id="customerId";
				inputHiddenBox.name="customerId";
				inputHiddenBox.value = ${customer.customer_no};
				inputNameRowBox2.appendChild(inputHiddenBox);
				
				var inputButtonBox = document.createElement("button");
				
				if(result.customerWallet == null){
					inputButtonBox.type="button";
					inputButtonBox.classList.add("btnnn");
					inputButtonBox.setAttribute("onclick","insertAccount()");
					inputButtonBox.innerText="등록";
					inputButtonBox.setAttribute("data-bs-dismiss","modal");
					inputButtonBox.ariaLabel="Close";
					
					
				}else{
					inputButtonBox.type="button";
					inputButtonBox.classList.add("btn");
					inputButtonBox.classList.add("btn-outline-warning");
					inputButtonBox.classList.add("fs-5");
					inputButtonBox.setAttribute("onclick","updateAccount()");
					inputButtonBox.innerText="수정";
					inputButtonBox.setAttribute("data-bs-dismiss","modal");
					inputButtonBox.ariaLabel="Close";
				}
				
				inputNameRowBox2.appendChild(inputButtonBox);
				
				
				/* 
				var nicknameBox = document.createElement("span");
				nicknameBox.innerText = result.data.memberVo.member_nick;
				nicknameBox.style.color = "red";
				resultBox.appendChild(nicknameBox);
				
				
				
				<div class="collapse" id="collapseExample">
				  <div class="card card-body">
				    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
				  </div>
				</div> */ 
			}
		};
	

		xhr.open("post" , "../payPage"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("customerNo=" +customerNo);
		

	
	}

		
	function insertAccount(){
		var customerNo = document.getElementById("customerId").value;
		var account = document.getElementById("accountId").value;
		var bank = document.getElementById("selectInput").value;
		
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

				insertBank(result.wallet.customer_wallet_no);
				console.log("result.wallet.customer_wallet_no",result.wallet.customer_wallet_no)
			}
		};
		xhr.open("post" , "../insertAccount"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("customerNo=" +customerNo + "&account=" + account + "&bank=" + bank);
		
		
	}
	
	
	
	function updateAccount(){
		var customerNo = document.getElementById("customerId").value;
		var account = document.getElementById("accountId").value;
		var bank = document.getElementById("selectInput").value;
		console.log(customerNo,account, bank );
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

				payPage();
			}
		};
		xhr.open("post" , "../updateAccount"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("customerNo=" +customerNo + "&account=" + account + "&bank=" + bank);
		
		
	}
	
	
	function insertBank(a){
		console.log("아예 안되나?");
		var walletNo = a;
		console.log("walletNo",walletNo);
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				payPage();
			}
		};
		xhr.open("post" , "../insertBank"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("walletNo=" +walletNo);
		
		
	}

	


	
	
	function insertImageStore(){
		//ecma5

	
		const formData = new FormData();
		
	
		formData.append("storeNo",document.getElementById("storeNo").value);
		formData.append("file",document.getElementById("file").files[0]);
		 const xhr = new XMLHttpRequest();
		
		 
			xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);
				console.log(result.Store);
				console.log(result.Store.store_name);
				
				var imgInput = document.getElementById("imageCol");
				imgInput.innerHTML = "";
				
				var buttonImage = document.createElement("button");
				buttonImage.classList.add("btn");
				buttonImage.classList.add("btn-warning");
				buttonImage.classList.add("rounded-circle");
				buttonImage.type = "button";
				buttonImage.setAttribute("data-bs-toggle","modal");
				buttonImage.setAttribute("data-bs-target","#imageModal");
				buttonImage.setAttribute("style","--bs-btn-padding-y: .75px; --bs-btn-padding-x: .75px; --bs-btn-font-size: .75rem;");
				imgInput.appendChild(buttonImage);
				
				var imgBox = document.createElement("img");
				
				imgBox.classList.add("rounded-circle");
				imgBox.setAttribute("src","/uploadFiles/"+result.Store.store_img);
				imgBox.setAttribute("style","outline : solid 1px pink;");
				imgBox.setAttribute("width","75");
				imgBox.setAttribute("height","75");
				imgBox.setAttribute("alt","...");
				buttonImage.appendChild(imgBox);
				
		/* 		<button type="button" class="btn btn-warning rounded-circle" data-bs-toggle="modal" data-bs-target="#imageModal"
				style="--bs-btn-padding-y: .75px; --bs-btn-padding-x: .75px; --bs-btn-font-size: .75rem;"> 
				<img src="../../resources/img/default.jpg" class="rounded-circle" style="outline : solid 1px pink;" alt="..." 
					width="75" height="75"></button>
 */				
			}
		}; 
	 
		
	
	
		 xhr.open("POST", "../storeImage");
		 xhr.send(formData);  
		

	}	
	
	function rankStatus(){
		var rank = document.getElementById("point").value;
		console.log("rank", rank);
		
		
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.open("post" , "../rankStatus"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("amount=" +rank);
	}
	
	window.addEventListener("DOMContentLoaded" , function (){
		//사실상 처음 실행하는 코드 모음...
		 rankStatus();
		
		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
		
	});
</script>
<style type="text/css">
.btnn {
  border: none;
  background-color: inherit;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
}

	.btnnn {
  border: none;
  background-color: inherit;
 
  display: inline-block;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>

</head>
<body>	
	
	
	
	
	
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		
	<div class="container-fluid">
		
		<div class="row" style="height:60px;"></div>
			<div class="row bg-warning bg-opacity-50">
				
			<div class="col"><img src="../../resources/img/together.png" class="rounded-circle" alt="..." 
					width="75" height="75" ></div><div class="col-6 text-center"  style="justify-content; margin :auto;  align-items : center;"><a  class="nav-link active" aria-current="page"href="../rent/rentAtelierList">함께 공유하는 공방! <span class=" fw-bold fs-5">Atelier Community</span></a></div><div class="col-2">
					</div>
				
			</div>
		
		<div class="row" style="height:10px;"></div>
		<div class="row py-3">
			<div class="col-3" id = "imageCol">
				<c:choose>
				<c:when test="${temp.store_name} == null">
				<button type="button" class="btn btn-warning rounded-circle" data-bs-toggle="modal" data-bs-target="#imageModal"
				style="--bs-btn-padding-y: .75px; --bs-btn-padding-x: .75px; --bs-btn-font-size: .75rem;"> 
				<img src="../../resources/img/noimage.png" class="rounded-circle" style="outline : solid 1px pink;" alt="..." 
					width="75" height="75"> </button></c:when><c:otherwise>
					<button type="button" class="btn btn-warning rounded-circle" data-bs-toggle="modal" data-bs-target="#imageModal"
				style="--bs-btn-padding-y: .75px; --bs-btn-padding-x: .75px; --bs-btn-font-size: .75rem;"> 
				<img src="/uploadFiles/${temp.store_img}" class="rounded-circle" style="outline : solid 1px pink;" alt="..." 
					width="75" height="75"> 
					</button>
				
					</c:otherwise>
					</c:choose>
			</div>
			<div class="col-5">
				<div class="row my-1 py-1" style="margin :auto; color:#6C6C6C;"> <span class="">환영합니다!</span></div>
				<div class="row my-1" style="margin :auto;"><span class="fs-1 fw-bold">${temp.store_name}</span></div>
			</div>
			
			<div class="col text-center" style="justify-content; margin :auto; padding: auto; align-items : center;"><button type="button" class="btn  rounded-circle" data-bs-toggle="modal" data-bs-target="#customerModal"
				style="--bs-btn-padding-y: .55px; --bs-btn-padding-x: .55px; --bs-btn-font-size: .55rem; justify-content;"> 
				<img src="../../resources/img/gear.png" class="rounded-circle"  alt="..." 
					width="45" height="45"></button></div>
		</div>
		
	
		<div class="row my-2 py-2 border-bottom" style="color:#6C6C6C;">
						 <input type="hidden" value="${temp.store_total_sales_amount}" id="point">
						<c:choose>
							<c:when test="${temp.store_tier_no==1 }">
							<div class="col-6 py-1 border-end  border-2  border-opacity-50 text-center" style="height:40px;">
							 <a class="navbar-brand" href="./myRank">
     							 마켓등급 :  <img src="../../resources/img/bronze.JPG"  alt="..." width="30" height="30">
   							 </a>	    		
   							 </div>  
   							  <div class="col-6  py-1 text-center"> 누적Point : ${temp.store_total_sales_amount}</div>
							</c:when>
							
							<c:when test="${temp.store_tier_no==2 }">
							<div class="col-6 py-1 border-end  border-2 border-opacity-50 text-center" style="height:40px;">
							 <a class="navbar-brand" href="./myRank">
     						 마켓등급 : <img src="../../resources/img/silver.JPG"  alt="..." width="30" height="30">
   							 </a>	   
   							 </div>
   							 <div class="col-6  py-1 text-center"> 누적Point : ${temp.store_total_sales_amount}</div>
							</c:when>
							
							<c:when test="${temp.store_tier_no ==3}">
							<div class="col-6 py-1 border-end  border-2  border-opacity-50 text-center" style="height:40px;">
							 <a class="navbar-brand" href="./myRank">
     						 마켓등급 : <img src="../../resources/img/gold.JPG"  alt="..." width="30" height="30">
   							 </a>	
							</div>
							 <div class="col-6  py-1 text-center"> 누적Point : ${temp.store_total_sales_amount}</div>
							</c:when>
							
							<c:when test="${temp.store_tier_no ==6}">
							<div class="col-6 py-1 border-end  border-2  border-opacity-50 text-center" style="height:40px;">
							 <a class="navbar-brand" href="./myRank">
     						 마켓등급 : <img src="../../resources/img/noTro.JPG"  alt="..." width="30" height="30">
   							 </a>	
							</div>
							 <div class="col-6  py-1 text-center"> 누적Point : ${temp.store_total_sales_amount}</div>
							</c:when>
							<c:otherwise>
							<div class="col-6 py-1 border-end  border-2 border-warning border-opacity-50 text-center" style="height:40px;">
							 <a class="navbar-brand" href="./myRank">
     						 마켓등급 : <img src="../../resources/img/pla.JPG"  alt="..." width="30" height="30">
   							 </a>	
							</div>
							 <div class="col-6  py-1 text-center"> 누적Point : ${temp.store_total_sales_amount}</div>
							</c:otherwise>
						</c:choose>
					
					
			</div>
							
	
	
	<div class="row">
		<span class="fs-6 fw-bold"  style="color:#6C6C6C;">상점 관리</span>
	</div>			
	
	<div class="row  p-2 my-2">
		
		<div class="col">
			<a href="./myProductReviewAllList?storeNo=${temp.store_no}" class="text-decoration-none fs-5" style="color:#6C6C6C;">전체상품 후기</a>
		</div>
	</div>
	<div class="row  p-2 my-2">
		
		<div class="col">
			<a href="./myProductAskAllList?storeNo=${temp.store_no}" class="text-decoration-none  fs-5" style="color:#6C6C6C;">전체상품 문의</a>
		</div>
	</div>
	
	<div class="row  p-2 my-2 border-bottom">
		
		<div class="col">
			<a href="./incomeStatistics?storeNo=${temp.store_no}" class="text-decoration-none   fs-5" style="color:#6C6C6C;">판매 현황 확인</a>
		</div>
	</div>
	




	<div class="row">
		<span class="fs-6 fw-bold text-secondary ">기타 관리</span>
	</div>			
	<div class="row  p-2">
	<div class="col">
		<input type ="hidden" value ="${customer.customer_no}" id = "customerNo">
		<div class="fs-5 btn-sm" onclick ="payPage()" data-bs-toggle="modal" data-bs-target="#payModal"style="color:#6C6C6C;">내 계좌관리</div>
		</div>
	</div>


	<div class="row  p-2 my-1">
		
		<div class="col">
			<a href="../ct/askWriteToAdminList?storeNo=${temp.store_no}" class="text-decoration-none fs-5" style="color:#6C6C6C;">고객센터</a>
		</div>
	</div>

	<div class="row  p-2 my-1">
		
		<div class="col">
			<a href="./myMeeting" class="text-decoration-none fs-5" style="color:#6C6C6C;">공방 후기</a>
		</div>
	</div>

<div class="row" style="height:70px;"></div>
	<div class="row">
		
		<a class="btn btn-outline-warning text-warning text-opacity-50" href="../lg/logoutProcess" role="button">로그아웃</a>
	</div>
	
	<div class="row" style="height:30px;"></div>
		<div class="row"><jsp:include page="../common/bottomInfo.jsp"></jsp:include></div>
		
</div>



<jsp:include page="../common/navbarBottom.jsp"></jsp:include>
		
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>




<!-- payPage Modal -->
<div class="modal fade" id="payModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
           <h5 class="modal-title" id="staticBackdropLabel" style="text:pink;">내 결제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">


	
		<div class="container-fluid">
			<div id="payPageResultBox"></div>
					
				
			<div class="collapse" id="accountCollapse">
			  <div class="card card-body">
			   <div class="container-fluid">
			   	<div id="collapseResultBox"></div>
			   	<div class = "row" style="height:40px;"></div>
			   </div>
			  </div>
			</div>
			
				<div class = "row" style="height:180px;"></div>			
		</div>
		
			</div>	
	</div>
      </div>
    </div>



<!-- image Modal -->
<div class="modal fade" id="imageModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">


		<div class="container-fluid">
			<form id ="imageForm2" name ="imageForm2" enctype="multipart/form-data">
			<input type="file" id="file"name="file" accept="image/*">	
			<input type="hidden" id="storeNo" name="storeNo" value="${temp.store_no}">
			<button type="button" onclick ="insertImageStore()" data-bs-dismiss="modal" aria-label="Close">등록하기</button>
			
			</form>
			
		</div>
		
			</div>	
	</div>
      </div>
    </div>


<!-- customer Modal -->
<div class="modal fade" id="customerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
       <h3 class="modal-title" id="staticBackdropLabel" style="text:pink;">${customer.customer_name}</h3>님 정보 수정 화면
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">


		<div class="container-fluid" id = "containerBox">
				<form action="./profileModifyProcess" method="post">
					<div class="input-group input-group-sm mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-sm">이름</span>
					  <input class="form-control" name = "store_name" type = "text"  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
					  
					</div>
					<div class="input-group input-group-sm mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-sm">프로필</span>
					   <textarea class="form-control" name = "store_profile" id="message-text"></textarea>
					</div>
					<div class="input-group input-group-sm mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-sm">연락처</span>
					  <input class="form-control" name = "store_phone" type = "text"  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
					  
					</div>
			
				<input name ="customer_no" type ="hidden" value="${customer.customer_no}">
				<div class="d-grid gap-2">
					<input type="submit" value="수정하기" class="btn btn-warning opacity-50">				
				</div>
				</form>
				</div>
		</div>
		</div>
		
			</div>	
	</div>



</body>
</html>
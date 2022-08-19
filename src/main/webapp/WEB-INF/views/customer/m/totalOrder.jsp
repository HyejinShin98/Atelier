<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">	

<style type="text/css">
	.btnnn {
  border: none;
  background-color: inherit;
 
  display: inline-block;
}
</style>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>
<script src="https://code.jquery.com/jquery-3.5.0.js" ></script>

<script type="text/javascript" >


	//주문 전체 페이지 출력 F
	function totalOrder(inputValue){
		
		var Value = inputValue.value;
		console.log(Value);
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
			xhr.onreadystatechange = function(){
			
			
				if(xhr.readyState ==4 && xhr.status ==200){
					var result2 =JSON.parse(xhr.responseText);
					
					
					var resultBox = document.getElementById("resultBox");
					resultBox.innerHTML =""; 
				
					
					
					var ingRowBox = document.createElement("div");
					ingRowBox.classList.add("row");
					ingRowBox.classList.add("py-3");
					resultBox.appendChild(ingRowBox);

					
						var ingColBox = document.createElement("div");
						ingColBox.classList.add("col-4");
						ingColBox.setAttribute("style","text-align: center; border-right: solid; border-right-color:pink");
						ingRowBox.appendChild(ingColBox);
					
					var ingFormBox  = document.createElement("form");
					ingFormBox.name = "act";
					ingColBox.appendChild(ingFormBox);
					
			
					var ingInputBox3  = document.createElement("input");
					ingInputBox3.type="hidden";
					ingInputBox3.value="READY";
					ingInputBox3.id="readyValue";
					ingInputBox3.name="readyValue";
					ingFormBox.appendChild(ingInputBox3);
					
			
					
					if(Value =="READY"){
						
						var ingButtonBox  = document.createElement("button");
						ingButtonBox.type="button";
						ingButtonBox.classList.add("btnnn");
						ingButtonBox.classList.add("fs-6");
						ingButtonBox.classList.add("text-warning");
						ingButtonBox.classList.add("fw-bold");
						ingButtonBox.setAttribute("onclick","totalOrder(readyValue)");
						ingButtonBox.innerText="배송준비";
						ingFormBox.appendChild(ingButtonBox);
					}else{
						var ingButtonBox  = document.createElement("button");
						ingButtonBox.type="button";
						ingButtonBox.classList.add("btnnn");
						ingButtonBox.classList.add("fs-6");
						ingButtonBox.classList.add("text-secondary");
						ingButtonBox.classList.add("fw-bold");
						ingButtonBox.setAttribute("onclick","totalOrder(readyValue)");
						ingButtonBox.innerText="배송준비";
						ingFormBox.appendChild(ingButtonBox);
					}
					
					
				    
				
					//일시정지
					
					var ingColBox2 = document.createElement("div");
					ingColBox2.classList.add("col-4");
					ingColBox2.setAttribute("style","text-align: center; border-right: solid; border-right-color:pink");
					ingRowBox.appendChild(ingColBox2);
					
					var ingFormBox2  = document.createElement("form");
					ingFormBox2.name = "act";
					ingColBox2.appendChild(ingFormBox2);
				
					
					var ingInput2Box3  = document.createElement("input");
					ingInput2Box3.type="hidden";
					ingInput2Box3.value="ING";
					ingInput2Box3.id="ingValue";
					ingInput2Box3.name="ingValue";
					ingFormBox2.appendChild(ingInput2Box3);
					
					if(Value =="ING"){
					var ingButtonBox2  = document.createElement("button");
					ingButtonBox2.type="button";
					ingButtonBox2.classList.add("btnnn");
					ingButtonBox2.classList.add("fs-6");
					ingButtonBox2.classList.add("text-warning");
					ingButtonBox2.classList.add("fw-bold");
					ingButtonBox2.setAttribute("onclick","totalOrder(ingValue)");
					ingButtonBox2.id ="asd";
					ingButtonBox2.innerText="배송중";
					ingFormBox2.appendChild(ingButtonBox2);
					}else{
						var ingButtonBox2  = document.createElement("button");
						ingButtonBox2.type="button";
						ingButtonBox2.classList.add("btnnn");
						ingButtonBox2.classList.add("fs-6");
						ingButtonBox2.classList.add("text-secondary");
						ingButtonBox2.classList.add("fw-bold");
						ingButtonBox2.setAttribute("onclick","totalOrder(ingValue)");
						ingButtonBox2.id ="asd";
						ingButtonBox2.innerText="배송중";
						ingFormBox2.appendChild(ingButtonBox2);
					}
					
					
					//대기중
					
					var ingColBox3 = document.createElement("div");
					ingColBox3.classList.add("col-4");
					ingColBox3.setAttribute("style","text-align: center");
					ingRowBox.appendChild(ingColBox3);
					
					var ingFormBox3  = document.createElement("form");
					ingFormBox3.name = "act";
					ingColBox3.appendChild(ingFormBox3);
					
					var ingInput3Box3  = document.createElement("input");
					ingInput3Box3.type="hidden";
					ingInput3Box3.value="COM";
					ingInput3Box3.id="comValue";
					ingInput3Box3.name="comValue";
					
					ingFormBox3.appendChild(ingInput3Box3);
					
					if(Value =="COM"){
					var ingButtonBox3  = document.createElement("button");
					ingButtonBox3.type="button";
					ingButtonBox3.classList.add("btnnn");
					ingButtonBox3.classList.add("fs-6");
					ingButtonBox3.classList.add("text-warning");
					ingButtonBox3.classList.add("fw-bold");
					ingButtonBox3.setAttribute("onclick","totalOrder(comValue)");
					
					ingButtonBox3.innerText="배송완료";
					ingFormBox3.appendChild(ingButtonBox3);
					}else{
						
						var ingButtonBox3  = document.createElement("button");
						ingButtonBox3.type="button";
						ingButtonBox3.classList.add("btnnn");
						ingButtonBox3.classList.add("fs-6");
						ingButtonBox3.classList.add("text-secondary");
						ingButtonBox3.classList.add("fw-bold");
						ingButtonBox3.setAttribute("onclick","totalOrder(comValue)");
						
						ingButtonBox3.innerText="배송완료";
						ingFormBox3.appendChild(ingButtonBox3);
						
					}
					
					
					//
					
					
					for(e of result2.restOrderTotal){
						
						
					var sumerDivBox=  document.createElement('div');
					sumerDivBox.classList.add('row');
					sumerDivBox.classList.add('border-bottom');
					sumerDivBox.classList.add('border-1');
					sumerDivBox.classList.add('py-2');
					
					resultBox.appendChild(sumerDivBox);
					
					var dateBox =  document.createElement('div');
					dateBox.classList.add('row');
					dateBox.classList.add('py-2');
					dateBox.classList.add('fs-4');
					dateBox.classList.add('mx-0');
					dateBox.classList.add('text-secondary');
					
					dateBox.innerText = e.date;
					sumerDivBox.appendChild(dateBox);
					
					
					
					var divMainBox2 = document.createElement('div');
					divMainBox2.classList.add('row');
					divMainBox2.classList.add('py-0');
					divMainBox2.classList.add('my-1');
					
					
					sumerDivBox.appendChild(divMainBox2);	
					
					var spanBox1 = document.createElement('span');
				 	spanBox1.classList.add("text-secondary");
				 	
					spanBox1.innerText = "주문번호_" + e.restarrOrderList.order_number;
					
					divMainBox2.appendChild(spanBox1);
					
					
					var divMainBox = document.createElement('div');
						divMainBox.classList.add('row');
						divMainBox.classList.add('py-2');
						divMainBox.classList.add('my-1');
						
						
						sumerDivBox.appendChild(divMainBox);
					
				
					
					var divColBox1 = document.createElement('div');
						divColBox1.classList.add('col-3');
						divColBox1.classList.add('py-2');
						divColBox1.classList.add('my-1');
					divMainBox.appendChild(divColBox1);	
					
				 
					
					var imageYn =  document.createElement("img");
		 			imageYn.setAttribute("src","/uploadFiles/"+e.image.pi_path);
		 			imageYn.classList.add("rounded")
		 			imageYn.setAttribute("width","75");
		 			imageYn.setAttribute("height","75");
		 			imageYn.setAttribute("alt","...");
		 			divColBox1.appendChild(imageYn);
					
					
					
					
					var divColBox2 = document.createElement('div');
						divColBox2.classList.add('col-7');
						divColBox2.classList.add('py-2');
						divColBox2.classList.add('ms-3');
					divMainBox.appendChild(divColBox2);	
				
					
					var row1 = document.createElement('div');
					row1.classList.add('row');
					row1.classList.add('py-0');
					row1.classList.add('mx-0');
					
					divColBox2.appendChild(row1);
					
					
					if(e.restarrOrderList.order_delivery_status == "READY"){
						var badgeBox = document.createElement('div');
						badgeBox.classList.add("badge");
						badgeBox.classList.add("bg-danger");
						badgeBox.classList.add("bg-opacity-50");
						badgeBox.classList.add("text-wrap");
						badgeBox.style="width : 3rem;";
						row1.appendChild(badgeBox);
						
						
						var spanBox2 = document.createElement('span');
						spanBox2.classList.add("text-secondary");
						spanBox2.classList.add("fw-bold");
						spanBox2.innerText= "준비중";
						badgeBox.appendChild(spanBox2);
					}else if(e.restarrOrderList.order_delivery_status=="ING"){
						var badgeBox = document.createElement('div');
						badgeBox.classList.add("badge");
						badgeBox.classList.add("bg-warning");
						badgeBox.classList.add("bg-opacity-50");
						badgeBox.classList.add("text-wrap");
						badgeBox.style="width : 3rem;";
						row1.appendChild(badgeBox);
						
						
						var spanBox2 = document.createElement('span');
						spanBox2.classList.add("text-secondary");
						spanBox2.classList.add("fw-bold");
						spanBox2.innerText= "배송중";
						badgeBox.appendChild(spanBox2);
					}else{
						var badgeBox = document.createElement('div');
						badgeBox.classList.add("badge");
						badgeBox.classList.add("bg-success");
						badgeBox.classList.add("bg-opacity-50");
						badgeBox.classList.add("text-wrap");
						badgeBox.style="width : 4rem;";
						row1.appendChild(badgeBox);
						
						
						var spanBox2 = document.createElement('span');
						spanBox2.classList.add("text-secondary");
						spanBox2.classList.add("fw-bold");
						spanBox2.innerText= "배송완료";
						badgeBox.appendChild(spanBox2);
						
					}
					
					
					
					
					var row2 =  document.createElement('div');
					row2.classList.add('row');
					row2.classList.add('py-0');
					row2.classList.add('my-1');
					divColBox2.appendChild(row2);
					
					
					var col2FormBox =   document.createElement('form');
					col2FormBox.id ="FormBox";
					col2FormBox.name= "FormBox";
					row2.appendChild(col2FormBox);
					var col2InputBox =  document.createElement('input');
					col2InputBox.type= "hidden";
					col2InputBox.value =e.restarrOrderList.order_no;
					col2InputBox.name="col2HiddenValue";
					col2InputBox.id="col2HiddenValue";
					col2FormBox.appendChild(col2InputBox);
					var col2ButtonBox =  document.createElement('button');
					col2ButtonBox.type = "button";
					col2ButtonBox.setAttribute("onclick","detailOrder(col2HiddenValue)");
					col2ButtonBox.classList.add("btnnn");
					col2ButtonBox.setAttribute("data-bs-toggle","modal"); 
					col2ButtonBox.setAttribute("data-bs-target","#Backdrop1");
					col2FormBox.appendChild(col2ButtonBox);
					
					var spanBox2 = document.createElement('span');
					spanBox2.classList.add("fs-5");
					spanBox2.classList.add("text-dark");
					spanBox2.innerText=  e.restnick.product_name;
					
					col2ButtonBox.appendChild(spanBox2);
					
					
					
					row3 =  document.createElement('div');
					row3.classList.add('row');
					row3.classList.add('py-0');
					row3.classList.add('my-1');
					divColBox2.appendChild(row3);
					
				
					var spanBox2 = document.createElement('span');
					spanBox2.classList.add("text-secondary");
					spanBox2.innerText=  e.consumer.consumer_nickname + " / "+ e.consumer.consumer_name ;
					
					row3.appendChild(spanBox2);
					
					
					}
	
				}

			};


		xhr.open("post" , "../OrderStatus"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("orderStatus=" + Value);
			
			
		}	
	

	
	
	function detailOrder(a){
		
			var value =a.value;
			//var v= document.getElementById('nameValue').value;
			console.log("value",value);
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					
					
					var result =JSON.parse(xhr.responseText);
				
					//상품 이름 출력
			   		var detailOrderName  = document.getElementById("staticBackdropLabel");
			   		detailOrderName.innerHTML ="";
			   		detailOrderName.classList.add("text-warning");
			   		detailOrderName.classList.add("text-opacity-50");
			   		detailOrderName.classList.add("fs-2");
			   		detailOrderName.innerText=result.detail.Product.product_name;
			   		//상품 정보 출력
			   		modalResultBox = document.getElementById("modalResultBox");
			   		modalResultBox.innerHTML ="";
			   		
			   		
			   		modaldetailBox = document.createElement("div");
			   		modaldetailBox.classList.add("row");
			   		modaldetailBox.classList.add("py-2");
			   		modaldetailBox.classList.add("fs-5");
			   		modaldetailBox.classList.add("my-1");
			   		modaldetailBox.classList.add("text-secondary");
			   		modaldetailBox.innerText=" 상세정보"
			   		
			   		 
			   		modalResultBox.appendChild(modaldetailBox);
			   		
			   		modaldivBox = document.createElement("div");
			   		modaldivBox.classList.add("row");
			   		modaldivBox.classList.add("py-2");
			   		modaldivBox.classList.add("my-1");
			   		
			   		modalResultBox.appendChild(modaldivBox);
			   		
			   		modalspanNameBox = document.createElement("span");
			   		modalspanNameBox.classList.add('fs-6');
			   		modalspanNameBox.classList.add('fw-bold');
			   		
			   		modalspanNameBox.innerText="상품 명 : "+result.detail.Product.product_name;
			   	
			   		modaldivBox.appendChild(modalspanNameBox);
			   		
			   		modalspanCountBox = document.createElement("span");
			   		modalspanCountBox.classList.add('fs-6');
			   		modalspanCountBox.classList.add('fw-bold');
			   		modalspanCountBox.classList.add('py-1');
			   		modalspanCountBox.classList.add('border-bottom');
			   		modalspanCountBox.classList.add('text-secondary');
			   		modalspanCountBox.innerText="상품 갯수 : "+result.detail.Order.order_product_count;
			   	
			   		modaldivBox.appendChild(modalspanCountBox);
			   		
	               
			   		
                	modalspanConsumerBox = document.createElement("span");
                	modalspanConsumerBox.classList.add('fs-6');
                	modalspanConsumerBox.classList.add('py-1');
                	modalspanConsumerBox.classList.add('fw-bold');
                	modalspanConsumerBox.innerText="구매자 : "+ result.detail.consumerAddress.address_name;
			   	
			   		modaldivBox.appendChild(modalspanConsumerBox);
			   		
	                
			   		modalspanAddressBox = document.createElement("span");
			   		modalspanAddressBox.classList.add('fs-6');
			   		modalspanAddressBox.classList.add('fw-bold');
			   		modalspanAddressBox.classList.add('text-secondary');
			   		modalspanAddressBox.innerText="배송지  : "+result.detail.consumerAddress.address_street_addr;
			   		 
			   		modaldivBox.appendChild(modalspanAddressBox);
				
			   		modalspanDetailAddressBox = document.createElement("span");
			   		modalspanDetailAddressBox.classList.add('fs-6');
			   		modalspanDetailAddressBox.classList.add('fw-bold');
			   		modalspanDetailAddressBox.classList.add('text-secondary');
			   		modalspanDetailAddressBox.innerText="상세주소  : "+result.detail.consumerAddress.address_detail_addr;
			   		 
			   		modaldivBox.appendChild(modalspanDetailAddressBox);

			   		modalspanPhoneBox = document.createElement("span");
			   		modalspanPhoneBox.classList.add('fs-6');
			   		modalspanPhoneBox.classList.add('fw-bold');
			   		modalspanPhoneBox.classList.add('text-secondary');
			   		modalspanPhoneBox.innerText="연락처  : "+result.detail.consumerAddress.address_phone;
			   		 
			   		modaldivBox.appendChild(modalspanPhoneBox);
			   		
			   		

			   		modalspanMessageBox = document.createElement("span");
			   		modalspanMessageBox.classList.add('fs-6');
			   		modalspanMessageBox.classList.add('py-2');
			   		modalspanMessageBox.classList.add('fw-bold');
			   		modalspanMessageBox.classList.add('border-bottom');
			   		modalspanMessageBox.classList.add('text-secondary');
			   		modalspanMessageBox.innerText="남긴 말  : "+result.detail.consumerAddress.address_message;
			   		 
			   		modaldivBox.appendChild(modalspanMessageBox);
			   		
			   		
			   		
	             
			 	
	                
                	modalStatusBox = document.createElement("span");
                	modalStatusBox.classList.add('fs-6');
                	modalStatusBox.classList.add('fw-bold');
                	modalStatusBox.classList.add('py-2');
                	if(result.detail.Order.order_complete_status =="PAY"){
                		modalStatusBox.innerText="주문 상태 : 결제완료";	
                	}else{
                		modalStatusBox.innerText="주문 상태 : 구매확정";
                	}
                	
			   		 
                	modaldivBox.appendChild(modalStatusBox);
					
			  
			   		
			   		
				}
			};
			
	        
			xhr.open("post" , "../detailOrder"); //리퀘스트 세팅..
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send("orderNo=" + value );
			
		
			
		}
	

	window.addEventListener("DOMContentLoaded" , function (){
		//사실상 처음 실행하는 코드 모음...
		
		var aa = document.getElementById("ready");
		totalOrder(aa);
		
		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
		
	});
</script>

</head>
<body>	
	

	<div class="container-fluid">
		<div class="fixed-top">
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
		<div class="row" style="height:70px;"></div>
	
		 
				<!-- TABLE을 출력하기 위한 DIV -->
				
		
				<div id ="resultBox">
					<input type="hidden" value="READY" id="ready">
				</div>
	
			
</div>

<!-- Navi foot -->

			<jsp:include page="../common/navbarBottom.jsp"></jsp:include>

<!-- Modal -->
<div class="modal fade" id="Backdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
           <h5 class="modal-title" id="staticBackdropLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">


	
		<div class="container-fluid">
		
			<div id="modalResultBox">
			</div>
							
		</div>
		
			</div>	
	</div>
      </div>
    </div>




	 
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
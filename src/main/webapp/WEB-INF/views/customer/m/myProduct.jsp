<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Atelier</title>
<script src="https://code.jquery.com/jquery-3.5.0.js" ></script>

<script type="text/javascript" >



//<button type="button" onclick="productList1(typeTime,typeTimeE,typeTimeN)"
	//판매중 확인하기
	function productList1(abc,def,ghiYn){
		
	if(def===undefined){
		var	testType="";
	}else{
		
		var testType = def.value;
	}

	
	if(ghiYn===undefined){
		var	typeYn="";
	}else{
		
		var typeYn =ghiYn.value;
	}

	
		
		var typeNumber = abc.value;
	
		var formData = new FormData();
		//	formData.append('username', 'Chris');
		//formData.get('username');
		

		console.log('test:',typeNumber);
		console.log('testType:',testType);
		console.log('typeYn:',typeYn);
		
		//alert(customerNo);
		
		//AJAX : 자바스크립트로 리퀘스트한다...
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function(){
		
		
			
			if(xhr.readyState ==4 && xhr.status ==200){
				var result =JSON.parse(xhr.responseText); // = 응답 결과 텍스트(JSON)
				
				//AJAX는 restapi를 호출한다뿐... 단 필연적으로 client side rendering이 필요함.
				
	

				//상품 출력
				
				
				var resultBox = document.getElementById("resultBox");
				resultBox.innerHTML =""; 
				
				
				//판매중
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
				
				var ingInputBox  = document.createElement("input");
				ingInputBox.type="hidden";
				ingInputBox.value="4";
				ingInputBox.id="typeSale";
				ingInputBox.name="acti";
				ingFormBox.appendChild(ingInputBox);
				
				var ingInputBox2  = document.createElement("input");
				ingInputBox2.type="hidden";
				ingInputBox2.value="";
				ingInputBox2.id="typeSaleE";
				ingInputBox2.name="actiE";
				ingFormBox.appendChild(ingInputBox2);
				
				var ingInputBox3  = document.createElement("input");
				ingInputBox3.type="hidden";
				ingInputBox3.value="y";
				ingInputBox3.id="typeSaleY";
				ingInputBox3.name="actiY";
				ingFormBox.appendChild(ingInputBox3);
				
		
				
				if(typeYn =="y"){
					
					var ingButtonBox  = document.createElement("button");
					ingButtonBox.type="button";
					ingButtonBox.classList.add("btnnn");
					ingButtonBox.classList.add("fs-6");
					ingButtonBox.classList.add("text-warning");
					ingButtonBox.classList.add("fw-bold");
					ingButtonBox.setAttribute("onclick","productList1(typeSale,typeSaleE,typeSaleY)");
					ingButtonBox.innerText="판매중";
					ingFormBox.appendChild(ingButtonBox);
				}else{
					var ingButtonBox  = document.createElement("button");
					ingButtonBox.type="button";
					ingButtonBox.classList.add("btnnn");
					ingButtonBox.classList.add("fs-6");
					ingButtonBox.classList.add("text-secondary");
					ingButtonBox.classList.add("fw-bold");
					ingButtonBox.setAttribute("onclick","productList1(typeSale,typeSaleE,typeSaleY)");
					ingButtonBox.innerText="판매중";
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
				
				var ingInput2Box  = document.createElement("input");
				ingInput2Box.type="hidden";
				ingInput2Box.value="4";
				ingInput2Box.id="typeTime";
				ingFormBox2.appendChild(ingInput2Box);
				
				var ingInput2Box2  = document.createElement("input");
				ingInput2Box2.type="hidden";
				ingInput2Box2.value="";
				ingInput2Box2.id="typeTimeE";
				
				ingFormBox2.appendChild(ingInput2Box2);
				
				var ingInput2Box3  = document.createElement("input");
				ingInput2Box3.type="hidden";
				ingInput2Box3.value="n";
				ingInput2Box3.id="typeTimeN";
				
				ingFormBox2.appendChild(ingInput2Box3);
				
				if(typeYn =="n"){
				var ingButtonBox2  = document.createElement("button");
				ingButtonBox2.type="button";
				ingButtonBox2.classList.add("btnnn");
				ingButtonBox2.classList.add("fs-6");
				ingButtonBox2.classList.add("text-warning");
				ingButtonBox2.classList.add("fw-bold");
				ingButtonBox2.setAttribute("onclick","productList1(typeTime,typeTimeE,typeTimeN)");
				ingButtonBox2.id ="asd";
				ingButtonBox2.innerText="일시정지";
				ingFormBox2.appendChild(ingButtonBox2);
				}else{
					var ingButtonBox2  = document.createElement("button");
					ingButtonBox2.type="button";
					ingButtonBox2.classList.add("btnnn");
					ingButtonBox2.classList.add("fs-6");
					ingButtonBox2.classList.add("text-secondary");
					ingButtonBox2.classList.add("fw-bold");
					ingButtonBox2.setAttribute("onclick","productList1(typeTime,typeTimeE,typeTimeN)");
					ingButtonBox2.id ="asd";
					ingButtonBox2.innerText="일시정지";
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
				

				var ingInput3Box  = document.createElement("input");
				ingInput3Box.type="hidden";
				ingInput3Box.value="1";
				ingInput3Box.id="typeStop";
				ingFormBox3.appendChild(ingInput3Box);
				
				var ingInput32Box2  = document.createElement("input");
				ingInput32Box2.type="hidden";
				ingInput32Box2.value="";
				ingInput32Box2.id="typeStopE";
				
				ingFormBox3.appendChild(ingInput32Box2);
				
				var ingInput3Box3  = document.createElement("input");
				ingInput3Box3.type="hidden";
				ingInput3Box3.value="";
				ingInput3Box3.id="typeStopN";
				
				ingFormBox3.appendChild(ingInput3Box3);
				
				if(typeYn ==""){
				var ingButtonBox3  = document.createElement("button");
				ingButtonBox3.type="button";
				ingButtonBox3.classList.add("btnnn");
				ingButtonBox3.classList.add("fs-6");
				ingButtonBox3.classList.add("text-warning");
				ingButtonBox3.classList.add("fw-bold");
				ingButtonBox3.setAttribute("onclick","productList1(typeStop,typeStopE,typeStopN)");
				
				ingButtonBox3.innerText="정지";
				ingFormBox3.appendChild(ingButtonBox3);
				}else{
					
					var ingButtonBox3  = document.createElement("button");
					ingButtonBox3.type="button";
					ingButtonBox3.classList.add("btnnn");
					ingButtonBox3.classList.add("fs-6");
					ingButtonBox3.classList.add("text-secondary");
					ingButtonBox3.classList.add("fw-bold");
					ingButtonBox3.setAttribute("onclick","productList1(typeStop,typeStopE,typeStopN)");
					
					ingButtonBox3.innerText="정지";
					ingFormBox3.appendChild(ingButtonBox3);
					
				}
				//검색창

				

					
					var FormdivinputBox  = document.createElement("form");
					FormdivinputBox.name = "searchW";
					resultBox.appendChild(FormdivinputBox);
			
					
					var divSearch = document.createElement("div");
					divSearch.classList.add('row');
					divSearch.classList.add('py-3');
					divSearch.classList.add('bg-warning');
					divSearch.classList.add('bg-opacity-50');
					divSearch.classList.add('text-center');
					FormdivinputBox.appendChild(divSearch);
			
					
					var divColSearch = document.createElement("div");
					divColSearch.classList.add('col-9');
					divSearch.appendChild(divColSearch);
					
					var divinputBox = document.createElement("input");
					divinputBox.classList.add("form-control");
					divinputBox.id = "dib";
					divinputBox.name = "dib";
					divinputBox.type="text";
					divinputBox.value="";
					divColSearch.appendChild(divinputBox);		
					
					var divinputBox2 = document.createElement("input");
					
					divinputBox2.id = "dib2";
					divinputBox2.name = "dib2";
					divinputBox2.type="hidden";
					divinputBox2.value=result.number;
					divColSearch.appendChild(divinputBox2);
					
					
					var divinputBox3 = document.createElement("input");
					
					divinputBox3.id = "dib3";
					divinputBox3.name = "dib3";
					divinputBox3.type="hidden";
					divinputBox3.value=result.Yn;
					
					divColSearch.appendChild(divinputBox3);
					
					var divColSearch2 = document.createElement("div");
					divColSearch2.classList.add('col-3');
					divColSearch2.setAttribute("style","justify-content; margin :auto; padding: auto; align-items : center;");
					divSearch.appendChild(divColSearch2);
						
					
					
					var textButtonBox = document.createElement("button");
					
					textButtonBox.classList.add("fw-bold");
					textButtonBox.classList.add("fs-6");
					textButtonBox.classList.add("btnnn");
					
					textButtonBox.classList.add("text-secondary");
					textButtonBox.type ="button";
					textButtonBox.setAttribute("onclick","productList1(dib2,dib,dib3)");	
					
					divColSearch2.appendChild(textButtonBox);
					var span11Box = document.createElement("span");
					span11Box.innerText="검 색"
					textButtonBox.appendChild(span11Box);
				
			
					
			
			//데이터 출력쪽
					
				for(e of result.data){
						
					 	var rowBox = document.createElement("div");
					 		rowBox.classList.add('row');
					 		rowBox.classList.add('py-3');
					 		rowBox.classList.add('border-bottom');
					 		
					 		resultBox.appendChild(rowBox);
					 	
					 	var colBox = document.createElement("div");
					 		colBox.classList.add('col-3');	
					 		colBox.classList.add('text-center');
					 		colBox.setAttribute("style","margin: auto;");
					 		rowBox.appendChild(colBox);
					 		
					 		if(e.Image == null){
					 			
					 			var imageNull =  document.createElement("img");
					 			imageNull.setAttribute("src","../../resources/img/noimage.png");
					 			
					 			imageNull.setAttribute("width","65");
					 			imageNull.setAttribute("height","65");
					 			imageNull.setAttribute("alt","...");
					 			
					 			colBox.appendChild(imageNull);
					 		}else{
					 			var imageYn =  document.createElement("img");
					 			imageYn.setAttribute("src","/uploadFiles/"+e.Image.pi_path);
					 		
					 			imageYn.setAttribute("width","65");
					 			imageYn.setAttribute("height","65");
					 			imageYn.setAttribute("alt","...");
					 			
					 			colBox.appendChild(imageYn);
					 			
					 		}
					 			
	
					 		
					 	var colBox2 = document.createElement("div");
					 		colBox2.classList.add('col-6');	
					 		colBox2.classList.add('text-secondary');
					 		colBox2.classList.add('text-center');
					 		
					 		
					 	var rowPart1 = document.createElement("div");
					 	rowPart1.classList.add("row");
					 	colBox2.appendChild(rowPart1);
					 	
					 	
					  		var nameFormBox =  document.createElement("form");
		           			nameFormBox.id ="formValue";
		           			nameFormBox.name ="formValue1";
		           			rowPart1.appendChild(nameFormBox);
		           			
		                var nameInputBox = document.createElement("input");	
		                	nameInputBox.id = "nameValue";
		                	nameInputBox.name = "nameValue1";
		                	nameInputBox.value= e.Product.product_no;
		                	nameInputBox.type="hidden";
		                	
		                	nameFormBox.appendChild(nameInputBox);
		                	
		                    var nameButtonBox =  document.createElement("button");
					 		nameButtonBox.classList.add("btn");
					 		nameButtonBox.classList.add("btn-link");
					 		nameButtonBox.classList.add("text-dark");
					 		nameButtonBox.classList.add("text-decoration-none");
					 		nameButtonBox.type = "button";
					 		nameButtonBox.setAttribute("onclick","detailProduct(nameValue1)");
					 		nameButtonBox.id = "nameButton";
					 		nameButtonBox.name = "nameButton";
					 		nameButtonBox.setAttribute("data-bs-toggle","modal"); 
					 		nameButtonBox.setAttribute("data-bs-target","#staticBackdrop2");
					 	
		 		
					 		nameFormBox.appendChild(nameButtonBox);		
					 		
							 
						 	
							 var nameBox =  document.createElement("span");
							 nameBox.classList.add("text-secondary");
							 nameBox.classList.add("fs-6");	
			                nameBox.innerText = e.Product.product_name;     		                
			                	
			                nameButtonBox.appendChild(nameBox);	
			                
			                
			            var rowPart2 = document.createElement("div");
			            rowPart2.classList.add("row");
						 colBox2.appendChild(rowPart2);    
			              //찜 글 갯수  
		              var colPart1 = document.createElement("div");
		              colPart1.classList.add("col");
		              colPart1.classList.add("ps-1");
		              colPart1.classList.add("pe-1");
		              rowPart2.appendChild(colPart1);
		              
		              var wishImage = document.createElement("i");
		              wishImage.classList.add("bi");
		              wishImage.classList.add("bi-chat-heart");
		              wishImage.classList.add("text-warning");
		              wishImage.classList.add("fs-5");
		              colPart1.appendChild(wishImage);
		              
		              var wishSpan = document.createElement("span");
		              wishSpan.innerText =" "+e.Wish;
		              colPart1.appendChild(wishSpan);
					 		
					 //리뷰글 갯수
		              var colPart2 = document.createElement("div");
		              colPart2.classList.add("col");
		              colPart2.classList.add("ps-1");
		              colPart2.classList.add("pe-1");
		              rowPart2.appendChild(colPart2);		
		              
		              
					  var askImage = document.createElement("i");
					  
					  askImage.classList.add("bi");
					  askImage.classList.add("bi-question-circle");
					  askImage.classList.add("text-warning");
					  askImage.classList.add("fs-5");
		              colPart2.appendChild(askImage);
		              
		              var askSpan = document.createElement("span");
		              askSpan.innerText = " "+e.Ask;
		              colPart2.appendChild(askSpan);
		              
		              //문의글 갯수
		              var colPart3 = document.createElement("div");
		              colPart3.classList.add("col");
		              colPart3.classList.add("ps-1");
		              colPart3.classList.add("pe-1");
		              rowPart2.appendChild(colPart3);		
		              
		              
 					  var reviewImage = document.createElement("i");
 					 
 						reviewImage	.classList.add("bi");
	 					reviewImage.classList.add("bi-pencil-square");
	 					reviewImage.classList.add("text-warning");
	 					reviewImage.classList.add("fs-5");
	 					colPart3.appendChild(reviewImage);
		              
 					  var riviewSpan = document.createElement("span");
 					  riviewSpan.innerText =" "+e.Review;
 					 colPart3.appendChild(riviewSpan);
 					
 					
	 					
					 		
					 	var colBox3 = document.createElement("div");
					 		colBox3.classList.add('col-3');	
					 		colBox3.classList.add('py-2');
					 		colBox3.setAttribute("style","justify-content; margin :auto; padding: auto; align-items : center;");
					 	
					 		
					
		                	rowBox.appendChild(colBox2);
		                	
		             if(result.number ==4) {
		                var buttonBox = document.createElement("button");
		                	//
		               	    buttonBox.classList.add("btn");
		                	
		                	buttonBox.classList.add("text-secondary");
		                	buttonBox.classList.add("dropdown-toggle");
		                	buttonBox.type = "button";
		                	
		                	
		                	buttonBox.dataset.bsToggle = "dropdown";
		                	buttonBox.innerText="상태";
		              
		                	colBox3.appendChild(buttonBox); 
		                	
				
		         		var ulBox = document.createElement("ul");	
		         		
		         			ulBox.classList.add("dropdown-menu");	         			
		         			
		         		
		         		
		         		
			         		
						var liBox = document.createElement("li");
				         	
				         	liBox.classList.add("droptown-item");
				         	liBox.classList.add("text-secondary");
				         	liBox.classList.add("fw-bold");
			         		liBox.classList.add("fs-6");
			         	
		
			         		
			         		ulBox.appendChild(liBox);
			         			
			         	var formBox =document.createElement("form");
			         		
			           		formBox.id = "productStatus";
			         		formBox.name= "productStatus"
			         			liBox.appendChild(formBox);
			         		
			         		
		         		var inputBox = document.createElement("input");
		         			inputBox.id = "product_confirm_s2";
		         			inputBox.name = "product_confirm_status_no2";
		         			inputBox.type="hidden";
		         			inputBox.value=4;
		         			
		         			formBox.appendChild(inputBox);
		         		
		         			
	
		         		var inputBoxH =	document.createElement("input");
		         			inputBoxH.id = "product_n2";
		         			inputBoxH.name = "product_no2";
		         			inputBoxH.type="hidden";
		         			inputBoxH.value =e.Product.product_no;
		         			
		         			formBox.appendChild(inputBoxH);
						var inputBoxHH =document.createElement("input");
							inputBoxHH.id = "product_c2";
		         			inputBoxHH.name = "product_confirm2";
		         			inputBoxHH.type="hidden";
		         			inputBoxHH.value ='n';
		         			
		         			formBox.appendChild(inputBoxHH);
		         		
		         		var inputBoxHHH =	document.createElement("input");
			         		inputBoxHHH.id = "product_yn2";
			         		inputBoxHHH.name = "product_Yn2";
			         		inputBoxHHH.type="hidden";
			         		inputBoxHHH.value =result.Yn;
		         			
			         		formBox.appendChild(inputBoxHHH);		
		         			
			         	var buttonBox1 = document.createElement("button");
			         		buttonBox1.id="smBtn"
			         		buttonBox1.classList.add("btnnn");
			         		buttonBox1.classList.add("text-secondary");
			         		buttonBox1.type="button";
			         		buttonBox1.innerText="일시정지";
			         		buttonBox1.setAttribute("onclick","test(product_no2,product_confirm2,product_confirm_status_no2,product_Yn2)");
			         		
			         		
		         			formBox.appendChild(buttonBox1);
		         			
	       		///////////
			         	var liBox2 = document.createElement("li");
				         	
				         	liBox2.classList.add("droptown-item");
				         	liBox2.classList.add("text-dark");
				         	liBox2.classList.add("fw-bold");
			         		liBox2.classList.add("fs-6");
			         	
		
			         		
			         		ulBox.appendChild(liBox2);
			         			
			         	var formBox2 =document.createElement("form");
			         		
			           		formBox2.id = "productStatus2";
			         		formBox2.name= "productStatus2"
			         			liBox2.appendChild(formBox2);
			         		
			         		
		         		var inputBox2 = document.createElement("input");
		         			inputBox2.id = "product_confirm_s";
		         			inputBox2.name = "product_confirm_status_no";
		         			inputBox2.type="hidden";
		         			inputBox2.value=4;
		         			
		         			formBox2.appendChild(inputBox2);
		         			
	
		         		var inputBoxH2 =	document.createElement("input");
		         			inputBoxH2.id = "product_n";
		         			inputBoxH2.name = "product_no";
		         			inputBoxH2.type="hidden";
		         			inputBoxH2.value =e.Product.product_no;
		         			
		         			formBox2.appendChild(inputBoxH2);
						var inputBoxHH2 =	document.createElement("input");
							inputBoxHH2.id = "product_c";
		         			inputBoxHH2.name = "product_confirm";
		         			inputBoxHH2.type="hidden";
		         			inputBoxHH2.value ='y';
		         			
		         			formBox2.appendChild(inputBoxHH2);
		         		
		         		var inputBoxHHH2 =	document.createElement("input");
			         		inputBoxHHH2.id = "product_yn";
			         		inputBoxHHH2.name = "product_Yn";
			         		inputBoxHHH2.type="hidden";
			         		inputBoxHHH2.value =result.Yn;
		         			
		         			formBox2.appendChild(inputBoxHHH2);	
		         			
			         	var buttonBox2 = document.createElement("button");
			         		buttonBox2.id="smBtn2"
			         		buttonBox2.classList.add("btnnn");
			         		buttonBox2.classList.add("text-secondary");
			         		buttonBox2.type="button";
			         		buttonBox2.innerText="판매중";
			         		buttonBox2.setAttribute("onclick","test(product_no,product_confirm,product_confirm_status_no,product_Yn)");
			         		
			         		
		         			formBox2.appendChild(buttonBox2);
		         			
		         			
		         			colBox3.appendChild(ulBox);     
		             }
		                	rowBox.appendChild(colBox3);
		                	
		                //일단 여기까지가 세팅
		                	 
		                	
		             
		                	

					 }
					 
			}
		};
		
		
		xhr.open("post" , "../productTable"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("type=" + typeNumber + "&productName=" + testType +"&productYn=" + typeYn);
	}
	

	
	function test(a, b,c,d){
	
		var aa = a.value;
		var bb= b.value;
		var cc=c;
		var dd= d;
		var xhr = new XMLHttpRequest();
	
		
		console.log("aa의 값 ",aa);
		console.log("bb의 값 ",bb);
		console.log("cc의 값 ",cc);
		console.log("dd의 값 ",dd);
		
	                //일단 여기까지가 세팅
	                	  
	    	xhr.onreadystatechange = function(){
			if(xhr.readyState ==4 && xhr.status ==200){
				productList1(cc,undefined,dd);        	
			}
	                };
	             
	                
	
	                
	                
		xhr.open("post" , "../updateProductStatus"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("productNo=" + aa + "&productYn=" + bb);
	}
	

	
/* 	function ajaxTest() {
		$.ajax({
			url: '../productModifyProcess',
			method: 'post',
			data: $("#modalForm").serialize(),
		}).done(function(obj) {
			if(obj.result == 'success') {}
		})
		
	}
	 */
	//모달로 상품 추가하기 
	function insertProduct(){
		//ecma5

		const form = $('modalForm')[0]; // You need to use standard javascript object here
		const formData = new FormData();
		var fileLength =  document.getElementById("files").files.length;
		console.log(fileLength);
		
		formData.append("product_category_no",document.getElementById("modalSelect").value);
		formData.append("product_name",document.getElementById("modalPN").value);
		formData.append("product_price",document.getElementById("modalPP").value);
		formData.append("product_description",document.getElementById("modalPD").value);
		formData.append("product_post_price",document.getElementById("modalPPP").value);
		
		 for (var index = 0; index < fileLength; index++) {
		      formData.append("productFile", document.getElementById('files').files[index]);
		    }
	
	

		
		const request = new XMLHttpRequest();
		
		 request.onreadystatechange = function(){
				if(request.readyState ==4 && request.status ==200){
				
					var s1 = document.getElementById("typeStop");
					var s2 = document.getElementById("typeStopE");
					var s3 = document.getElementById("typeStopN");
					productList1(s1,s2,s3);        	
				}
		                };
	 	request.open("POST", "../productModifyProcess");
		request.send(formData); 
		
	
		console.log("formData", formData)
	
		/*
		for(file of files) {
			console.log(file.value);
		}*/
		
	/* 	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
			
				productList1(test,typeStopE,typeStopN);
				
			}
		};
		
        
		xhr.open("post" , "../productModifyProcess"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("&formData=" + formData);
	
*/
	}
	
	function detailProduct(vv){
	 /* 	nameButtonBox.setAttribute("data-bs-toggle","modal"); 
 		nameButtonBox.setAttribute("data-bs-target","#staticBackdrop2");  */
		var v =vv.value;
		//var v= document.getElementById('nameValue').value;
		console.log("v",v);
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				
				var result =JSON.parse(xhr.responseText);
			
				
				var detailImage  = document.getElementById("detailImage");
				detailImage.innerHTML ="";
				
				var itemBox1 = document.createElement("div");
					itemBox1.classList.add("carousel-item");
					itemBox1.classList.add("active");
					itemBox1.classList.add("text-center");
					detailImage.appendChild(itemBox1);
					
					//수정할 부분 ...상품 디페일 페이지 부분 전면 수정하기
					var imgBox1 = document.createElement("img");
					imgBox1.setAttribute("src","/uploadFiles/"+result.dat.ProductImage[0].pi_path); 
					imgBox1.classList.add("border");
					imgBox1.width="250";
					imgBox1.height="250";
					itemBox1.appendChild(imgBox1);
						
				for(a of result.dat.ProductImage){
					var itemBox = document.createElement("div");
					itemBox.classList.add("text-center");
					
					itemBox.classList.add("carousel-item");
					
					detailImage.appendChild(itemBox);
					
					
					var imgBox = document.createElement("img");
					imgBox.classList.add("border");
					imgBox.setAttribute("src","/uploadFiles/"+a.pi_path); 
					imgBox.width="250";
					imgBox.height="250";
					itemBox.appendChild(imgBox);
				}

		   		var detailProductNo  = document.getElementById("detailProductNo");
		   		detailProductNo.innerHTML ="";
		   		
		   		detailProductNo.classList.add('row');
		   		detailProductNo.classList.add('py-2');
		   		detailProductNo.classList.add('ms-0');
		   		detailProductNo.classList.add('my-2');
		   		detailProductNo.classList.add('text-secondary');
		   		detailProductNo.classList.add('text-opacity-50');
		   		detailProductNo.innerText="no." + result.dat.Product.product_no;
		   		
		   		
		   		var detailProductName  = document.getElementById("detailProductName");
		   		detailProductName.innerHTML ="";
		   		
		   		detailProductName.classList.add('row');
		   		detailProductName.classList.add('py-2');
		   		detailProductName.classList.add('ms-0');
		   		detailProductName.classList.add('my-2');
		   		detailProductName.classList.add('text-secondary');
		   		detailProductName.innerText=result.dat.Product.product_name;
		   		
		   		var detailProductdescription  = document.getElementById("detailProductdescription");
		   		detailProductdescription.innerHTML ="";
		   		
		   		detailProductdescription.classList.add('row');
		   		detailProductdescription.classList.add('py-3');
		   		detailProductdescription.classList.add('ms-0');
		   		detailProductdescription.classList.add('my-2');
		   		detailProductdescription.classList.add('border-bottom');
		   		
		   		detailProductdescription.innerText=result.dat.Product.product_description;
					
				var modifyDivBox = document.getElementById("myProductModify");
				modifyDivBox.innerHTML ="";
				modifyDivBox.classList.add("row");
				
				
				var modifyABox = document.createElement('a');
				modifyABox.id ="mody";
				modifyABox.classList.add("text-secondary");
				modifyABox.classList.add("text-opacity-50");
				modifyABox.setAttribute("href","./productModify?productNo="+result.dat.Product.product_no); 
				modifyABox.style="text-decoration:none;";
				modifyABox.innerText="상품수정하기";
				modifyDivBox.appendChild(modifyABox);
				
				
				var myProductReviewList  =  document.getElementById("myProductReviewList");
				myProductReviewList.innerHTML ="";
				myProductReviewList.classList.add("row");
				
				
				var myProductReviewListA = document.createElement('a');
				myProductReviewListA.id ="mody2";
				myProductReviewListA.classList.add("text-secondary");
				myProductReviewListA.classList.add("text-opacity-50");
				myProductReviewListA.setAttribute("href","./myProductReviewList?productNo="+result.dat.Product.product_no); 
				myProductReviewListA.style="text-decoration:none;";
				myProductReviewListA.innerText="상품리뷰보기";
				myProductReviewList.appendChild(myProductReviewListA);
				
				
				var myProductAskList = document.getElementById("myProductAskList");
				myProductAskList.innerHTML ="";
				var myProductAskListA = document.createElement('a');
				myProductAskListA.classList.add("text-secondary");
				myProductAskListA.classList.add("text-opacity-50");
				myProductAskListA.id ="mody3";
				myProductAskListA.style="text-decoration:none;";
				myProductAskListA.setAttribute("href","././myProductAskList?productNo="+result.dat.Product.product_no); 

				myProductAskListA.innerText="상품문의보기";
				myProductAskList.appendChild(myProductAskListA);
				
				
				
			}
		};
		
        
		xhr.open("post" , "../test"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("productNo=" + v );
		
	
		
	}

	
	window.addEventListener("DOMContentLoaded" , function (){
		//사실상 처음 실행하는 코드 모음...
		
		var w1 = document.getElementById("typeSale");
		var w2 = document.getElementById("typeSaleE");
		var w3 = document.getElementById("typeSaleY");
		 productList1(w1,w2,w3);
		
		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
		
	});
</script>

</head>
<body>	
	
	<jsp:include page="../common/navbarTop.jsp"></jsp:include>
	<div class="container-fluid">
	
		
		
		<div class="row" style="height:70px;"></div>
		
			
				<div id ="resultBox">
				
					<div class="row py-3 ">
				<div class="col-4 " style="  text-align: center; border-right: solid; border-right-color:pink;">
				<form name = "act">
				<input type="hidden" value="4" id ="typeSale" name="acti">
				<input type="hidden" value="" id ="typeSaleE" name="actiE">
				<input type="hidden" value="y" id ="typeSaleY" name="actiY">
				<button type="button" onclick="productList1(typeSale,typeSaleE,typeSaleY)" class="btnnn text-secondary fw-bold fs-6">판매중</button>
				
				</form>
				</div>
				
				<div class="col-4" style="  text-align: center; border-right: solid;  border-right-color:pink;">
				<form name = "act">
				<input type="hidden" value="4" id ="typeTime">
				<input type="hidden" value="" id ="typeTimeE">
				<input type="hidden" value="n" id ="typeTimeN">
				<button id = "asd"type="button" onclick="productList1(typeTime,typeTimeE,typeTimeN)" class="btnnn  text-secondary fw-bold fs-6">일시정지 </button>
				
				</form>
				</div>
				
				<div class="col-4" style="  text-align: center; ">
				<form name = "act">
				<input type="hidden" value="1" id ="typeStop">
				<input type="hidden" value="" id ="typeStopE">
				<input type="hidden" value="" id ="typeStopN">
				<button type="button" onclick="productList1(typeStop,typeStopE,typeStopN)" class="btnnn  text-secondary fw-bold fs-6">정지 </button>
				
				</form>
				</div>
				
			</div>
				
				

				</div>

	<div class="row" style="height:60px;"></div>
</div>

	<footer class="fixed-bottom py-2 mb-1">
		<div class="container-fluid">
			<div class="row sticky-bottom">
				<div class= "col"></div>
				<div class= "col"></div>
				<div class= "col-4 px-3 text-center">
					<button type="button" class="btnnn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
 		 <img src ="../../resources/img/productInput.png" width="65" height="65" alt="..."><br>등 록
		</button>
				</div>
			</div>
			<jsp:include page="../common/navbarBottom.jsp"></jsp:include>
		</div>
</footer>
	

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">${storeInfo.getStore_name() }</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">

	
	<div class="container-fluid">
		
	
		<form id = "modalForm" name = "modalForm" >	
			<div class="row py-3">	
				<div class="mb-3">
		    	<input type="text" class="form-control" name = "product_name" id="modalPN" aria-describedby="emailHelp" placeholder="상품 이름을 입력해주세요">
				</div>
			</div>
			<div class="row py-2 border border-1"> 
				<div class="row py-3">
					<div class="mb-1">
			    	<input type="text" class="form-control" name = "product_price" id="modalPP" aria-describedby="emailHelp" placeholder="가격">
					</div>
				</div>
				<div class="row py-3">
					<div class="mb-1">		
					 <textarea class="form-control"name = "product_description" placeholder="상세정보를 입력해주세요!" id="modalPD" rows="10"></textarea>
					</div>
				</div>
				<div class="row py-3">
					<div class="mb-1">
			    	<input type="text" class="form-control" name = "product_post_price" id="modalPPP" aria-describedby="emailHelp" placeholder="배송비입력">
					</div>
				</div>	
				<div class="row mb-4">
					
						
						
						<select id ="modalSelect" name ="product_category_no" class="form-select btn-outline-warning" size="3"  aria-label="size 3 select example" style="color:pink;">
						
						  <option selected>상품유형을 등록해주세요!</option>
						  <option value="1">디저트</option>
						  <option value="2">음료</option>
						  <option value="3">의류</option>
						  <option value="4">악세사리</option>
						  <option value="5">꽃</option>
						  <option value="6">캔들</option>
						  <option value="7">가구</option>
						  <option value="8">인형</option> 
						  <option value="9">문구</option>
						</select>
				</div>
				<div class="row py-1"><input type="file" id="files"name="files" multiple accept="image/*" ></div>
				<div class="row mb-3"><input type="button" onclick="insertProduct()" class="btn btn-outline-warning" value="등록요청" data-bs-dismiss="modal" aria-label="Close"></div>
			</div>	
		</form>
	</div>
    
      </div>
    </div>
  </div>
</div>
 	
	<!--  -->

<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
    
           <h5 class="modal-title" id="staticBackdropLabel">${storeInfo.getStore_name() }</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">

		<div class="container-fluid">
	<div class="row">		
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
  </div>
  <div class="carousel-inner" id ="detailImage"></div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
							
	</div>		
				
				<div id ="detailProductNo"></div>
				<div  id ="detailProductName"></div>			
				<div  id ="detailProductdescription"></div>
				<div class="row">
				<div class="col text-center"><div id ="myProductModify"></div></div>
				<div class="col text-center"><div id = "myProductReviewList"></div>	</div>			
				<div class="col text-center"><div id = "myProductAskList"></div></div>
				</div>
				
				</div>
			</div>	
	</div>
      </div>
    </div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
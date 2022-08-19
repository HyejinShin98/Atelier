<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
<title>모임 평가하기</title>
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
	 <link rel="stylesheet" href="../../resources/css/common.css">
<style>
		
		.star{
			color:#f90;
		}
		
        .star-rating {
        display:flex;
        flex-direction: row-reverse;
        font-size:1.5em;
        justify-content:space-around;
        padding:0 .2em;
        text-align:center;
        width:5em;
        }

        .star-rating input {
        display:none;
        }

        .star-rating label {
        color:#ccc;
        cursor:pointer;
        }

        .star-rating :checked ~ label {
        color:#f90;
        }

        .star-rating label:hover,
        .star-rating label:hover ~ label {
        color:#fc0;
        }

</style>


<script type="text/javascript">

	var rentAtelierNo = ${rAD.rentAtelier.rent_atelier_no}
	//var eCNo = ${customer.customer_no}
	
	function myGroupEvaluate(){	
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var myList = document.getElementById("groupList");
				myList.innerHTML = "";
				
				for(myGroupList of jsonObj.myList){
					
					console.log(myGroupList);
					
					var outterRow = document.createElement("div");
					outterRow.classList.add("row");
					outterRow.classList.add("mt-3")
					myList.appendChild(outterRow);
					
					var submitForm = document.createElement("form");
					submitForm.id = "formBox";
					outterRow.appendChild(submitForm);
									
					var nameCol = document.createElement("div");
					nameCol.classList.add("col");
					submitForm.appendChild(nameCol);
					
					var cardBox = document.createElement("div");
					cardBox.classList.add("card");
					cardBox.classList.add("d-grid");
					nameCol.appendChild(cardBox);
					
					var cardBody = document.createElement("div");
					cardBody.classList.add("card-body");
					cardBox.appendChild(cardBody);
					
					var titleBox = document.createElement("h5");
					titleBox.classList.add("card-title");
					titleBox.innerText = myGroupList.customer.customer_name + " " + "님";
					cardBody.appendChild(titleBox);
					 
					var personIcon = document.createElement("i");
					personIcon.classList.add("bi");
					personIcon.classList.add("bi-person-circle");
					personIcon.classList.add("px-3");
					titleBox.appendChild(personIcon);
					
					var contentBox = document.createElement("p");
					contentBox.classList.add("card-text");
					contentBox.classList.add("sub-grey");
						if(myGroupList.rGG == null){
							contentBox.innerText="이 참여자님에 대한 평가를 작성해주세요." 
						}else{
							contentBox.innerText="이미 평가를 작성한 회원님입니다."
						};					
					cardBody.appendChild(contentBox);
					
					var innerRow1 = document.createElement("div");
					innerRow1.classList.add("row");
					cardBody.appendChild(innerRow1);
					
					var innerCol = document.createElement("div");
					innerCol.classList.add("col");
					innerCol.classList.add("d-grid");
					innerRow1.appendChild(innerCol);
					
					//분기 시작-평가를 한 경우
					
					if(myGroupList.rGG== null){
					
						var collapButton = document.createElement("button");
						collapButton.classList.add("btn");
						collapButton.classList.add("btn-primary");
						collapButton.type = "button";
		                collapButton.setAttribute("data-bs-toggle","collapse");
						collapButton.setAttribute("data-bs-target","#collapseExample"+myGroupList.customer.customer_no);
						collapButton.setAttribute("aria-expanded","false");				
						collapButton.setAttribute("aria-controls","collapseExample");
						//여기에 기능 추가
						collapButton.innerText = "평가하기";
						innerCol.appendChild(collapButton);
						
						var colLap1 = document.createElement("div");
						colLap1.classList.add("collapse");
						colLap1.classList.add("mt-3");
						colLap1.id = "collapseExample"+myGroupList.customer.customer_no;					
						innerCol.appendChild(colLap1);
												
						var colLap2 = document.createElement("div");
						colLap2.classList.add("card");
						colLap2.classList.add("card-body");
						colLap2.classList.add("sub-grey");
						colLap2.innerText = "정당한 평가가 아닌 욕설이나 비방, 불쾌한 표현 등은 제재될 수 있습니다.";
						colLap1.appendChild(colLap2);							
					
						var innerRow2 = document.createElement("div");					
						innerRow2.classList.add("row");
						innerCol.appendChild(innerRow2);
						
						var colLap3 = document.createElement("div");
						colLap3.classList.add("collapse");
						colLap3.classList.add("mt-1");
						colLap3.id = "collapseExample"+myGroupList.customer.customer_no;
						innerRow2.appendChild(colLap3);
						
						var colLap4 = document.createElement("div");
						colLap4.classList.add("col");
						colLap4.classList.add("text-center");
						colLap3.appendChild(colLap4);
						
						var starRating = document.createElement("div");
						starRating.classList.add("star-rating");
						starRating.id = "starRating";
						starRating.name = "starRating";
						colLap4.appendChild(starRating);
						
						var star5 = document.createElement("input");
						star5.type = "radio";
						star5.id = "5-stars"+myGroupList.customer.customer_no;
						star5.name = "rating"
						star5.value = 5;
						starRating.appendChild(star5);
						
						var fiveStars = document.createElement("label");
						fiveStars.setAttribute("for","5-stars"+myGroupList.customer.customer_no);
						fiveStars.classList.add("star");
						fiveStars.innerText="★";
						starRating.appendChild(fiveStars);
						
						var star4 = document.createElement("input");
						star4.type = "radio";
						star4.id = "4-stars"+myGroupList.customer.customer_no;
						star4.name = "rating"
						star4.value = 4;
						starRating.appendChild(star4);
						
						var fourStars = document.createElement("label");
						fourStars.setAttribute("for","4-stars"+myGroupList.customer.customer_no);
						fourStars.classList.add("star");
						fourStars.innerText="★";
						starRating.appendChild(fourStars);
						
						var star3 = document.createElement("input");
						star3.type = "radio";
						star3.id = "3-stars"+myGroupList.customer.customer_no;
						star3.name = "rating"
						star3.value = 3;
						starRating.appendChild(star3);
						
						var threeStars = document.createElement("label");
						threeStars.setAttribute("for","3-stars"+myGroupList.customer.customer_no);
						threeStars.classList.add("star");
						threeStars.innerText="★";
						starRating.appendChild(threeStars);
						
						var star2 = document.createElement("input");
						star2.type = "radio";
						star2.id = "2-stars"+myGroupList.customer.customer_no;
						star2.name = "rating"
						star2.value = 2;
						starRating.appendChild(star2);
						
						var twoStars = document.createElement("label");
						twoStars.setAttribute("for","2-stars"+myGroupList.customer.customer_no);
						twoStars.classList.add("star");
						twoStars.innerText="★";
						starRating.appendChild(twoStars);
						
						var star1 = document.createElement("input");
						star1.type = "radio";
						star1.id = "1-star"+myGroupList.customer.customer_no;
						star1.name = "rating"
						star1.value = 1;
						starRating.appendChild(star1);
						
						var oneStars = document.createElement("label");
						oneStars.setAttribute("for","1-star");
						oneStars.classList.add("1-star"+myGroupList.customer.customer_no);
						oneStars.innerText="★";
						starRating.appendChild(oneStars);					
						
						var innerRow3 = document.createElement("div");					
						innerRow3.classList.add("row");
						innerCol.appendChild(innerRow3);
						
						var colLap5 = document.createElement("div");
						colLap5.classList.add("collapse");
						colLap5.classList.add("mt-1");
						colLap5.id = "collapseExample"+myGroupList.customer.customer_no;
						innerRow3.appendChild(colLap5);
										
						var colLap6 = document.createElement("div");
						colLap6.classList.add("col");
						colLap6.classList.add("d-grid");
						colLap5.appendChild(colLap6);				
						
						var colLapTextArea = document.createElement("textarea");
						colLapTextArea.classList.add("form-control");
						colLapTextArea.classList.add("insertValue")
						colLapTextArea.setAttribute("placeholder","한줄 평가를 남겨주세요.");
						colLapTextArea.setAttribute("style","height: 5rem");
						colLapTextArea.id = "textarea";
						colLapTextArea.name = "textarea";
						colLap6.appendChild(colLapTextArea);
									
						var innerRow4 = document.createElement("div");
						innerRow4.classList.add("row");
						innerCol.appendChild(innerRow4);
						
						var colLap7 = document.createElement("div");
						colLap7.classList.add("collapse");
						colLap7.classList.add("mt-1");
						colLap7.id = "collapseExample"+myGroupList.customer.customer_no;
						innerRow4.appendChild(colLap7);
						
						var colLap8 = document.createElement("div");
						colLap8.classList.add("col");
						colLap8.classList.add("d-grid");
						colLap7.appendChild(colLap8);				
						
						var hiddenBox = document.createElement("input");
						hiddenBox.type = "hidden";
						hiddenBox.name = "hb";
						hiddenBox.id = "hb";
						hiddenBox.value = myGroupList.customer.customer_no;
						colLap8.appendChild(hiddenBox);
						
						var submitButton = document.createElement("button");
						submitButton.type = "button";
						submitButton.classList.add("btn")
						submitButton.classList.add("btn-success")
						submitButton.innerText = "평가 제출하기";
						submitButton.setAttribute("onclick","groupReviewProcess(hb,textarea,rating)")
						colLap8.appendChild(submitButton);
					}else{
						var submittedStar = document.createElement("div");
						submittedStar.classList.add("star-rating");
						innerCol.appendChild(submittedStar);
						
						var starValue = document.createElement("span")
						starValue.classList.add("star");
						if(myGroupList.rGG.manner_grade == 5){
							starValue.innerText= "★★★★★"
						}else if(myGroupList.rGG.manner_grade == 4){
							starValue.innerText= "★★★★"
						}else if(myGroupList.rGG.manner_grade == 3){
							starValue.innerText= "★★★"
						}else if(myGroupList.rGG.manner_grade == 2){
							starValue.innerText= "★★"
						}else if(myGroupList.rGG.manner_grade == 1){
							starValue.innerText= "★"
						}
						submittedStar.appendChild(starValue);
						
						var submittedComment = document.createElement("div");
						submittedComment.classList.add("card");
						submittedComment.classList.add("mt-3");
						submittedComment.classList.add("card-body");
						submittedComment.classList.add("sub-grey");
						submittedComment.innerText = myGroupList.rGG.manner_comment;
						innerCol.appendChild(submittedComment);	
					}										
						
				}
				
			}
		}
		
		xhr.open("get" , "./myGroupEvaluate?rentAtelierNo=" + rentAtelierNo);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}

	
	function groupReviewProcess(hb,textarea,rating){
		
		
		var formData = new FormData();
		
		formData.append("customer_no",hb.value);
		formData.append("manner_comment",textarea.value);
		formData.append("manner_grade",rating.value);
		formData.append("evaluated_customer_no",${customer.customer_no});
		formData.append("rent_atelier_no",${rAD.rentAtelier.rent_atelier_no});
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				myGroupEvaluate()
				
			}
		}	
		
		xhr.open("post" , "groupReviewProcess");
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send(formData);
		
	}
	 
	
	
	
	window.addEventListener("DOMContentLoaded" , function (){
		
		myGroupEvaluate()
		
		//setInterval(refreshCommentList , 3000);
		
	});

	
	
</script>	
</head>        
<body>
    <div class="container-fluid px-3">
        <div class="row">
            <div class="col d-grid mt-3">
                <span class="text-center">참여하신 분들에 대한 평가를 내려주세요.</span>
            </div>
        </div>
        <div class="row">
            <div class="col d-grid">
                <div class="row">
                    <hr class="my-3">
                    <h1 class="display-1"></h1>
                  </div>
            </div>    
        </div>
            <div class="row">
            	<div class="col" id="groupList">
            	</div>
            </div>
        
       
        
        
        
        
   </div>     
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
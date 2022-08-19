<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">	
<script type="text/javascript">

function detailReview(vv,bb){
	 /* 	nameButtonBox.setAttribute("data-bs-toggle","modal"); 
		nameButtonBox.setAttribute("data-bs-target","#staticBackdrop2");  */
		var productNo =vv.value;
		var consumerNo =bb.value;
		//var v= document.getElementById('nameValue').value;
	
		console.log("productNo",productNo);
		console.log("consumerNo",consumerNo);
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				
				var result =JSON.parse(xhr.responseText);
			
				
				var modalResult  = document.getElementById("modalResult");
				modalResult.innerHTML ="";
	
					var SuperBox = document.createElement("div");
					SuperBox.classList.add("row");
					SuperBox.classList.add("py-2");
					SuperBox.classList.add("border-bottom");
					
					modalResult.appendChild(SuperBox);
					
					var nameBox =  document.createElement("div");
					nameBox.classList.add("row");
					nameBox.classList.add("py-2");
					SuperBox.appendChild(nameBox);
					
					var nameCol = document.createElement("div");
					nameCol.classList.add("col-6");
					nameCol.classList.add("py-2");
					nameBox.appendChild(nameCol);		
					
					var row1  = document.createElement("div");
					row1.classList.add("row");
					row1.classList.add("py-2");
					nameCol.appendChild(row1);
					
					
					var nameSpan = document.createElement("span");
					nameSpan.classList.add("fw-bold");
					nameSpan.classList.add("fs-4");
					nameSpan.innerText = result.review.Consumer.consumer_name;
					row1.appendChild(nameSpan);
					
					
					var row2  = document.createElement("div");
					row2.classList.add("row");
					row2.classList.add("py-2");
					nameCol.appendChild(row2);
					
					
					var dateSpan = document.createElement("span");
					dateSpan.classList.add("text-secondary");
					dateSpan.innerText = result.review.date;
					row2.appendChild(dateSpan);
					
					var nameCol2 = document.createElement("div");
					nameCol2.classList.add("col");
					nameCol2.classList.add("py-2");
					nameBox.appendChild(nameCol2);
					
					var nameCol3 = document.createElement("div");
					nameCol3.classList.add("col-5");
					nameCol3.classList.add("py-2");
					nameCol3.classList.add("my-4");
					nameCol3.classList.add("text-center");
					nameBox.appendChild(nameCol3);
					
					
					var spanStarBox = document.createElement("span");
					spanStarBox.classList.add("text-opacity-50");
					spanStarBox.classList.add("text-warning");
					nameCol3.appendChild(spanStarBox);
					if(result.review.Review.review_star==5){
						
						
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						
					}else if(result.review.Review.review_star==4){
						
						
						
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						
					}else if(result.review.Review.review_star==3){
						
						
						
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						
					}else if(result.review.Review.review_star==2){
						
						
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
					
						
					}else if(result.review.Review.review_star==1){
						
					
						
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star-fill");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
					
					}else{
					
						
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
						var imgBox1 = document.createElement("i");
						imgBox1.classList.add("bi");
						imgBox1.classList.add("bi-star");
						spanStarBox.appendChild(imgBox1);
					}
					
					
					
					var comment =  document.createElement("div");
				   	
					comment.classList.add('row');
					comment.classList.add('py-2');
					comment.classList.add("text-center");
					comment.classList.add("ms-0");
					comment.innerText=result.review.Review.review_content;
					
			   		SuperBox.appendChild(comment);
			   		
					//수정할 부분 ...상품 디페일 페이지 부분 전면 수정하기
					
					var itemBox1 = document.createElement("div");
					itemBox1.classList.add("row");
					itemBox1.classList.add("text-center");
					itemBox1.classList.add("ms-0");
					SuperBox.appendChild(itemBox1);
					
					
					var imgBox1 = document.createElement("img");
					imgBox1.classList.add("border");
					imgBox1.setAttribute("src","/uploadFiles/"+result.review.Review.review_img_path); 
					imgBox1.width="300";
					imgBox1.height="200";
					itemBox1.appendChild(imgBox1);
				
					
				
				
			}
		};
		
	    
		xhr.open("post" , "../detailReview"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("productNo=" + productNo +"&consumerNo="+consumerNo );
		
	
		
	}
		
		
</script>
<style type="text/css">

.span {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 100px;
  height: 20px;
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
	
	
	<div class="container-fluid">
		<div class="fixed-top">
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
		
		<div class="row" style="height:60px;"></div>
	
			<div class="row bg-warning bg-opacity-50">
				
			<div class="col"><img src="../../resources/img/together.png" class="rounded-circle" alt="..." 
					width="75" height="75" ></div><div class="col-6 text-center"  style="justify-content; margin :auto;  align-items : center;"><a  class="nav-link active" aria-current="page"href="../rent/rentAtelierList">함께 공유하는 공방! <span class=" fw-bold fs-5">Atelier Community</span></a></div><div class="col-2">
					</div>
				
			</div>
				
			

		<c:forEach items= "${review}" var ="re">
				<div class="row py-3 border-bottom">
					<div class="col-2 my-2" id="colResultBox"><c:choose>
				
				
				<c:when test="${re.Image== null}">
				
				<button type="button" class="btn btn-warning rounded-circle" data-bs-toggle="modal" data-bs-target="#reviewModal"
				style="--bs-btn-padding-y: .75px; --bs-btn-padding-x: .75px; --bs-btn-font-size: .75rem;"> 
				<img src="../../resources/img/noimage.png" class="rounded-circle" style="outline : solid 1px pink;" alt="..." 
					width="35" height="35"> </button></c:when><c:otherwise>
				<img src="/uploadFiles/${re.Image.pi_path}" class="rounded-circle" style="outline : solid 1px pink;" alt="..." 
					width="35" height="35"> 
				
					</c:otherwise>
					</c:choose></div>
					<div class="col-6">
					<div class="row">	
					<form>
					<input type ="hidden" value="${re.Product.product_no}" id="proNo" name="proNo">
					<input type ="hidden" value="${re.Consumer.consumer_no}" id="conName" name="conName">
					
					<button type="button" class="btnnn text-start" onclick="detailReview(proNo,conName)" data-bs-toggle="modal" data-bs-target="#staticBackdrop2"><span class="fs-4">${re.Product.product_name}</span></button>
					</form>
					</div>
					<div class="row">	<span class="text-secondary text-opacity-50"> ${re.Consumer.consumer_name}</span><br></div>
					</div>
					<div class="col">
					<div class="row span"><span id="span">리뷰 : ${re.Review.review_content}</span><br></div>
					<div class="row"><span>별점 : ${re.Review.review_star}</span><br></div></div>
			
		
		
			
				</div>
			
			</c:forEach>
		
	
	</div>
	
	<jsp:include page="../common/navbarBottom.jsp"></jsp:include>


<!-- image Modal -->
<div class="modal fade" id="reviewModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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

<!-- detail -->

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
				
				<div id ="modalResult"></div>
			
				</div>
			</div>	
	</div>
      </div>
    </div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>




</body>
</html>
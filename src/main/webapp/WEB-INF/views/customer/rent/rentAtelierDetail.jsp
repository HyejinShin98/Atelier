<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>제안 자세히 보기</title>
     
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
     <link rel="stylesheet" href="../../resources/css/common.css">

<style>
	
	.btnnn {
	  border: none;
	  background-color: inherit;
	 
	  display: inline-block;
	}

</style>


<script type="text/javascript">

//신청 승인
	
	var rentAtelierNo = ${rentAtelierData.rentAtelier.rent_atelier_no} 
	
	function AjconfirmGroupProcess(hb1,hb2){							
		
		var aa = hb1.value;
		var bb = hb2.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				RgaList()
				AjConfirmedList()
				AjRentCount()
				
			}
		}
		
		xhr.open("post" , "./AjconfirmGroupProcess");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("rent_group_app_no=" + aa + "&customer_no=" + bb);
				
	}
	
//댓글 쓰기
	function WriteRgaProcess(a,b){
			
		var customerNo = a;
		var atelierNo = b;
		var appValue = document.getElementById("appComment").value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);	
				
				document.getElementById("appComment").value = "";	
				
				AjAppCount()
				RgaList()
				
			}
		}
		
		xhr.open("post" , "./WriteRgaProcess");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("customer_no=" + customerNo + "&rent_atelier_no=" + atelierNo + "&rent_group_app_comment=" + appValue);		
			
	}


//댓글 리스트
	function RgaList(){
			
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	
				
				var appComm = document.getElementById("appCommCB");
				appComm.innerHTML = "";
				
				for(appCommList of jsonObj.appComm){
					
					var appCommRowBox = document.createElement("div");
					appCommRowBox.classList.add("row");
					appCommRowBox.classList.add("CommRow");
					appComm.appendChild(appCommRowBox);
					
					var outterCol1 = document.createElement("div");
					outterCol1.classList.add("col");
					appCommRowBox.appendChild(outterCol1);
					
					var innerRow1 = document.createElement("div");
					innerRow1.classList.add("row");
					outterCol1.appendChild(innerRow1);
					
					var innerCol1 = document.createElement("div");
					innerCol1.classList.add("col");
					innerCol1.classList.add("mb-3");
					innerRow1.appendChild(innerCol1);
									
							
					var modalForm = document.createElement("form");
					modalForm.id = "mF";
					innerCol1.appendChild(modalForm);
					
					var modalHiddenName= document.createElement("input")
					modalHiddenName.type = "hidden"
					modalHiddenName.name = "modalNb";
					modalHiddenName.id = "modalNb";
					modalHiddenName.value = appCommList.customer.customer_name;
					modalForm.appendChild(modalHiddenName);					
					
					var nameBox = document.createElement("span");
					nameBox.classList.add("input-group-text");
					nameBox.classList.add("mb-1");
					/* nameBox.innerText = appCommList.customer.customer_name;					
					nameBox.type= "button";
					nameBox.setAttribute("data-bs-toggle","modal");
					nameBox.setAttribute("data-bs-target","#staticBackdrop"); */
					modalForm.appendChild(nameBox);
					
					//모달
					
					var modalHiddenBox = document.createElement("input")
					modalHiddenBox.type = "hidden";
					modalHiddenBox.name = "modalHb";
					modalHiddenBox.id = "modalHb";
					modalHiddenBox.value = appCommList.customer.customer_no;
					nameBox.appendChild(modalHiddenBox);
					
					var modalSwitch = document.createElement("button");
					modalSwitch.classList.add("btnnn");			
					modalSwitch.type= "button";
					modalSwitch.setAttribute("data-bs-toggle","modal");
					modalSwitch.setAttribute("data-bs-target","#staticBackdrop");
					modalSwitch.setAttribute("onclick","customerMannerGrade(modalHb)");
					modalSwitch.innerText = appCommList.customer.customer_name;
					nameBox.appendChild(modalSwitch);
													
					
					var contentBox = document.createElement("div");
					contentBox.classList.add("form-control");
					contentBox.innerText = appCommList.rentAtelierGroupApplication.rent_group_app_comment;					
					innerCol1.appendChild(contentBox);											
					
					var formBox = document.createElement("form");
					formBox.id = "formB";
					nameBox.appendChild(formBox);
					
					var confirmBox = document.createElement("badge");							
					//분기 1. 글 작성자(대여 모집자)일 경우					
					if(${customer.customer_no} == appCommList.rentAtelier.customer_no){
						//분기 2. 해당 모집글의 신청 인원이 모집 인원을 넘지 않으며, 자신의 댓글이 아니어야 함
						if(${rentCount} < appCommList.rentAtelier.rent_atelier_max_no && appCommList.rentAtelierGroupApplication.customer_no != ${customer.customer_no }){
							//분기 3. 신청자의 신청 상태를 확인함
							if(appCommList.rentAtelierGroupApplication.rent_group_app_complete_yn == 'n'){

								//3.신청 확인되지 않음
								
								confirmBox.classList.add("badge");
								confirmBox.classList.add("text-bg-success");
								confirmBox.classList.add("mx-3");	
								confirmBox.type = "button";
								confirmBox.setAttribute("onclick","AjconfirmGroupProcess(hb1,hb2)");														
								confirmBox.innerText = "신청 수락";		        				
																									
									var hiddenBox1 = document.createElement("input");
									hiddenBox1.type = "hidden";
									hiddenBox1.name = "hb1";
									hiddenBox1.id = "hb1";
									hiddenBox1.value = appCommList.rentAtelierGroupApplication.rent_atelier_no;									
									formBox.appendChild(hiddenBox1);
																										
									var hiddenBox2 = document.createElement("input");
									hiddenBox2.type = "hidden";
									hiddenBox2.name = "hb2";
									hiddenBox2.id = "hb2";
									hiddenBox2.value = appCommList.customer.customer_no;
									formBox.appendChild(hiddenBox2);																		
									
							}else if(appCommList.rentAtelierGroupApplication.rent_group_app_complete_yn == 'y') {
								//3.이미 참여중인 경우								
								confirmBox.classList.add("badge");
								confirmBox.classList.add("text-bg-info");
								confirmBox.classList.add("mx-3");
								confirmBox.innerText = "참여중";
							}
						//2. 신청 인원을 넘겨 마감이 된 경우
						}else if(${rentCount} >= appCommList.rentAtelier.rent_atelier_max_no && appCommList.rentAtelierGroupApplication.customer_no != ${customer.customer_no }){
							confirmBox.classList.add("badge");
							confirmBox.classList.add("text-bg-danger");
							confirmBox.classList.add("mx-3");
							confirmBox.innerText = "마감됨";							
						
						//2. 작성자 자신의 댓글일 경우	
						}else if(appCommList.rentAtelierGroupApplication.customer_no == ${customer.customer_no }){
							confirmBox.classList.add("badge");
							confirmBox.classList.add("text-bg-warning");
							confirmBox.classList.add("mx-3");
							confirmBox.innerText = "내 댓글";	
						}
					//1. 그냥 모집 신청자가 자신의 댓글을 보는 경우(내 댓글 표시)	
					}else if(appCommList.rentAtelierGroupApplication.customer_no == ${customer.customer_no }){
						confirmBox.classList.add("badge");
						confirmBox.classList.add("text-bg-warning");
						confirmBox.classList.add("mx-3");						
						confirmBox.innerText = "내 댓글";	
						
					}					
					
					formBox.appendChild(confirmBox);																
					
				}
				
			}
		}
		
		xhr.open("get" , "./RgaList?rentAtelierNo=" + rentAtelierNo);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		
	}
	
//참여자 수 카운트 	
	function AjRentCount(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);	
				
				var count = document.getElementById("confirmdCount");
				count.innerHTML = "";
				count.innerText = jsonObj.CfCount;
				
				var state = document.getElementById("stateBadge");
				state.HTML = "";
				state.classList.add("badge");
				state.classList.add("mx-3")
				if(jsonObj.CfCount < ${rentAtelierData.rentAtelier.rent_atelier_max_no}){					
					state.classList.add("text-bg-warning");
					state.innerText = "모집중";
				}else{
					state.classList.add("text-bg-danger");
					state.innerText = "모집 완료";				
				}
				
			}
		
		}
		
		xhr.open("post" , "./AjRentCount");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("rentAtelierNo="+ rentAtelierNo);		
				
	}

//참여자 보여주기

	function AjConfirmedList(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);													
				
				var cfList = document.getElementById("cfCustomers"); 
				cfList.innerHTML = "";				
				cfList.classList.add("nav");
				cfList.classList.add("justify-content-center");				
				
				for(confirmList of jsonObj.cfList){
					
					var listLi = document.createElement("li");
					listLi.classList.add("nav-item");
					cfList.appendChild(listLi);
					
					var listA = document.createElement("a");
					listA.classList.add("nav-link")
					listA.classList.add("disabled")
					listA.innerText = confirmList.customer.customer_name + " " + "님" + " ";
					listLi.appendChild(listA);
					
					var listBadge = document.createElement("span");
					listBadge.classList.add("badge");
					listBadge.classList.add("text-bg-primary");
					listBadge.innerText = "참여중";
					listA.appendChild(listBadge);
				}
					
			}
		}
		
		xhr.open("get" , "./AjConfirmedList?rentAtelierNo=" + rentAtelierNo);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();		
		
		
	}	
	
//댓글 수 카운트
	function AjAppCount(){
		
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);	
					
					var appCount = document.getElementById("appCountSpan");
					appCount.innerHTML = "";
					appCount.innerText = jsonObj.appCount;			
				}
			}
			
			xhr.open("post" , "./AjAppCount");
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send("rentAtelierNo="+ rentAtelierNo);		
					
		}
	
//평점 체크(후기 점수)
	
	 function customerMannerGrade(modalHb){
		
		customerNo = modalHb.value; 	
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var jsonObj = JSON.parse(xhr.responseText);	
				
				console.log(modalNb.value);
				
				var mannerCount = document.getElementById("mannerModal");
				mannerCount.innerHTML = "";
				
				var modalHeader = document.createElement("div");
				modalHeader.classList.add("modal-header");
				mannerCount.appendChild(modalHeader);
				
				var modalTitle = document.createElement("h5");
				modalTitle.classList.add("modal-title");
				modalTitle.id = "staticBackdropLabel";
				modalTitle.innerText = "이 회원님의 매너 점수";
				modalHeader.appendChild(modalTitle);
				
				var closeButton = document.createElement("button");
				closeButton.type = "button";
				closeButton.classList.add("btn-close")
				closeButton.setAttribute("data-bs-dismiss","modal");
				closeButton.setAttribute("aria-label","Close");
				modalHeader.appendChild(closeButton);
				
				var mannerPoint = document.createElement("div");
				mannerPoint.classList.add("modal-body");
				if (jsonObj.viewManner==null){
					mannerPoint.innerText = "아직 매너 평가가 없는 회원님입니다.";
				}
				else{
					mannerPoint.innerText = jsonObj.viewManner + +" " +"점입니다.";
				}
				mannerCount.appendChild(mannerPoint);				
				
				var mannerBadge = document.createElement("span");
				mannerBadge.classList.add("badge");
				//표시 분기
				if(jsonObj.viewManner == 5){					
						mannerBadge.classList.add("text-bg-warning");
						mannerBadge.classList.add("bi");
						mannerBadge.classList.add("bi-emoji-laughing-fill");
						mannerBadge.classList.add("mx-1");
						mannerBadge.innerText = " "+"매너 최고"
					}else if(jsonObj.viewManner <5 && jsonObj.viewManner >= 4){
						mannerBadge.classList.add("text-bg-primary");
						mannerBadge.classList.add("bi");
						mannerBadge.classList.add("bi-emoji-smile");
						mannerBadge.classList.add("mx-1");
						mannerBadge.innerText = " "+"매너 좋음";						
					}else if(jsonObj.viewManner <4 && jsonObj.viewManner >= 3){
						mannerBadge.classList.add("text-bg-primary");
						mannerBadge.classList.add("bi");
						mannerBadge.classList.add("bi-emoji-neutral");
						mannerBadge.classList.add("mx-1");
						mannerBadge.innerText = " "+"매너 보통";
					}else if(jsonObj.viewManner <3 && jsonObj.viewManner >= 2){
						mannerBadge.classList.add("text-bg-secondary");
						mannerBadge.classList.add("bi");
						mannerBadge.classList.add("bi-emoji-expressionless");
						mannerBadge.classList.add("mx-1");
						mannerBadge.innerText = " "+"매너 낮음";
					}else{
						mannerBadge.classList.add("text-bg-danger");
						mannerBadge.classList.add("bi");
						mannerBadge.classList.add("bi-emoji-angry");
						mannerBadge.classList.add("mx-1");
						mannerBadge.innerText = " "+"주의";
					}
						mannerPoint.appendChild(mannerBadge);
				
				var modalFooter = document.createElement("div");
				modalFooter.classList.add("modal-footer");
				mannerCount.appendChild(modalFooter);
				
				var footerButton = document.createElement("button");
				footerButton.type = "button";
				footerButton.classList.add("btn");
				footerButton.classList.add("btn-secondary")
				footerButton.setAttribute("data-bs-dismiss","modal");
				footerButton.innerText = "닫기";
				modalFooter.appendChild(footerButton);
	
			}
		}
				
		xhr.open("get" , "./viewManner?customerNo=" + customerNo);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();			
				
	} 



	window.addEventListener("DOMContentLoaded" , function (){
		
		RgaList();
		AjRentCount();
		AjConfirmedList();
		AjAppCount()
		
		//setInterval(refreshCommentList , 3000);
		
	});

	
	
	
	
</script>

</head>
<body>
  <div class="container-fluid px-3">
     <div class="row">
         <div class="col">
             <div class="row">
                 <div class="col-3"></div>
                 <div class="col-6 fs-4 fw-bold text-center">자세히 보기</div>
                 <div class="col-3"></div>
             </div>
             <hr class="my-2">
             <h1 class="display-1"></h1>
         </div>  
     </div>
     <div class="row">
         <div class="input-group mb-3">
             <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
             <div class="form-control">${rentAtelierData.rentAtelier.rent_atelier_title}</div>
         </div>
     </div>
     <div class="row">
         <div class="col">    
             <div class="input-group mb-3">
                 <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
                 <div class="form-control">${rentAtelierData.customer.customer_name}</div>
             </div>
         </div>  
     </div>
     <div class="row">
         <div class="input-group mb-3">
             <span class="input-group-text" id="inputGroup-sizing-default">공방 위치</span>
             <div class="form-control">${rentAtelierData.rentAtelier.rent_atelier_location}</div>
          </div>
     </div>
     <div class="row">
         <div class="col">
             <div class="input-group mb-3"> 
                 <span class="input-group-text" id="inputGroup-sizing-default">대여료</span>
                 <div class="form-control">${rentAtelierData.rentAtelier.rent_atelier_price} 원</div>
             </div>
         </div>
         <div class="col">    
             <div class="input-group mb-3">
                 <span class="input-group-text" id="inputGroup-sizing-default">모집인원</span>
                 <div class="form-control">${rentCount }/${rentAtelierData.rentAtelier.rent_atelier_max_no} 명
                 </div>
             </div>
         </div>    
     </div>
     <div class="row">
         <div class="input-group mb-3">
             <span class="input-group-text" id="inputGroup-sizing-default">모집일시</span>
             <div class="form-control"><fmt:formatDate value="${rentAtelierData.rentAtelier.rent_atelier_plan}" pattern="yy년MM월dd일"/></div>
         </div>
     </div>
     <div class="row">
         <div class="col">
             <div>
                 <label for="exampleFormControlTextarea1" class="form-label" >모집글 자세히 보기</label>
                 <div class="form-control" style="min-height: 10rem;">${rentAtelierData.rentAtelier.rent_atelier_content}</div>
               </div>
         </div>
     </div>
     <div class="row">
         <div class="col">
             <div class="mt-3">
                 <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                     <div class="carousel-indicators">
                       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                     </div>
                     <div class="carousel-inner">
                       <div class="carousel-item active">
                         <img src="../../resources/img/sample1.jpg" class="d-block w-100" alt="...">
                       </div>
                       <div class="carousel-item">
                         <img src="../../resources/img/sample2.jpg" class="d-block w-100" alt="...">
                       </div>  
                       <div class="carousel-item">
                         <img src="../../resources/img/sample3.jpg" class="d-block w-100" alt="...">
                       </div>
                     </div>
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
         </div>
     </div>
     <div class="row">
        <c:if test="${!empty customer && customer.customer_no == rentAtelierData.rentAtelier.customer_no }">   
         <div class="col d-grid mt-3">
           <button type="button" class="btn btn-primary">수정</button>
		 </div>
        </c:if>  
        <c:if test="${!empty customer && customer.customer_no == rentAtelierData.rentAtelier.customer_no }"> 
          <div class="col d-grid mt-3">             
       	   <a href="./rentAtelierProcess?rentAtelierNo=${rentAtelierData.rentAtelier.rent_atelier_no}" class="btn btn-primary">삭제</a>
          </div>
        </c:if>
         <div class="col d-grid mt-3">
            <a href="./rentAtelierList" class="btn btn-primary">목록</a>
         </div> 
     </div>
     <!-- 참여 인원 테이블 -->
    <div class="row mt-3">
        <div class="col">
            <div class="input-group mb-1"> 
                <div id="" class="form-control">현재 참여 인원: 
                <span id="confirmdCount"></span>
                /${rentAtelierData.rentAtelier.rent_atelier_max_no }
                <span id="stateBadge"></span>
                </div>
                
            </div>
        </div>    
    </div>
    <div class="row mt-1">  
        <h1 class="display-1"></h1>
        <div class="col d-grid">
            <span class="input-group-text" id="inputGroup-sizing-default">참여하신 분</span>
        </div>       
        <div class="col"> 
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link disabled">${rentAtelierData.customer.customer_name} 님 <span class="badge text-bg-primary">작성자</span>
                    </a>
                </li>
            </ul>
            <!-- 렌더링 시작해야 하는 부분 -->
            <ul id="cfCustomers" class="nav justify-content-center">                                        	           
  	           <li class="nav-item">                
               </li>
            </ul>          
        </div>
    </div>
        <h1 class="display-1"></h1>     
     
   <div class="row mt-3">
       <div class="col"><i class="bi bi-chat-square-dots mx-1"></i> 현재 <span id="appCountSpan"></span>개의 문의가 있습니다.</div>
     <div class="row">
      <hr class="my-3">
       <h1 class="display-1"></h1>
     </div>
   </div>
  
  <div class="row mx-0 bg-warning bg-opacity-50">
     <div class="col"><img src="../../resources/img/together.png" class="rounded-circle" alt="..." 
     width="75" height="75" ></div><div class="col-6 text-center"  style="justify-content; margin :auto;  align-items : center;">함께 공유하는 공방!<br> <span class=" fw-bold fs-5">Atelier Community</span></div><div class="col-2"></div>
  </div>
  
  
  <!-- 댓글 창 -->
  
	<div class="row mt-3">
      <div id="appCommCB" class="col">
        <div class="row">
          <div class="col mb-3">
            <span class="input-group-text mb-1" id="inputGroup-sizing-default"></span>
			<div class="form-control"></div>	    	
		  </div>
		</div>
	 </div>	    
	</div>
		
		         
  <!-- 댓글 작성 창 -->     
    <div class="row">
      <div class="col">
        <div class="input-group mb-3">
          <input id="customerNo" type="hidden" name="customer_no" value ="${customer.customer_no}">
          <input id="atelierNo" type="hidden" name="rent_atelier_no" value ="${rentAtelierData.rentAtelier.rent_atelier_no}">
          <input id="appComment" style="width:87%" type="text" name="rent_group_app_comment" placeholder="작성내용">
          <button class="btn btn-outline-secondary" id="button-addon2" onclick="WriteRgaProcess(${customer.customer_no } , ${rentAtelierData.rentAtelier.rent_atelier_no})">작성</button>
        </div>
      </div>
  </div>
  
</div> 

<!-- modal body -->

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" id="mannerModal">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">customerName</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        매너 점수: ㅋㅋ
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
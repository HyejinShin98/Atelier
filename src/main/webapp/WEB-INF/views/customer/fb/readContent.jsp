<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<title>상세 페이지</title>
</head>
<body>
<div class="container-fluid px-3">
	<c:choose>
	<c:when test="${customer != null}">
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
             <div class="form-control">${data.FreeBoardVo.freeboard_title }</div>
         </div>
     </div>  
     <div class="row">
         <div class="col">    
             <div class="input-group mb-3">
                 <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
                 <div class="form-control">${data.Customer.customer_name}</div>
             </div>
         </div>  
     </div>
     <div class="row">
         <div class="col-5">
             <div class="input-group mb-3"> 
                 <span class="input-group-text" id="inputGroup-sizing-default">조회수</span>
                 <div class="form-control">${data.FreeBoardVo.freeboard_readcount}</div>
             </div>
         </div>
         <div class="col-7">    
             <div class="input-group mb-3">
            	 <span class="input-group-text" id="inputGroup-sizing-default">작성일</span>
            	 <div class="form-control"><fmt:formatDate value="${data.FreeBoardVo.freeboard_writedate}" pattern="yy년MM월dd일"/></div>
        	 </div>
         </div>    
     </div>
     
	 <div class="row">
       
	     <label for="exampleFormControlTextarea1" class="form-label" >내용</label>
	     <div class="form-control" style="min-height: 10rem;">${data.FreeBoardVo.freeboard_content}
	     <br>
	     <br>
	     	<c:forEach items="${data.freeboardImageVo}" var="freeboardImageVo">
         		<img class="pd-img" src="/uploadFiles/${freeboardImageVo.freeboardimage_link }">
         	</c:forEach>
	     
	     </div>           	          		     
     </div>
     <div class="row">
     	<c:if test="${!empty customer && customer.customer_no == data.Customer.customer_no }">   
        <div class="col d-grid mt-3">
           <a href="./updateContent?freeboard_no=${data.FreeBoardVo.freeboard_no }" class="btn btn-primary">수정</a>
		 </div>
        </c:if>  
        <c:if test="${!empty customer && customer.customer_no == data.Customer.customer_no }"> 
          <div class="col d-grid mt-3">             
       	   <a href="./deleteContentProcess?freeboard_no=${data.FreeBoardVo.freeboard_no }" class="btn btn-primary">삭제</a>	
          </div>
        </c:if>
         <div class="col d-grid mt-3">
            <a href="./mainContent" class="btn btn-primary">목록</a>
         </div> 
     </div>
     
     <h1 class="display-1"></h1>     
     <div class="row mx-0 mt-3 bg-warning bg-opacity-50 mb-3">
      		<div class="col"><img src="../../resources/img/together.png" class="rounded-circle" alt="..." 
            width="75" height="75" ></div><div class="col-6 text-center"  style="justify-content; margin :auto;  align-items : center;">함께 공유하는 공방!<br> <span class=" fw-bold fs-5">Atelier Community</span></div><div class="col-2"></div>
   	</div>
		    
		    
		    
	
	<div class="row">
		<form action="./writeComment?freeboard_no=${data.FreeBoardVo.freeboard_no }" method="post">
			<div class="col mt-3">
				<textarea name="comment_content" class="form-control"></textarea>	
			</div>
			<div class="row my-2 mt-2">
				<div class="col">
					<button type="submit" class="form-control" style="color:white; background-color: #FFCA28;">댓글쓰기</button>
				</div>
			</div>
		</form>	
	</div>	
	<div class="row">
				<div class="col">								
				<c:forEach items="${datas}" var="datas">
				<c:if test="${data.FreeBoardVo.freeboard_no == datas.CommentVo.freeboard_no }">		
						<table class="table my-0" style="border: 1px solid #dddddd; border-collapse: collapse; border-spacing: 0;">
							<tr>
								<td>${datas.Customer.customer_name}</td> <td style="text-align: right;"><fmt:formatDate value="${datas.CommentVo.comment_writedate}" pattern="yy.MM.dd"/></td>
							</tr>
							<tr >
								<td>${datas.CommentVo.comment_content}</td>		
							</tr>										
						</table>							
								<c:if test="${!empty customer && customer.customer_no == datas.Customer.customer_no }">						
								<button type="button" class="btn btn-secondary mb-3" style="padding:0; float: right;" onclick="location.href='./deleteComment?comment_no=${datas.CommentVo.comment_no }'">삭제</button>
								</c:if>
								<c:if test="${!empty customer && customer.customer_no == datas.Customer.customer_no }">
								<button type="button" class="btn btn-secondary mb-3" style="padding:0; float: right;" onclick="location.href='./updateComment?comment_no=${datas.CommentVo.comment_no }'">수정</button>
								</c:if>
								<button type="button" class="btn btn-secondary mb-3" style="padding:0; float: right;">답글</button>						
				</c:if>				
				</c:forEach>
				</div>
			</div>
     
	</c:when>
	<c:otherwise>
		비회원입니다.
		<a href="../lg/login">로그인하기</a>
	</c:otherwise>
	</c:choose>
</div>	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
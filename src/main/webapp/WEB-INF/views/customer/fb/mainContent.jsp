<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>판매자 커뮤니티</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">
</head>
<body>	
<div class="container-fluid " > 
		<c:choose>
		<c:when test="${customer != null}">
			<div class="fixed-top">
					<jsp:include page="../common/navbarTop.jsp"></jsp:include>
		</div>
		<div class="row" style="height:60px;"></div>
			<div class="row bg-warning bg-opacity-50">
				
			<div class="col"><img src="../../resources/img/together.png" class="rounded-circle" alt="..." 
					width="75" height="75" ></div><div class="col-6 text-center"  style="justify-content; margin :auto;  align-items : center;"><a  class="nav-link active" aria-current="page"href="../rent/rentAtelierList">함께 공유하는 공방! <span class=" fw-bold fs-5">Atelier Community</span></a></div><div class="col-2">
					</div>
				
			</div>
		
		<div class="row mt-2">
			<div class="col">
				<div class="input-group">
					<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">선택</button>
					<ul class="dropdown-menu">
					  <li><a class="dropdown-item" href="#">제목</a></li>
					  <li><a class="dropdown-item" href="#">닉네임</a></li>
					</ul>
					<input type="text" class="form-control" aria-label="Text input with dropdown button">
				  	<button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
				  </div>				  
			</div>
		</div>
		<div class="row">
                <div class="col">
                    <table class="table">				
                        <tbody>
                        <c:forEach items="${dataList }" var="data">
                          <tr>
                            <th scope="row" style="width: 10%">${data.FreeBoardVo.freeboard_no }</th>
                            <td style="width: 60%"><a class="text-secondary" style="text-decoration : none;" href="./readContent?freeboard_no=${data.FreeBoardVo.freeboard_no }">${data.FreeBoardVo.freeboard_title }</a>
                            	<div class="form-control-sm mx-0">
									<span style="color: #6C6C6C">
	                            		${data.Customer.customer_name }
	                            	</span>	                            
                            	</div>
                            </td style="width: 40%">	
                            <td><fmt:formatDate value="${data.FreeBoardVo.freeboard_writedate }" pattern="yyyy.MM.dd"/>
                            	<div class="form-control-sm mx-0">
                            		<span style="color: #6C6C6C">
	                            		조회수:${data.FreeBoardVo.freeboard_readcount}
	                           	 </span>
	                           	</div>
                            </td>                		
                          </tr>
                        </c:forEach> 
                        </tbody>
                      </table>
                      </div>
                    </div>
		
		
			
		<div class="row">
			<div class="col d-grid">
				<a class="btn btn-warning"  href="./writeContent" style="color:white;">글쓰기</a>
			</div>	
		</div>
		
		<div class="row my-2" >		<!-- 페이징 -->
			<div class="col"></div>
			<div class="col">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item" >
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item" ><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item"><a class="page-link" href="#">4</a></li>
				    <li class="page-item"><a class="page-link" href="#">5</a></li>
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
			</c:when>
			<c:otherwise>
			비회원입니다.
			<a href="../lg/login">로그인하기</a>
		</c:otherwise>
	</c:choose>
	
	
	
	
   		
   		<div class="row" style="height:65px;"></div>
</div>

<footer class="fixed-bottom">
		<div class="container-fluid">
			
			<div class="row"><jsp:include page="../common/navbarBottom.jsp"></jsp:include></div>
		</div>
		</footer>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
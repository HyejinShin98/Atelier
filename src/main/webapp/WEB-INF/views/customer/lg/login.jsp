<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../../resources/css/common.css">
<style type="text/css">
.button-color{
background-color: pink;
}


</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>사업자 로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid ">
	<div class="row my-5"></div>
		
		<div class="row mx-3">
			<div class="col">
			
				<div class="row mb-3">
					<div class="col-1"></div>
					<div class="col border-bottom border-top border-secondary border-opacity-25 text-center py-2">
					
						<div class="row">
							<div class="col">
								<span class="text-warning opacity-50 fw-bold">W</span><span class="text-secondary">e</span>&nbsp;
								<span class="text-warning opacity-50 fw-bold">H</span><span class="text-secondary">and</span>&nbsp;
								<span class="text-warning opacity-50 fw-bold">M</span><span class="text-secondary">ade</span>
							</div>
						</div>
						
					</div>	
					<div class="col-1"></div>				
				</div>
				
				
				<div class="row pt-3">
					<div class="col px-0">
						
						<div class="row" style="width: 230px; margin: 0 auto;">
							<div class="col"><img class="img-fluid" src="../../resources/img/logoA.png"></div>
						</div>
		<div class="row" style="height:35px;"></div>
		<div>
			<form action="../lg/loginProcess" method="post"><br>
			<div class="row" style="padding: 10px;"><input class="form-control py-1" type="text" name="customer_id" placeholder="아이디"> </div>
				
			<div class="row "style="padding: 10px;"><input class="form-control py-1" type="password" name="customer_pw" placeholder="비밀번호"></div>
			<div class="row" style="height:10px;"></div>
			<div class="row" style="padding: 20px;"><button type="submit" class="btn btn-warning text-light" >로그인</button></div>
			</form>	
			
		</div>
	</div>
	
	<div class="row">
			<div class="col-6"><a class="text-decoration-none text-warning opacity-50" href="../lg/findId">아이디/비밀번호 찾기</a></div>
			<div class="col"></div>
			<div class="col"><a class="text-decoration-none text-warning opacity-50" href="../lg/register">회원가입</a></div>
		</div>
			</div>
			</div>
			</div>
			</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
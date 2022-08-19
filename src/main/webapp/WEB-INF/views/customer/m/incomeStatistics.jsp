<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/common.css">	
<script type="text/javascript">



	function income(a){
		
		//ecma5
		var storeNo = a;
	
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				//client side rendering => hell...
				//AJAX는 restapi를 호출한다뿐 ... 단 필연적으로 client side rendering이 필요함..
				var resultBox = document.getElementById("resultBox");
				resultBox.innerHTML = "";
				
				var rowBox = document.createElement("div");
				rowBox.classList.add("row");
				rowBox.classList.add("py-3");
				resultBox.appendChild(rowBox);
				
				var colBox1 = document.createElement("div");
				colBox1.classList.add("col-5");
				colBox1.classList.add("py-2");
				rowBox.appendChild(colBox1);
				
				var col1RowBox1 = document.createElement("div");
				col1RowBox1.classList.add("row");
				col1RowBox1.classList.add("py-2");
				col1RowBox1.classList.add("center-bottom");
				colBox1.appendChild(col1RowBox1);
				
				
				var col1SpanBox = document.createElement("span");
				col1SpanBox.classList.add("fs-2");
				col1SpanBox.classList.add("fw-bold");
				col1SpanBox.classList.add("text-secondary");
				col1SpanBox.innerText =  "매출요약";
				col1RowBox1.appendChild(col1SpanBox);	
				
				var brBox = document.createElement("br");
				col1RowBox1.appendChild(brBox);
				
				var col1SpanBox2 = document.createElement("span");
				col1SpanBox2.classList.add("fs-6");
				col1SpanBox2.classList.add("fw-bold");
				col1SpanBox2.classList.add("text-secondary");
				col1SpanBox2.classList.add("text-opacity-75");
				col1SpanBox2.innerText =  result.income.todayYear + "년" +  result.income.todayMonth +"월 기준";
				col1RowBox1.appendChild(col1SpanBox2);	
				
				
				var colBox2 = document.createElement("div");
				colBox2.classList.add("col-2");
				colBox2.classList.add("py-2");
				rowBox.appendChild(colBox2);
				
				var colBox3 = document.createElement("div");
				colBox3.classList.add("col");
				colBox3.classList.add("py-3");
				colBox3.classList.add("ms-4");
				colBox3.classList.add("text-center");
				rowBox.appendChild(colBox3);
				
				
				var f = document.createElement("form");
				colBox3.appendChild(f);	
				var a = document.createElement("input");
				a.type="hidden";
				a.value=result.income.productHap;
				a.name="a";
				f.appendChild(a);	
				var b = document.createElement("input");
				b.type="hidden";
				b.value=result.income.lastProductHap;
				b.name="b";
				f.appendChild(b);
				var c = document.createElement("input");
				c.type="hidden";
				c.value=result.income.postHap;
				c.name="c";
				f.appendChild(c);
				var d = document.createElement("input");
				d.type="hidden";
				d.value=result.income.lastProductHap;
				d.name="d";
				f.appendChild(d);
				
				var e = document.createElement("input");
				e.type="hidden";
				e.value=result.income.sub;
				e.name="e";
				f.appendChild(e);
				
				var g= document.createElement("input");
				g.type="hidden";
				g.value=result.income.postSub;
				g.name="g";
				f.appendChild(g);
				
				  var nameButtonBox =  document.createElement("button");
					 		nameButtonBox.classList.add("btnnn");
					 		nameButtonBox.classList.add("text-secondary");
					 		nameButtonBox.classList.add("text-center");
					 		nameButtonBox.classList.add("fs-2");
					 		nameButtonBox.type = "button";
					 		
					 		nameButtonBox.setAttribute("onclick","modalInfo(a,b,c,d,e,g)");
					 		nameButtonBox.id = "nameButton";
					 		nameButtonBox.name = "nameButton";
					 		nameButtonBox.innerText="상세보기"
					 		nameButtonBox.setAttribute("data-bs-toggle","modal"); 
					 		nameButtonBox.setAttribute("data-bs-target","#customerModal");
					 		f.appendChild(nameButtonBox);		
					 		
				
				var rowBox2 = document.createElement("div");
				rowBox2.classList.add("row");
				rowBox2.classList.add("py-2");
				resultBox.appendChild(rowBox2);
				
				
				//
				var rowColBox = document.createElement("div");
				rowColBox.classList.add("col-4");
				rowColBox.classList.add("py-2");
				rowBox2.appendChild(rowColBox);
				
				var rowColRowBox1 = document.createElement("div");
				rowColRowBox1.classList.add("row");
				rowColRowBox1.classList.add("py-2");
				rowColRowBox1.classList.add("center-bottom");
				rowColBox.appendChild(rowColRowBox1);
				
				
				var SpanBox = document.createElement("span");
				SpanBox.classList.add("fs-4");
				SpanBox.classList.add("fw-bold");
				SpanBox.classList.add("text-secondary");
				SpanBox.innerText =  "작품 금액";
				rowColRowBox1.appendChild(SpanBox);	
				
				var brBox2 = document.createElement("br");
				rowColRowBox1.appendChild(brBox2);
				
				if(result.income.productHap > result.income.lastProductHap){
					var SpanBox2 = document.createElement("span");
					SpanBox2.classList.add("fs-6");
					SpanBox2.classList.add("fw-bold");
					SpanBox2.classList.add("text-danger");
					SpanBox2.classList.add("text-opacity-75");
					SpanBox2.innerText = result.income.sub;
					rowColRowBox1.appendChild(SpanBox2);	
					
					var iBox =  document.createElement("i");
					iBox.classList.add("bi");
					iBox.classList.add("bi-caret-up-fill");
					SpanBox2.appendChild(iBox);
				}else{
					var SpanBox2 = document.createElement("span");
					SpanBox2.classList.add("fs-6");
					SpanBox2.classList.add("fw-bold");
					SpanBox2.classList.add("text-primary");
					SpanBox2.classList.add("text-opacity-75");
					SpanBox2.innerText =  result.income.sub; 
					rowColRowBox1.appendChild(SpanBox2);
					
					var iBox2 = document.createElement("i");
					iBox2.classList.add("bi");
					iBox2.classList.add("bi-caret-down-fill");
					SpanBox2.appendChild(iBox2);
					
					
				}
				
			
				
				
				var colBox2 = document.createElement("div");
				colBox2.classList.add("col-2");
				colBox2.classList.add("py-2");
				
				rowBox2.appendChild(colBox2);
				
				var colBox3 = document.createElement("div");
				colBox3.classList.add("col");
				colBox3.classList.add("text-end");
				colBox3.classList.add("py-2");
				colBox3.style="margin:auto;"		
				rowBox2.appendChild(colBox3);
				
				
				var SpanBox2 = document.createElement("span");
				SpanBox2.classList.add("fs-2");
				SpanBox2.classList.add("fw-bold");
				SpanBox2.classList.add("text-secondary");
				SpanBox2.classList.add("text-opacity-75");
				SpanBox2.innerText =  result.income.productHap + " 원";
				colBox3.appendChild(SpanBox2);
				
				var lineBox = document.createElement("hr");
				lineBox.classList.add("text-secondary");
				lineBox.style.outline="1px solid";
               	lineBox.style.borderTop="1px solid";
               	resultBox.appendChild(lineBox);
				
				
				//
				var rowBox2 = document.createElement("div");
				rowBox2.classList.add("row");
				rowBox2.classList.add("py-2");
				resultBox.appendChild(rowBox2);
				
				
				//
				var rowColBox = document.createElement("div");
				rowColBox.classList.add("col-4");
				rowColBox.classList.add("py-2");
				rowBox2.appendChild(rowColBox);
				
				var rowColRowBox1 = document.createElement("div");
				rowColRowBox1.classList.add("row");
				rowColRowBox1.classList.add("py-2");
				rowColRowBox1.classList.add("center-bottom");
				rowColBox.appendChild(rowColRowBox1);
				
				
				var SpanBox = document.createElement("span");
				SpanBox.classList.add("fs-4");
				SpanBox.classList.add("fw-bold");
				SpanBox.classList.add("text-secondary");
				SpanBox.innerText =  "배송비";
				rowColRowBox1.appendChild(SpanBox);	
				
				var brBox2 = document.createElement("br");
				rowColRowBox1.appendChild(brBox2);
				
				if(result.income.postHap > result.income.lastPostHap){
					var SpanBox2 = document.createElement("span");
					SpanBox2.classList.add("fs-6");
					SpanBox2.classList.add("fw-bold");
					SpanBox2.classList.add("text-danger");
					SpanBox2.classList.add("text-opacity-75");
					SpanBox2.innerText = result.income.postSub;
					rowColRowBox1.appendChild(SpanBox2);	
					
					var iBox =  document.createElement("i");
					iBox.classList.add("bi");
					iBox.classList.add("bi-caret-up-fill");
					SpanBox2.appendChild(iBox);
				}else{
					var SpanBox2 = document.createElement("span");
					SpanBox2.classList.add("fs-6");
					SpanBox2.classList.add("fw-bold");
					SpanBox2.classList.add("text-primary");
					SpanBox2.classList.add("text-opacity-75");
					SpanBox2.innerText =  result.income.postSub; 
					rowColRowBox1.appendChild(SpanBox2);
					
					var iBox2 = document.createElement("i");
					iBox2.classList.add("bi");
					iBox2.classList.add("bi-caret-down-fill");
					SpanBox2.appendChild(iBox2);
					
					
				}
				
			
				
				
				var colBox2 = document.createElement("div");
				colBox2.classList.add("col-2");
				colBox2.classList.add("py-2");
				
				rowBox2.appendChild(colBox2);
				
				var colBox3 = document.createElement("div");
				colBox3.classList.add("col");
				colBox3.classList.add("text-end");
				colBox3.classList.add("py-2");
				colBox3.style="margin:auto;"		
				rowBox2.appendChild(colBox3);
				
				
				var SpanBox2 = document.createElement("span");
				SpanBox2.classList.add("fs-2");
				SpanBox2.classList.add("fw-bold");
				SpanBox2.classList.add("text-secondary");
				SpanBox2.classList.add("text-opacity-75");
				SpanBox2.innerText =  result.income.postHap + " 원";
				colBox3.appendChild(SpanBox2);
				
				var lineBox = document.createElement("hr");
				lineBox.classList.add("text-secondary");
				lineBox.style.outline="1px solid";
               	lineBox.style.borderTop="1px solid";
               	resultBox.appendChild(lineBox);
				
               	
               	
               	
               	//
               	var rowBox2 = document.createElement("div");
				rowBox2.classList.add("row");
				rowBox2.classList.add("py-2");
				resultBox.appendChild(rowBox2);
				
				
				//
				var rowColBox = document.createElement("div");
				rowColBox.classList.add("col-4");
				rowColBox.classList.add("py-2");
				rowBox2.appendChild(rowColBox);
				
				var rowColRowBox1 = document.createElement("div");
				rowColRowBox1.classList.add("row");
				rowColRowBox1.classList.add("py-2");
				rowColRowBox1.classList.add("center-bottom");
				rowColBox.appendChild(rowColRowBox1);
				
				
				var SpanBox = document.createElement("span");
				SpanBox.classList.add("fs-4");
				SpanBox.classList.add("fw-bold");
				SpanBox.classList.add("text-secondary");
				SpanBox.innerText =  "후원금";
				rowColRowBox1.appendChild(SpanBox);	
				
				var brBox2 = document.createElement("br");
				rowColRowBox1.appendChild(brBox2);
				
			
					var SpanBox2 = document.createElement("span");
					SpanBox2.classList.add("fs-6");
					SpanBox2.classList.add("fw-bold");
					SpanBox2.classList.add("text-danger");
					SpanBox2.classList.add("text-opacity-75");
					SpanBox2.innerText = 5500;
					rowColRowBox1.appendChild(SpanBox2);	
					
					var iBox =  document.createElement("i");
					iBox.classList.add("bi");
					iBox.classList.add("bi-caret-up-fill");
					SpanBox2.appendChild(iBox);
			
				
			
				
				
				var colBox2 = document.createElement("div");
				colBox2.classList.add("col-2");
				colBox2.classList.add("py-2");
				
				rowBox2.appendChild(colBox2);
				
				var colBox3 = document.createElement("div");
				colBox3.classList.add("col");
				colBox3.classList.add("text-end");
				colBox3.classList.add("py-2");
				colBox3.style="margin:auto;"		
				rowBox2.appendChild(colBox3);
				
				
				var SpanBox2 = document.createElement("span");
				SpanBox2.classList.add("fs-2");
				SpanBox2.classList.add("fw-bold");
				SpanBox2.classList.add("text-secondary");
				SpanBox2.classList.add("text-opacity-75");
				SpanBox2.innerText =  25000 + " 원";
				colBox3.appendChild(SpanBox2);
				
				var lineBox = document.createElement("hr");
				lineBox.classList.add("text-secondary");
				lineBox.style.outline="1px solid";
               	lineBox.style.borderTop="1px solid";
               	resultBox.appendChild(lineBox);
               	
               	
               	var rowBox = document.createElement("div");
				rowBox.classList.add("row");
				rowBox.classList.add("py-2");
				resultBox.appendChild(rowBox);
				
				var colBox1 = document.createElement("div");
				colBox1.classList.add("col-5");
				colBox1.classList.add("py-2");
				rowBox.appendChild(colBox1);
				
				var col1RowBox1 = document.createElement("div");
				col1RowBox1.classList.add("row");
				col1RowBox1.classList.add("py-2");
				col1RowBox1.classList.add("center-bottom");
				colBox1.appendChild(col1RowBox1);
				
				
				var col1SpanBox = document.createElement("span");
				col1SpanBox.classList.add("fs-2");
				col1SpanBox.classList.add("fw-bold");
				col1SpanBox.classList.add("text-secondary");
				col1SpanBox.innerText =  "매출비교";
				col1RowBox1.appendChild(col1SpanBox);	
				
			
				
				
				var colBox2 = document.createElement("div");
				colBox2.classList.add("col-2");
				colBox2.classList.add("py-2");
				rowBox.appendChild(colBox2);
				
				var colBox3 = document.createElement("div");
				colBox3.classList.add("col");
				colBox3.classList.add("py-2");
				rowBox.appendChild(colBox3);
				
				var rowBox2 = document.createElement("div");
				rowBox2.classList.add("row");
				rowBox2.classList.add("py-2");
				resultBox.appendChild(rowBox2);
				
				
				var rowColBox = document.createElement("div");
				rowColBox.classList.add("col-4");
				rowColBox.classList.add("py-2");
				rowBox2.appendChild(rowColBox);
				
				var rowColRowBox1 = document.createElement("div");
				rowColRowBox1.classList.add("row");
				rowColRowBox1.classList.add("py-2");
				rowColRowBox1.classList.add("center-bottom");
				rowColBox.appendChild(rowColRowBox1);
				
				
				var SpanBox = document.createElement("span");
				SpanBox.classList.add("fs-4");
				SpanBox.classList.add("fw-bold");
				SpanBox.classList.add("text-secondary");
				SpanBox.innerText =  "최다 판매";
				rowColRowBox1.appendChild(SpanBox);	
				
				var brBox2 = document.createElement("br");
				rowColRowBox1.appendChild(brBox2);
				
				if(result.income.productHap > result.income.lastProductHap){
					var SpanBox2 = document.createElement("span");
					SpanBox2.classList.add("fs-6");
					SpanBox2.classList.add("fw-bold");
					SpanBox2.classList.add("text-danger");
					SpanBox2.classList.add("text-opacity-75");
					SpanBox2.innerText = "35000";
					rowColRowBox1.appendChild(SpanBox2);	
					
					var iBox =  document.createElement("i");
					iBox.classList.add("bi");
					iBox.classList.add("bi-caret-up-fill");
					SpanBox2.appendChild(iBox);
				}else{
					var SpanBox2 = document.createElement("span");
					SpanBox2.classList.add("fs-6");
					SpanBox2.classList.add("fw-bold");
					SpanBox2.classList.add("text-primary");
					SpanBox2.classList.add("text-opacity-75");
					SpanBox2.innerText = "35000";
					rowColRowBox1.appendChild(SpanBox2);
					
					var iBox2 = document.createElement("i");
					iBox2.classList.add("bi");
					iBox2.classList.add("bi-caret-down-fill");
					SpanBox2.appendChild(iBox2);
					
					
				}
				
			
				
				
				var colBox2 = document.createElement("div");
				colBox2.classList.add("col-4");
				colBox2.classList.add("py-2");
				colBox2.classList.add("my-3");
				
				rowBox2.appendChild(colBox2);
				
				
				var SpanBox2 = document.createElement("span");
				SpanBox2.classList.add("fs-2");
				SpanBox2.classList.add("fw-bold");
				
				SpanBox2.classList.add("text-secondary");
				
				SpanBox2.innerText =  "오드머퓸";
				colBox2.appendChild(SpanBox2);
				
				
				var colBox3 = document.createElement("div");
				colBox3.classList.add("col-4");
				colBox3.classList.add("text-end");
				colBox3.classList.add("py-2");
				colBox3.style="margin:auto;"		
				rowBox2.appendChild(colBox3);
				
				
				var SpanBox2 = document.createElement("span");
				SpanBox2.classList.add("fs-2");
				SpanBox2.classList.add("fw-bold");
				SpanBox2.classList.add("text-secondary");
				SpanBox2.classList.add("text-opacity-75");
				SpanBox2.innerText =  "125000 원";
				colBox3.appendChild(SpanBox2);
				
				var lineBox = document.createElement("hr");
				lineBox.classList.add("text-secondary");
				lineBox.style.outline="1px solid";
               	lineBox.style.borderTop="1px solid";
               	resultBox.appendChild(lineBox);
			}
		};
		
		 xhr.open("get" , "../income?storeNo=" + storeNo); //리퀘스트 세팅..
		xhr.send(); //AJAX로 리퀘스트함.. 
	}
	
	
	function modalInfo(a,b,c,d,e,g){
		var hap = a.value;
		var lastHap = b.value;
		var post = c.value;
		var lastPost = d.value;
		var first = eval(hap + "+" + lastHap);
		
		var second = eval(hap + "/" + first);
		
		var third = eval(second + "*" + 100);
		
		
		var first2 = eval(lastHap + "+" + hap);
		
		var second2 = eval(lastHap + "/" + first2);
		
		var third2 = eval(second2 + "*" + 100);
		
		var first3 = eval(post + "+" + lastPost);
		
		var second3 = eval(post + "/" + first3);
		
		var third3 = eval(second3 + "*" + 100);
		
		
		var first4 = eval(lastPost + "+" + post);
		
		var second4 = eval(lastPost + "/" + first4);
		
		var third4 = eval(second4 + "*" + 100);
		
		
	
		
		
		var sub = e.value;
		var postSub=g.value;
	
	
		
		
	  var resultBox = document.getElementById("modalResult");
	  resultBox.innerHTML="";
	  
	  
	  
	  var rowBox = document.createElement("div");
	  rowBox.classList.add("row");
	  rowBox.classList.add("py-2");
	  rowBox.classList.add("border-bottom");
	  resultBox.appendChild(rowBox);
	  
	  var colBox1=document.createElement("div");
	  colBox1.classList.add("col");
	  colBox1.classList.add("py-2");
	  colBox1.classList.add("text-secondary");
	  colBox1.classList.add("fs-5");
	  colBox1.innerText ="작품 판매";
	  rowBox.appendChild(colBox1);
	  
	  
	  var colBox2=document.createElement("div");
	  colBox2.classList.add("col");
	  colBox2.classList.add("py-2");
	  rowBox.appendChild(colBox2);
	  
	  var colBox3=document.createElement("div");
	  colBox3.classList.add("col");
	  colBox3.classList.add("py-2");
	  colBox3.classList.add("text-secondary");
	  colBox3.classList.add("text-end");
	  colBox3.classList.add("my-1");
	  colBox3.innerText ="백분률(%)";
	  rowBox.appendChild(colBox3);
	  
	  
	  var proRow =  document.createElement("div");
	  proRow.classList.add("row");
	  
	  rowBox.appendChild(proRow);
	  
	  var proCol =document.createElement("div");
	  proCol.classList.add("col-3");
	  
	  proCol.innerText="이번 달";
	  proRow.appendChild(proCol);
	  
	  
	  
	  
	  var proCol1 =document.createElement("div");
	  proCol1.classList.add("col");
	  proCol1.classList.add("my-1");
	  proCol1.classList.add("ms-0");
	  proRow.appendChild(proCol1);
	  
	  
	  
	  var progress = document.createElement("div");
	  progress.classList.add("progress");
	  progress.classList.add("bg-white");
	  
	  proCol1.appendChild(progress);
	  
	  var bar =  document.createElement("div");
	  bar.classList.add("progress-bar");
	  bar.classList.add("bg-success");
	  bar.classList.add("bg-opacity-50");
	  bar.setAttribute("role","progressbar");
	  bar.style="width:" + third + "%";
	  bar.setAttribute("aria-valuenow",third);
	  bar.setAttribute("aria-valuemin",0);
	  bar.setAttribute("aria-valuemax",100);
	  progress.appendChild(bar);
	  
	  var rowMonth = document.createElement("div");
	  rowMonth.classList.add("row");
	  rowMonth.classList.add("py-2");
	  rowMonth.classList.add("ms-0");
	  rowMonth.classList.add("text-success");
	  rowMonth.classList.add("text-opacity-50");
	  rowMonth.innerText =+ hap +"원";
	  rowBox.appendChild(rowMonth);
	  
	  //지난달 작품값
	  
	    var proRow =  document.createElement("div");
	  proRow.classList.add("row");
	  
	  rowBox.appendChild(proRow);
	  
	  var proCol =document.createElement("div");
	  proCol.classList.add("col-3");
	  
	  proCol.innerText="지난 달";
	  proRow.appendChild(proCol);
	  
	  
	  
	  
	  var proCol1 =document.createElement("div");
	  proCol1.classList.add("col");
	  proCol1.classList.add("my-1");
	  proCol1.classList.add("ms-0");
	  proRow.appendChild(proCol1);
	  
	  
	  
	  var progress = document.createElement("div");
	  progress.classList.add("progress");
	  progress.classList.add("bg-white");
	  
	  proCol1.appendChild(progress);
	  
	  var bar =  document.createElement("div");
	  bar.classList.add("progress-bar");
	  bar.classList.add("bg-warning");
	  bar.classList.add("bg-opacity-50");
	  bar.setAttribute("role","progressbar");
	  bar.style="width:" + third2 + "%";
	  bar.setAttribute("aria-valuenow",third);
	  bar.setAttribute("aria-valuemin",0);
	  bar.setAttribute("aria-valuemax",100);
	  progress.appendChild(bar);
	  
	  var rowMonth = document.createElement("div");
	  rowMonth.classList.add("row");
	  rowMonth.classList.add("py-2");
	  rowMonth.classList.add("ms-0");
	  rowMonth.classList.add("text-warning");
	  rowMonth.classList.add("text-opacity-50");
	  rowMonth.innerText =+ lastHap +"원";
	  rowBox.appendChild(rowMonth);
	  
	  
	  
	  
	  
	  //
	   var rowBox = document.createElement("div");
	  rowBox.classList.add("row");
	  rowBox.classList.add("py-2");
	  rowBox.classList.add("border-bottom");
	  resultBox.appendChild(rowBox);
	  
	  var colBox1=document.createElement("div");
	  colBox1.classList.add("col");
	  colBox1.classList.add("py-2");
	  colBox1.classList.add("text-secondary");
	  colBox1.classList.add("fs-5");
	  colBox1.innerText ="배송비";
	  rowBox.appendChild(colBox1);
	  
	  
	  var colBox2=document.createElement("div");
	  colBox2.classList.add("col");
	  colBox2.classList.add("py-2");
	  rowBox.appendChild(colBox2);
	  
	  var colBox3=document.createElement("div");
	  colBox3.classList.add("col");
	  colBox3.classList.add("py-2");
	  colBox3.classList.add("my-1");
	  colBox3.classList.add("text-secondary");
	  colBox3.classList.add("text-end");
	  colBox3.innerText ="백분률(%)";
	  rowBox.appendChild(colBox3);
	  
	  
	  var proRow =  document.createElement("div");
	  proRow.classList.add("row");
	  
	  rowBox.appendChild(proRow);
	  
	  var proCol =document.createElement("div");
	  proCol.classList.add("col-3");
	  
	  proCol.innerText="이번 달";
	  proRow.appendChild(proCol);
	  
	  
	  
	  
	  var proCol1 =document.createElement("div");
	  proCol1.classList.add("col");
	  proCol1.classList.add("my-1");
	  proCol1.classList.add("ms-0");
	  proRow.appendChild(proCol1);
	  
	  
	  
	  var progress = document.createElement("div");
	  progress.classList.add("progress");
	  progress.classList.add("bg-white");
	  
	  proCol1.appendChild(progress);
	  
	  var bar =  document.createElement("div");
	  bar.classList.add("progress-bar");
	  bar.classList.add("bg-primary");
	  bar.classList.add("bg-opacity-50");
	  bar.setAttribute("role","progressbar");
	  bar.style="width:" + third3 + "%";
	  bar.setAttribute("aria-valuenow",third);
	  bar.setAttribute("aria-valuemin",0);
	  bar.setAttribute("aria-valuemax",100);
	  progress.appendChild(bar);
	  
	  var rowMonth = document.createElement("div");
	  rowMonth.classList.add("row");
	  rowMonth.classList.add("py-2");
	  rowMonth.classList.add("ms-0");
	  rowMonth.classList.add("text-primary");
	  rowMonth.classList.add("text-opacity-50");
	  rowMonth.innerText =+ post +"원";
	  rowBox.appendChild(rowMonth);
	  
	  
	  
	  //지난달 작품값
	  
	    var proRow =  document.createElement("div");
	  proRow.classList.add("row");
	  
	  rowBox.appendChild(proRow);
	  
	  var proCol =document.createElement("div");
	  proCol.classList.add("col-3");
	  
	  proCol.innerText="지난 달";
	  proRow.appendChild(proCol);
	  
	  
	  
	  
	  var proCol1 =document.createElement("div");
	  proCol1.classList.add("col");
	  proCol1.classList.add("my-1");
	  proCol1.classList.add("ms-0");
	  proRow.appendChild(proCol1);
	  
	  
	  
	  var progress = document.createElement("div");
	  progress.classList.add("progress");
	  progress.classList.add("bg-white");
	  
	  proCol1.appendChild(progress);
	  
	  var bar =  document.createElement("div");
	  bar.classList.add("progress-bar");
	  bar.classList.add("bg-danger");
	  bar.classList.add("bg-opacity-50");
	  bar.setAttribute("role","progressbar");
	  bar.style="width:" + third4 + "%";
	  bar.setAttribute("aria-valuenow",third);
	  bar.setAttribute("aria-valuemin",0);
	  bar.setAttribute("aria-valuemax",100);
	  progress.appendChild(bar);
	  
	  var rowMonth = document.createElement("div");
	  rowMonth.classList.add("row");
	  rowMonth.classList.add("py-2");
	  rowMonth.classList.add("ms-0");
	  rowMonth.classList.add("text-danger");
	  rowMonth.classList.add("text-opacity-50");
	  rowMonth.innerText =+ lastPost +"원";
	  rowBox.appendChild(rowMonth);
	  
	  
	 //수익 변화 
	  var proRow =  document.createElement("div");
	  proRow.classList.add("row");
	  proRow.classList.add("py-2");
	  resultBox.appendChild(proRow);
	  
	  var proCol =document.createElement("div");
	  proCol.classList.add("col-5");
	  proCol.classList.add("fs-5");
	  proCol.classList.add("text-secondary");
	  proCol.innerText="수익 변화";
	  proRow.appendChild(proCol);
	  
	  
	  var row =document.createElement("div");
	  row.classList.add("row");
	  row.classList.add("py-2");
	  resultBox.appendChild(row);
	  
	  var col =document.createElement("div");
	  col.classList.add("col-7");
	  col.classList.add("text-secondary");
	  col.innerText="작품 판매 ";
	  row.appendChild(col);
	  
	  
	  
	  if(hap > lastHap){
			var SpanBox2 = document.createElement("span");
			SpanBox2.classList.add("fs-6");
			SpanBox2.classList.add("fw-bold");
			SpanBox2.classList.add("text-danger");
			SpanBox2.classList.add("text-opacity-75");
			SpanBox2.innerText = sub;
			col.appendChild(SpanBox2);	
			
			var iBox =  document.createElement("i");
			iBox.classList.add("bi");
			iBox.classList.add("bi-caret-up-fill");
			SpanBox2.appendChild(iBox);
		}else{
			var SpanBox2 = document.createElement("span");
			SpanBox2.classList.add("fs-6");
			SpanBox2.classList.add("fw-bold");
			SpanBox2.classList.add("text-primary");
			SpanBox2.classList.add("text-opacity-75");
			SpanBox2.innerText =  sub; 
			col.appendChild(SpanBox2);
			
			var iBox2 = document.createElement("i");
			iBox2.classList.add("bi");
			iBox2.classList.add("bi-caret-down-fill");
			SpanBox2.appendChild(iBox2);
		}
			
	  
	  var row =document.createElement("div");
	  row.classList.add("row");
	  row.classList.add("py-2");
	  resultBox.appendChild(row);
	  
	  var col =document.createElement("div");
	  col.classList.add("col-7");
	  col.classList.add("text-secondary");
	  col.innerText="배송비 ";
	  row.appendChild(col);
	  
	  
	  
	  if(post > lastPost){
			var SpanBox2 = document.createElement("span");
			SpanBox2.classList.add("fs-6");
			SpanBox2.classList.add("fw-bold");
			SpanBox2.classList.add("text-danger");
			SpanBox2.classList.add("text-opacity-75");
			SpanBox2.innerText = postSub;
			col.appendChild(SpanBox2);	
			
			var iBox =  document.createElement("i");
			iBox.classList.add("bi");
			iBox.classList.add("bi-caret-up-fill");
			SpanBox2.appendChild(iBox);
		}else{
			var SpanBox2 = document.createElement("span");
			SpanBox2.classList.add("fs-6");
			SpanBox2.classList.add("fw-bold");
			SpanBox2.classList.add("text-primary");
			SpanBox2.classList.add("text-opacity-75");
			SpanBox2.innerText =  postSub; 
			col.appendChild(SpanBox2);
			
			var iBox2 = document.createElement("i");
			iBox2.classList.add("bi");
			iBox2.classList.add("bi-caret-down-fill");
			SpanBox2.appendChild(iBox2);
		}
			
	}
	
	
	window.addEventListener("DOMContentLoaded" , function (){
	 income(${storeNo});
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
					width="75" height="75" ></div><div class="col-6 text-center"  style="justify-content; margin :auto;  align-items : center;">함께 공유하는 공방! <span class=" fw-bold fs-5">Atelier Community</span></div><div class="col-2"></div>
		</div>
		<input type="hidden" value=${storeNo }>
		<div id="resultBox"></div>
		
		 
		
		
	
		
		
		
		
	<div class="row" style="height:30px;"></div>
		<div class="row"><jsp:include page="../common/bottomInfo.jsp"></jsp:include></div>
		<div class="row" style="height:65px;"></div>
</div>

<jsp:include page="../common/navbarBottom.jsp"></jsp:include>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>







<!--  -->


<!-- customer Modal -->
<div class="modal fade" id="customerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
       <h3 class="modal-title" id="staticBackdropLabel" style="text:pink;">상세 정보</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id ="modalBody">


		<div class="container-fluid" id = "containerBox">
		
			<div id="modalResult"></div>		
		

				
		</div>
				
		</div>
		</div>
		
			</div>	
	</div>












</body>
</html>
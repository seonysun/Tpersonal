<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/> -->
<!-- <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/> -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<link rel="stylesheet" href="../Content/app3/css/mypage.css">

</head>
<body>
<main class="container">
	<div style="margin-left:20px"> 
		<span style="font-size: 20px;font-weight: 700;line-height: 50px;">관리자</span> 페이지입니다
	</div>
	
	<div style="width:20%;height:100%;padding:5px;float:left;">
	  <div class=rows>
	  	<div style="height:100px;margin:5px;padding:10px;border:2px solid #45c5c5;">
	  		<div style="height:50px;">
	  	  		<img src="../images/gtop.png" style="height: 40px">
	  	  		<span>마스터</span>
	  		</div>
	  		<div style="height:30px;">
		  		<span class="mintBtn" value="로그아웃">로그아웃</span>
		  		<span class="mintBtn">정보수정</span>
	  		</div>
	  	</div>
	  </div>
	  <div style="height: 10px;"></div>
	  <div class=rows>
		<ul style="margin:5px;padding:10px;border:1px solid #45c5c5;border-radius:10px">
			<div class="my_li">
		  	    <li class="my_menu">공지사항 관리</li>
		  	    <span><li class="my_menu2">공지 등록</li></span>
		  	    <span><li class="my_menu2">공지 수정</li></span>
	  	    </div>
	  	    <div class="my_li">
	  	    	<li class="my_menu">문의 관리</li>
	  	    	<span><li class="my_menu2">일반회원 문의</li></span>
	  	    	<span><li class="my_menu2">튜터 문의</li></span>
	  	    </div>
	  	    <div class="my_li">
	  	    	<li class="my_menu">강의 관리</li>
	  	    	<span><li class="my_menu2">강의 승인</li></span>
	  	    	<span><li class="my_menu2">강의 목록</li></span>
	  	    </div>
	  	    <div class="my_li">
		  	    <li class="my_menu">회원 관리</li>
		  	    <span><li class="my_menu2">일반회원 관리</li></span>
		  	    <span><li class="my_menu2">튜터 관리</li></span>
			</div>
		</ul>
	  </div>
	</div>
	
	<div style="width:80%;float:left;">
	  <div class=rows>
	  
	  </div>
	</div>
</main>
<script>
	new Vue({
		el:'.container'
	})
</script>
</body>
</html>
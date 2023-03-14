<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <div class=rows>
	  	<div style="height:150px;margin:5px;padding:10px;border:2px solid #45c5c5;">
	  		<div style="height:50px;">
	  	  		<img src="${sessionScope.mvo.image }" style="height: 40px;border-radius: 50px">
	  	  		<span>${sessionScope.mvo.nickname }</span> 튜터
	  		</div>
	  		<div style="height:25px;">
		  	  	<img src="../images/letter.png" style="height: 20px">&nbsp;<span>쪽지함</span>
	  		</div>
	  		<div style="height:25px;">
		  	  	<img src="../images/letter.png" style="height: 20px">&nbsp;<span>개설된 강의</span>
	  		</div>
	  		<div style="height:30px;text-align:center;margin:5px">
		  		<a href="../member/logout.do"><span class="mintBtn">로그아웃</span></a>
		  		<span class="mintBtn">정보수정</span>
	  		</div>
	  	</div>
	  </div>
	  <div style="height: 10px;"></div>
	  <div class=rows>
		<ul style="margin:5px;padding:10px;border:1px solid #45c5c5;border-radius:10px">
	  	    <div class="my_li">
	  	    	<li id="my_menus"><a href="../tutorpage/main.do">튜터 소개</a></li>
	  	    	<li class="my_menu">내 강의</li>
	  	    	<span><li class="my_menu2">강의 관리</li></span>
	  	    	<span><li class="my_menu2">수강생 관리</li></span>
	  	    	<span><li class="my_menu2">질문 관리</li></span>
	  	    </div>
	  	    <div class="my_li">
	  	    	<li class="my_menu">강의 등록</li>
	  	    	<span><li class="my_menu2">강의 신청서</li></span>
	  	    </div>
		</ul>
	  </div>
</body>
</html>
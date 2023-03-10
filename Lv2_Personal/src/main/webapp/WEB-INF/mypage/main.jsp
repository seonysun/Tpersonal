<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mypage_ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}
li.mypage_menu {
	font-size: 22px;
	font-weight: bold;
	color: #27375C!important;
	padding-bottom: 5px;
}
.mypage_menu_child {
	color: #666;
	font-size: 14px;
}
.mypage_li_div {
	margin-bottom: 30px;
	padding-bottom: 10px;
	border-bottom: 1px solid #E2E2E2;
}
.mypage_li_div:last-child {
	margin-bottom: 30px;
	padding-bottom: 10px;
	border-bottom: none;
}
</style>
</head>
<body>
<div class=container>
	<h1>나의 탈잉</h1>
	<div style="width:100%;height:50px;background:pink;">
		<a href="#">이름</a>님 클래스 하루와 <span>30</span>일째 성장 중!
	</div>
	<div style="width:20%;background:orange;float:left;">
		<ul class="mypage_ul">
			<a href="../mypage/mypage_main.do"><h2 class="mypage_title">MyPage</h2></a>
			<div class="mypage_li_div">
		  	    <li class="mypage_menu">내 활동</li>
		  	    <span id ="mypost_list"><li class="mypage_menu_child">내가 쓴 게시글</li></span>
		  	    <span id ="myreply_list"><li class="mypage_menu_child">내가 쓴 댓글</li></span>
		  	    <span id ="myqna_list"><li class="mypage_menu_child">내가 쓴 문의</li></span>
	  	    </div>
	  	    <div class="mypage_li_div">
	  	    	<li class="mypage_menu">전시회 예매</li>
	  	    	<span id="reserve_list"><li class="mypage_menu_child">예매 목록</li></span>
	  	    </div>
	  	    <div class="mypage_li_div">
	  	    	<li class="mypage_menu">좋아요&찜&공감</li>
	  	    	<span id="like_list"><li class="mypage_menu_child">좋아요 목록</li></span>
	  	    	<span id="jjim_list"><li class="mypage_menu_child">찜 목록</li></span>
	  	    	<span id="gong_list"><li class="mypage_menu_child">공감 목록</li></span>
	  	    </div>
	  	    <div class="mypage_li_div">
		  	    <li class="mypage_menu">내 정보</li>
		  	    <li class="mypage_menu_child"><a href="../member/join_update.do">정보 수정</a></li>
		  	    <span id="join_delete"><li class="mypage_menu_child">회원 탈퇴</li></span>
			</div>
		</ul>
	</div>
	<div style="width:80%;background:blue;float:left;">
		<div class="row">
		  <div class="col-sm-7" style="height:300px;background:yellow;">
			<h2>최근 학습 강의</h2>
			<table>
			  <tr>
			  	<td>최근 학습한 강의가 없습니다.</td>
			  </tr>
			  <tr>
			  	<td>
				  	<input type=button value="강의 보러 가기" class="btn btn-sm btn-primary">
			  	</td>
			  </tr>
			</table>
		  </div>
		  <div class="col-sm-5" style="height:300px;background:orange;">
			<h2>주간 학습</h2>
			<table>
			  <tr>
			  	<td>달력 년 월 주</td>
			  </tr>
			  <tr>
			  	<td>
				  	동구랑미
			  	</td>
			  </tr>
			  <tr>
			  	<td>공부시간</td>
			  </tr>
			</table>
		  </div>
		</div>
		
		<div class="row">
		  <div class="col-sm-3" style="height:300px;background:green;">
			<h2>스킬 태그</h2>
			<table>
			  <tr>
			  	<td>달력 년 월 주</td>
			  </tr>
			  <tr>
			  	<td>
				  	동구랑미
			  	</td>
			  </tr>
			  <tr>
			  	<td>공부시간</td>
			  </tr>
			</table>
		  </div>
		  <div class="col-sm-9" style="height:300px;background:purple;">
			<h2>연간 학습</h2>
			<table>
			  <tr>
			  	<td>달력 년 월 주</td>
			  </tr>
			  <tr>
			  	<td>
				  	동구랑미
			  	</td>
			  </tr>
			  <tr>
			  	<td>공부시간</td>
			  </tr>
			</table>
		  </div>
		</div>
	
	</div>
</div>
</body>
</html>
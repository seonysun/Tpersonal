<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#reserve_manage').click(function(){
		$.ajax({
			type:'post',
			url:'../adminpage/admin_reserve_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('#qna_manage').click(function(){
		$.ajax({
			type:'post',
			url:'../adminpage/faq_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('#notice_manage').click(function(){
		$.ajax({
			type:'post',
			url:'../adminpage/notice_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('#member_manage').click(function(){
		$.ajax({
			type:'post',
			url:'../adminpage/member_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
})


</script>
<style type="text/css">
* {
font-family: font-family: 'Noto Sans KR', sans-serif;
}
.mypage_title {
	color: #27375C;
	font-size: 30px;
	padding-bottom: 40px;
}

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
li.mypage_menu:hover {
	cursor: pointer;
}
li.mypage_menu::before {
	content: <i class="fa-solid fa-star"></i>;
}

.mypage_menu_child {
	color: #666;
	font-size: 14px;
}
.mypage_menu_child:hover {
	color: #27375C!important;
	cursor: pointer;
	font-weight: bold;
}
.mypage_menu_child a {
	color: #666;
	font-size: 14px;
}
.mypage_menu_child a:hover {
	color: #27375C!important;
	cursor: pointer;
	font-weight: bold;
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
* {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>
<body>
	<ul class="mypage_ul">
		<a href="../adminpage/adminpage_main.do"><h2 class="mypage_title">AdminPage</h2></a>
		<div class="mypage_li_div">
	  	    <li class="mypage_menu">게시글 관리</li>
	  	    <span id="notice_manage"><li class="mypage_menu_child">공지사항 관리</li></span>
  	    </div>
  	    <div class="mypage_li_div">
  	    	<li class="mypage_menu">예매 관리</li>
  	    	<span id="reserve_manage"><li class="mypage_menu_child">예매 승인</li></span>
  	    </div>
  	    <div class="mypage_li_div">
  	    	<li class="mypage_menu">문의관리</li>
  	    	<span id="qna_manage"><li class="mypage_menu_child">미답변 문의내역</li></span>
  	    </div>
  	    <div class="mypage_li_div">
	  	    <li class="mypage_menu">회원관리</li>
	  	    <span id="member_manage"><li class="mypage_menu_child">회원추방</li></span>
		</div>
	</ul>
</body>
</html>
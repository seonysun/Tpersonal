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
	$('#jjim_list').click(function(){
		$.ajax({
			type:'post',
			url:'../mypage/mypage_main.do',
			success:function(result) {
				$.ajax({
					type:'post',
					url:'../mypage/jjim_list.do',
					success:function(response){
						$('.mypage_home_div').html(response)
					}
				})
			}
		})
	})
	
	$('#join_delete').click(function(){
		$.ajax({
			type:'post',
			url:'../mypage/join_delete.do',
			success:function(result){
				$('.mypage_home_div').html(result)
			}
		})
	})
	
	$('#reserve_list').click(function(){
		$.ajax({
			type:'post',
			url:'../mypage/mypage_reserve_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('#mypost_list').click(function(){
		$.ajax({
			type:'post',
			url:'../mypage/mypage_mypost_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('#myreply_list').click(function(){
		$.ajax({
			type:'post',
			url:'../mypage/mypage_myreply_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('#myqna_list').click(function(){
		$.ajax({
			type:'post',
			url:'../mypage/mypage_myqna_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('#like_list').click(function(){
		$.ajax({
			type:'post',
			url:'../mypage/mypage_like_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('#gong_list').click(function(){
		$.ajax({
			type:'post',
			url:'../mypage/mypage_gong_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	$('.mypage_title').hover(function(){
		$(this).css('cursor', 'pointer')
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
	text-decoration: underline;
}
.mypage_menu_child:active {
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
		<a href="../mypage/mypage_main.do"><h2 class="mypage_title">MyPage</h2></a>
		<div class="mypage_li_div">
	  	    <li class="mypage_menu">??? ??????</li>
	  	    <span id ="mypost_list"><li class="mypage_menu_child">?????? ??? ?????????</li></span>
	  	    <span id ="myreply_list"><li class="mypage_menu_child">?????? ??? ??????</li></span>
	  	    <span id ="myqna_list"><li class="mypage_menu_child">?????? ??? ??????</li></span>
  	    </div>
  	    <div class="mypage_li_div">
  	    	<li class="mypage_menu">????????? ??????</li>
  	    	<span id="reserve_list"><li class="mypage_menu_child">?????? ??????</li></span>
  	    </div>
  	    <div class="mypage_li_div">
  	    	<li class="mypage_menu">?????????&???&??????</li>
  	    	<span id="like_list"><li class="mypage_menu_child">????????? ??????</li></span>
  	    	<span id="jjim_list"><li class="mypage_menu_child">??? ??????</li></span>
  	    	<span id="gong_list"><li class="mypage_menu_child">?????? ??????</li></span>
  	    </div>
  	    <div class="mypage_li_div">
	  	    <li class="mypage_menu">??? ??????</li>
	  	    <li class="mypage_menu_child"><a href="../member/join_update.do">?????? ??????</a></li>
	  	    <span id="join_delete"><li class="mypage_menu_child">?????? ??????</li></span>
		</div>
	</ul>
</body>
</html>
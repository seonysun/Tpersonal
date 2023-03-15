<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/> -->
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<link rel="stylesheet" href="../Content/app3/css/mypage.css">
<style type="text/css">
#my-sidebar{
	width: 450px
}
</style>
</head>
<body>
<div class="container">
	<jsp:include page="../mypage/header.jsp"></jsp:include>
	
	<div style="width:20%;height:100%;padding:5px;float:left">
		<jsp:include page="../mypage/menu.jsp"></jsp:include>
	</div>
	
	<div style="width:80%;float:left;padding:20px">
	  <div class=rows>
			<div class="class-box" v-for="vo in jjim_list">
				<div class="class-info " style="position: relative;">
					<a :href="'../class/class_detail.do?cno='+vo.cno">
						<img class="image" src="#">
					</a>
					<div class="information-box">
						<p><font class="pink">7,871명</font>이 찜했습니다.</p>
						<h3><a href="../class/class_detail.do?cno=">세상에 몸치는 없다-테디베어,파피,뉴진스,캔디등</a></h3>
						<div class="stars-box">
							<font class="class-type">원데이 수업  </font>&nbsp;|&nbsp; &nbsp;
							<font class="class-stars">
								<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
								<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
								<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
								<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
								<img src="https://front-img.taling.me/Content/Images/class/icon_star_new.png" width="15px">
							</font>
							<span>	(400)</span>
						</div>
						<div class="start-date">
							<font>수업 시작일 : 2023-03-26</font>&nbsp;|&nbsp; 
							<font>신촌홍대</font>
						</div>
                        <div class="price"><font>￦</font>12,800<span class="hour_unit">/시간</span></div>
					</div>
					<button class="btn_wish act" type="button" onclick="updateWish(this, 2949)">
						<span class="blind">찜하기</span>
					</button>
				</div>
			</div>
	  </div>
	</div>
</div>
</body>
</html>
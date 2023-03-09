<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container .my-class-list {
    margin-top: 40px;
}

.container .class-box {
    border-bottom: 1px solid #cccfd3;
}

.container .class-box .class-info {
    padding-bottom: 30px;
    display: flex;
}

.container .class-box .class-info .image {
    position: relative;
    width: 320px;
    height: 180px;
    background-size: cover;
    background-position: center;
}

.container .class-box .class-info .image .reward_badge {
    position: absolute;
    left: 12px;
    bottom: 12px;
    width: auto;
    height: 22px;
    padding: 0 10px 0 23px;
    border-radius: 22px;
    font-weight: 500;
    font-size: 11px;
    line-height: 22px;
    color: #000;
    background-repeat: no-repeat;
    background-position: 3px center;
    background-size: 17px;
}

.container .class-box .class-info .image .reward_badge.year {
    left: 10px;
    bottom: 8px;
    width: 31px;
    height: 31px;
    padding: 0;
    border-radius: 0;
    background-position: center;
    background-size: cover;
}

.container .class-box .class-info .image .play_button {
    margin-top: 65px;
    cursor: pointer;
    position: absolute;
    margin-left: 130px;
    z-index: 10;
}

.container .class-box .class-info .image .black_filter {
    width: 320px;
    height: 180px;
    background: #000;
    opacity: 0.6;
}

.container .class-box .class-info .information-box {
    width: 690px;
    padding-top: 10px;
    margin-left: 30px;
}

.container .class-box .review-info {
    border: 1px solid #cccfd3;
    padding: 30px;
    box-sizing: border-box;
    display: none;
    border-radius: 15px;
}

.container .class-box .class-info .information-box p {
    font-size: 14px;
    color: #888;
    letter-spacing: -0.35px;
}

.container .class-box .class-info .information-box p .pink {
    color: #ff005a
}

.container .class-box .class-info .information-box h3 {
    color: #333;
    font-size: 20px;
    letter-spacing: -0.5px;
    font-weight: 500;
    line-height: 2;
    ;height: 40px;
    overflow: hidden;
    cursor: pointer;
}

.container .class-box .class-info .information-box .badge {
    display: inline-block;
    height: 18px;
    padding-left: 20px;
    padding-right: 6px;
    border-radius: 2px;
    line-height: 18px;
    font-size: 13px;
    color: #fff;
    font-weight: 700;
    background: no-repeat left center/18px 18px;
}

.container .class-box .class-info .information-box .badge.live {
    background-image: url(//front-img.taling.me/Content/app3/img/icon/icClasscardLive@2x.png);
    background-color: #f20e42;
}

.container .class-box .class-info .information-box .badge.offline {
    background-image: url(//front-img.taling.me/Content/app3/img/icon/icClasscardOffline@2x.png);
    background-color: #3390ff;
}

.container .class-box .class-info .information-box .btn_wrap {
    display: flex;
    align-items: center;
    height: 48px;
    margin-top: 20px;
}

.container .class-box .class-info .information-box .btn_wrap [class*="btn_"] {
    width: 180px;
    height: 48px;
    margin-right: 10px;
    border-radius: 8px;
    line-height: 48px;
    text-align: center;
    color: #595D61;
    background-color: #EEF0F4;
    cursor: pointer;
}

.container .class-box .class-info .information-box .btn_wrap [class*="btn_"]:hover {
    background-color: #DDDFE5;
}

.container .class-box .class-info .information-box .btn_wrap [class*="btn_"]:disabled, .container .class-box .class-info .information-box .btn_wrap [class*="btn_"].disabled {
    color: #CCD0D7;
    background-color: #FAFAFC;
    cursor: default;
}

.container .class-box .class-info .information-box .btn_wrap [class*="btn_"]:last-child {
    margin-right: 0;
}

.container .class-box .class-info .information-box .btn_wrap .btn_live {
    color: #fff;
    background-color: #ff0045;
}

.container .class-box .class-info .information-box .btn_wrap .btn_live:hover {
    background-color: #E0003C;
}

.container .class-box .class-info .information-box .btn_wrap .btn_live:disabled {
    color: #fa8a94;
    background-color: #ffe5ec;
    cursor: default;
}

.container .class-box .stars-box .class-type {
    color: #888;
    letter-spacing: -0.35px;
    font-size: 14px;
}

.container .class-box .stars-box .class-stars img {
    width: 15px;
    margin-left: -2px;
    margin-bottom: 3px;
    vertical-align: middle;
}

.container .class-box .stars-box span {
    font-size: 14px;
    color: #888;
    letter-spacing: -0.35px;
}

.container .class-box .class-info .information-box .start-date {
    margin-top: 10px;
    color: #888;
    font-size: 14px;
    letter-spacing: -0.35px;
}

.container .class-box .class-info .information-box .review-fold {
    font-size: 14px;
    color: #888;
    letter-spacing: -0.35px;
    line-height: 2.36;
    margin-top: 10px;
}

.container .class-box .class-info .information-box .review-fold .arrw {
    margin-top: -13px;
    margin-left: 5px;
    position: absolute;
    width: 16px;
}

.container .class-box .class-info .information-box .review-fold .arrw-box {
    overflow: hidden;
    display: inline-block;
}

.container .class-box .class-info .information-box .review-fold .arrw.up {
    display: none;
}

.container .class-box .class-info .information-box .review-fold.on {
    color: #ff005a;
}

.container .class-box .class-info .information-box .price {
    font-size: 24px;
    letter-spacing: -0.6px;
    color: #ff005a;
    font-weight: 500;
    text-align: right;
    padding-right: 120px;
    margin-top: -25px;
}

.container .class-box .class-info .information-box .price font {
    font-size: 14px;
}

.container .class-box .class-info .information-box .price .hour_unit {
    margin-left: 4px;
    font-size: 12px;
    letter-spacing: -0.3px;
    line-height: 15px;
    font-weight: normal;
    color: #111;
}
</style>
</head>
<body>
<div class="container">
		<!--MyTItleBox head-->
        <div class="title-box">
            <h1>나의 탈잉</h1>
            <ul>
                <li class="cursor on"><a href="/My/MyTuteeWishList/">찜</a></li>
            </ul>
        </div>
		<!--MyTItleBox head 마무리-->
		<div class="my-class-list">
		
			<div class="class-box">
				<div class="class-info " style="position: relative;">
					<a href="/Talent/Detail/2949">
													<div class="image" style="background-image:url(//img.taling.me/Content/Uploads/Cover/s_6982334808a05b449a04a4de04eaab235897665d.jpg)">
																											<span class="reward_badge" style="background-image: url('https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/Images/1361ccc0c7f91ae93dabd76286640f38961472ec.png'); background-color: #71F4FF;">리뷰 100건+@</span>
																																	</div>
											</a>
					<div class="information-box">
						<p><font class="pink">7,871명</font>이 찜했습니다.</p>
						<h3><a href="/Talent/Detail/2949">세상에 몸치는 없다-테디베어,파피,뉴진스,캔디등</a></h3>
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
							<font>수업 시작일 :  2023-03-26</font>&nbsp;|&nbsp; 
							<font>신촌홍대</font>
						</div>
                        						<div class="price"><font>￦</font>12,800<span class="hour_unit">/시간</span></div>
					</div>
					<button class="btn_wish act" type="button" onclick="updateWish(this, 2949)">
						<span class="blind">찜하기</span>
					</button>
				</div>
			</div>
				
						<div style="padding-top:100px"></div>
		</div>
	</div>
</body>
</html>
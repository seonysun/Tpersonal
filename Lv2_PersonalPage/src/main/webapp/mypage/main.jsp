<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tutee_list {
  margin: 0 0 -40px -40px;
  font-size: 0;
}

.tutee_list li {
  display: inline-block;
  width: calc(33.333% - 40px);
  margin: 0 0 40px 40px;
}

.tutee_list li:hover .thumb_box a::after {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: url(https://front-img.taling.me/Content/app3/images/vod/icon_play.png) rgba(0, 0, 0, 0.2) no-repeat center/15% 26.96%;
}

.tutee_list .thumb_box {
  overflow: hidden;
  position: relative;
  padding-top: 55.63%;
  border-radius: 15px 15px 0 0;
}

.tutee_list .thumb_box a {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
}

.tutee_list .thumb_box img {
  width: 100%;
  height: 100%;
}

.tutee_list .thumb_box .reward_badge {
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

.tutee_list .thumb_box .reward_badge.year {
  left: 10px;
  bottom: 8px;
  width: 31px;
  height: 31px;
  padding: 0;
  border-radius: 0;
  background-position: center;
  background-size: cover;
}

.tutee_list .text_box {
  padding: 12px 16px 15px;
  border: 1px solid #eee;
  border-top: none;
  border-radius: 0 0 15px 15px;
}

.tutee_list .title {
  display: block;
  overflow: hidden;
  margin-bottom: 8px;
  font-weight: 500;
  font-size: 16px;
  line-height: 24px;
  letter-spacing: -0.4px;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.tutee_list .course_info {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  margin-bottom: 16px;
}

.tutee_list .tutor {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  width: calc(100% - 53px);
  font-size: 12px;
  letter-spacing: -0.3px;
  color: #666;
}

.tutee_list .profile {
  position: relative;
  width: 22px;
  height: 22px;
  margin-right: 8px;
}

.tutee_list .profile::after {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  border: 1px solid #eee;
}

.tutee_list .label {
  height: 22px;
  padding: 0 8px;
  border-radius: 4px;
  font-weight: 500;
  font-size: 11px;
  line-height: 22px;
  color: #fff;
  background-color: #7814dc;
}

.tutee_list .progress_box {
  margin-bottom: 20px;
}

.tutee_list .progress_box::after {
  content: '';
  display: block;
  clear: both;
}

.tutee_list .progress_bar {
  position: relative;
  width: 100%;
  height: 5px;
  margin-bottom: 7px;
  background-color: #eee;
}

.tutee_list .bar {
  position: absolute;
  left: 0;
  top: 0;
  height: 5px;
  background-color: #7814dc;
}

.tutee_list .play_time {
  float: left;
  width: 35%;
  font-weight: 500;
  font-size: 12px;
  line-height: 18px;
  color: #7814dc;
}

.tutee_list .due_date {
  float: right;
  width: 65%;
  text-align: right;
  font-weight: 500;
  font-size: 12px;
  line-height: 18px;
  color: #666;
}

.tutee_list .due_date.act {
  color: #ff5d5d;
}

.tutee_list .btn_box {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  text-align: center;
}

.tutee_list .btn_box .btn {
  -webkit-box-flex: 1;
  -ms-flex: 1;
  flex: 1;
  height: 48px;
  margin-left: 9px;
  border-radius: 6px;
  line-height: 48px;
  letter-spacing: -0.35px;
  background-color: #f6f6f6;
}

.tutee_list .btn_box .btn:hover {
  background-color: #eee;
}

.tutee_list .btn_box .btn_intro {
  margin-left: 0;
}

.tutee_list .btn_box .icon {
  display: inline-block;
  width: 10px;
  height: 13px;
  margin-right: 5px;
  vertical-align: middle;
  background: url(https://front-img.taling.me/Content/app3/images/btn/icon_write.png) no-repeat center/cover;
}

.tutee_list .btn_box .btn_period {
  color: #7814dc;
  background-color: #f2e8fd;
}

.tutee_list .btn_box .btn_period:hover {
  background-color: #ecd8fe;
}
.tutee_list .btn_box .btn_space {
  margin: 8px 0 0 0;
}
.tutee_list .btn_box .btn_space.disabled {
  cursor: default;
  color: #bbb;
  background-color: #f6f6f6;
}
.tutee_list .btn_box .btn_space .beta {
  display: inline-block;
    width: 26px;
    height: 18px;
    margin-left: 4px;
    vertical-align: middle;
    background: url(//front-img.taling.me/Content/app3/img/bg/img-beta-black-26@2x.png) no-repeat center/100% auto;
}
.tutee_list .btn_box .btn_space.disabled .beta {
  background-image: url(//front-img.taling.me/Content/app3/img/bg/img-beta-gray-26@2x.png);
}
.btn_faq {
  display: block;
  width: 219px;
  margin: -30px auto 50px;
  padding: 16px 0;
  border-radius: 8px;
  border: 1px solid #7814dc;
  font-weight: 500;
  line-height: 20px;
  color: #7814dc;
}
</style>
</head>
<body>
<div>
	<aside>메뉴</aside>
	<div>
		<a href="#">이름</a>
		<div>
			<p>클래스 하루와 <span>30</span>일째 성장 중!</p>
		</div>
	</div>
	<div>
		<div><p>최근 학습 강의</p></div>
		<div>
			<a>전체보기</a>&gt;
		</div>
		<div>
			학습 강의 내용 출력
		</div>
		<div>
			<a>강의 보러 가기</a>
		</div>
	</div>
	<div>
		<div><p>주간 학습</p></div>
		<div>
			<a>알림 설정</a>
		</div>
		<div>
			
		</div>
		<div>

		</div>
	</div>
</div>
</body>
</html>
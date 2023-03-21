<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.login_box .link_login {
	display: block;
	padding: 12px 0;
	border-radius: 6px;
	text-align: center;
	color: #ffffff;
	font-size: 15px;
	line-height: 24px;
	background-color: #45c5c5;
}

.login_box .link_login:hover {
	background-color: #45c5c5;
}
</style>
</head>
<body>
	<main class="container">
		<!-- visual -->
		<div class="visual">
			<!-- all_category -->
			<ul class="all_category">
				<!-- v-for 작성 -->
				<li class="depth1" v-for="vo in cate_list"
					@mouseover="onMouseOver(vo.cateno)">{{vo.catename}}
					<div class="sub_content">
						<ul>
							<li class="depth2" v-for="dvo in detail_cate_list"><a
								:href="'../class/class_list.do?cateno='+dvo.cateno+'&detail_cateno='+dvo.detail_cateno">{{dvo.detail_catename}}</a></li>
							<!-- 							<li class="depth2"><a href="/Home/Search/?cateMain=45">자기계발</a></li> -->
							<!-- 							<li class="depth2"><a href="/Home/Search/?cateMain=47">취업·이직</a></li> -->
							<!-- 							<li class="depth2"><a href="/Home/Search/?cateMain=43">직무역량</a></li> -->
						</ul>
					</div>
				</li>
			</ul>
			<!-- // all_category -->
			<!-- roll_visual -->
			<div
				class="roll_visual swiper-container swiper-container-fade swiper-container-initialized swiper-container-horizontal">
				<h2 class="blind">롤링배너</h2>
				<ul class="swiper-wrapper" style="transition-duration: 0ms;">
					<li
						class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev"
						data-swiper-slide-index="3"
						style="width: 880px; opacity: 1; transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
						<a href="#" onclick="traceClick('mainTopBanner', 257);"> <img
							class="img"
							src="https://img.taling.me/Content/Uploads/Images/42ad12cc026dede4fdcdcfac70429d39e89f3a25.png"
							alt="">
					</a>
					</li>
					<li class="swiper-slide" data-swiper-slide-index="1"
						style="width: 880px; opacity: 1; transform: translate3d(-1760px, 0px, 0px); transition-duration: 0ms;">
						<a href="#" onclick="traceClick('mainTopBanner', 260);"> <img
							class="img"
							src="https://img.taling.me/Content/Uploads/Images/48d8c3c037eef078baab7b9443fc61d4d0777d05.png"
							alt="">
					</a>
					</li>
					<li class="swiper-slide" data-swiper-slide-index="2"
						style="width: 880px; opacity: 1; transform: translate3d(-2640px, 0px, 0px); transition-duration: 0ms;">
						<a href="#" onclick="traceClick('mainTopBanner', 258);"> <img
							class="img"
							src="https://img.taling.me/Content/Uploads/Images/96bc7b892354f9cc05eb9c197575551955d16d23.png"
							alt="">
					</a>
					</li>
					<li
						class="swiper-slide swiper-slide-prev swiper-slide-duplicate-next"
						data-swiper-slide-index="3"
						style="width: 880px; opacity: 1; transform: translate3d(-3520px, 0px, 0px); transition-duration: 0ms;">
						<a href="#" onclick="traceClick('mainTopBanner', 257);"> <img
							class="img"
							src="https://img.taling.me/Content/Uploads/Images/42ad12cc026dede4fdcdcfac70429d39e89f3a25.png"
							alt="">
					</a>
					</li>
					<li class="swiper-slide swiper-slide-duplicate swiper-slide-active"
						data-swiper-slide-index="0"
						style="width: 880px; opacity: 1; transform: translate3d(-4400px, 0px, 0px); transition-duration: 0ms;">
						<a href="#" onclick="traceClick('mainTopBanner', 263);"> <img
							class="img"
							src="https://img.taling.me/Content/Uploads/Images/6cc03f984146702e93d24606dd9cbf83dbc8ed10.png"
							alt="">
					</a>
					</li>
				</ul>
				<div class="swiper_btn_next" tabindex="0" role="button"
					aria-label="Next slide"></div>
				<div class="swiper_btn_prev" tabindex="0" role="button"
					aria-label="Previous slide"></div>
				<div
					class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets">
					<span
						class="swiper-pagination-bullet swiper-pagination-bullet-active"
						tabindex="0" role="button" aria-label="Go to slide 1"></span><span
						class="swiper-pagination-bullet" tabindex="0" role="button"
						aria-label="Go to slide 2"></span><span
						class="swiper-pagination-bullet" tabindex="0" role="button"
						aria-label="Go to slide 3"></span><span
						class="swiper-pagination-bullet" tabindex="0" role="button"
						aria-label="Go to slide 4"></span>
				</div>
				<span class="swiper-notification" aria-live="assertive"
					aria-atomic="true"></span>
			</div>
			<!-- // roll_visual -->
		</div>
		<!-- // visual -->
		<!-- category -->
		<div class="category" id="homeIconCuration">
			<ul class="list_category">
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/3bea9ebb29c4445a50c5719d669be5846e8d84e9.png)"></span>실시간랭킹</a></li>
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/4e178e7f3b976d755554d38004d87bd370881cb9.png)"></span>신규클래스</a></li>
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/5e4623a4053b7bfb84865bc2947dac29349471d3.png)"></span>도전!댄스</a></li>
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/18cde21b43f8fd1f0331ad4fd2d05208cf1a83e9.png)"></span>헤메코</a></li>
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/6869b8c8cab9ad327b7bb95f81e607d098ce8418.png)"></span>일상탈출</a></li>
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/4199e05ef0f70409feb651237118ddd1d912f22e.png)"></span>N잡러</a></li>
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/7280fa3f49f47a550e9f287331a53699df9400ed.png)"></span>사주/타로</a></li>
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/44cb86fde1f60db71c68bced923bf37a61a69c9b.png)"></span>액세서리</a></li>
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/9e0433a2911d0b11eb9569fc9477f6356865ebcb.png)"></span>쿠킹/베이킹</a></li>
				<li><a href="#"><span
						style="background-image: url(https://img.taling.me/Content/Uploads/Images/7356716c49a8d19a2fc4ece690cde60f3faa9d55.png)"></span>외국어</a></li>
			</ul>
		</div>
		<!-- // category -->
		<div class="main_content">
			<!-- colunm_left -->
			<section class="column_left">
				<!-- talents_area -->
				<div class="talents_area">
					<!-- curationSections -->
					<div class="talent_box pop_dance">
						<h2 class="main_title">Stay in the middle~ 나도 배워볼까?</h2>
						<div
							class="talent_list swiper-container swiper_this_week swiper-container-initialized swiper-container-horizontal swiper-container-free-mode"
							data-number="1">
							<ul class="swiper-wrapper">
								<li class="swiper-slide swiper-active"
									style="width: 210px; margin-right: 15px;" v-for="pvo in pop_dance">
									<a :href="'../class/class_detail.do?cno='+pvo.cno">
<!-- 									div class="thumb lazyloaded"> :style="{'background-image':'url('{{cvo.image}}')}">       -->
<!--            <img v-if="cvo.image=='noimg.jpg'" :src="'../images/'+cvo.image"> -->
<!--            <img v-else :src="cvo.image"> -->
<!--             </div>       -->		
										<div class="thumb lazyloaded">
										  <img v-if="pvo.image=='noimg.jpg'" :src="'../images/'+pvo.image">
										  <img v-else :src="pvo.image">
										</div>
										<div class="card_cnt">
											<h3 class="talent_title">{{pvo.title}}</h3>
											<p class="cate_tutor">
												<span class="name">{{pvo.tutor_info_nickname}}</span>
											</p>
											<p class="price_info">
												<span class="price">{{pvo.perprice}}</span>
											</p>
											<div class="talent_info">
												<span class="user">{{pvo.jjim_count}}</span><span class="reward_badge"
													style="background-image: url('//front-img.taling.me/Content/app3/img/icon/icClasscardReview@2x.png')">
											</div>
										</div>
								</a>
									<button type="button" class="btn_wish "
										onclick="updateWish(this,10034);"></button></li>
							</ul>
							<button type="button"
								class="btn_swiper swiper-button-prev swiper-button-disabled"
								tabindex="0" role="button" aria-label="Previous slide"
								aria-disabled="true"></button>
							<button type="button" class="btn_swiper swiper-button-next"
								tabindex="0" role="button" aria-label="Next slide"
								aria-disabled="false"></button>
							<span class="swiper-notification" aria-live="assertive"
								aria-atomic="true"></span>
						</div>
					</div>
					<!-- // curationSections -->
					
					<!-- curationSections -->
					<div class="talent_box pop_get_job">
						<h2 class="main_title">취업하고싶어요... 자소서는 어떻게 써야하죠?</h2>
						<div
							class="talent_list swiper-container swiper_this_week swiper-container-initialized swiper-container-horizontal swiper-container-free-mode"
							data-number="1">
							<ul class="swiper-wrapper">
								<li class="swiper-slide swiper-active"
									style="width: 210px; margin-right: 15px;" v-for="pvo in pop_get_job">
									<a :href="'../class/class_detail.do?cno='+pvo.cno">
										<div class="thumb lazyloaded">
										  <img v-if="pvo.image=='noimg.jpg'" :src="'../images/'+pvo.image">
										  <img v-else :src="pvo.image">
										</div>
										<div class="card_cnt">
											<h3 class="talent_title">{{pvo.title}}</h3>
											<p class="cate_tutor">
												<span class="name">{{pvo.tutor_info_nickname}}</span>
											</p>
											<p class="price_info">
												<span class="price">{{pvo.perprice}}</span>
											</p>
											<div class="talent_info">
												<span class="user">{{pvo.jjim_count}}</span><span class="reward_badge"
													style="background-image: url('//front-img.taling.me/Content/app3/img/icon/icClasscardReview@2x.png')">
											</div>
										</div>
								</a>
									<button type="button" class="btn_wish "
										onclick="updateWish(this,10034);"></button></li>
							</ul>
							<button type="button"
								class="btn_swiper swiper-button-prev swiper-button-disabled"
								tabindex="0" role="button" aria-label="Previous slide"
								aria-disabled="true"></button>
							<button type="button" class="btn_swiper swiper-button-next"
								tabindex="0" role="button" aria-label="Next slide"
								aria-disabled="false"></button>
							<span class="swiper-notification" aria-live="assertive"
								aria-atomic="true"></span>
						</div>
					</div>
					<!-- // curationSections -->
					
					<!-- curationSections -->
					<div class="talent_box pop_fit">
						<h2 class="main_title">나이가 들었나 몸이 예전같지 않을땐~</h2>
						<div
							class="talent_list swiper-container swiper_this_week swiper-container-initialized swiper-container-horizontal swiper-container-free-mode"
							data-number="1">
							<ul class="swiper-wrapper">
								<li class="swiper-slide swiper-active"
									style="width: 210px; margin-right: 15px;" v-for="pvo in pop_fit">
									<a :href="'../class/class_detail.do?cno='+pvo.cno">
										<div class="thumb lazyloaded">
										  <img v-if="pvo.image=='noimg.jpg'" :src="'../images/'+pvo.image">
										  <img v-else :src="pvo.image">
										</div>
										<div class="card_cnt">
											<h3 class="talent_title">{{pvo.title}}</h3>
											<p class="cate_tutor">
												<span class="name">{{pvo.tutor_info_nickname}}</span>
											</p>
											<p class="price_info">
												<span class="price">{{pvo.perprice}}</span>
											</p>
											<div class="talent_info">
												<span class="user">{{pvo.jjim_count}}</span><span class="reward_badge"
													style="background-image: url('//front-img.taling.me/Content/app3/img/icon/icClasscardReview@2x.png')">
											</div>
										</div>
								</a>
									<button type="button" class="btn_wish "
										onclick="updateWish(this,10034);"></button></li>
							</ul>
							<button type="button"
								class="btn_swiper swiper-button-prev swiper-button-disabled"
								tabindex="0" role="button" aria-label="Previous slide"
								aria-disabled="true"></button>
							<button type="button" class="btn_swiper swiper-button-next"
								tabindex="0" role="button" aria-label="Next slide"
								aria-disabled="false"></button>
							<span class="swiper-notification" aria-live="assertive"
								aria-atomic="true"></span>
						</div>
					</div>
					<!-- // curationSections -->


					<!-- line_banner -->
					<div class="talent_box banner_area">
						<h2 class="main_title blind">프로모션 띠 배너</h2>
						<div
							class="swiper-container style_line swiper-container-initialized swiper-container-horizontal">
							<ul class="swiper-wrapper"
								style="transform: translate3d(-1320px, 0px, 0px); transition-duration: 0ms;">
								<li class="swiper-slide" data-swiper-slide-index="0"
									style="width: 660px;"><a
									href="https://taling.me/tutor/Register/Manual"> <img
										src="https://img.taling.me/Content/Uploads/Images/fcc3acf199f2e86dbd3032be061b712acdae4cd7.png"
										alt="">
								</a></li>
							</ul>
							<button type="button" class="btn_swiper swiper-button-prev"
								tabindex="0" role="button" aria-label="Previous slide"></button>
							<button type="button" class="btn_swiper swiper-button-next"
								tabindex="0" role="button" aria-label="Next slide"></button>
							<div
								class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets">
								<span
									class="swiper-pagination-bullet swiper-pagination-bullet-active"
									tabindex="0" role="button" aria-label="Go to slide 1"></span>
							</div>
							<span class="swiper-notification" aria-live="assertive"
								aria-atomic="true"></span>
						</div>
					</div>
					<!-- // line_banner -->

					<!-- curationSections -->
					<div class="talent_box pop_fortune">
						<h2 class="main_title">2023년, 올해 운세는? ✍</h2>
						<div
							class="talent_list swiper-container swiper_this_week swiper-container-initialized swiper-container-horizontal swiper-container-free-mode"
							data-number="1">
							<ul class="swiper-wrapper">
								<li class="swiper-slide swiper-active"
									style="width: 210px; margin-right: 15px;" v-for="pvo in pop_fortune">
									<a :href="'../class/class_detail.do?cno='+pvo.cno">
										<div class="thumb lazyloaded">
										  <img v-if="pvo.image=='noimg.jpg'" :src="'../images/'+pvo.image">
										  <img v-else :src="pvo.image">
										</div>
										<div class="card_cnt">
											<h3 class="talent_title">{{pvo.title}}</h3>
											<p class="cate_tutor">
												<span class="name">{{pvo.tutor_info_nickname}}</span>
											</p>
											<p class="price_info">
												<span class="price">{{pvo.perprice}}</span>
											</p>
											<div class="talent_info">
												<span class="user">{{pvo.jjim_count}}</span><span class="reward_badge"
													style="background-image: url('//front-img.taling.me/Content/app3/img/icon/icClasscardReview@2x.png')">
											</div>
										</div>
								</a>
									<button type="button" class="btn_wish "
										onclick="updateWish(this,10034);"></button></li>
							</ul>
							<button type="button"
								class="btn_swiper swiper-button-prev swiper-button-disabled"
								tabindex="0" role="button" aria-label="Previous slide"
								aria-disabled="true"></button>
							<button type="button" class="btn_swiper swiper-button-next"
								tabindex="0" role="button" aria-label="Next slide"
								aria-disabled="false"></button>
							<span class="swiper-notification" aria-live="assertive"
								aria-atomic="true"></span>
						</div>
					</div>
					<!-- // curationSections -->

				</div>
				<!-- // talents_area -->
			</section>
			<!-- // colunm_left -->
			<!-- column_right -->
			<section class="column_right" id="stick"
				style="transform: translate(0px, 0px);">
				<div class="wrapper">
					<!-- 로그인 전 -->
					<c:if test="${sessionScope.mvo.id==null }">
						<div class="login_box">
							<h2 class="blind">회원 로그인 영역</h2>
							<p class="login_msg">
								로그인 하시고 하루의<br>다양한 튜터를 만나보세요.
							</p>
							<a class="link_login" href="../member/loginpage.do">하루 로그인</a>
							<div class="box_btns">
								<a class="find_id" href="#">아이디 찾기</a> <a class="find_pw"
									href="#">비밀번호 찾기</a> <a class="link_join"
									href="../member/loginpage.do">회원가입</a>
							</div>
						</div>
					</c:if>
					<!-- //로그인 전 -->
					<!-- 로그인 후 -->
					<c:if test="${sessionScope.mvo.id!=null }">
						<div class="login_box status_logon">
							<div class="area_info_top">
								<a class="my_profile" href="#"> <img class="img_profile"
									src="${sessionScope.mvo.image }"
									onerror="profileImgError(this,);" alt="프로필 이미지">
								</a>
								<div class="logon_msg">
									<b><em class="level"></em>${sessionScope.mvo.name }님</b> <span>반가워요</span>
									<!-- 								<button class="btn_logout" type="button" id="btn-menu-logout">로그아웃</button> -->
									<button class="btn_logout" type="button" id="btn-menu-logout"
										onclick="location.href='../member/logout.do'">로그아웃</button>
								</div>
								<button class="btn_livechat " type="button" onclick="qPop(0)">
									<span class="blind">메시지💬</span>
								</button>
							</div>
							<div class="area_info_bottom">
								<div class="btn_coupon" id="coupon">
									<button type="button" class="coupon">
										쿠폰 <em>0</em>
									</button>
									<button type="button" class="point">
										포인트 <em>0P</em>
									</button>
								</div>
								<!-- pub -->
								<button class="tutor_mode" type="button" data-tutormode="">
									<b>튜터모드</b> <span class="toggle"><small></small></span>
								</button>
							</div>
							<ul class="lnb">
								<li claas="chat_tutee"><a onclick="qPop(0)"
									style="cursor: pointer;">메시지💬</a></li>
								<li class=""><a href="#">수업신청서</a></li>
								<li><a href="#">수강목록</a></li>
								<li class="link_wish"><a href="#">찜</a></li>
							</ul>
						</div>
					</c:if>
					<!-- // 로그인 후 -->
					<!-- hot_keyword -->
					<!-- // hot_keyword -->
					<!-- ad_banner -->
					<div class="ad_banner">
						<a href="https://taling.me/tutor/Register/Manual"> <img
							data-src="//front-img.taling.me/Content/app3/img/banner/every-talent-into-content06.png"
							class="lazyload" alt="여러분의 재능은 무엇인가요? 튜터 등록하러 가기">
						</a>
					</div>
					<!-- // ad_banner -->

					<!-- review_list -->
					<div
						class="review_list swiper-container swiper-container-initialized swiper-container-horizontal">
						<h2 class="main_title">실시간 리뷰</h2>
						<ul class="swiper-wrapper"
							style="transition-duration: 0ms; transform: translate3d(-5029.6px, 0px, 0px);">
							<li class="swiper-slide" data-swiper-slide-index="0"
								style="margin-right: 20px;"><a href="#">
									<div class="thumb lazyload"
										data-bg="//img.taling.me/Content/Uploads/Images/10a830d5244fd058777f220389c62013cdad5600.png"></div>
									<div class="text_box">
										<span class="write_time">3 시간전</span>
										<div class="score_talent">
											<div class="score_star">
												<span class="star" style="width: 100%"></span>
											</div>
											<span class="score">5.0 <em>(153)</em></span>
										</div>
										<p class="review_text">정말 좋은 강의 였습니다.</p>
									</div>
							</a></li>
						</ul>
						<span class="swiper-notification" aria-live="assertive"
							aria-atomic="true"></span>
					</div>
					<!-- // review_list -->
					<!-- ad_vod -->
					<div class="ad_vod">
						<div class="ad_vod_title">
							<h2 class="main_title">최고 인기 클래스</h2>
							<!--<a href="/vod/list" class="btn_link">브오디홈</a>-->
						</div>
						<ul>
							<li v-for="pvo in now_pop_list">
							<a href="/Talent/Detail/7624">
									<div class="thumb lazyloaded"
										v-bind:style="{'background-image': 'url('+pvo.image+')'}">
									</div>
									<div class="text_box">
										<h3 class="talent_title">{{pvo.title}}</h3>
										<div class="talent_info">
											<span class="user"><em>{{pvo.jjim_count}}명</em>이
												찜했습니다!</span> <span class="average">{{pvo.tutor_grade_total}}</span>
										</div>
									</div>
							</a> <!-- <p class="earlybird">얼리버드 마감임박!</p> --></li>
						</ul>
					</div>
					<!-- // ad_vod -->
					<!-- ad_app -->
					<div class="ad_app">
						<h2 class="logo">
							<img src="../images/favicon.png" alt="하루">
						</h2>
						<h3>언제 어디서나 하루하기!</h3>
						<a href="//play.google.com/store/apps/details?id=com.taling"
							target="_blank"> <img
							src="//front-img.taling.me/Content/app3/img/sns/sns-googleplay@2x.png"
							alt="ANDROID APP ON Google Play">
						</a> <a
							href="//apps.apple.com/kr/app/%ED%83%88%EC%9E%89-taling/id1153218962?l=en"
							target="_blank"> <img
							src="//front-img.taling.me/Content/app3/img/sns/sns-appstore@2x.png"
							alt="Download on th App Store">
						</a>
					</div>
					<!-- // ad_app -->
				</div>
			</section>
			<!-- // column_right -->
		</div>
	</main>
	<script>
		new Vue({
			el : '.all_category',
			data : {
				cate_list : [],
				detail_cate_list : []
			},
			mounted : function() {
				let _this = this;
				axios.get("../class/class_cate_vue.do").then(
						function(response) {
							console.log(response.data)
							_this.cate_list = response.data
						})
			},
			methods : {
				onMouseOver : function(cateno) {
					let _this = this;
					axios.get(
							"../class/class_detail_cate_vue.do?cateno="
									+ cateno).then(function(response) {
						console.log(response.data)
						_this.detail_cate_list = response.data
					})
				}

			}
		})
		new Vue({
			el : '.ad_vod',
			data : {
				now_pop_list : []
			},
			mounted : function() {
				let _this = this;
				axios.get("../main/nowPopular_vue.do").then(
						function(response) {
							console.log(response.data)
							_this.now_pop_list = response.data
						})

			}
		})
		new Vue({
			el:'.pop_dance',
			data:{
				pop_dance:[]
			},
			mounted:function(){
				let _this=this;
				axios.get("../main/popularDance_vue.do").then(function(response){
					console.log(response.data)
					_this.pop_dance=response.data
				})
			}
		})
		new Vue({
			el:'.pop_get_job',
			data:{
				pop_get_job:[]
			},
			mounted:function(){
				let _this=this;
				axios.get("../main/popular_get_job_vue.do").then(function(response){
					console.log(response.data)
					_this.pop_get_job=response.data
				})
			}
		})
		new Vue({
			el:'.pop_fit',
			data:{
				pop_fit:[]
			},
			mounted:function(){
				let _this=this;
				axios.get("../main/popular_fit_vue.do").then(function(response){
					console.log(response.data)
					_this.pop_fit=response.data
				})
			}
		})
		new Vue({
			el:'.pop_fortune',
			data:{
				pop_fortune:[]
			},
			mounted:function(){
				let _this=this;
				axios.get("../main/popular_fortune_vue.do").then(function(response){
					console.log(response.data)
					_this.pop_fortune=response.data
				})
			}
		})
	</script>
</body>
</html>
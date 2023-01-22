<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 홈화면 메인배너 -->
	<div class="owl-carousel header-carousel position-relative">
		<div class="owl-carousel-item position-relative">
			<img class="img-fluid"
				src="https://www.showala.com/data/banner/sz4ZpjfPra" alt="">
		</div>
		<div class="owl-carousel-item position-relative">
			<img class="img-fluid"
				src="https://www.showala.com/data/banner/YGBqCTfZbJ" alt="">
		</div>
		<div class="owl-carousel-item position-relative">
			<img class="img-fluid"
				src="https://www.showala.com/data/banner/H6C1OQZwKa" alt="">
		</div>
		<div class="owl-carousel-item position-relative">
			<img class="img-fluid"
				src="https://www.showala.com/data/banner/p0CaeINEVP" alt="">
		</div>
		<div class="owl-carousel-item position-relative">
			<img class="img-fluid"
				src="https://www.showala.com/data/banner/v8bWEaU4GO" alt="">
		</div>
	</div>


	<!-- 검색바 -->
	<div class="box">
		<div class="container-2">
			<span class="icon"><i class="fa fa-search"></i></span> <input
				type="search" id="search" placeholder="Search..." />
		</div>
	</div>


	<!-- 일반전시회 카테고리 -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h6 class="section-title bg-white text-center text-primary px-3">Category</h6>
				<h1 class="mb-5 text-center">일반 전시회</h1>
			</div>
			<div class="row g-4 justify-content-center">
				<c:forEach var="vo" items="${list2 }" begin="1" end="4" step="1">
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="course-item bg-white">
							<div class="position-relative overflow-hidden">
								<img class="img-fluid" src="${vo.poster }" alt="">
							</div>
							<div class="text-center p-4 pb-0">
								<h5 class="mb-4">${vo.title }</h5>
								<div class="smm-4">
									<h6 class="sm-4">${vo.period }</h6>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- 무역전시회 카테고리 -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h6 class="section-title bg-white text-center text-primary px-3">Category</h6>
				<h1 class="mb-5 text-center">무역 전시회</h1>
			</div>
			<div class="row g-4 justify-content-center">
				<c:forEach var="vo" items="${list3 }" begin="4" end="7" step="1">
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="course-item bg-white">
							<div class="position-relative overflow-hidden">
								<img class="img-fluid" src="${vo.poster }" alt="">
							</div>
							<div class="text-center p-4 pb-0">
								<h5 class="mb-4">${vo.title }</h5>
								<div class="smm-4">
									<h6 class="sm-4">${vo.period }</h6>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- 미술관 카테고리 -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h6 class="section-title bg-white text-center text-primary px-3">미술관</h6>
				<h1 class="mb-5 text-center">미술관</h1>
			</div>
			<div class="row g-4 justify-content-center">
				<c:forEach var="vo" items="${list }" begin="1" end="4" step="1">
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="course-item bg-white">
							<div class="position-relative overflow-hidden">
								<img class="img-fluid" src="${vo.image }" alt="">
							</div>
							<div class="text-center p-4 pb-0">
								<h5 class="mb-4">${vo.title }</h5>
								<div class="smm-4">
									<h6 class="sm-4">${vo.name }</h6>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- 프로모션 카테고리 -->
	<div class="container-xxl py-5 category">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h6 class="section-title bg-white text-center text-primary px-3">이번달
					이벤트</h6>
				<h1 class="mb-5 text-center">얼리버드 및 관람후기 프로모션</h1>
			</div>
			<div class="row g-3">
				<div class="col-lg-7 col-md-6">
					<div class="row g-3">
						<div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
							<a class="position-relative d-block overflow-hidden" href="">
								<img class="img-fluid" src="../img/cat-1.png" alt="">
								<div
									class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
									style="margin: 0px;">
									<i class="fa-solid fa-arrow-right"></i>
									<!-- <h5 class="m-0">Web Design</h5> -->
									<!--   <small class="text-primary">49 Courses</small> -->
								</div>
							</a>
						</div>
						<div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
							<a class="position-relative d-block overflow-hidden" href="">
								<img class="img-fluid" src="../img/cat-2.png" alt="">
								<div
									class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
									style="margin: 0px;">
									<i class="fa-solid fa-arrow-right"></i>
									<!-- <h5 class="m-0">Web Design</h5> -->
									<!--   <small class="text-primary">49 Courses</small> -->
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-md-6 wow zoomIn" data-wow-delay="0.7s"
					style="min-height: 350px;">
					<a class="position-relative d-block h-100 overflow-hidden" href="">
						<img class="img-fluid position-absolute w-100 h-100"
						src="../img/cat-3.png" alt="" style="object-fit: cover;">
						<div
							class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
							style="margin: 0px;">
							<i class="fa-solid fa-arrow-right"></i>
							<!-- <h5 class="m-0">Online Marketing</h5>-->
							<!-- <small class="text-primary">49 Courses</small>-->
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>





	<!-- 인기랭킹 -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h6 class="section-title bg-white text-center text-primary px-3">이번달
					전시</h6>
				<h1 class="mb-5 text-center">전시 랭킹 TOP4</h1>
			</div>
			<div class="row g-4">
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">

					<div class="overflow-hidden">
						<img class="img-fluid" src="../img/poster1.jpg" alt="">
					</div>
					<div class="position-relative d-flex justify-content-center"
						style="margin-top: -23px;">
						<!-- <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div> -->


						<div class="text-center p-4">
							<h5 class="mb-0">핀란드디자인</h5>
							<small>2019.12.21 ~ 2020.5.10</small>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<!--<div class="team-item bg-light">-->
					<div class="overflow-hidden">
						<img class="img-fluid" src="../img/poster2.jpg" alt="">
					</div>
					<div class="position-relative d-flex justify-content-center"
						style="margin-top: -23px;">
						<!-- 
                            <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                             -->
					</div>
					<div class="text-center p-4">
						<h5 class="mb-0">이탈리아 디자인의 거장, 카스틸리오니</h5>
						<small>2022.1.17 ~ 2022.4.26</small>
						<!-- </div> -->
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">

					<div class="overflow-hidden">
						<img class="img-fluid" src="../img/poster3.jpg" alt="">
					</div>
					<div class="position-relative d-flex justify-content-center"
						style="margin-top: -23px;">
						<!-- 
                            <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                             -->

						<div class="text-center p-4">
							<h5 class="mb-0">Statue Garden</h5>
							<small>2022.1.21 ~ 2022.1.31</small>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">

					<div class="overflow-hidden">
						<img class="img-fluid" src="../img/poster4.jpg" alt="">
					</div>
					<div class="position-relative d-flex justify-content-center"
						style="margin-top: -23px;">
						<!-- 
                            <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                             -->
						<div class="text-center p-4">
							<h5 class="mb-0">서양인이 그린 우리 땅 우리 삶</h5>
							<small>2017.10.27 ~ 2018.2.28</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Team End -->


	<!-- 전시회 리뷰 -->
	<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container">
			<div class="text-center">
				<h6 class="section-title bg-white text-center text-primary px-3">전시관람
					후기</h6>
				<h1 class="mb-5">리뷰 서브 타이틀</h1>
			</div>
			<div class="owl-carousel testimonial-carousel position-relative">
				<div class="testimonial-item text-center">
					<img class="border rounded-circle p-2 mx-auto mb-3"
						src="../img/testimonial-1.jpg" style="width: 80px; height: 80px;">
					<h5 class="mb-0">WATSON, THE MAESTRO-알버트 왓슨 사진전</h5>
					<p>손현진</p>
					<div class="testimonial-text bg-light text-center p-4-1">
						<p class="mb-0">패션 관련 전시가 전혀 아니고 마틴 마르지엘라 님의 깊고 심오한 예술세계를 볼 수
							있는 현대미술 같은 전시입니다.</p>
					</div>
				</div>
				<div class="testimonial-item text-center">
					<img class="border rounded-circle p-2 mx-auto mb-3"
						src="../img/testimonial-2.jpg" style="width: 80px; height: 80px;">
					<h5 class="mb-0">MARTIN MARGIELA AT LOTTE MUSEUM</h5>
					<p>김선우</p>
					<div class="testimonial-text bg-light text-center p-4-1">
						<p class="mb-0">패션 관련 전시가 전혀 아니고 마틴 마르지엘라 님의 깊고 심오한 예술세계를 볼 수
							있는 현대미술 같은 전시입니다.</p>
					</div>
				</div>
				<div class="testimonial-item text-center">
					<img class="border rounded-circle p-2 mx-auto mb-3"
						src="../img/testimonial-3.jpg" style="width: 80px; height: 80px;">
					<h5 class="mb-0">WATSON, THE MAESTRO-알버트 왓슨 사진전</h5>
					<p>김남훈</p>
					<div class="testimonial-text bg-light text-center p-4-1">
						<p class="mb-0">패션 관련 전시가 전혀 아니고 마틴 마르지엘라 님의 깊고 심오한 예술세계를 볼 수
							있는 현대미술 같은 전시입니다.</p>
					</div>
				</div>
				<div class="testimonial-item text-center">
					<img class="border rounded-circle p-2 mx-auto mb-3"
						src="../img/testimonial-4.jpg" style="width: 80px; height: 80px;">
					<h5 class="mb-0">MARTIN MARGIELA AT LOTTE MUSEUM</h5>
					<p>최선형</p>
					<div class="testimonial-text bg-light text-center p-4-1">
						<p class="mb-0">어렵고도 재미있는 현대미술. 패션계 마틴 마르지엘라가 아닌 예술가 마틴 마르지엘라를
							만나볼 수 있었던 전시입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
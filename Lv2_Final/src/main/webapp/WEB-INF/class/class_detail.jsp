<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<link rel="styleSheet" href="../Content/app3/css/login/login_pc.css">
<link rel="styleSheet" href="../Content/app3/css/talent/detail.css">
<link rel="styleSheet" href="../Content/app3/css/talent/photo_review.css">
<link rel="styleSheet" href="../Content/app3/css/talent/respond.css">
<link rel="styleSheet" href="../Content/app3/css/aegrenner.css">
<link rel="styleSheet" href="../Content/app3/css/common.css">
<link rel="styleSheet" href="../Content/app3/css/footer_pc.css">
<link rel="styleSheet" href="../Content/app3/css/header.css">
<link rel="styleSheet" href="../Content/app3/css/index.css">
<link rel="styleSheet" href="../Content/app3/css/jquery.mCustomScrollbar.css">
<link rel="styleSheet" href="../Content/app3/css/notokr.css">
<link rel="styleSheet" href="../Content/app3/css/swiper.min.css">
<link rel="stylesheet" href="../Content/app3/css/class_detail.css">
<link rel="stylesheet" href="../Content/app3/css/class_detail2.css">
<style type="text/css">
.regi {
	width: 70%;
	height: 48px;
	margin-top: 10px;
	margin-right: 0px;
	padding: 10px 50px;
	background: #45c5c5;
	border-radius: 10px;
}

.regifont {
	color: white;
}

.chat {
	width: 80%;
	height: 48px;
	margin-top: 10px;
	margin-right: 0px;
	padding: 10px 80px;
	border: 1px solid #45c5c5;
	border-radius: 10px;
}

#regionAll, #inwon {
	color: #45c5c5;
}
.th{
	background-color:#45c5c5;
	color:white;
}
.info_item:hover{
  background:#eaeaea;
}
</style>
</head>
<body>
	<!-- main -->
	<main id="wrap" class="detail">
		<div class="p2p_class_wrap">
			<div class="p2p_class_container">
				<!-- 수업명, 튜터이름, 별점 -->
				<section class="p2p_class_info">
					<!-- 오프라인, 온라인 라이브 수업 : 모든 정보 노출 -->
					<ul class="p_info_sum">
						<li id="regionAll" v-if test="{{class_detail.onoff!=null}}">{{class_detail.onoff}}</li>
						<li id="inwon">{{class_detail.inwon}}</li>
						<!-- 녹화영상, 전자책 수업 : 진행방식만 노출 -->
					</ul>
					<h1 class="p_title">{{class_detail.title}}</h1>

					<div class="p2p_tutor_info">
						<!-- <div class="tutor_img">
							<img :src="class_detail.tutor_info_img">
						</div> -->
						<!-- <div class="short_info">
							<em class="t_nickname">{{class_detail.tutor_info_nickname}}</em>
							<span class="class_review">
							<i class="star_img">
							<img src="../images/star.png" style="width: 15px; height: 15px">
							</i> 
							<p>{{class_detail.tutor_info_grade_total}}</p>
							
							</span>
						</div> -->
						<div>
						   <div class="tutor_img" style="float:left;margin:0 10px 0 0;">
							<img :src="class_detail.tutor_info_img">
						   </div>
						   <div >
						     <span style="">{{class_detail.tutor_info_nickname}}</span>
						     <div style="display:flex;align-items:center;">
						       <img src="../images/star.png" style="width: 15px; height: 15px">&nbsp;
						       <span>{{class_detail.tutor_info_grade_total}}</span>
						     </div>
						   </div>  
						</div>
					</div>
				</section>
				<!--// 수업명, 튜터이름, 별점 -->

				<!-- 수업 이미지 -->
				<section class="p2p_class_img">
					<!-- Swiper -->
					<div class="img_slied_area">
						<!-- gallery-thumbs -->
						<table class="table">
							<tr>
								<td><img :src="class_detail.image"></td>
							</tr>
						</table>
						<!-- // gallery-thumbs -->
					</div>
					<!--//swiper_wrapper-->
				</section>
				<!--//p2p_class_img-->
				<!--// 수업 이미지 -->

				<div class="detail_wrap">
					<!-- 수업전 숙지해주세요. -->
					<section class="p2p_class_notice" v-if
						test="{{class_detail.notice!=null }}">
						<div class="p_col_left">
							<p class="col_title">클래스 전 숙지해주세요!</p>
						</div>
						<div class="p_col_right">
							<div class="text_wrap">

								<p class="text_area">{{class_detail.notice}}</p>
								<span class="badge_noti">튜터 공지</span>
							</div>
						</div>
						<!--//p2p_class_notice-->
					</section>
					<!--// 수업전 숙지해주세요. -->

					<!-- 클래스 요약 -->
					<section class="sec_common" v-if
						test="{{class_detail.summary!=null }}">
						<div class="p_col_left">
							<p class="col_title">클래스 요약</p>
						</div>
						<div class="p_col_right">
							<div class="text_wrap">
								<p class="text_area">{{class_detail.summary}}</p>
							</div>
						</div>
						<!--//p2p_class_notice-->
					</section>
					<!-- // 클래스 요약 -->

					<!-- 이런 분들이 들으면 좋아요. -->
					<section class="sec_common p2p_class_target">
						<div class="p_col_left">
							<p class="col_title">이런 분들이 들으면 좋아요.</p>
						</div>
						<!--//p_col_left-->
						<div class="p_col_right">
							<div class="text_wrap">
								<p class="text_area">{{class_detail.target}}</p>
							</div>
						</div>
					</section>
					<!--// 이런 분들이 들으면 좋아요. -->

					<!-- 튜터님을 소개합니다. -->
					<section class="idx sec_common p2p_tutor_intro">
						<div class="p_col_left">
							<p class="col_title">튜터님을 소개합니다.</p>
						</div>
						<div class="p_col_right">
							<div class="tutor_info_profile">
								<div class="profile_img">
									<img :src="class_detail.tutor_info_img"
										onerror="profileImgError(this, 1)" alt="">
								</div>
								<div class="profile_text">
									<p class="name">{{class_detail.tutor_info_nickname}}</p>
								</div>
							</div>
							<div class="text_wrap">
								<p class="text_area">{{class_detail.tutor_intro}}</p>
							</div>
						</div>
					</section>
					<!--// 튜터님을 소개합니다. -->

					<!-- 어떤 수업인가요? -->
					<section class="idx sec_common p2p_class_intro">
						<div class="p_col_left">
							<p class="col_title">어떤 클래스 인가요?</p>
						</div>
						<!--//p_col_left-->
						<div class="p_col_right">
							<div class="text_wrap  ">
								<p class="text_area">{{class_detail.class_intro}}</p>
							</div>
						</div>
					</section>
					<!--// 어떤 수업인가요? -->

					<!-- 수업은 이렇게 진행됩니다 -->
					<section class="idx sec_common p2p_class_curri" v-if test="{{class_detail.class_curri!=null }}">
						<div class="p_col_left">
							<p class="col_title">클래스는 이렇게 진행됩니다.</p>
						</div>
						<!--//p_col_left-->
						<div class="p_col_right">
							<div class="text_wrap  ">
								<div class="text_area">
									<div class="multi_class_list">
										<p class="curri_details">{{class_detail.class_curri}}</p>
										<div class="curri_img"></div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<section class="idx sec_common review">
						<div class="p_col_left">
							<p class="col_title">실제 수강생들의 리뷰입니다.</p>
						</div>
						<!--//p_col_left-->
						<div class="p_col_right">
							<div class="text_wrap  ">
								<div class="text_area">
			                            <table class="review-table table-hover">
			                              <thead>
			                                 <tr>
			                                    <th scope="col" class="text-center th">번호</th>
			                                    <th scope="col" class="text-center th">내용</th>
			                                    <th scope="col" class="text-center th">작성자</th>
			                                    <th scope="col" class="text-center th">작성일</th>
			                                  </tr>
			                                </thead>
			                                <tbody>
			                                 <c:forEach var="vo" items="${rList }">
			                                  <tr>
			                                    <td class="text-center">${vo.rno}</td>
			                                    <td class="text-center">${vo.content}</td>
			                                    <td class="text-center">${vo.id}</td>
			                                    <td class="text-center">${vo.dbday }</td>
			                                  </tr>
			                                 </c:forEach>
			                                 <tr>
			                                   <input type=button class="btn btn-lg" value="후기 작성" style="margin:0 0 10px 0;padding:5px 10px;float:right;background-color:#45c5c5;color:white">
			                                 </tr>
			                               </tbody>
			                              </table>								 
										</div>
									</div>
								</div>
							</section>
 						</div>
					</div>
					<!--//수업은 이렇게 진행됩니다 -->
			<!--//p2p_class_container -->
			<!-- pc 수업 신청 부분 -->
			<aside class="sticky_area">
				<div class="sticky_navi">
					<h2>클래스 일정</h2>
					<ul
						class="schedule_list mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar"
						style="overflow: visible;">
						<div id="mCSB_1"
							class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
							style="max-height: none;" tabindex="0">
							<div id="mCSB_1_container"
								class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
								style="position: relative; top: 0; left: 0;" dir="ltr">
								<!-- <li v-if test="{{class_detail.schedule!=null }}"> -->
								  <div class="info_item" v-for="(s,index) in class_detail.schedule.split('^')" style="margin:0 auto;width:90%;">   <!-- {{class_detail.schedule.split("^")}} -->
									<div style="width:90%;">
									  <span class="c_schedule">{{s}}</span> <!--다회차 수업일 경우--> (<span class="c_location" style="font-weight:bold;">{{class_detail.location[index]}}</span>)
									</div>
									<span class="c_place" style="width:100%;color:gray;">{{class_detail.place[index]}}</span>
									<hr style="border-top:1px solid gray; margin:10px 0;">
								  </div>	
								<!-- </li> -->
							</div>
						</div>
						<div id="mCSB_1_scrollbar_vertical"
							class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
							style="display: none;">
							<div class="mCSB_draggerContainer">
								<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
									style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
									<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
								</div>
								<div class="mCSB_draggerRail"></div>
							</div>
						</div>
					</ul>
					<p class="price_info">
						<span class="per">{{class_detail.perprice}}</span> <span
							class="total"> <b>{{class_detail.totalprice}}</b></span>
					</p>

					<table class="table">
						<!-- 찜 -->
						<tr>
							<td class="text-center">
								<ul class="btn_area">
									<li><c:if test="${sessionScope.mvo.id==null }">
											<button onclick="alert('로그인이 필요합니다');">
												<img src="../images/heartoff32px.png" :title="class_detail.jjim_count+'명이 찜한 수업입니다'">
											</button>
										</c:if> 
										<c:if test="${sessionScope.mvo.id!=null }">
											<c:if test="${jjim_count==0}">
												<a href="#"></a>
												<img src="../images/heartoff32px.png">
											</c:if>
											<c:if test="${jjim_count!=0 }">
												<img src="../images/hearton32px.png">
											</c:if>
										</c:if></li> &nbsp;&nbsp;
									<!-- 수업신청 -->
									<li class="regi text-center"
										style="width: 100%; height: 48px; margin-top: 10px; margin-right: 0;">
										<c:if test="${sessionScope.mvo.id==null }">
											<button onclick="alert('로그인이 필요합니다');" class="regifont">클래스 신청하기</button>
										</c:if> 
										<c:if test="${sessionScope.mvo.id!=null }">
											<a :href="'../reserve/reserve.do?cno='+class_detail.cno">
											<button style="background-color: #45c5c5" class="regifont">클래스신청하기</button></a>
										</c:if>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td>
								<ul class="btn_area">
									<!-- 실시간채팅 -->
									<li class="chat"
										style="width: 100%; height: 48px; margin-top: 10px; margin-right: 0;">
										<c:if test="${sessionScope.mvo.id==null }">
											<button onclick="alert('로그인이 필요합니다');">
												<img src="../images/chat32px.png">&nbsp;&nbsp;실시간 채팅
											</button>
										</c:if> 
										<c:if test="${sessionScope.mvo.id!=null }">
											<button onclick="location.href='#'">
												<img src="../images/chat32px.png">&nbsp;&nbsp;실시간 채팅
											</button>
										</c:if>
									</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
			</aside>
			<!--// pc 수업 신청 부분 끝-->
		</div>
		<!--//p2p_class_wrap-->
	</main>
	<script>
	  new Vue({
		  el:'.detail',
		  data:{
			  cno:${cno},
	  		  class_detail:{}
		  },
		  mounted:function(){
			  let _this=this
			  axios.get('../class/class_detail_vue.do',{
				  params:{
					  cno:_this.cno,
					  schedule:_this.schedule
				  }
			  }).then(function(response){
				  console.log(response.data)
				  _this.class_detail=response.data
			  })
		  }
	  })
	</script>
	

</body>
</html>
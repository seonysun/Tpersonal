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
	
	<div style="width:80%;float:left;padding-left:20px;padding-top:10px">
	  <div class="rows rowss">
	    <div style="height:500px;">
		  <p style="height: 20px;">
		  	<strong>신청한 클래스</strong> 목록입니다. 클래스 중에 궁금한 점이 있으면 <strong>Q&amp;A</strong>로 물어보세요.<br>
			<input type=hidden size=15 class=input-sm ref="sid" value="${sessionScope.mvo.id }">
		  </p>
		  <p style="margin:0px 5px 10px 10px">&gt; 총 <span style="font-size: 20px;font-weight: 600;color: #45c5c5">{{class_count}}</span>개의 클래스</p>
		  <div v-if="class_count==0" class="text-center">
		  	<p style="font-size:20px">
		  		신청한 클래스가 없습니다. <br>
		  		다양한 클래스를 구경해보세요! <br>
		  		<a href="../main/main.do" class="mintBtn_m" style="font-size:15px;width:200px;height:100px;padding:10px;margin-top:10px">클래스 구경가기</a>
		  	</p>
		  </div>
		  <div v-if="class_count>0">
			  <ul class="tutee_list">
			    <li style="width: 350px" v-for="vo in class_list">
			      <div class="thumb_box">
			        <a :href="'../class/class_detail.do?cno='+vo.cno"><img :src="vo.image" style="width: 350px;height: 200px"></a>
			      </div>
			      <div class="text_box">
			        <a :href="'../class/class_detail.do?cno='+vo.cno" class="title">{{vo.title}}</a>
	<!-- 			      <div class="course_info"> -->
	<!-- 			       <p class="tutor"> -->
	<!-- 			       	<span class="profile"> -->
	<!-- 			       		<img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/Profile/s_1077c649d31a6a3dde112f75b085a151c7b568ff.jpg" alt=""> -->
	<!-- 			       	</span> -->
	<!-- 			       	튜터이름(튜터닉네임) 튜터 -->
	<!-- 			       </p> -->
	<!-- 			      </div> -->
	<!-- 			      <div class="progress_box"> -->
	<!-- 			       <div class="progress_bar"> -->
	<!-- 			        <div class="bar" style="width: 0%;"></div> -->
	<!-- 			       </div><span class="play_time">0% 수강</span><span class="due_date ">만료까지 71일 남았어요!</span> -->
	<!-- 			      </div> -->
				      <div>
				      	<table class="table text-center">
				      	  <tr>
				      	  	<th width=20%>일정</th>
				      	  	<td width=80%>{{vo.schedule}}</td>
				      	  </tr>
				      	  <tr>
				      	  	<th width=20%>장소</th>
				      	  	<td width=80%>{{vo.place}}</td>
				      	  </tr>
				      	  <tr>
				      	  	<th width=30%>{{vo.inwon}}명</th>
				      	  	<td width=70%>{{vo.totalprice}}원</td>
				      	  </tr>
				      	</table>
				      </div>
				      <div class="btn_box">
				       <span class="btn btn_intro"><a :href="'../class/class_detail.do?cno='+vo.cno">강의 상세</a></span>
				       <span class="btn btn_intro"><a :href="'../class/class_detail.do?cno='+vo.cno"><i class="icon"></i>리뷰 작성</a></span>
				      </div>
			      </div>
			    </li>
			  </ul>
		  </div>
	    </div>
	    <div style="height: 10px"></div>
			<div class="text-center" v-if="totalpage>0">
	         <span class="mintBtn presspoint" @click="prev()">이전</span>
		         {{curpage}} / {{totalpage}} 
	         <span class="mintBtn presspoint" @click="next()">다음</span>
	      	</div>
		<div style="height: 20px"></div>
	  </div>
	</div>
</div>
<script>
	new Vue({
		el:'.rowss',
		data:{
			class_list:[],
			sessionId:'',
			curpage:1,
			totalpage:0,
			class_count:0,
			class_detail:{}
		},
		mounted:function(){
			this.send()
		},
		methods:{
			send:function(){
				this.sessionId=this.$refs.sid.value
				let _this=this
				axios.get('../mypage/my_reserve_vue.do',{
					params:{
						page:this.curpage,
						id:this.sessionId
					}
				}).then(function(response){
					console.log(response.data)
					_this.class_list=response.data
					_this.curpage=response.data[0].curpage
					_this.totalpage=response.data[0].totalpage
					_this.class_count=response.data[0].count
				})
			},
			prev:function(){
		    	this.curpage=this.curpage>1?this.curpage-1:this.curpage
		        this.send()
		    },
		    next:function(){
		        this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
		        this.send()               
		    }
// 			reservedetail:function(cno){
// 				let _this=this
// 				axios.get('../mypage/reserve_class_vue.do',{
// 					params:{
// 						cno:cno
// 					}
// 				}).then(function(response){
// 					console.log(response.data)
// 					_this.class_detail=response.data
// 				})
// 			}
		}
	})
</script>
</body>
</html>
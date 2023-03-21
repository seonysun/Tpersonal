<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/> -->
<!-- <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/> -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<link rel="stylesheet" href="../Content/app3/css/mypage.css">
<link rel="stylesheet" href="../Content/app3/css/common.css">
<link rel="stylesheet" href="../Content/app3/css/index.css">

</head>
<body>
<div class="container">
	<jsp:include page="../adminpage/header.jsp"></jsp:include>
	
	<div style="width:20%;height:100%;padding:5px;float:left">
		<jsp:include page="../adminpage/menu.jsp"></jsp:include>
	</div>
	
	<div style="width:40%;float:left;margin-top:10px">
		<tutorlist :tutordata='tutor_list' :curpage='curpage' :totalpage='totalpage'></tutorlist>
	</div>
	<div style="width:40%;float:left;margin-top:40px" v-if="isShow">

		<div class="talent_area">
		  <div class="talent_box">
		   <div class="talent_list swiper-container swiper_this_week swiper-container-initialized swiper-container-horizontal swiper-container-free-mode" data-number="1">
			  <ul class="tutee_list talent_box swiper-wrapper" style="padding-left: 25px">
			    <li class="swiper-slide swiper-slide-active" style="width: 320px" v-for="tvo in tutor_class">
			      <div class="thumb_box">
			        <a :href="'../class/class_detail.do?cno='+tvo.cno"><img :src="tvo.image"></a>
			      </div>
			      <div class="text_box">
			        <a :href="'../class/class_detail.do?cno='+tvo.cno" class="title">{{tvo.title}}</a>
				      <div>
				      	<table class="table text-center">
				      	  <tr>
				      	  	<th width=20%>일정</th>
				      	  	<td width=80%>{{tvo.schedule}}</td>
				      	  </tr>
				      	  <tr>
				      	  	<th width=20%>장소</th>
				      	  	<td width=80%>{{tvo.location}}</td>
				      	  </tr>
				      	  <tr>
				      	  	<th width=20%>가격</th>
				      	  	<td width=70%>{{tvo.perprice}}</td>
				      	  </tr>
				      	</table>
				      </div>
			      </div>
			      <button type="button" class="btn_swiper swiper-button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button> <button type="button" class="btn_swiper swiper-button-next swiper-button-disabled" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button> <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span> <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
			    </li>
			  </ul>
		   </div>
		  </div>
		</div>
  
	</div>
</div>
<script>
	let eventBus=new Vue()
	Vue.component('tutorlist',{
		props:['tutordata','curpage','totalpage'],
		template:'<table class=table style="border-color:white">'
			+'<tr>'
			+'<td>'
			+'<table class=table v-for="vo in tutordata">'
			+'<tr>'
			+'<td width=30% class=text-center rowspan=3>'
			+'<img :src="vo.image" style="width: 80px;height: 80px" class="img-circle images" v-on:click="showClass(vo.id)">'
			+'</td>'
			+'<td width=20% style="font-weight:bold">닉네임</td>'
			+'<td width=80% style="color:#45c5c5;font-weight:bold">{{vo.nickname}}</td>'
			+'</tr>'
			+'<tr>'
			+'<td width=20% style="font-weight:bold">이름</td>'
			+'<td width=80%>{{vo.name}}</td>'
			+'</tr>'
			+'<tr>'
			+'<td width=20% style="font-weight:bold">번호</td>'
			+'<td width=80%>{{vo.tel}}</td>'
			+'</tr>'
			+'</table>'
			+'</td>'
			+'</tr>'
			+'<tr>'
			+'<td class=text-center>'
			+'<span class="mintBtn presspoint" v-on:click="this.$parent.prev">이전</span>'
			+' {{curpage}} / {{totalpage}} '
			+'<span class="mintBtn presspoint" v-on:click="this.$parent.next">다음</span>'
			+'</td>'
			+'</tr>'
			+'</table>',
		methods:{
			showClass:function(value){
				eventBus.$emit('showClassEvent', value)
			}
		}
	})
	new Vue({
		el:'.container',
		data:{
			tutor_list:[],
			curpage:1,
			totalpage:0,
			tutor_id:'',
			tutor_class:[],
			isShow:false
		},
		mounted:function(){
			this.send()
		},
		updated:function(){
			let _this=this
			eventBus.$on('showClassEvent', function(value){
				_this.tutor_id=value
				_this.isShow=true
				axios.get('../adminpage/tutor_class_vue.do',{
					params:{
						id:_this.tutor_id
					}
				}).then(function(response){
					console.log(response.data)
					_this.tutor_class=response.data
				})
			})
		},
		methods:{
			send:function(){
				let _this=this
				axios.get("../adminpage/tutor_list_vue.do",{
					params:{
						page:this.curpage
					}
				}).then(function(response){
					console.log(response.data)
					_this.tutor_list=response.data
					_this.curpage=response.data[0].curpage
					_this.totalpage=response.data[0].totalpage
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
		}
	})
</script>
</body>
</html>
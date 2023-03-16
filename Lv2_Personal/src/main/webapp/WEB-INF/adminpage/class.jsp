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

</head>
<body>
<div class="container">
	<jsp:include page="../adminpage/header.jsp"></jsp:include>
	
	<div style="width:20%;height:100%;padding:5px;float:left">
		<jsp:include page="../adminpage/menu.jsp"></jsp:include>
	</div>
	
	<div style="width:80%;float:left;padding-left:20px">
	  <div class=rows>
	  	<p style="height: 30px">
			튜터들이 <strong>새롭게 등록한 클래스</strong> 목록입니다.<br>
			<input type=hidden size=15 class=input-sm ref="sid" value="${sessionScope.mvo.id }">
		</p>
		<div>
			<div class="class-box" v-for="vo in class_list">
				<div class="class-info " style="position: relative;padding-top:10px;padding-bottom:10px">
					<a :href="'../class/class_detail.do?cno='+vo.cno">
						<img class="image" style="width:200px;height:120px" :src="vo.image">
					</a>
					<div class="information-box">
						<h3><a :href="'../class/class_detail.do?cno='+vo.cno">{{vo.title}}</a></h3>
						<div class="stars-box">
							<font class="class-type">원데이 수업&nbsp;&nbsp;|&nbsp;&nbsp;{{vo.tutor_info_nickname}}</font>
						</div>
						<div class="start-date">
							<font>수업 장소 : {{vo.location}}</font>
						</div>
                        <div class="price">
                        	<font>￦</font>{{vo.perprice}}<span class="hour_unit">/시간</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        	<span class="mintBtn" v-on:click="classcon(vo.cno)">강의 승인</span>
                        </div>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 10px"></div>
		
		<div class="text-center" v-if="totalpage>0">
         <input type="button" class="mintBtn" value="이전" @click="prev()">
         {{curpage}} / {{totalpage}} 
         <input type="button" class="mintBtn" value="다음" @click="next()">
      	</div>
		<div style="height: 10px"></div>
	  </div>
	</div>
</div>
<script>
	new Vue({
		el:'.container',
		data:{
			class_list:[],
			curpage:1,
			totalpage:0
		},
		mounted:function(){
			this.send()
		},
		methods:{
			send:function(){
				let _this=this
				axios.get("http://localhost/web/adminpage/class_list_vue.do",{
					params:{
						page:this.curpage
					}
				}).then(function(response){
					console.log(response.data)
					_this.class_list=response.data
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
		    },
			classcon:function(cno){
				if(confirm('선택한 수업을 메인에 노출하시겠습니까?\n클릭 즉시 강의 리스트가 업데이트됩니다')){
					axios.get("http://localhost/web/adminpage/class_ok_vue.do",{
						params:{
							cno:cno
						}
					}).then(function(response){
						location.href="../adminpage/class.do"
					})
				}
			}
		}
	})
</script>
</body>
</html>
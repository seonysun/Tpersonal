<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<div style="width:80%;float:left;padding-left:20px;margin-top:10px">
	  <div class=rows>
		<div style="height: 480px">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<th width="15%" class="text-center">프로필</th>
					<th width="15%" class="text-center">닉네임</th>
					<th width="30%" class="text-center">아이디</th>
					<th width="15%" class="text-center">이름</th>
					<th width="15%" class="text-center">튜터승인</th>
					<th width="10%" class="text-center">관리</th>
				</tr>
				<tr style="vertical-align: middle;" v-for="vo in member_list">
					<td width="15%" class="text-center origin">
						<img :src="vo.image" style="height: 40px;border-radius: 50px">
					</td>
					<td width="15%" class="text-center origin" style="line-height: 35px">{{vo.nickname}}</td>
					<td width="30%" class="text-center origin" style="line-height: 35px">{{vo.id}}</td>
					<td width="15%" class="text-center origin" style="line-height: 35px">{{vo.name}}</td>
					<td width="15%" class="text-center origin" style="line-height: 35px" v-if="vo.tutor=='y'">
						<img src="../images/checkg.png" style="height: 15px;margin: 10px">
					</td>
					<td width="15%" class="text-center origin" style="line-height: 35px" v-if="vo.tutor=='n'">
						<span class="presspoint" v-on:click="tutorups(vo.id)">학생회원</span>
					</td>
					<td width="10%" class="text-center origin">
						<span class="presspoint" v-on:click="memberDelete(vo.id)">
							<img src="../images/memdel2.png" style="height: 15px;margin: 10px">
						</span>
					</td>
				</tr>
			</table>
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
	
	<template>
		<b-modal ref="tutor_up" title="튜터 신청 정보" hide-footer>
		  <div>
		  	<table class=table>
		  	  <tr>
		  	  	<td width=20% style="font-weight: bold">이름</td>
		  	  	<td width=50%>{{member_detail.name}}</td>
		  	  	<td width=30% rowspan=4 class=text-center>
		  	  		<img :src="member_detail.image">
		  	  	</td>
		  	  </tr>
		  	  <tr>
		  	  	<td width=20% style="font-weight: bold">ID</td>
		  	  	<td width=50%>{{member_detail.id}}</td>
		  	  </tr>
		  	  <tr>
		  	  	<td width=20% style="font-weight: bold">닉네임</td>
		  	  	<td width=50%>{{member_detail.nickname}}</td>
		  	  </tr>
		  	  <tr>
		  	  	<td width=20% style="font-weight: bold">전화번호</td>
		  	  	<td width=50%>{{member_detail.tel}}</td>
		  	  </tr>
		  	  <tr>
		  	  	<td colspan=2>
		  	  		<p>{{member_detail.intro}}</p>
		  	  	</td>
		  	  </tr>
		  	</table>
		  </div>
		  <div class="text-center">
		    <b-button variant="info" inline @click="tutorok">튜터 승인</b-button>
		    <b-button variant="outline-info" inline @click="hide">취소</b-button>
		  </div>
		</b-modal>
	</template>
</div>
<script>
	new Vue({
		el:'.container',
		data:{
			member_list:[],
			curpage:1,
			totalpage:0,
			stu_id:'',
			member_detail:{}
		},
		mounted:function(){
			this.send()
		},
		methods:{
			send:function(){
				let _this=this
				axios.get("../adminpage/member_list_vue.do",{
					params:{
						page:this.curpage
					}
				}).then(function(response){
					console.log(response.data)
					_this.member_list=response.data
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
			tutorups:function(stu){
				this.$refs['tutor_up'].show()
				this.stu_id=stu
				let _this=this
				axios.get("../adminpage/member_detail_vue.do",{
					params:{
						id:stu
					}
				}).then(function(response){
					console.log(response.data)
					_this.member_detail=response.data
				})
			},
			tutorok:function(){
				let _this=this
				axios.get("../adminpage/tutor_ok_vue.do",{
					params:{
						id:_this.stu_id
					}
				}).then(function(response){
					location.href="../adminpage/member.do"
				})
			},
			hide:function(){
				this.$refs['tutor_up'].hide()
			},
			memberDelete:function(id){
				if(confirm('정말로 탈퇴 처리 하시겠습니까?\n삭제 내역은 복구되지 않습니다')){
					axios.get('../adminpage/member_delete_vue.do',{
						params:{
							id:id
						}
					}).then(function(response){
						location.href="../adminpage/member.do"
					})
				}
			}
		}
	})
</script>
</body>
</html>
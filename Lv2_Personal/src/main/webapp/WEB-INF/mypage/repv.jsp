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
	
	<div style="width:80%;float:left;padding-left:20px;margin-top:10px">
	  <div class="rows rowss">
		 <b-tabs content-class="mt-3">
		  <b-tab title="나의 리뷰" active>
		<div style="height:500px;">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<input type=hidden size=15 class=input-sm ref="id" value="${sessionScope.mvo.id }">
					<th width="15%" class="text-center">게시물번호</th>
					<th width="60%" class="text-center">리뷰</th>
					<th width="15%" class="text-center">작성일</th>
					<th width="10%" class="text-center">삭제</th>
				</tr>
				<tr style="vertical-align: middle;" v-for="vo in re_list">
					<td width="10%" class="text-center origin">{{vo.rno}}</td>
					<td width="60%" class="origin"><a :href="'../class/class_detail.do?cno='+vo.cno">{{vo.content}}</a></td>
					<td width="15%" class="text-center origin">{{vo.dbday}}</td>
					<td width="10%" class="text-center origin">
						<span class="presspoint" v-on:click="reviewDelete(vo.rno)">
							<img src="../images/del.png" style="height: 15px;margin: 4px 10px;">
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
	  	  </b-tab>
	  	  
		  <b-tab title="나의 댓글">
		<div style="height:500px;">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<th width="15%" class="text-center">게시물번호</th>
					<th width="60%" class="text-center">댓글</th>
					<th width="15%" class="text-center">작성일</th>
					<th width="10%" class="text-center">삭제</th>
				</tr>
				<tr style="vertical-align: middle;" v-for="rvo in reply_list">
					<td width="10%" class="text-center origin">{{vo.brno}}</td>
					<td width="60%" class="origin"><a :href="'../board/board_detail.do?cno='+vo.bno">{{vo.msg}}</a></td>
					<td width="15%" class="text-center origin">{{vo.dbday}}</td>
					<td width="10%" class="text-center origin">
						<span class="presspoint" v-on:click="replyDelete(vo.brno)">
							<img src="../images/del.png" style="height: 15px;margin: 4px 10px;">
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
	  	  </b-tab>
	 	</b-tabs>
	  </div>
	</div>
</div>
<script>
	new Vue({
		el:'.rowss',
		data:{
			re_list:[],
			sessionId:'',
			curpage:1,
			totalpage:0,
			reply_list:[]
		},
		mounted:function(){
			this.send()
		},
		methods:{
			send:function(){
				this.sessionId=this.$refs.id.value
				let _this=this
				axios.get("http://localhost/web/mypage/review_list_vue.do",{
					params:{
						page:this.curpage,
						id:this.sessionId
					}
				}).then(function(response){
					console.log(response.data)
					_this.re_list=response.data
					_this.curpage=response.data[0].curpage
					_this.totalpage=response.data[0].totalpage
				})
				axios.get("http://localhost/web/mypage/reply_list_vue.do",{
					params:{
						page:this.curpage,
						id:this.sessionId
					}
				}).then(function(response){
					console.log(response.data)
					_this.reply_list=response.data
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
			reviewDelete:function(rno){
				if(confirm('정말로 삭제하시겠습니까?\n삭제된 항목은 복구되지 않습니다')){
					axios.get('http://localhost/web/mypage/review_delete_vue.do',{
						params:{
							rno:rno
						}
					}).then(function(response){
						location.href="../mypage/repv.do"
					})
				}
			},
			replyDelete:function(brno){
				if(confirm('정말로 삭제하시겠습니까?\n삭제된 항목은 복구되지 않습니다')){
					axios.get('http://localhost/web/board/reply_delete_vue.do',{
						params:{
							brno:brno
						}
					}).then(function(response){
						location.href="../mypage/repv.do"
					})
				}
			}
		}
	})
</script>
</body>
</html>
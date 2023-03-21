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
	
	<div style="width:80%;float:left;padding-left:20px;margin-top:20px">
	  <div class="rows rowss">
		<div style="height:500px;">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<input type=hidden size=15 class=input-sm ref="id" value="${sessionScope.mvo.id }">
					<th width="15%" class="text-center">게시물번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
					<th width="15%" class="text-center">수정 / 삭제</th>
				</tr>
				<tr style="vertical-align: middle;" v-for="vo in commu_list">
					<td width="10%" class="text-center origin">{{vo.bno}}</td>
					<td width="45%" class="origin"><a :href="'../board/board_detail.do?bno='+vo.bno">{{vo.title}}</a></td>
					<td width="15%" class="text-center origin">{{vo.dbday}}</td>
					<td width="10%" class="text-center origin">{{vo.hit}}</td>
					<td width="15%" class="text-center origin">
						<span class="presspoint">
							<a :href="'../board/board_update.do?bno='+vo.bno">
								<img src="../images/up3.png" style="height: 18px;margin: 2px 10px;">
							</a>
						</span>
						<span class="presspoint" v-on:click="boardDelete(vo.bno)">
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
	         <span class="mintBtn presspointn" @click="next()">다음</span>
	      	</div>
		<div style="height: 20px"></div>
	  </div>
	</div>
</div>
<script>
	new Vue({
		el:'.rowss',
		data:{
			commu_list:[],
			sessionId:'',
			curpage:1,
			totalpage:0
		},
		mounted:function(){
			this.send()
		},
		methods:{
			send:function(){
				this.sessionId=this.$refs.id.value
				let _this=this
				axios.get("../mypage/commu_list_vue.do",{
					params:{
						page:this.curpage,
						id:this.sessionId
					}
				}).then(function(response){
					console.log(response.data)
					_this.commu_list=response.data
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
			boardDelete:function(bno){
				if(confirm('정말로 삭제하시겠습니까?\n삭제된 항목은 복구되지 않습니다')){
					axios.get('../board/board_delete_vue.do',{
						params:{
							bno:bno
						}
					}).then(function(response){
						location.href="../mypage/community.do"
					})
				}
			}
		}
	})
</script>
</body>
</html>
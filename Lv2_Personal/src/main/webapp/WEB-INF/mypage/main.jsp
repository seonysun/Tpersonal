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
	
	<div style="width:20%;height:100%;padding:5px;float:left;">
	  <div class=rows>
	  	<div style="height:150px;margin:5px;padding:10px;border:2px solid #45c5c5;">
	  		<div style="height:50px;">
	  	  		<img src="${sessionScope.mvo.image }" style="height: 40px;border-radius: 50px">
	  	  		<span>${sessionScope.mvo.nickname }</span>
	  		</div>
	  		<div style="height:25px;">
		  	  	<img src="../images/letter.png" style="height: 20px">&nbsp;
				<template>
				  	<b-sidebar id="my-sidebar" title="쪽지함" shadow>
					    <div class="px-3 py-2">
					        <div class="text-right" style="height: 25px">
					    		<b-button variant="danger" v-b-modal.text-insert>쪽지보내기</b-button>
					        </div>
					    	<b-tabs content-class="mt-3">
								<b-tab title="받은 쪽지함" active>
									<table>
									  <tr class=text-center style="font-weight: bold">
									  	<th width=20%>보낸 사람</th>
									  	<th width=50%>내용</th>
									  	<th width=25%>날짜</th>
									  </tr>
									  <tr class=text-center v-for="rt in stext_list">
									  	<td width=20%>{{rt.nickname}}</td>
									  	<td width=50% v-on:click="textdetail(rt.tno)">{{rt.msg}}</td>
									  	<td width=25%>{{rt.dbday}}</td>
									  </tr>
									</table>
								</b-tab>
								<b-tab title="보낸 쪽지함" active>
									<table>
									  <tr class=text-center>
									  	<th width=20%>받는 사람</th>
									  	<th width=50%>내용</th>
									  	<th width=25%>날짜</th>
									  </tr>
									  <tr class=text-center v-for="st in rtext_list">
									  	<td width=20%>{{st.receiver}}</td>
									  	<td width=50% v-on:click="textdetail(st.tno)">{{st.msg}}</td>
									  	<td width=25%>{{st.dbday}}</td>
									  </tr>
									</table>
								</b-tab>
							</b-tabs>
						</div>
					</b-sidebar>
					<b-modal id="text-insert" title="쪽지보내기">
						<table>
						  <tr>
						  	<th width=20%>받는 사람</th>
						  	<td width=80%>
						  		<input type=text size=15 class=input-sm v-model="receiver">
						  		<input type=text size=15 class=input-sm ref="id" value="${sessionScope.mvo.id }">
						  		<input type=text size=15 class=input-sm ref="nickname" value="${sessionScope.mvo.nickname }">
						  	</td>
						  </tr>
					  	  <tr>
					  	  	<th width=20%>내용</th>
					  	  	<td width=80%><textarea rows=10 cols=55 v-model="msg"></textarea></td>
					  	  </tr>
					  	  <tr>
					  	  	<td colspan=2 class=text-center>
					  	  		<input type=button value="전송" class="btn btn-sm btn-danger" v-on:click="sendtext()">
					  	  	</td>
					  	  </tr>
						</table>
					</b-modal>
					<b-modal ref="text-detail" title="쪽지 상세보기">
						<table>
						  <tr>
						  	<th width=20%>보낸 사람</th>
						  	<td width=80%>{{tdetail.nickname}}</td>
						  </tr>
					  	  <tr>
					  	  	<th width=20%>내용</th>
					  	  	<td width=80%>
					  	  		<p>{{tdetail.msg}}</p>
					  	  	</td>
					  	  </tr>
					  	  <tr>
					  	  	<td colspan=2 class=text-center>
					  	  		<input type=button value="삭제" class="btn btn-sm btn-danger" v-on:click="textdelete()">
					  	  	</td>
					  	  </tr>
						</table>
					</b-modal>
					<b-button v-b-toggle.my-sidebar>쪽지함</b-button>&nbsp;()
				</template>
	  		</div>
	  		<div style="height:25px;">
		  	  	<img src="../images/letter.png" style="height: 20px">&nbsp;
		  	  	<button>수강중 강의</button>&nbsp;(3)
	  		</div>
	  		<div style="height:30px;">
		  		<a href="../member/logout.do"><span class="mintBtn">로그아웃</span></a>
		  		<a href="#"><span class="mintBtn">정보수정</span></a>
	  		</div>
	  	</div>
	  </div>
	  <div style="height: 10px;"></div>
	  <div class=rows>
		<ul style="margin:5px;padding:10px;border:1px solid #45c5c5;border-radius:10px">
			<div class="my_li">
		  	    <li id="my_menus"><a href="../mypage/main.do">대시보드</a></li>
		  	    <li class="my_menu">내 학습</li>
		  	    <span><li class="my_menu2"><a href="../mypage/myclass.do">내 강의실</a></li></span>
		  	    <span><li class="my_menu2"><a href="../mypage/myquestion.do">내가 남긴 질문</a></li></span>
	  	    </div>
	  	    <div class="my_li">
	  	    	<li class="my_menu">수강 관리</li>
	  	    	<span><li class="my_menu2"><a href="../mypage/myjjim.do">수강바구니</a></li></span>
	  	    </div>
	  	    <div class="my_li">
	  	    	<li class="my_menu">내 활동</li>
	  	    	<span><li class="my_menu2">커뮤니티</li></span>
	  	    	<span><li class="my_menu2">리뷰 & 댓글</li></span>
	  	    </div>
	  	    <div class="my_li">
		  	    <li class="my_menu">내 정보</li>
		  	    <span><li class="my_menu2">계정 정보</li></span>
			</div>
		</ul>
	  </div>
	</div>
	
	<div style="width:80%;float:left;">
		<jsp:include page="../mypage/home.jsp"></jsp:include>
	</div>
</div>
<script>
	new Vue({
		el:'.container',
		data:{
			id:'',
			nickname:'',
			msg:'',
			receiver:'',
			stext_list:[],
			scurpage:1,
			stotalpage:0,
			rtext_list:[],
			rcurpage:1,
			rtotalpage:0,
			tdetail:{}
		},
		mounted:function(){
			let _this=this
			axios.get('http://localhost:8080/web/mypage/stext_list_vue.do',{
				params:{
					page:this.scurpage
				}
			}).then(function(response){
				console.log(response.data)
				_this.stext_list=response.data
				_this.scurpage=response.data[0].curpage
				_this.stotalpage=response.data[0].totalpage
			})
			axios.get('http://localhost:8080/web/mypage/rtext_list_vue.do',{
				params:{
					page:this.rcurpage
				}
			}).then(function(response){
				console.log(response.data)
				_this.rtext_list=response.data
				_this.rcurpage=response.data[0].curpage
				_this.rtotalpage=response.data[0].totalpage
			})
		},
		methods:{
			sendtext:function(){
				let _this=this
				this.id=this.$refs.id.value
				this.nickname=this.$refs.nickname.value
				axios.get('http://localhost:8080/web/mypage/text_insert_vue.do',{
					params:{
						id:this.id,
						msg:this.msg,
						receiver:this.receiver,
						nickname:this.nickname
					}
				}).then(function(response){
					location.href='../mypage/main.do'
				})
			},
			textdetail:function(tno){
				let _this=this
				axios.get('http://localhost:8080/web/mypage/text_detail_vue.do',{
					params:{
						tno:tno
					}
				}).then(function(response){
					console.log(response.data)
					_this.tdetail=response.data
				})
				this.$refs['text-detail'].show()
			}
		}
	})
</script>
</body>
</html>
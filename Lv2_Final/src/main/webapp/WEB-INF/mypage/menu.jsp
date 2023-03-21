<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	  <div class="rows mypages_menu">
	  	<div style="height:150px;margin:5px;padding:10px;border:2px solid #45c5c5;">
	  		<div style="height:50px;">
	  	  		<img src="${sessionScope.mvo.image }" style="height: 45px;border-radius: 50px">
	  	  		<span style="line-height: 45px;margin: 10px">${sessionScope.mvo.nickname }</span>
	  		</div>
	  		<div style="height:25px;">
		  	  	<img src="../images/letter.png" style="height: 20px;margin-top:3px">
				<template>
				  	<b-sidebar id="my-sidebar" ref="my-sidebar" shadow>
					    <div class="px-3 py-2">
					        <div style="height: 40px">
					    		<span style="font-size:larger">${sessionScope.mvo.nickname }님의 쪽지함</span>
					    		&nbsp;&nbsp;
					    		<b-button variant="danger" v-b-modal.text-insert>쪽지보내기</b-button>
					        </div>
					    	<b-tabs content-class="mt-3">
								<b-tab title="받은 쪽지함" active>
									<table class="table">
									  <tr class=text-center>
									  	<th style="font-weight: bold" width=20%>보낸 사람</th>
									  	<th style="font-weight: bold" width=55%>내용</th>
									  	<th style="font-weight: bold" width=25%>날짜</th>
									  </tr>
									  <tr class=text-center v-for="rt in rtext_list">
									  	<td width=20%>{{rt.nickname}}</td>
									  	<td width=50% v-on:click="textdetail(rt.tno)">
									  		{{rt.msg}}
									  		<img src="../images/n.png" style="height: 15px;margin-top:3px" v-if="rt.ok=='n'">
									  	</td>
									  	<td width=25%>{{rt.dbday}}</td>
									  </tr>
									</table>
								</b-tab>
								<b-tab title="보낸 쪽지함">
									<table class="table">
									  <tr class=text-center>
									  	<th style="font-weight: bold" width=20%>받는 사람</th>
									  	<th style="font-weight: bold" width=55%>내용</th>
									  	<th style="font-weight: bold" width=25%>날짜</th>
									  </tr>
									  <tr class=text-center v-for="st in stext_list">
									  	<td width=20%>{{st.receiver}}</td>
									  	<td width=50% v-on:click="textdetail(st.tno)">
									  		{{st.msg}}
									  		<img src="../images/n.png" style="height: 15px;margin-top:3px" v-if="st.ok=='n'">
									  	</td>
									  	<td width=25%>{{st.dbday}}</td>
									  </tr>
									</table>
								</b-tab>
							</b-tabs>
						</div>
					</b-sidebar>
					<b-modal id="text-insert" ref="text-insert" title="쪽지보내기" hide-footer>
						<table class="table">
						  <tr>
						  	<th width=25% style="font-weight: bold">받는 사람</th>
						  	<td width=75%>
						  		<input type=text size=15 class=input-sm v-model="receiver">
						  	</td>
						  </tr>
					  	  <tr>
					  	  	<th width=30% style="font-weight: bold">내용</th>
					  	  	<td width=70%>
					  	  		<textarea rows=10 cols=50 v-model="msg"></textarea>
						  		<input type=hidden class=input-sm ref="id" value="${sessionScope.mvo.id }">
						  		<input type=hidden class=input-sm ref="nickname" value="${sessionScope.mvo.nickname }">
					  	  	</td>
					  	  </tr>
					  	  <tr>
					  	  	<td colspan=2 class=text-center>
					  	  		<b-button variant="info" inline @click="textsend">전송</b-button>
		    					<b-button variant="outline-info" inline @click="hide">취소</b-button>
<!-- 					  	  		<input type=button value="전송" class="mintBtn" v-on:click="textsend()"> -->
<!-- 					  	  		<input type=button value="취소" class="mintBtn" v-on:click="hide()"> -->
					  	  	</td>
					  	  </tr>
						</table>
					</b-modal>
					<b-modal ref="text-detail" title="쪽지 상세보기" hide-footer>
						<table class="table">
						  <tr>
						  	<th width=20% style="font-weight: bold">보낸 사람</th>
						  	<td width=80%>{{tdetail.nickname}}({{tdetail.dbday}})</td>
						  </tr>
						  <tr>
						  	<th width=20% style="font-weight: bold">받는 사람</th>
						  	<td width=80% v-if="tdetail.recvday!=null">{{tdetail.receiver}}({{tdetail.recvday}})</td>
						  	<td width=80% v-if="tdetail.recvday==null">{{tdetail.receiver}}(읽지 않음)</td>
						  </tr>
					  	  <tr>
					  	  	<th width=20% style="font-weight: bold">내용</th>
					  	  	<td width=80%>
					  	  		<p>{{tdetail.msg}}</p>
					  	  	</td>
					  	  </tr>
					  	  <tr>
					  	  	<td colspan=2 class=text-center>
					  	  		<b-button variant="info" inline @click="textdelete(tdetail.tno)">삭제</b-button>
		    					<b-button variant="outline-info" inline @click="hide">닫기</b-button>
<!-- 					  	  		<input type=button value="삭제" class="mintBtn" v-on:click="textdelete(tdetail.tno)"> -->
<!-- 					  	  		<input type=button value="닫기" class="mintBtn" v-on:click="hide()"> -->
					  	  	</td>
					  	  </tr>
						</table>
					</b-modal>
					<b-button v-b-toggle.my-sidebar variant="light" style="font-size:12px" v-on:click="textroom('${sessionScope.mvo.id }', '${sessionScope.mvo.nickname }')">쪽지함</b-button>
				</template>
	  		</div>
	  		<div style="height:25px">
		  	  	<img src="../images/book2.png" style="height: 20px;margin-top:3px">
			  	<b-button variant="light" style="font-size:12px"><a href="../mypage/class.do" style="text-decoration: none">수강중 강의</a></b-button>
	  		</div>
	  		<div style="height:30px;text-align:center;margin:5px">
		  		<a href="../mypage/profileUpdate.do"><span class="mintBtn">정보수정</span></a>&nbsp;&nbsp;
		  		<a href="../member/logout.do"><span class="mintBtn">로그아웃</span></a>
	  		</div>
	  	</div>
	  </div>
	  <div style="height: 10px;"></div>
	  
	  <div class=rows>
		<ul style="margin:5px;padding:10px;border:1px solid #45c5c5;border-radius:10px">
			<div class="my_li">
		  	    <li id="my_menus"><a href="../mypage/main.do">대시보드</a></li>
		  	    <li class="my_menu">내 학습</li>
		  	    <span><li class="my_menu2"><a href="../mypage/class.do">내 강의실</a></li></span>
	  	    </div>
	  	    <div class="my_li">
	  	    	<li class="my_menu">내 활동</li>
	  	    	<span><li class="my_menu2"><a href="../mypage/community.do">커뮤니티</a></li></span>
	  	    	<span><li class="my_menu2"><a href="../mypage/repv.do">리뷰 & 댓글</a></li></span>
	  	    </div>
	  	    <div class="my_li">
		  	    <li class="my_menu">내 정보</li>
		  	    <span><li class="my_menu2"><a href="../mypage/profileUpdate.do">계정 정보</a></li></span>
			</div>
			<c:if test="${sessionScope.mvo.tutor=='y' }">
		  	    <div class="my_li">
		  	    	<li class="my_menu">강의 등록</li>
			  	    <span><li class="my_menu2"><a href="../mypage/register.do">강의 신청서</a></li></span>
		  	    </div>
			</c:if>
		</ul>
	  </div>
<script>
	new Vue({
		el:'.mypages_menu',
		data:{
			id:'',
			nickname:'',
			msg:'',
			receiver:'',
			stext_list:[],
			rtext_list:[],
			tdetail:{}
		},
		methods:{
			textroom:function(tid, tnickname){
				let _this=this
				axios.get('../mypage/stext_list_vue.do',{
					params:{
						id:tid
					}
				}).then(function(response){
					console.log(response.data)
					_this.stext_list=response.data
				})
				axios.get('../mypage/rtext_list_vue.do',{
					params:{
						receiver:tnickname
					}
				}).then(function(response){
					console.log(response.data)
					_this.rtext_list=response.data
				})
			},
			textsend:function(){
				let _this=this
				this.id=this.$refs.id.value
				this.nickname=this.$refs.nickname.value
				axios.get('../mypage/text_insert_vue.do',{
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
			hide:function(){
				this.$refs['text-insert'].hide()
				this.$refs['text-detail'].hide()
				this.$refs['my-sidebar'].hide()
			},
			textdetail:function(tno){
				let _this=this
				axios.get('../mypage/text_detail_vue.do',{
					params:{
						tno:tno
					}
				}).then(function(response){
					console.log(response.data)
					_this.tdetail=response.data
				})
				this.$refs['text-detail'].show()
			},
			textdelete:function(tno){
				let _this=this
				axios.get('../mypage/text_delete_vue.do',{
					params:{
						tno:tno
					}
				}).then(function(response){
					location.href='../mypage/main.do'
				})
			}
		}
	})
</script>
</body>
</html>
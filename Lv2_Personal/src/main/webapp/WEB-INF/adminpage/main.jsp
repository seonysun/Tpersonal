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
	<div style="margin-left:20px"> 
		<span style="font-size: 20px;font-weight: 700;line-height: 50px;">관리자</span> 페이지입니다
	</div>
	
	<div style="width:20%;height:100%;padding:5px;float:left;">
	  <div class=rows>
	  	<div style="height:100px;margin:5px;padding:10px;border:2px solid #45c5c5;">
	  		<div style="height:50px;">
	  	  		<img src="../images/gtop.png" style="height: 40px">
	  	  		<span>마스터</span>
	  		</div>
	  		<div style="height:30px;">
		  		<span class="mintBtn" value="로그아웃">로그아웃</span>
		  		<span class="mintBtn">정보수정</span>
	  		</div>
	  	</div>
	  </div>
	  <div style="height: 10px;"></div>
	  <div class=rows>
		<ul style="margin:5px;padding:10px;border:1px solid #45c5c5;border-radius:10px">
			<div class="my_li">
		  	    <li class="my_menu">공지사항 관리</li>
		  	    <span><li class="my_menu2"><a href="../board/board_insert.do?btype=3">공지 등록</a></li></span>
		  	    <span><li class="my_menu2"><a href="../board/board_main.do?btype=3">공지 수정</a></span>
	  	    </div>
	  	    <div class="my_li">
	  	    	<li class="my_menu">강의 관리</li>
	  	    	<span><li class="my_menu2"><a href="#">강의 승인</a></li></span>
	  	    </div>
	  	    <div class="my_li">
		  	    <li class="my_menu">회원 관리</li>
		  	    <span><li class="my_menu2"><a href="#">일반회원 관리</a></li></span>
		  	    <span><li class="my_menu2"><a href="#">튜터 관리</a></li></span>
			</div>
		</ul>
	  </div>
	</div>
	
	<div style="width:80%;float:left;">
	  <div class=rows>
		<div class="mintBtn_m" style="float: right">
			공지 등록
		</div>
		<div style="display: inline-block;height: 30px"></div>
		<div style="display: inline-block">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<th width="15%" class="text-center">분류</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
					<th width="15%" class="text-center">수정/삭제</th>
				</tr>
				<tr style="vertical-align: middle;" v-for="vo in notice_list">
					<td width="10%" class="text-center origin">{{vo.bno}}</td>
					<td width="45%" class="text-center origin"><a href="#">{{vo.title}}</a></td>
					<td width="15%" class="text-center origin"></td>
					<td width="10%" class="text-center origin">{{vo.hit}}</td>
					<td width="15%" class="text-center origin">
						<span><img src="#" style="height:20px;"></span>
						<span><img src="#" style="height:20px;"></span>
					</td>
				</tr>
			</table>
		</div>
<!-- 		<ul class="page_ul"> -->
<!--           <li class="page_li"><span class="page_a" style="font-size: 10px; width: 20px" v-on:click="prev()">◀</span></li> -->
<!--           <li class="page_li" v-for="i in range(startpage, endpage)"><span class="page_a" v-on:click="pageChange(i)">{{i }}</span></li>           -->
<!--           <li class="page_li"><span class="page_a" style="font-size: 10px; width: 20px" v-on:click="next()">▶</span></li> -->
<!--    		</ul> -->
	  </div>
	</div>
</div>
<script>
	new Vue({
		el:'.container',
		data:{
			notice_list:[],
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0
		},
		mounted:function(){
			this.send()
		},
		methods:{
			send:function(){
				let _this=this
				axios.get("http://localhost/web/adminpage/notice_list_vue.do",{
					params:{
						page:this.curpage
					}
				}).then(function(response){
					console.log(response.data)
					_this.notice_list=response.data
					_this.curpage=response.data[0].curpage
					_this.totalpage=response.data[0].totalpage
					_this.startpage=response.data[0].startpage
					_this.endpage=response.data[0].endpage
				})
			},
			prev:function(){
				this.curpage=this.startpage-1
				this.getData()
			},
			next:function(){
				this.curpage=this.endpage+1
				this.getData()
			},
			range:function(min, max){
				let array=[],
				j=0
				for(let i=min;i<=max;i++){
					array[j]=i
					j++
				}
				return array
			},
			pageChange:function(page){
				this.curpage=page
				this.getData()
			}
		}
	})
</script>
</body>
</html>
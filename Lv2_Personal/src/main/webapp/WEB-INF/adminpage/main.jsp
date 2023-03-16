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
	
	<div style="width:80%;float:left;padding-left:20px;margin-top:-25px">
	  <div class=rows>
		<div class="mintBtn_m" style="float: right">
			<a href="../faq/insert.do">FAQ 등록</a>
		</div>
		<div style="display: inline-block;height: 30px"></div>
		<div style="display: inline-block">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<th width="15%" class="text-center">번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
					<th width="15%" class="text-center">수정/삭제</th>
				</tr>
				<tr style="vertical-align: middle;" v-for="vo in faq_list">
					<td width="10%" class="text-center origin">{{vo.ano}}</td>
					<td width="45%" class="text-center origin"><a :href="'../faq/detail.do?ano='+vo.ano">{{vo.subject}}</a></td>
					<td width="15%" class="text-center origin">{{vo.dbday}}</td>
					<td width="10%" class="text-center origin">{{vo.hit}}</td>
					<td width="15%" class="text-center origin">
						<span>
							<a :href="'../faq/update.do?ano='+vo.ano">수정</a>
						</span>
						<span>
							<a :href="'../faq/delete.do?ano='+vo.ano">삭제</a>
						</span>
					</td>
				</tr>
			</table>
		</div>
	  </div>
<%-- 		<jsp:include page="${admin_jsp }"></jsp:include> --%>
	</div>
</div>
<script>
	new Vue({
		el:'.container',
		data:{
			faq_list:[],
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
				axios.get("http://localhost/web/adminpage/faq_list_vue.do",{
					params:{
						page:this.curpage
					}
				}).then(function(response){
					console.log(response.data)
					_this.faq_list=response.data
					_this.curpage=response.data[0].curpage
					_this.totalpage=response.data[0].totalpage
					_this.startpage=response.data[0].startpage
					_this.endpage=response.data[0].endpage
				})
			},
			prev:function(){
				this.curpage=this.startpage-1
				this.send()
			},
			next:function(){
				this.curpage=this.endpage+1
				this.send()
			},
// 			range:function(min, max){
// 				let array=[],
// 				j=0
// 				for(let i=min;i<=max;i++){
// 					array[j]=i
// 					j++
// 				}
// 				return array
// 			},
			pageChange:function(page){
				this.curpage=page
				this.send()
			}
		}
	})
</script>
</body>
</html>
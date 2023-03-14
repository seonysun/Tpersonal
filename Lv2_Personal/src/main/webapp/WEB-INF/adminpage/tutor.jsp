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
	
	<div style="width:20%;height:100%;padding:5px;float:left;">
		<jsp:include page="../adminpage/menu.jsp"></jsp:include>
	</div>
	
	<div style="width:40%;float:left;">
	
	</div>
	<div style="width:40%;float:left;">
	
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
				this.send()
			},
			next:function(){
				this.curpage=this.endpage+1
				this.send()
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
				this.send()
			},
			boardDelete:function(bno){
				if(confirm('정말로 삭제하시겠습니까?\n삭제된 항목은 복구되지 않습니다')){
					axios.get('http://localhost/web/board/board_delete_vue.do',{
						params:{
							bno:bno
						}
					}).then(function(response){
						location.href="../adminpage/main.do"
					})
				}
			}
		}
	})
</script>
</body>
</html>
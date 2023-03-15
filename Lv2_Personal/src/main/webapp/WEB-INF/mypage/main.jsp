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
<div class="container">
	<jsp:include page="../mypage/header.jsp"></jsp:include>
	
	<div style="width:20%;height:100%;padding:5px;float:left">
		<jsp:include page="../mypage/menu.jsp"></jsp:include>
	</div>
	
	<div style="width:80%;float:left;padding-left:20px">
		<div class=rows>
	  	  <div class=my-card style="width:35%;">
	  	  	  <dl>
				<dt>최근 학습 강의</dt>
				<dd>
					<table>
					  <tr v-if="">
						<td>최근 학습한 강의가 없습니다.</td>
					  </tr>
					  <tr>
						<td>
							<input type=button value="강의 보러 가기" class="btn btn-sm btn-primary">
						</td>
					  </tr>
					</table>
			    </dd>
			  </dl>
		  </div>
		  <div class=my-card style="width:60%;">
			  <dl>
			  	<dt>주간 학습</dt>
			  	<dd>
					<table>
					  <tr>
					  	<td>달력 년 월 주</td>
					  </tr>
					  <tr>
					  	<td>
						  	동구랑미
					  	</td>
					  </tr>
					  <tr>
					  	<td>공부시간</td>
					  </tr>
					</table>
			  	</dd>
			  </dl>
		  </div>
		  <div class=my-card style="width:30%;">
			  <dl>
			  	<dt>스킬 태그</dt>
			  	<dd>
			  	</dd>
			  </dl>
		  </div>
		  <div class=my-card style="width:65%;">
			  <dl>
			  	<dt>연간 학습</dt>
			  	<dd>
					<table>
					  <tr>
					  	<td>달력 년 월 주</td>
					  </tr>
					  <tr>
					  	<td>
						  	동구랑미
					  	</td>
					  </tr>
					  <tr>
					  	<td>공부시간</td>
					  </tr>
					</table>
			  	</dd>
			  </dl>
		  </div>
	  </div>
	</div>
</div>
</body>
</html>
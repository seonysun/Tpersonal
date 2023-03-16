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
.insert_title{
	margin:0 0 30px 0;
}
.input_name{
  margin:0 0 10px 0;
  font-size:16px;
}
.input_text{
  padding: 0 20px;
  width:100%;
  height:45px;
  border:1px solid lightgray;
  font-size:16px;
  margin-bottom:10px
}
.textBox{
  padding:15px;width:100%;height:400px;border:1px solid lightgray;border-radius:4px;resize:none;overflow:auto;
  font-size:16px;
}
.textBox:focus{
  outline:none;
}
.all_btn{
  display:inline-block;
}
</style>
</head>
<body>
<div class="container">
	<jsp:include page="../mypage/header.jsp"></jsp:include>
	
	<div style="width:20%;height:100%;padding:5px;float:left">
		<jsp:include page="../mypage/menu.jsp"></jsp:include>
	</div>
	
	<div style="width:80%;float:left;padding-left:20px;">
		<div id="insert_title">
		  <div class="input_name">제목</div>
		  <input type=text class="input_text" placeholder="제목을 입력해주세요">
		</div>
		<div id="insert_title">
		  <div class="input_name">장소</div>
		  <input type="text" class="input_text" placeholder="클래스가 진행될 장소를 입력해주세요">
		</div>
		<div id="insert_title">
		  <div class="input_name">일정</div>
		  <input type="text" class="input_text" placeholder="클래스 일정을 입력해주세요">
		</div>
		<div id="insert_title">
		  <div class="input_name">시간대</div>
		  <input type="text" class="input_text" placeholder="클래스가 진행될 시간대를 입력해주세요">
		</div>
		<div id="insert_title">
		  <div class="input_name">가격</div>
		  <input type="text" class="input_text" placeholder="클래스 가격 정보를 입력해주세요">
		</div>
		<div id="insert_title">
		  <div class="input_name">공지사항</div>
		  <textarea class="textBox" style="height: 100px" placeholder="학생들에게 전달할 공지사항을 입력해주세요"></textarea>
		</div>
		<div id="insert_title">
		  <div class="input_name">수업 간략 소개</div>
		  <textarea class="textBox" placeholder="클래스에 대한 소개를 간략하게 설명해주세요"></textarea>
		</div>
		<div id="insert_title">
		  <div class="input_name">튜터 소개</div>
		  <textarea class="textBox" style="height: 100px" placeholder="학생들에게 튜터를 직접 소개해보세요"></textarea>
		</div>
		<div style="margin:20px 0 100px 0;float:right;">
		  <a class="all_btn"style="padding:10px 25px;background:#eaeaea">취소</a>
		  <span class="all_btn" style="padding:10px 25px;background:#45c5c5;border:0;color:white;">등록<span>
		</div>
	</div>
</div>
</body>
</html>
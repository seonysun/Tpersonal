<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <div class=rows>
		<div class="mintBtn_m" style="float: right">
			<a href="../board/board_insert.do?btype=3">공지 등록</a>
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
					<td width="45%" class="text-center origin"><a :href="'../board/board_detail.do?bno='+vo.bno">{{vo.title}}</a></td>
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
</body>
</html>
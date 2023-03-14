<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <div class=rows>
		<div>
			<table class="table" style="table-layout: fixed;">
				<tr>
					<th width="15%" class="text-center"></th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">장소</th>
					<th width="10%" class="text-center">가격</th>
					<th width="15%" class="text-center">수정/삭제</th>
				</tr>
				<tr style="vertical-align: middle;" v-for="vo in class_list">
					<td width="15%" class="text-center origin">
						<img :src="vo.image" style="height: 40px;border-radius: 50px">
					</td>
					<td width="45%" class="text-center origin"><a href="#">{{vo.title}}</a></td>
					<td width="15%" class="text-center origin">{{vo.location}}</td>
					<td width="10%" class="text-center origin">{{vo.perprice}}</td>
					<td width="15%" class="text-center origin">
						<span><img src="#" style="height:20px;"></span>
						<span><img src="#" style="height:20px;"></span>
					</td>
				</tr>
			</table>
		</div>
	  </div>
</body>
</html>
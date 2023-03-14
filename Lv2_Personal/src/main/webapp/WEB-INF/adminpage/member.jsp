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
					<th width="15%" class="text-center">프로필</th>
					<th width="15%" class="text-center">닉네임</th>
					<th width="30%" class="text-center">아이디</th>
					<th width="20%" class="text-center">이름</th>
					<th width="10%" class="text-center">튜터</th>
					<th width="10%" class="text-center">관리</th>
				</tr>
				<tr style="vertical-align: middle;" v-for="m in member_list">
					<td width="15%" class="text-center origin">
						<img :src="m.image" style="height: 40px;border-radius: 50px">
					</td>
					<td width="15%" class="text-center origin">{{m.nickname}}</td>
					<td width="30%" class="text-center origin">{{m.id}}</td>
					<td width="20%" class="text-center origin">{{m.name}}</td>
					<td width="10%" class="text-center origin">{{m.tutor}}</td>
					<td width="10%" class="text-center origin">
						<span><img src="#" style="height:20px;"></span>
						<span><img src="#" style="height:20px;"></span>
					</td>
				</tr>
			</table>
		</div>
	  </div>
</body>
</html>
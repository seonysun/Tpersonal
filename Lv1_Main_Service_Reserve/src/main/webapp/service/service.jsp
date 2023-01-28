<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.f-card{
	position: relative;
	margin: 0 10px;
	text-align: center;
	width: 20%;
	float: left;
	-webkit-box-shadow: 0 0 5px rgba(0,0,0,0.4);
}
.f-card dl{
	margin: 0 auto;
}
.f-card dt{
	color: #FFF;
	background: #27375C;
	padding: 10px 0;
	font-size: 1em;
	text-align: center;
}
.f-card dd{
	padding: 10px 0;
	font-size: 0.9rem;
	text-align: left;
}
.f-10{
	clear: both;
}
</style>
<script type="text/javascript">
$(function(){
	//검색 결과
	$('#sBtn').click(function(){
		let ss=$('#search').val()
		if(ss.trim()==""){
			$('#search').focus()
			return
		}
		$.ajax({
			
		})	
	})
	
	//인기검색어 클릭 이벤트
	$('#s-pop span:nth-child(n+2)').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('#s-pop span:nth-child(n+2)').click(function(){
		$.ajax({
			
		})
	})
	
	//빠른찾기 클릭 이벤트
	$('.f-card li').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('.f-card li').click(function(){
		
	})
	
	//f10 본문 보여주기
	$('#fsub').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('.fdetail').hide()
	$('#fsub').click(function(){
		$('.fdetail').show() //개별 제어 안되고용
	})
	
	//qna 연결 질문 새창
	$('#qsub').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('#qsub').click(function(){
		window.open('one_list.jsp','one_list','width:600px,height:400px')
	})
})
</script>
</head>
<body>
	<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">고객센터</h1>
<!-- faq 검색바, 인기검색어 -->
    <div style="height: 20px"></div>
	<div>
		<h6 style="color: white">GOD 고객센터입니다. 무엇이든 검색해보세요.</h6>
			<input type=text id=search size=30 placeholder="검색어를 입력하세요" style="border-radius: 20px;border: none"/>
			<button type=submit id=sBtn style="border: none;background: none;color: white;"><i class="fa fa-search"></i></button>
    </div>
    <div style="height: 10px"></div>
	<div id=s-pop style="color: white;font-size: 13px">
		<span style="font-size: 14px">인기검색어</span>&nbsp;
		<span>결제방법</span>&nbsp;|&nbsp;
		<span>회원정보 확인/변경</span>&nbsp;|&nbsp;
		<span>2D 전시회</span>&nbsp;|&nbsp;
		<span>티켓예매 수수료</span>
	</div>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->

	<div class="container" style="width: 100%">
	
<!-- faq 빠른 찾기  -->
	<div>
		<h4 class="text-primary px-3">FAQ 찾기</h4>
	    <p>분야별 faq 빠른 찾기를 이용해보세요</p>
		<div class=f-card>
		  <dl>
		  	<dt>예매</dt>
		  	<dd>
		  	  <ul>
				<li>예매/예매확인</li>
				<li>예매변경</li>
				<li>예매취소</li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
		<div class=f-card>
		  <dl>
		  	<dt>결제/영수증</dt>
		  	<dd>
		  	  <ul>
				<li>결제정보</li>
				<li>결제수단</li>
				<li>영수증/세금계산서</li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
		<div class=f-card>
		  <dl>
		  	<dt>회원관리</dt>
		  	<dd>
		  	  <ul>
				<li>회원가입/탈퇴</li>
				<li>회원정보 확인/변경</li>
				<li>인증문의(성인/본인)</li>
				<li>휴면회원</li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
		<div class=f-card>
		  <dl>
		  	<dt>기타</dt>
		  	<dd>
		  	  <ul>
				<li>리뷰/한줄평</li>
				<li>홈페이지/시스템장애</li>
				<li>기타</li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
	</div>
	
<!-- faq top10 -->
	<div class="f-10" >
	  <div style="height: 30px"></div>
		<h4 class="text-primary px-3">자주 묻는 질문 TOP10</h4>
		<table class="table table-hover">
		  <thead>
			  <tr>
			 	<th width=10% class="text-center">순위</th>
			 	<th width=10% class="text-center">문의유형</th>
			  	<th width=70% class="text-center">제목</th>
			  	<th width=10% class="text-center">
			  		<a href="../service/faq_list.do"><input type=button class="btn btn-sm btn-primary" value="더보기"></a>
			  	</th>
		 	  </tr>
	 	  </thead>
	 	  <tbody>
	 	    <c:forEach var="vo" items="${flist }" varStatus="s">
	 	    <!-- 전체를 forEach문이 아닌 html 추가로 넣어야 하는 듯? 개별 제어가 안됨 -->
			  <tr>
			   	<td width=10% class="text-center">${s.index+1 }</td>
			  	<td width=10% class="text-center">${vo.type }</td>
			  	<td colspan=2 id=fsub>${vo.subject }</td>
			  </tr>
			  <tr class="fdetail">
				<td colspan=2></td>
				<td colspan=2>${vo.content }</td>
			  </tr>
		    </c:forEach>
	 	  </tbody>
		</table>
	</div>
	
<!-- qna -->
	<div>
	  <div style="height: 30px"></div>
		<h4 class="text-primary px-3">나의 문의 내역</h4>
		<table class="table">
		  <tr>
		  	<th width=15% class="text-center">문의유형</th>
		   	<th width=60% class="text-center">제목</th>
		   	<th width=15% class="text-center">답변상태</th>
		   	<th width=10% class="text-center">
		   		<a href="../service/list.do"><input type=button class="btn btn-sm btn-primary" value="더보기"></a>
		   	</th>
		  </tr>
		  <c:forEach var="vo" items="${slist }">
		  <!-- 전체를 forEach문이 아닌 html 추가로 넣어야 하는 듯? 개별 제어가 안됨 -->
			<c:if test="${vo.group_tab==0 }">
			  <tr>
			  	<td width=15% class="text-center">${vo.type }</td>
			  	<td width=35% id=qsub>${vo.subject }</td>
			  	<td width=10% class="text-center">
			  	  <c:if test="${vo.ans_state=='답변완료' }">
			  	  	<span style="color: blue">${vo.ans_state }</span>
			  	  </c:if>
			  	  <c:if test="${vo.ans_state!='답변완료' }">
			  	  	<span style="color: gray">${vo.ans_state }</span>
			  	  </c:if>
			  	</td>
			   	<td width=10% class="text-center">${vo.depth }</td>
			  </tr>
			</c:if>
		  </c:forEach>
		  <tr>
			<td colspan=4 class="text-center" style="border-color: white">
	  			<a href="../service/insert.do"><input type=button class="btn btn-sm btn-danger" value="문의 작성"></a>
			</td>
		  </tr>
		</table>
	</div>
  
<!-- 공지사항 list 일부 추가? 더보기 누르면 공지사항 페이지 연결 -->
	
	</div>
</body>
</html>
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
</head>
<body>
	<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">고객센터</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a class="text-white" href="../main/main.do">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="../service/main.do">고객센터</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">문의 내역</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->
    
	<div class="container" style="width:960px">
	  <div style="height: 5px"></div>
	  	<table class="table">
	  	  <tr>
	  	  	<td>
	  	  		<a href="../service/insert.do" class="btn btn-primary py-md-3 px-md-5 slideInLeft">문의 작성</a>
	  	  		<a href="../service/faq_list.do" class="btn btn-light py-md-3 px-md-5 slideInRight">FAQ 찾기</a>
	  	  	</td>
	  	  </tr>
	  	</table>
	  	<table class="table">
	  	  <tr>
	  	  	<th width=5% class="text-center">번호</th>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<th width=35% class="text-center">제목</th>
	  	  	<th width=10% class="text-center">ID</th>
	  	  	<th width=15% class="text-center">작성일</th>
	  	  	<th width=10% class="text-center">답변상태</th>
	  	  	<th width=10% class="text-center">첨부파일</th>
	  	  </tr>
	  	  <c:forEach var="vo" items="${list }" varStatus="s">
		  	  <tr>
		  	  	<td width=5% class="text-center">${count-s.index-((curpage-1)*10) }</td>
		  	  	<td width=15% class="text-center">${vo.type }</td>
		  	  	<td width=35%>
		  	  	  <c:if test="${vo.group_tab>0 }">
		  	  	  	<c:forEach var="i" begin="0" end="${vo.group_tab }">&nbsp;&nbsp;</c:forEach>
		  	  	  	<img src="../service/image/letter.png" style="width: 20px;height: 20px">
		  	  	  	<!-- 
		  	  	  	<i class="fa-brands fa-replyd"></i>
		  	  	  	 -->
		  	  	  </c:if>
		  	  	  <a href="../service/detail.do?no=${vo.gano }" style="color: black">${vo.subject }</a>
		  	  	  <c:if test="${vo.dbday==today }">
		          	<img src="../service/image/new_red.png" style="width: 20px">
		          </c:if>
		  	  	</td>
		  	  	<td width=10% class="text-center">${vo.id }</td>
		  	  	<td width=15% class="text-center">${vo.dbday }</td>
		  	  	<td width=10% class="text-center">
		  	  	  <c:if test="${vo.ans_state=='답변완료' }">
		  	  	  	<span style="color: blue">${vo.ans_state }</span>
		  	  	  </c:if>
		  	  	  <c:if test="${vo.ans_state!='답변완료' }">
		  	  	  	<span style="color: gray">${vo.ans_state }</span>
		  	  	  </c:if>
		  	  <!-- ### id=master의 글은 답변 상태 나타내지 말까? 이중 for문으로? ### -->
		  	  	</td>
		  	  	<td width=10% class="text-center">
		  	  	  <c:if test="${vo.filesize>0 }">
		  	  	   <a href="../service/download.do?fn=${vo.filename }">
		  	  	  	<img src="../service/image/folder.png" style="width: 20px;height: 20px">
		  	  	   </a>
		  	  	  </c:if>
		  	  	  <!-- hover 첨부 파일 정보 창 띄우기 -->
		  	  	</td>
		  	  </tr>
	  	  </c:forEach>
	  	</table>
	  	<table class="table" style="border-color: white">
	  	  <tr>
	  	  	<td class="text-center">
	  	  		<a href="../service/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
	  	  		${curpage } page / ${totalpage } pages
	  	  		<a href="../service/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
	  	  	</td>
	  	  </tr>
	  	</table>
	</div>
</body>
</html>
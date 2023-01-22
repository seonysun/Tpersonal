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
                            <li class="breadcrumb-item"><a class="text-white" href="../service/list.do">고객센터</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">고객 Home</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->

	
	<!-- 검색바 추가 faq 검색 -->
	
	<!-- faq list 추가(카드 형식) 분야별 faq 빠른 찾기를 이용해보세요 -->
	
	<!-- ///고민///faq top10 색 변하는 목록-->
	<table class="table table-striped">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
    </tbody>
  </table>
	
	<!-- qna list include ///고민///이 페이지를 메인으로 넣고 list는 간략하게 출력, 현재 게시판형 list는 마이페이지로? -->
	<!-- 사이드에 배지 출력 depth 수 나타내기 -->
	<ul class="list-group">
	    <li class="list-group-item">New <span class="badge">12</span></li>
	    <li class="list-group-item">Deleted <span class="badge">5</span></li>
	    <li class="list-group-item">Warnings <span class="badge">3</span></li>
  	</ul>
  
	<!-- ///고민///공지사항 list 일부 추가, 더보기 누르면 공지사항 페이지 연결 -->
	
</body>
</html>
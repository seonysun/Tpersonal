<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#selectbox').change(changeseletebox=function(){
		$.ajax({
			type:'post',
			url:'',
			data:{$('#selectbox option:selected').val()}
		})
	})
		
	})
	}
</script>
        <style type="text/css">
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    </style>
</head>
<body>


<!-- 게시판 start -->

<div class="wrapper row3">
  <main class="container clear">
  <div style="height: 120px;">
  
  
  </div>

  <div>
  <h2>Notice</h2>
  <h6>공지사항</h6>
  </div>
    <div style="height: 5px"></div>
  <hr>
  <div style="height: 20px"></div>
  
  <div>
  	<table class="pull-right">
	<tr>
	<td><select class="form-control" name="searchField" id="selectbox">
			<option value="0">전체</option>
			<option value="1">서비스소식</option>
			<option value="2">서비스오픈</option>
			<option value="3">서비스종료</option>
			<option value="4">서비스점검</option>
			<option value="5">안내</option>
	</select></td>
	</tr>

				</table>
  </div>
  <div style="height: 10px;"></div>
  <div style="height: auto;">
  <table class="table">
    <tr>
      <th width=10% class="text-center">NO.</th>
      <th width=20% class="text-center">분류</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">등록일</th>
      <th width=10% class="text-center">조회</th>
    </tr>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td width="10%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.gnbno}</td><%-- vo.getNo() = {} getXxx() --%>
        <td width="20%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.prefix}</td>
        <td width="45%" height="50px" style="vertical-align: middle;" class="notice-table" >
         <a href="../board/notice_detail.do?gnbno=${vo.gnbno }">${vo.subject}</a>&nbsp;
         <c:if test="${vo.dbday==today }">
           <sup><img src="../board/image/new.gif"></sup>
         </c:if>
        </td>
        <td width="15%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.dbday }</td>
        <td width="10%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.hit }</td>
      </tr>
    </c:forEach>
  </table>
  </div>
   <nav class="pagination">
        <ul>
         <c:if test="${startPage>1 }">
          <li><a href="../board/notice_list.do?page=${startPage-1 }">&laquo; Previous</a></li>
         </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":"" }><a href="../board/notice_list.do?page=${i }">${i }</a></li>
          </c:forEach>
         <c:if test="${endPage<totalpage }">
          <li><a href="../board/notice_list.do?page=${endPage+1 }">Next &raquo;</a></li>
         </c:if>
        </ul>
        <!-- 검색바 start -->
        <div class="board_search">
        <div class="container">
		<div class="row">
			<form method="post" name="search" action="../board/notice_list.do" class="inline">
				<table class="pull-right">
					<tr>
						<td><input type="text" class="form-control" value="${ss }"
							placeholder="검색어 입력" name="ss" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	</div>
        <!-- 검색바 end -->
      </nav>
  </main>
</div>

<!-- 게시판 end -->

    


     <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let f=0
$(function(){
	//faq 본문 보여주기
	$('.fsub').hover(function(){
		$(this).css("cursor","pointer")
	},function(){
		$(this).css("cursor","none")
	})
	$('.fsub').click(function(){
		$('.fdetail').hide()
		let no=$(this).attr("data-no")
		if(f===0){
			$('#f'+no).show()
			f=1
		}else{
			$('#f'+no).hide()
			f=0
		}
	})
	
	//페이지 이동
	$('.pBtn').click(function(){
		let page=$(this).val()
		$.ajax({
			type:'post',
			url:'../service/faq_find.do',
			data:{"page":page},
			success:function(response){
				$('#f-find').html(response)
			}
		})
	})
})
</script>
</head>
<body>
	<table class=table>
		  <c:if test="${count==0 }">
	  	   	  <tr>
	  	   		<td colspan=4>검색 결과가 없습니다</td>
	  	   	  </tr>
	  	  </c:if>
		  <c:forEach var="vo" items="${list }" varStatus="s">
		  	  <tr>
		  	  	<td width=10% class="text-center">${count-s.index }</td>
		  	  	<td width=15% class="text-center">${vo.type }</td>
		  	  	<td width=65% class=fsub data-no="${vo.gfno }">${vo.subject }</td>
		  	  	<td width=10% class="text-center">${vo.hit }</td>
		  	  </tr>
		  	  <tr id="f${vo.gfno }" class="fdetail" style="display: none">
				<td colspan=2></td>
				<td>
					<pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content }</pre>
				</td>
				<td>
					<c:if test="${sessionScope.admin=='y' }">
	  	  				<a href="../service/faq_update.do?no=${vo.gfno }" class="btn btn-sm btn-warning">수정</a>
	  	  			</c:if>
				</td>
			  </tr>
	  	  </c:forEach>
	</table>
	<table class="table" style="border-color: white">
	  <tr>
	  	<td class="text-center">
		  	<%--
	  		<a href="../service/faq_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
		  	${curpage } page / ${totalpage } pages
		  	<a href="../service/faq_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
		  	 --%>  		
	  		<span value="${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary pBtn">이전</span>
	  		${curpage } page / ${totalpage } pages
	  		<span value="${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary pBtn">다음</span>
	  	</td>
	  </tr>
	</table>
</body>
</html>
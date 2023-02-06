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
$(function(){
	$('.trs').hover(function(){
		$(this).css("cursor","pointer")
	},function(){
		$(this).css('cursor',"none")
	})
	$('.trs').click(function(){
		let img=$(this).attr("data-img")
		let name=$(this).attr("data-name");
		$('#exhibition_img').attr("src",img)
		$('#exhibition_title').text(name)
		
		$.ajax({
			type:'post',
			url:'../reserve/reserve_date.do',
			success:function(response)
			{
				$('#select_date').html(response)
			}
		})
	})
})
</script>
</head>
<body>
  <table class="table">
   <tr>
     <th class="text-center"></th>
     <th class="text-center">전시명</th>
   </tr>
   <c:forEach var="vo" items="${list }">
     <tr class="trs" data-img="${vo.poster }" data-name="${vo.title }">
      <td class="text-center">
        <img src="${vo.poster }" style="width: 30px;height: 30px">
      </td>
      <td>${vo.title }</td>
     </tr>
   </c:forEach>
  </table>
</body>
</html>
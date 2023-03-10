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
let u=0
let d=0
let r=0
$(function(){
	//답변 내용 보기
	$('.usub').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('.usub').click(function(){
		let no=$(this).attr("data-no")
		if(u==0){
			$('#u'+no).show()
			u=1
		}else{
			$('#u'+no).hide()
			u=0
		}
	})
	
	//삭제
	$('#delete').click(function(){
		if(d===0){
			$('#dpwd').show()
			$('#delete').text("취소")
			d=1
		}else{
			$('#dpwd').hide()
			$('#delete').text("삭제")
			d=0
		}
	})
	$('#delBtn').click(function(){
		let no=$('#dpwd').attr("data-no")
		let pwd=$('#del_pwd').val()
		if(pwd.trim()===""){
			$('#del_pwd').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../service/delete.do',
			data:{"no":no,"pwd":pwd},
			success:function(result){
				let res=result.trim()
				if(res==='y'){
					location.href="../service/list.do"
				}else{
					alert("비밀번호를 다시 확인해주세요")
					$('#del_pwd').val("")
					$('#del_pwd').focus()
				}
			}
		})
	})
	
	//답변 등록
	$('#reply').click(function(){
		if(r===0){
			$('#reinsert').show()
			$('#reply').text("취소")
			r=1
		}else{
			$('#reinsert').hide()
			$('#reply').text("답변")
			r=0
		}
	})
})
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
	<jsp:include page="../service/service_header.jsp"></jsp:include>
    
	<div class="container" style="width:700px">
		<table>
		  <tr>
		  	<td style="border-color: white">
		  		<a href="../service/faq_list.do" class="btn btn-sm btn-primary">FAQ 목록</a>
		  	</td>
		  </tr>
		</table>
		<div style="height: 20px"></div>
	  	<table class="table">
	  	  <tr>
	  	  	<th width=10% class="text-center">번호</th>
	  	  	<td width=10% class="text-center">${vo.gano }</td>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<td width=10% class="text-center">${vo.type }</td>
	  	  	<th width=15% class="text-center">작성일</th>
	  	  	<td width=20% class="text-center">${vo.dbday }</td>
	  	  	<th width=10% class="text-center">조회수</th>
	  	  	<td width=10% class="text-center">${vo.hit }</td>
	  	  </tr>
	  	  <tr>
	  	  	<th colspan=2 class="text-center">제목</th>
	  	  	<td colspan=6>${vo.subject }</td>
	  	  </tr>
	  	  <c:if test="${vo.filesize>0 }">
<!-- 첨부파일 여러개인 경우 filecount 컬럼도 있어야하나? 관리를 어케하징 -->
	  	    <tr>
	  	    	<th colspan=2 class="text-center">첨부파일</th>
	  	    	<td colspan=6>
	  	    	  <img src="../service/image/folder.png" style="width: 20px;height: 20px">
	  	    	  <a href="../service/download.do?fn=${vo.filename }">${vo.filename }</a>(${vo.filesize }Bytes)
	  	    	</td>
	  	    </tr>
	  	  </c:if>
	  	  <tr>
	  	  	<td class="text-left" valign=top colspan=8 height=200>${vo.content }</td>
	  	  </tr>
	  	  <c:forEach var="uvo" items="${list }">
		  	  <tr>
		  	  	<td style="color: orange">
		  	  	  <c:if test="${uvo.id=='admin' }">
		  	  		답변
		  	  	  </c:if>
		  	  	  <c:if test="${uvo.id!='admin' }">
			  	  	  <c:if test="${uvo.group_tab>vo.group_tab }">
			  	  		재질문
			  	  	  </c:if>
			  	  	  <c:if test="${uvo.group_tab<vo.group_tab }">
			  	  		질문
			  	  	  </c:if>
		  	  	  </c:if>
		  	  	</td>
		  	  	<td colspan=5 class=usub data-no="${uvo.gano }">${uvo.subject }</td>
		  	  	<td colspan=2>${uvo.dbday }</td>
		  	  </tr>
		  	  <tr class=qunder id="u${uvo.gano }" style="display: none">
		  	  	<td></td>
		  	  	<td class="text-left" valign=top colspan=5 height=100>${uvo.content }</td>
		  	  	<td colspan=2></td>
		  	  </tr>
	  	  </c:forEach>
	  	  <tr>
	  	  	<td class="text-center" colspan=8 style="border-color: white">
	  	  		<a href="../service/update.do?no=${vo.gano }" class="btn btn-sm btn-warning">수정</a>
	  	  		<span class="btn btn-sm btn-danger" id=delete>삭제</span>
	  	  		<a href="../service/list.do" class="btn btn-sm btn-primary">목록</a>
	  	  		<span class="btn btn-sm btn-success" id=reply>답변</span>
	  	  	</td>
	  	  </tr>
	  	  <tr id=dpwd style="display: none" data-no="${vo.gano }">
	  	  	<td class="text-center" colspan=8>
	  	  		<form id=del_frm>
	  	  		  비밀번호: <input type=password size=10 class="input-sm" id=del_pwd>
	  	  		  <input type=button value="삭제" class="btn btn-sm btn-danger" id=delBtn>
	  	  		</form>
	  	  	</td>
	  	  </tr>
	  	</table>
	  	<table class="table" id=reinsert style="display: none">
	  	 <form method=post action="../service/reply.do">
	  	  <c:if test="${sessionScope.admin=='n' }">
			  <tr>
			  	<th width=15% class="text-right">제목</th>
			  	<td width=85%>
			  		<input type=text name=subject size=30 class="input-sm" required>
			  	</td>
			  </tr>
	  	  </c:if>
		  <tr>
		  	<th width=15% class="text-right">내용</th>
		  	<td width=85%>
		  		<textarea rows=10 cols=65 name=content required></textarea>
		  	</td>
		  </tr>
		  <tr>
		  	<th width=15% class="text-right">비밀번호</th>
		  	<td width=85%>
		  		<input type=password name=pwd size=10 class="input-sm" required>
		  		<input type=hidden name=no value="${vo.gano }">
		  		<input type=hidden name=id value="${sessionScope.id }">
		  		<input type=hidden name=admin value="${sessionScope.admin }">
		  	</td>
		  </tr>
		  <tr>
		  	<td colspan=2 class="text-center" style="border-color: white">
		  		<input type=submit value="등록" class="btn btn-sm btn-success">
		  	</td>
		  </tr>
	  	 </form>
		</table>
	</div>
</body>
</html>
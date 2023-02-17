<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
let u=0;
let r=0;
$(function(){
	$('#delete').click(function(){
		if(i===0)
		{
			$('#del').show();
		    $('#delete').text("취소");
		    i=1
		}
		else
		{
			$('#del').hide();
		    $('#delete').text("수정");
		    i=0
		}
	})
	$('#del_btn').on('click',function(){
		let pwd=$('#del_pwd').val()
		if(pwd.trim()==="")
		{
			$('#del_pwd').focus()
			return;
		}
		let no=$('#del').attr("data-no");
		$.ajax({
			type:'post',
			url:'../board/review_delete.do',
			data:{"no":no,"pwd":pwd},
			success:function(result)
			{
				let res=result.trim();
				if(res==='yes')
				{
					location.href="../board/review_list.do"
				}
				else
				{
					alert("비밀번호가 틀립니다!!\n다시 입력하세요")
					$('#del_pwd').val("")
					$('#del_pwd').focus()
				}
			}
		})
	})
	
	$('.ups').click(function(){
		$('.rinsert').hide();
		$('.rupdate').hide();
		let no=$(this).attr("data-no");
		if(u===0)
		{
			$('#u'+no).show();
			$(this).text("취소")
			u=1;
		}
		else
		{
			$('#u'+no).hide();
			$(this).text("수정")
			u=0;
		}
	})
	
	$('.replys').click(function(){
		$('.rinsert').hide();
		$('.rupdate').hide();
		
		let no=$(this).attr("data-no");
		if(r===0)
		{
			$('#r'+no).show();
			$(this).text("취소")
			r=1;
		}
		else
		{
			$('#r'+no).hide();
			$(this).text("답글쓰기")
			r=0;
		}
	})
})

function like_func(){
     var frm_read = $('#frm_read');
     var reviewboardno = $('#reviewboardno', frm_read).val();
     //var mno = $('#mno', frm_read).val();
     //console.log("boardno, mno : " + boardno +","+ mno);
     
     $.ajax({
       url: "../board/like_insert.do",
       type: "GET",
       cache: false,
       dataType: "json",
       data: 'reviewboardno=' +reviewboardno,
       success: function(data) {
         var msg = '';
         var like_img = '';
         msg += data.msg;
    
       }
     });
   }



</script>
        <style type="text/css">
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
textarea {
	resize: none;
}
    </style>
</head>
<body>


<!-- 게시판 글 상세 start -->

<div class="wrapper row3">
  <main class="container clear">
  
  <div style="height: 100px;">
  
  
  </div>
  <div>
  <h2>Review</h2>
  <h6>후기 게시판</h6>
    <div style="height: 5px"></div>
  
  </div>
  <div style="height: 5px"></div>
    			<div style="width: 100%;height: 30px;display: flex;flex-direction: row;justify-content: space-between;">
	  	  		<div style="height: 20px">
		  	  		<span>
				    	<a href="../board/review_detail.do?no=${vo.no-1 }" style="padding: 7px 7px 3px 7px;border: 1px solid gray;font-family: GmarketSansMedium" class="btn btn-sm writerbtn thebogy">이전글</a>
					</span>
	  	  		</div>
	  	  		<div style="height: 20px">
		  	  		<span>
				    	<a href="../board/review_detail.do?no=${vo.no+1 }" style="padding: 7px 7px 3px 7px;border: 1px solid gray;font-family: GmarketSansMedium" class="btn btn-sm writerbtn thebogy">다음글</a>
					</span>
	  	  		</div>
		  	</div>
		  	<hr>
  <table class="table board">
   <tr>
	<td width=95% class="text-left" colspan="3"><span style="font-size:13px;font-weight: 400;color: orange;">${vo.display_name }</span><br><span style="font-size:26px;font-weight: 400;">${vo.subject }</span></td>
   </tr>
   <tr>
     <th width=5% class="text-center"><img src="../board/image/profile.png" style="height: 40px; width: 40px;"></th>
     <td width=75% class="text-left">${vo.name }<br><span style="font-size:12px;font-weight: 400;">${vo.dbday } &nbsp; 조회 ${vo.hit }</span></td>
     <th width=20% class="text-right" valign="middle"><i class="fa-regular fa-comment-dots fa-lg"></i>&nbsp; 댓글(${count}) &nbsp;<img src="../board/image/heart.png" style="width: 30px;height: 30px;">&nbsp;공감(${like_total })</th>
   </tr>
   <tr>

<td class="text-left" valign="top" colspan="4" height="300"><pre style="white-space: pre-wrap;background-color: white;border: none;font-size: 15px;padding-top: 30px;padding-bottom: 30px;">${vo.content }</pre></td>
	
   </tr>
   
   
   <c:if test="${sessionScope.id!=null }">
   <tr>
     <td class="text-right" colspan="4">
     
           <c:if test="${like_count==0 }">
            <a href="../board/like_insert.do?no=${vo.no }" class="btn btn-xs" style="background-color: #F55066; color: #fff; border-radius: 5px;">공감  ${like_total }</a>
         </c:if>
         <c:if test="${like_count!=0 }">
            <span href="../board/like_insert.do?no=${vo.no }" class="btn btn-xs" style="background-color: gray; color: #fff; border-radius: 5px;">공감완료  ${like_total }</span>
         </c:if>
     	<div style="float: right;">
     	<c:if test="${sessionScope.id==vo.id }">
       <a href="../board/review_update.do?no=${vo.no }" class="btn btn-xs" style="font-family: GmarketSansMedium;">수정</a>
       <span class="btn btn-xs" id="delete" style="font-family: GmarketSansMedium;">삭제</span>
</c:if>
       </div>
     </td>
   </tr>
   </c:if>
   
   
   <tr id="del" style="display:none" data-no="${vo.no }">
    <td colspan="4" class="text-right">
    <form id="del_frm" class="inline">
    비밀번호:<input type=password class="input-sm" size=15 id="del_pwd">
    <input type=button value="삭제" class="btn btn-sm btn-primary" id="del_btn" style="font-family: GmarketSansMedium">	
    </form>
    </td>
   </tr>
  </table>
  
  <div style="height: 10px"></div>
  
  
  <div class="content three_quarter first">
  <h6 class="text-left" >댓글(${count})</h6>
  <c:if test="${count==0 }">
  </c:if>
  <c:if test="${count>0 }">
    <table class="table">
     <tr>
      <td>
        <c:forEach var="rvo" items="${list }">
          <table class="table">
            <tr>
            <td width="3%" rowspan="2">
            <img src="../board/image/pro.png" style="width: 50px;height: 50px;">
            </td>
              <td class="text-left" style="border-style: none;">
                <c:if test="${rvo.group_tab>0 }">
                  <c:forEach var="i" begin="1" end="${rvo.group_tab }">
                    답글&nbsp;&nbsp;
                  </c:forEach>
                </c:if>
              <span style="color:orange;font-size:13px;font-weight: 400;;">${rvo.name }</span>&nbsp;<br><span style="font-size:12px;font-weight: 400;">(${rvo.dbday })</span>
              <span class="btn btn-xs replys" style="font-family: GmarketSansMedium;vertical-align: bottom;font-size: 13px;padding: 0" data-no="${rvo.rno }">답글쓰기</span>
                              <c:if test="${sessionScope.id!=null }">
                 <c:if test="${sessionScope.id==rvo.id }">
                  <span class="btn btn-xs ups" style="vertical-align: bottom;font-size: 13px;font-family: GmarketSansMedium;padding: 0" data-no="${rvo.rno }">수정</span>
                  <a href="../board/reply_delete.do?rno=${rvo.rno }&bno=${vo.no}" class="btn btn-xs" style="font-family: GmarketSansMedium;vertical-align: bottom;font-size: 13px;padding: 0;">삭제</a>
                 </c:if>
                </c:if>
              </td>
              <td class="text-right"style="border-style: none;" valign="bottom">

              </td>
            </tr>
            <tr>
              <td colspan="2">
                <pre style="white-space: pre-wrap;background-color: white;border: none;font-size: 15px;">${rvo.msg }</pre> 
              </td>
            </tr>
            <%-- 대댓글 --%>
            <tr id="r${rvo.rno }" class="rinsert" style="display:none;">
             <td colspan="2">
               <form method="post" action="../board/reply_reply_insert.do">
		         <input type=hidden name="bno" value="${vo.no }">
		         <input type=hidden name="pno" value="${rvo.rno }">
		         <textarea rows="3" cols="90" name="msg" placeholder="댓글을 남겨보세요." style="float: left"></textarea>&nbsp;
		            <input type=submit value="등록" class="btn btn-sm" style="height: 65px;font-family: GmarketSansMediumfont-size:13px;font-weight: 400;background-color: orange;color: white;">
		        </form>
             </td>
            </tr>
            <%-- 수정 --%>
            <tr id="u${rvo.rno }" class="rupdate" style="display:none">
             <td colspan="2">
              
               <form method="post" action="../board/reply_update.do">
		         <input type=hidden name="bno" value="${vo.no }">
		         <input type=hidden name="rno" value="${rvo.rno }">
		         <textarea rows="3" cols="90" name="msg" style="float: left">${rvo.msg}</textarea>&nbsp;
		         <input type=submit value="수정" class="btn btn-sm btn-danger" style="height: 65px;font-family: GmarketSansMedium;">
		        </form>
             </td>
            </tr>
          </table>
        </c:forEach>
      </td>
     </tr>
    </table>
  </c:if>
  <c:if test="${sessionScope.id!=null }">
    <table class="table">
     <tr>
       <td>
        <form method="post" action="../board/reply_insert.do">
         <input type=hidden name="bno" value="${vo.no }">
         <textarea rows="3" cols="90" name="msg" placeholder="댓글을 남겨보세요." style="float: left;"></textarea>&nbsp;
         <input type=submit value="등록" class="btn btn-sm" style="height: 65px;font-family: GmarketSansMediumfont-size:13px;font-weight: 400;background-color: orange;color: white;">
        </form>
       </td>
     </tr>
    </table>
  </c:if>
  </div>
  
    	<div class="btn_customer">
	<span class="btn btn-lg btn_list"><a href="../board/review_list.do" class="btlcu">목록</a></span>
	</div>
  </main>
</div>

<!-- 게시판 글 상세 end -->

    


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
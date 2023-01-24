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
#csCenter_wrap .faqDlArea {
    margin: 0 auto;
    width: 958px;
    border: solid 1px #d8d8d8;
    background-color: #fff;
}
#csCenter_wrap .faqDlArea .faqDl_row {
    position: relative;
    display: table;
    width: 100%;
    table-layout: fixed;
}
#csCenter_wrap .faqDlArea .faqDl_row dl.faqDl_col.faqDl_col1 {
    width: 159px;
}
#csCenter_wrap .faqDlArea .faqDl_row dl.faqDl_col {
    position: relative;
    display: table-cell;
    padding-bottom: 12px;
    width: 160px;
    vertical-align: top;
}
#csCenter_wrap .faqDlArea .faqDl_row dl.faqDl_col dt {
    height: 40px;
    font-size: 13px;
    line-height: 40px;
    font-weight: bold;
    color: #333;
    background-color: #f8f8f8;
}
yesAlertLi li {
    padding: 2px 0 1px 7px !important;
    line-height: 18px !important;
    text-indent: -7px !important;
    color: #666;
    font-size: 12px;
    border: none !important;
    text-align: left;
}
</style>
</head>
<body>
	<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">고객센터</h1>
	<!-- faq 검색바 -->
                    <div style="height: 70px; color: white">
	                    <p>GOD 고객센터입니다. 무엇이든 검색해보세요</p>
						<input type="search" id="search" size=30 placeholder=" 검색어 입력" style="border-radius: 20px;border: none"/>
						<button type="submit" style="border: none;background-color: #27375C;color: white;"><i class="fa fa-search"></i></button>
                    </div>
	<!-- 인기검색어 -->
                    <div class=faqDlArea>
                      <div class="faqDl_row">
					    <dl class="faqDl_col">
					        <dt>인기 검색어</dt>
					        <dd>
					          <ul>
					            <li><a href="http://www.yes24.com/Mall/Help/Faq?faqquery=%uBD81%uD074%uB7FD">북클럽 </a></li>
					            <li><a href="http://www.yes24.com/Mall/Help/FAQ?faqGb=33">배송 </a></li>
					            <li><a href="http://www.yes24.com/Mall/Help/FAQ?faqGb=35&amp;faqSubGb=YE2">회원정보 확인/변경 </a></li>
					            <li><a href="http://www.yes24.com/Mall/Help/FAQ?faqGb=40">중고매장 </a></li>
					            <li><a href="http://www.yes24.com/Mall/Help/Faq?faqquery=%uACF5%uC5F0%uC608%uB9E4%uC218%uC218%uB8CC">티켓예매 수수료 </a></li>
					          </ul>
					        </dd>
					    </dl>
                      </div>
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
	</div>
	<table class="table" style="border-color: white">
	  <tr>
	  	<td>
	  		<a href="../service/faq_list.do?type=1" class="btn btn-primary py-md-3 px-md-5 slideInLeft">회원</a>
			<a href="../service/faq_list.do?type=2" class="btn btn-primary py-md-3 px-md-5 slideInRight">예매</a>
	  		<a href="../service/faq_list.do?type=3" class="btn btn-primary py-md-3 px-md-5 slideInLeft">결제</a>
	  		<a href="../service/faq_list.do?type=4" class="btn btn-primary py-md-3 px-md-5 slideInRight">티켓</a>
	  		<a href="../service/faq_list.do?type=5" class="btn btn-primary py-md-3 px-md-5 slideInLeft">기타</a>
	  	</td>
	  </tr>
	</table>
	
<div class="faqDlArea">
    <!-- ##########0000000000 FAQ ROW 시작 0000000000########## -->
    <div class="faqDl_row faqDl_row01">
            <dl class="faqDl_col faqDl_col1">
        <dt>상품</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=31&amp;faqSubGb=YA1" >국내도서     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=31&amp;faqSubGb=YA2" >외국도서     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=31&amp;faqSubGb=YA3" >CD/LP     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=31&amp;faqSubGb=YA4" >DVD/Blu-ray     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=31&amp;faqSubGb=YA5" >GIFT/업체상품     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=31&amp;faqSubGb=YA6" >VOD 관람권     </a></li>
            </ul>
        </dd>
    </dl>

            <dl class="faqDl_col faqDl_col2">
        <dt>주문/결제/영수증</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=32&amp;faqSubGb=YB1" >주문/주문확인     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=32&amp;faqSubGb=YB2" >주문 변경     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=32&amp;faqSubGb=YB3" >결제정보     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=32&amp;faqSubGb=YB4" >대량주문     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=32&amp;faqSubGb=YB5" >세금계산서/영수증/거래명세서     </a></li>
            </ul>
        </dd>
    </dl>

            <dl class="faqDl_col faqDl_col3">
        <dt>배송</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=33&amp;faqSubGb=YC1" >배송정보     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=33&amp;faqSubGb=YC2" >해외배송     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=33&amp;faqSubGb=YC3" >배송비     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=33&amp;faqSubGb=YC4" >배송지연/품절보상제도     </a></li>
            </ul>
        </dd>
    </dl>

            <dl class="faqDl_col faqDl_col4">
        <dt>취소/교환/반품</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=34&amp;faqSubGb=YD1" >취소/취소환불     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=34&amp;faqSubGb=YD2" >교환     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=34&amp;faqSubGb=YD3" >반품/반품환불     </a></li>
            </ul>
        </dd>
    </dl>

            <dl class="faqDl_col faqDl_col5">
        <dt>회원관리</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=35&amp;faqSubGb=YE1" >회원가입/탈퇴     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=35&amp;faqSubGb=YE2" >회원정보 확인/변경     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=35&amp;faqSubGb=YE3" >인증문의 (성인/본인/아이핀인증)     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=35&amp;faqSubGb=YE4" >휴면회원     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=35&amp;faqSubGb=YE5" >법인회원     </a></li>
            </ul>
        </dd>
    </dl>

            <dl class="faqDl_col faqDl_col6">
        <dt>회원계정</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=36&amp;faqSubGb=YF1" >YES 마니아     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=36&amp;faqSubGb=YF2" >YES 포인트     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=36&amp;faqSubGb=YF3" >YES 머니     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=36&amp;faqSubGb=YF4" >상품권     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=36&amp;faqSubGb=YF5" >쿠폰     </a></li>
            </ul>
        </dd>
    </dl>

    </div>
    <div class="faqDl_row faqDl_row02">
            <dl class="faqDl_col faqDl_col1">
        <dt>티켓</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=38&amp;faqSubGb=YG2" >티켓 결제     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=38&amp;faqSubGb=YG3" >티켓 수령/배송     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=38&amp;faqSubGb=YG4" >티켓 취소/환불     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=38&amp;faqSubGb=YG1" >티켓 예매     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=38&amp;faqSubGb=YG8" >티켓 MD상품     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=38&amp;faqSubGb=YG7" >티켓 기타     </a></li>
            </ul>
        </dd>
    </dl>

            <dl class="faqDl_col faqDl_col2">
        <dt>중고</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=39&amp;faqSubGb=YI1" >YES24 직배송 중고     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=39&amp;faqSubGb=YI2" >회원이 판매하는 중고     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=39&amp;faqSubGb=YI3" >YES24 바이백     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=39&amp;faqSubGb=YI4" >중고샵 표준 서비스     </a></li>
            </ul>
        </dd>
    </dl>

            <dl class="faqDl_col faqDl_col3">
        <dt>매장</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=40&amp;faqSubGb=YJ1" >매장 이용     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=40&amp;faqSubGb=YJ2" >중고매장 바이백     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=40&amp;faqSubGb=YJ3" >매장 픽업     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=40&amp;faqSubGb=YJ4" >중고매장 배송 온라인 중고     </a></li>
            </ul>
        </dd>
    </dl>

            <dl class="faqDl_col faqDl_col4">
        <dt>eBook/웹소설,코믹</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=41&amp;faqSubGb=YK1" >eBook     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=41&amp;faqSubGb=YY" >북클럽/북클럽머니     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=41&amp;faqSubGb=YK6" >티티북클럽     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=41&amp;faqSubGb=YK7" >킨더동아     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="https://story24.yes24.com/mypage/setting?category=faq" target=blank>웹소설, 코믹     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=41&amp;faqSubGb=YK2" >크레마원     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=41&amp;faqSubGb=YK3" >크레마 e-ink     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=41&amp;faqSubGb=YK4" >디지털머니     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=41&amp;faqSubGb=YK5" >4세대 뷰어 문의     </a></li>
            </ul>
        </dd>
    </dl>

            <dl class="faqDl_col faqDl_col5">
        <dt>기타</dt>
        <dd>
            <ul class="yesAlertLi">
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=42&amp;faqSubGb=YL1" >리뷰/한줄평     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=42&amp;faqSubGb=YL2" >YES블로그/스타블로그     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=42&amp;faqSubGb=YL3" >홈페이지/시스템장애     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=42&amp;faqSubGb=YL4" >문화비 소득공제     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=42&amp;faqSubGb=YL5" >최저가 보상제도     </a></li>
                    <li><em class="bl_dot bgYUI">&nbsp;</em><a href="/Mall/Help/FAQ?faqGb=42&amp;faqSubGb=YL6" >기타     </a></li>
            </ul>
        </dd>
    </dl>

        <dl class="faqDl_col faqDl_col6">
            <dt></dt>
            <dd>
            </dd>
        </dl>
    </div>
    <!-- ##########0000000000 FAQ ROW 끝 0000000000########## -->
</div>
	
<!-- faq top10 -->
<!-- detail로 연결하지 말고 화면에서 바로 아래에 출력되도록 하기 -->
	<div style="height: 30px"></div>
	<h4 class="text-primary px-3">자주 묻는 질문 TOP10</h4>
	<table class="table">
	  <tr>
	 	<th width=10% class="text-center">순위</th>
	 	<th width=10% class="text-center">문의유형</th>
	  	<th width=70% class="text-center">제목</th>
	  	<th width=10% class="text-center">
	  		<a href="../service/faq_list.do"><input type=button class="btn btn-sm btn-primary" value="더보기"></a>
	  	</th>
 	  </tr>
 	  <c:forEach var="vo" items="${flist }" varStatus="s">
		  <tr>
		   	<td width=10% class="text-center">${s.index+1 }</td>
		  	<td width=10% class="text-center">${vo.type }</td>
		  	<td width=70%>
		  	  <a href="../service/faq_detail.do?no=${vo.gfno }" style="color: black">${vo.subject }</a>
		  	</td>
		  	<td width=10% class="text-center"></td>
		  </tr>
	  </c:forEach>
	</table>
	
<!-- qna -->
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
		<c:if test="${vo.group_tab==0 }">
		  <tr>
		  	<td width=15% class="text-center">${vo.type }</td>
		  	<td width=35%>
		  	  <c:if test="${vo.group_tab>0 }">
		  	  	<c:forEach var="i" begin="0" end="${vo.group_tab }">&nbsp;&nbsp;</c:forEach>
		  	  </c:if>
		  	  <img src="">
		  	  <a href="../service/detail.do?no=${vo.gano }" style="color: black">${vo.subject }</a>
		  	</td>
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
  
<!-- 공지사항 list 일부 추가, 더보기 누르면 공지사항 페이지 연결 -->
	
	</div>
</body>
</html>
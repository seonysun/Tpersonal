<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rlist td{
	text-align: left;
}
</style>
</head>
<body>
	<table class="table rlist">
	  <tr>
    	<th width=40%>선택한 전시</th>
    	<td width=60%></td>
      </tr>
      <tr colspan=2 rowspan=3>
    	<td class=text-center colspan=2>
    	 	<img src="${vo.poster }" style="width: 150px;height: 200px">
    	 	<div style="height:5px"></div>
        	<b>&lt;&nbsp;${vo.title }&nbsp;&gt;</b><br>
        	${vo.period }
        </td>
      </tr>
      <tr>
    	<th width=35%>예매날짜</th>
    	<td width=65%><span id="r_day"></span></td>
      </tr>
      <tr>
    	<th width=35%>예매시간</th>
    	<td width=65%><span id="r_time"></span></td>
      </tr>
      <tr>
    	<th width=35%>수량</th>
    	<td width=65%><span id="r_pers"></span></td>
      </tr>
      <tr>
    	<th width=35%>금액</th>
    	<td width=65%><span id="r_price"></span></td>
      </tr>
      <tr>
    	<td colspan=2 class="text-center rBtn" style="display: none">
    	  <form method="post" action="../reserve/pay.do">
    		<input type=hidden name="reserveno" id="reserveno">
    		<input type=hidden name="reservedate" id="reservedate">
    		<input type=hidden name="reservetime" id="reservetime">
    		<input type=hidden name="reservepers" id="reservepers">
    		<input type=submit class="btn btn-sm btn-danger" value="예매하기">
    	  </form>
    	</td>
      </tr>
	</table>
</body>
</html>
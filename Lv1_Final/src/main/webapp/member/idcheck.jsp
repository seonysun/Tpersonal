<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
  font-family: 'Open Sans', sans-serif;
  background:white;
  margin: 0 auto 0 auto;
  width:100%; 
  text-align:center;
  margin: 70px 0px 0px 0px;
  font-size:14px;
}

p{
  font-size:12px;
  text-decoration: none;
  color:#ffffff;
}

h1{
  font-size:1.5em;
  color:#525252;
}

.box{
  background:white;
  width:300px;
  border-radius:6px;
  margin: 0 auto 0 auto;
  padding:0px 0px 50px 0px;
  border: none; 
}

.id{
  background:#ecf0f1;
  border: #ccc 1px solid;
  border-bottom: #ccc 2px solid;
  padding: 8px;
  width:250px;
  color:#AAAAAA;
  margin-top:10px;
  font-size:1em;
  border-radius:4px;
}

.password{
  border-radius:4px;
  background:#ecf0f1;
  border: #ccc 1px solid;
  padding: 8px;
  width:250px;
  font-size:1em;
}

.btn{
  background:#27375C;
  width:125px;
  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #27375C 1px solid;
  
  margin-top:20px;
  margin-bottom:20px;
  float:left;
  margin-left:16px;
  font-weight:800;
  font-size:0.8em;
}

.btn:hover{
  background:#27375C;
  opacity: 0.8;
}

#btn2{
  float:left;
  background:#27375C;
  width:125px;  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #27375C 1px solid;
  
  margin-top:20px;
  margin-bottom:20px;
  margin-left:10px;
  font-weight:800;
  font-size:0.8em;
}

#btn2:hover{ 
background:#27375C;
opacity: 0.8;
}
}
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#okBtn').hide();
	$('#idBtn').on('click', function(){
		let id = $('#id').val() // ???????????? ????????????
		if(id.trim() == "") {
			$('#id').focus();
			return
		}
		let idRegExp = /^[a-zA-z0-9]{4,8}$/;
		if (!idRegExp.test(id.trim())) {
            $('#result').html("<font color=red>???????????? ?????? ???????????????<br> ?????? 4~8????????? ?????????????????????!</font>");
            $('#id').val("");
        	$('#id').focus();
        	return
        }
		
		$.ajax({
			type: 'post', // get, post
			url: '../member/idcheck_result.do', // Model??? ???????????? (MVC Model=??????????????? ?????????)
			data:{"id":id},
			// ????????? JSP????????? ???????????? ==> 1. HTML, 2. JSON
			success:function(result){ // ??????: ???????????? ?????? ?????? ??????
				let res = Number(result.trim()); // ????????? ??????
				if(res === 0) {
					$('#result').html('<font color=blue>'+id+"???(???) ?????? ????????? ??????????????????</font>");
					$('#okBtn').show();
				} else {
					$('#result').html('<font color=red>'+id+"???(???) ?????? ???????????? ??????????????????</font>");
					$('#okBtn').hide();
				}
			}
		})
	})
	$('#okBtn').click(function(){
		parent.join_frm.id.value=$('#id').val(); // join.jsp?????? ?????????
		parent.Shadowbox.close()
	})
})
</script>
</head>
<body>
	
	
<div class="box">
	<h1>????????? ????????????</h1>
	
	<input type="text" id="id" placeholder="???????????? ??????????????????" class="id" />
	 
	<br>
	<div style="margin-top:5px;">
	<span id="result"></span>
	</div>
	<a href="#" id=idBtn><div class="btn">????????????</div></a> <!-- End Btn -->
	<a href="#" id=okBtn><div id="btn2">??????</div></a> <!-- End Btn2 -->
  
</div>
	
	
	
</body>
</html>
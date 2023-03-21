<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<!-- <link rel="stylesheet" href="../Content/app3/css/common.css" media="all"> -->
<link rel="stylesheet" href="../Content/app3/css/class_list.css">
<script src="../Scripts/app3/jquery-1.12.4.min.js"></script>
<script src="../Scripts/app3/list.js"></script>
<script src="../Scripts/app3/jquery-ui.js"></script>
<script src="../Scripts/app3/swiper.min.js"></script>
<script src="../Scripts/app3/lazysizes.min.js"></script>

<script src="../Scripts/renewal2203/js/header.js"></script>
<script src="../Scripts/topbar.js"></script>
<script src="../Scripts/app3/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function toggleCategoryList() {
	  var categoryList = document.querySelector('.filter_category');
	  categoryList.style.display = categoryList.style.display === 'none' ? 'block' : 'none';
	}
function toggleClassList() {
	  var classList = document.querySelector('.class_category');
	  classList.style.display = classList.style.display === 'none' ? 'block' : 'none';
	}
//목록 누르면 출력되는 함수
function showDetailList(){
	//클릭한 depth1요소
	var depth1Element=this;
	// 해당 depth1 요소의 하위 요소인 .sub_content 엘리먼트
    var subContentElement = depth1Element.nextElementSibling;
	
 // 하위 요소가 숨겨져 있으면 보여줌
    if (subContentElement.style.display === 'none') {
        subContentElement.style.display = 'block';
    }
    // 하위 요소가 보여져 있으면 숨김
    else {
        subContentElement.style.display = 'none';
    }
}
//DOM 로딩이 끝난 후 실행되는 함수
document.addEventListener('DOMContentLoaded', function() {
    // depth1 요소들에 이벤트 리스너 등록
    var depth1Elements = document.querySelectorAll('.depth1');
    for (var i = 0; i < depth1Elements.length; i++) {
        depth1Elements[i].addEventListener('click', showDetailList);
    }
});
</script>
</head>
<body>
<main class="search container">
    <!-- select_list -->
    <div class="select_list">
        <li>
          <button type="button" class="category_filed" onclick="toggleCategoryList()">카테고리</button>
            <div class="filter_contents filter_depth3 filter_category" style="display: none;">
              <ul class="depth1_list" v-for="cvo in class_name" v-on:click="detail_cate_name_list(cvo.cateno)">
                
                <li class="depth1">{{cvo.catename}}</li>  <!-- data-id="" -->
                <div class="sub_content">
                <ul class="depth2_list" >
                  <li class="depth1" v-for="dcvo in detail_class_name">
                  {{dcvo.detail_catename }}</li>  <!-- data-id="" -->
                  
              </ul>
              </div>    
               
              </ul>
              
<!--               [D] depth1 개수만큼 .sub_contents 생성 -->
                      
            </div>
          </li>
        
          <button type="button" class="category_filed1" onclick="toggleClassList()">클래스 진행 방식</button>
            <div class="filter_contents filter_depth2 class_category" style="display: none;">
              <!-- <form action=""> -->
                <!-- <div class="depth2"> -->
                  <p class="filter_title">클래스 종류</p>
                    <ul>
                      <li class="list">
                        <input type="checkbox" class="blind" id="online" name="classType" value="2">
                        <label for="online" class="inp_chkbox">온라인 LIVE</label>
                      </li>
                      <li class="list">
                        <input type="checkbox" class="blind" id="offline" name="classType" value="1">
                        <label for="offline" class="inp_chkbox">오프라인</label>
                      </li>
                    </ul>
                <!-- </div> -->
                <div class="filter_search_area">
                  <button type="button" class="btn_reset" onclick="filterReset(this);" disabled="">선택 해제</button>
                  <button class="btn_search">필터 적용</button>
                </div>
<!--               </form> -->
            </div>
        </li>
    </div>
    <!-- // select_list -->

    <!-- selected_list -->
    
    <!-- // selected_list -->
		
    <!-- category_path -->
    <div class="category_path">
      <span>{{catename}}</span> 
      <span>{{detail_catename}}</span>		   <!-- 여기 디테일카테네임 어떻게 들고오지..? -->
   </div>
    <!-- result_count -->
    <p class="result_count">검색 결과 {{count}}개</p>
    <!-- // result_count -->
    <!-- search_result -->
    <!-- // category_path -->
    <section class="search_result">
      <!-- class_card_list -->
      <ul class="class_card_list" >
        <li class="swiper-slide" v-for="cvo in class_list">
            <a :href="'../class/class_detail.do?cno='+cvo.cno">
            <div class="thumb lazyloaded"> <!-- :style="{'background-image':'url('{{cvo.image}}')}">   -->    
			  <img v-if="cvo.image=='noimg.jpg'" :src="'../images/'+cvo.image">
			  <img v-else :src="cvo.image">
            </div>      
          <div class="card_cnt">            
            <div class="badge_list inline">
              <span class="badge offline">{{cvo.location}}</span>            
            </div>            
            <h3 class="talent_title">{{cvo.title}}</h3>            
            <p class="cate_tutor">
              <span class="name">{{cvo.tutor_info_nickname}}</span>
            </p>            
            <p class="price_info">
              <span class="price">{{cvo.perprice}}</span>            
            </p>    
            </a>        
            <div class="talent_info">                
              <span class="jjim"><img src="../images/hearton32px.png" style="width: 20px;height: 20px">&nbsp;&nbsp;{{cvo.jjim_count}}</span>
              <!-- <span class="reward_badge" style="background-image:url('//front-img.taling.me/Content/app3/img/icon/icClasscardReview@2x.png')">{{cvo.rivew}}</span>    리뷰 개수 출력   -->      
            </div>        
          </div>    
        </li>                   
      </ul>
            <!-- // class_card_list -->
            <!-- pagination -->
            <nav class="pagination">
              <ul class="list-inline">
                <li v-if="startPage>1">
                  <a v-on:click="prev()">&laquo;</a>
                </li>
                <li class="current" v-for="i in range(startPage,endPage)" v-if="i==curpage">
                  <a class="act" v-on:click="pageClick(i)">{{i}}</a>
                </li>
                <li v-else>
                  <a v-on:click="pageClick(i)">{{i}}</a>
                </li>
                <li v-if="endPage<totalpage">
                  <a v-on:click="next()"> &raquo;</a>
                </li>
               </ul>
            </nav> 
            
            <!-- // pagination -->
        </section>
        <!--// search_result -->
    </main>
    <script>
    new Vue({
       el:'.container',
       data:{
          cateno:${cateno},
          detail_cateno:${detail_cateno},
          catename:'',
          detail_catename:'',
          class_list:[],
          class_name:[],
          detail_class_name:[],
          curpage:1,
          totalpage:0,
          startPage:0,
          endPage:0,
          count:0
          
       },
       mounted:function(){
          this.pageChange();
		  this.cate_name_list();
       },
       methods:{
           pageChange:function(){
                  let _this=this;
                  axios.get("../class/class_list_vue.do",{
                     params:{
                       cateno:this.cateno,
                       detail_cateno:this.detail_cateno,
                        page:this.curpage
                        
                        
                     }
                  }).then(function(response){
                     console.log(response.data);
                     _this.class_list=response.data
                     _this.curpage=response.data[0].curpage
                     _this.totalpage=response.data[0].totalpage
                     _this.startPage=response.data[0].startPage
                     _this.endPage=response.data[0].endPage
                     _this.count=response.data[0].count
                     _this.catename=response.data[0].catename
                     _this.detail_catename=response.data[0].detail_catename
                  })
               },
               cate_name_list:function(){
            	   let _this=this;
            	   axios.get("../class/class_cate_vue.do").then(function(response){
            		   console.log(response.data)
            		   _this.class_name=response.data
            	   })
               },
               detail_cate_name_list:function(cateno_forname){
            	   let _this=this;
            	   axios.get("../class/class_detail_cate_vue.do?cateno="+cateno_forname).then(function(response){
            		   console.log(response.data)
            		   _this.detail_class_name=response.data
            	   })
               },
               range:function(min,max){
                     let array=[],
                     j=0;
                     for(let i=min;i<=max;i++){
                        array[j]=i;
                        j++;
                     }
                     return array;
                  },
                  prev:function(){
                     this.curpage=this.startPage-1;
                     this.pageChange();
                  },
                  next:function(){
                     this.curpage=this.endPage+1;
                     this.pageChange();
                  },
                  pageClick:function(page){
                     this.curpage=page
                     this.pageChange()
                  }
            }
         })
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css"
   rel="stylesheet">
<link rel="stylesheet" href="resources/css/schedule2.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<meta charset="UTF-8" name="viewport"
   content="width=device-width, initial-scale=1.0">
<title>tagPage</title>
<script>
   $(document).ready(function() {
      // tag 클릭 됬는지 확인변수
      var checkClicked = false;
      var tagClicked = false;
      var tagConcatString = "";
      var checkCount = 0;

      // 시작시 cancel 버튼 숨기고 시작
      $("#cancel_img").hide();
      
      // check 버튼 클릭시
      $(".check_button").click(function() {
         if(!checkClicked){
            checkClicked = true;
            //$("#check_img").fadeOut(250).toggleClass("far fa-trash-alt", 250).fadeIn(250);
            $("#check_img").fadeOut(250).queue(function(next){$(this).removeClass('fas fa-check-double');$(this).addClass('far fa-trash-alt');next();}).fadeIn(250);
            //$("#check_img").fadeOut(250).delay(250, removeClass("fas fa-check-double")).delay(250, addClass("far fa-trash-alt")).fadeIn(250);
            $("#cancel_img").fadeIn(500);
            $(".tag_span3").toggle(150);   // span2 펼침
         }

         if(checkClicked && tagClicked && checkCount > 0){ // 페이지 이동
            tagConcatString = tagConcatString.substring(0, tagConcatString.length-1);   // remove the first '-''
            //alert("/tagPage/" + ${user_id} +"/" + tagConcatString);
            window.location.href="/tagPage/" + ${user_id} +"/" + tagConcatString;   // 페이지 이동
            tagConcatString=""; // 초기화
         }
      });

      // tag 버튼 클릭시
      $(".tag_div").click(function() {
         if(checkClicked){
            if(!$(this).hasClass( 'selected_tag' )) {   // if not selected
                 tagClicked = true;
                 checkCount++;
                 //태그버튼 색깔 변경
                 $(this).addClass( 'selected_tag' );
                 // string concat
                 $(this).find("b").text();
                 tagConcatString += $(this).find(".tag_span2").text() + "-";
                 alert(tagConcatSring);
            }
             else {   // if already selected
                $(this).removeClass( 'selected_tag' );
                checkCount--;
                tagConcatString = tagConcatString.replace(($(this).find(".tag_span2").text() + "-"),"");
                alert(tagConcatSring);
             }


         }

      });

      // cancel 버튼 클릭시
      $(".cancel_button").click(function() {
         checkClicked = false;
         tagClicked = false;
         tagConcatString = "";
         checkCount = 0;
         
         //$(".tag_div").attr('style', 'background-color:none'); //태그 버튼 색깔 바뀜
         $(".tag_div").removeClass( 'selected_tag' );
         $(".tag_span3").toggle(150);   // span2 접음
         
         $("#cancel_img").fadeOut(500); //취소 버튼 사라짐
         $("#check_img").fadeOut(250).queue(function(next){$(this).removeClass('far fa-trash-alt');$(this).addClass('fas fa-check-double');next();}).fadeIn(250);
         //$("#check_img").fadeOut(250).delay(250, removeClass("far fa-trash-alt")).addClass("fas fa-check-double").fadeIn(250);
         //$("#check_img").fadeOut(250).toggleClass("fas fa-check-double", 250).fadeIn(250);
      });

      
   });
</script>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

@media ( max-width : 1500px) {
   body {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      -ms-overflow-style: none;
      font-family: "Noto Sans KR", sans-serif;
      background-color: white;
   }
   * {
      box-sizing: border-box;
   }
   .totalWrapper {
      /* overflow-y:scroll!important; */
      width: 100%;
      height: 100%;
   }
   .header {
      padding-top: 10px;
      /* border-bottom:1px solid rgb(44,62,80); */
      padding-bottom: 12px;
      text-align: center;
      border-bottom: 1px solid #eeeeee;
      padding-left: 10px;
   }
   .close_button {
      width: 15px;
      padding-top: 3px;
      margin-bottom: -30px !important;
      float: left;
      cursor: pointer;
      outline: none;
      background-color: white;
      font-size: 20px;
      border-style: none;
   }
   .list_title {
      font-size: 18px;
      width: inherit;
      /* margin-top:10px; */
      font-family: "Noto Sans KR", sans-serif;
   }
   .cancel_button {
      width: 15px;
      padding-top: 3px;
      margin-bottom: -30px !important;
      margin-right: 65px;
      float: right;
      cursor: pointer;
      outline: none;
      background-color: white;
      font-size: 20px;
      border-style: none;
   }
   .check_button {
      width: 15px;
      padding-top: 3px;
      margin-bottom: -30px !important;
      margin-right: 30px;
      float: right;
      cursor: pointer;
      outline: none;
      background-color: white;
      font-size: 20px;
      border-style: none;
   }
   .tag_title {
      font-size: 2.5vh;
      font-weight: 600;
   }
   .go_home {
      display: block;
      float: right;
      font-size: 2.8vh;
      font-weight: 600;
      cursor: pointer;
   }
   .tags {
      width: 100%;
      display: block;
      margin-top: 3%;
      padding: 2%;
   }
   .tags div {
      display: inline-block;
      width: auto;
      margin: 1%;
      padding-left: 3px;
      padding-right: 5px;
      padding-top: 4px;
      padding-bottom: 4px;
      border: 0.5px solid rgb(247, 247, 247);
      border-radius: 5px;
      background-color: white;
      cursor: pointer;
      box-shadow: 2px 2px 10px rgb(210, 210, 210);
      font-size: 1.8vh;
   }
   .tag_span1 {
      margin: 0px 3px 0px 3px;
      color: #FF6C6C;
   }
   .tag_span3 {
      margin: 0px 3px 0px 3px;
      display: none;
      color: blue;
   }
   .selected_tag {
      background-color: pink !important;
      border: 0.5px solid pink !important;
      box-shadow: inset 0 0 2px rgba(0, 0, 0, 0.42) !important;
   }
}
</style>
<body>
   <!-- user_id is passed by session(controller) from index.jsp -->

   <div class="total_wrapper">
      <div class="header">
         <button class="close_button" onclick="location.href='/index'">
            <i class="fa fa-chevron-left" aria-hidden="true"></i>
         </button>
         <span class="list_title">태그 관리</span>
         <button class="cancel_button">
            <i id="cancel_img" class="fas fa-times-circle" aria-hidden="true"></i>
         </button>
         <button class="check_button">
            <i id="check_img" class="fas fa-check-double" aria-hidden="true"></i>
         </button>
      </div>


      <div class="tags">
         <c:forEach var="tl" items="${tagNamePostNumList}">
            <div class="tag_div">
               <span class="tag_span1">#</span><span class="tag_span2">${tl.tag_name}</span><span
                  class="tag_span3">[${tl.relatedPostNum}]</span>
            </div>
         </c:forEach>
      </div>
   </div>


</body>
</html>
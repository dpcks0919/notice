<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="currTime" class="java.util.Date" />
<fmt:formatDate value="${currTime}" var="currTime" pattern="yyyy-MM-dd HH:mm:ss" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
   <link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <title>Detailed Page</title>
    <script>
       $(document).ready(function() {
          $("#copy_button").click(function(){ 
              var urlbox = document.getElementById( 'copy_con' );
              urlbox.select(); 
              document.execCommand('copy'); 
              alert("링크가 복사되었습니다."); 
           });
       });
    </script>
</head>
<style>
    * {
        margin:5px;
    }
	
    img {
        display:block;
        position:relative;
        width:80%;
        margin:0 auto;
    }
    hr {
        border: 0;
        height:2px;
        background: #ccc;
    }

    input {
        padding:10px;
        font-size:medium;
        color: white;
        width:30%;
        border: 0 solid skyblue;
        border-radius: 15px;
        background-color:skyblue;
        text-align: center;
        display : block;
        margin : 0 auto;
    }

    .header-container {
        text-align: center;
    }

    .swiper-container {
        width:100%;
    }

    
    .swiper-slide {
       display: inline-block;
      width: auto;
      margin: 1%;
      padding-top: 2px;
      padding-bottom: 2px;
      border: 0.5px solid rgb(247, 247, 247);
      border-radius: 5px;
      background-color: white;
      cursor: pointer;
      box-shadow: 2px 2px 10px rgb(210, 210, 210);
      font-size: 2vh;
    }
    
    
    .swiper-wrapper span {
      margin: 0px 3px 0px 3px;
      color: #FF6C6C;
   }

    .info-container {
        margin:5px;
        font-size: medium;
    }

    .info-container hr {
        border: 0;
        height:1.5px;
        background: #ccc;
    }
      .close_button_image {
        width:15px;
        padding-top:10px;
        margin-bottom:-15px!important;
        float:right;
        margin-right:15px;
        cursor:pointer;   
      }
    .info-name {
        font:bold;
    }

    .info-contents {
        word-wrap: break-word;
    }

    .info-textarea {
        align-items: right;
        border: none;
        background-color:whitesmoke;
        width: 80%;
        height: 100px;
    }
    
    #copy_con {
       position:   absolute;
       top:        0;
       left:       0;
       width:      1px;
       height:     1px;
       margin:     0;
       padding:    0;
       border:     0;
   }
   #copy_button:hover{
   		color: #9e001a;
   }

</style>
<body>
   <!-- UserID:<h1>${user_id}</h1>
   PostID:<h1>${post_id}</h1>-->
    <div>
    <image type="button" class="close_button_image" style="cursor:pointer;" src="../resources/images/close.png" onclick="goBack(${post_id}, ${param.viewState});">
    <c:forEach var="l" items="${list}">
        <h1 class="header-container">${l.title}</h1>
        <hr>
            <img src="../${l.image_url}">
        <hr>

        <!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

        <div class="swiper-container">
            <div class="swiper-wrapper">
               <c:forEach var="tag_name" items="${tagList}">
                   <button class="swiper-slide" onclick="location.href='/detail/${post_id}/${tag_name}/${user_id}'"><span>#</span>${tag_name}</button>
                </c:forEach>
            </div>
        </div>

        <hr>
        <div class="info-container">
            <h3>상세 정보</h3>
            <hr>
                <span class="info-name">이름          :</span><span class="info-contents">${l.title}</span>
                <hr>
                <span class="info-name">접수 기간          :</span><span class="info-contents">${fn:substring(l.apply_start,0,10)} ~ ${fn:substring(l.apply_end,0,10)}</span>
                <hr>
                <span class="info-name">행사 기간          :</span><span class="info-contents">${fn:substring(l.event_start,0,10)} ~ ${fn:substring(l.event_end,0,10)}</span>
                <hr>
                <span class="info-name">대상          :</span><span class="info-contents">${l.subject}</span>
                <hr>
                <span class="info-name">연락          :</span><span class="info-contents">${l.phone} ${l.email}</span>
                <hr>
                <input id="copy_con" value="${l.url}"></input>
                
                <span class="info-name">URL    :  <%-- <a class="info-contents" href="${l.url}"><i class="fab fa-internet-explorer"></i></a> --%>
                <span id="copy_button" class="info-contents" value="${l.url}"><i class="far fa-copy"></i></span>
                <hr>
                <span class="info-name">상세정보        :</span>
                <p> 
               		 ${description}
                </p>
        </div>
<!-- 
        <form>
            <input type="button" value="돌아가기">
        </form>
 -->
    </c:forEach>
    </div>
<script>
	function goBack(post_id, viewState){
		location.href = "/index?starter=" + post_id + "&&viewState=" + viewState;
	}
</script>     
<script>
	
    new Swiper('.swiper-container', {

        slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
        spaceBetween : 5, // 슬라이드간 간격
        slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
 
        // 그룹수가 맞지 않을 경우 빈칸으로 메우기
        // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
        loopFillGroupWithBlank : true,

        loop : false // 무한 반복

    });
   
</script>
</body>
</html>
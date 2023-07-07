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
  <title>title</title>   
  <meta charset="utf-8">
  <!-- Bootstrap cdn 설정 -->   
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">   
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">   
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    body {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      font-family: 'Nanum Gothic Coding', monospace;
      background-color:#f5f7fa;
    }
    .carousel-control {
      background: none !important; 
    }
    .selected {
       border-bottom:2px solid black;
       color: black;
    }

   .addSubmit:hover {
      border: none;
      background: none;
   }
  </style>
</head>
<body>
  <nav class="w3-sidebar w3-animate-left w3-black" style="display:none;z-index:2;width:40%;height:100%;padding-top:7.5%;" id="mySidebar">
    <span style="font-size:3vh;margin-left:6%;">LOGO</span>
    <div style="margin-left:6%;margin-top:20%;cursor:pointer;" onclick="location.href='/schedule';">Schedule</div>
    <div style="margin-left:6%;margin-top:10%;cursor:pointer;" onclick="location.href='/tagPage';">Tags</div>
    <div style="margin-left:6%;margin-top:10%;cursor:pointer;" onclick="location.href='/insert';">Write</div>
    <div style="margin-left:6%;margin-top:10%;cursor:pointer;" onclick="location.href='/list';">WriteList</div>
    <div style="margin-left:6%;margin-top:10%;cursor:pointer;">Settings</div>
  </nav>
  <div id="modal_back" style="display:none;position:fixed;width:100%;height:100%;background-color:rgba(0,0,0,0.8);cursor:pointer;z-index:1;" onclick="w3_close();"></div>

  <div class="header" style="text-align:center;">
    <span style="font-size:6vh;">LOGO</span>
    <span onclick="w3_open()" style="position:absolute;left:0;height:10%;margin-top:3.5%;margin-left:2%;font-size:3.6vh;cursor:pointer;"><i class="fa fa-bars"></i></span>
  </div>
  <!-- carousel를 구성할 영역 설정 -->
  <div id="carousel_wrapper" style="width:100%;height:90%;position:absolute;bottom:0;">
    <div class="nav" style="display:inline-block;width:100%;margin-top:2.5%;padding-right:4.5%;text-align:center;color:#ccd3db;border-bottom:1px solid lightgray;">
      <div onclick="openAll();" class="navbtn" id="allBtn" style="display:block;float:right;width:calc(40%/3);padding-bottom:1.5%;font-size:2vh;cursor:pointer"><b>전체</b></div>
      <div onclick="openRecom();" class="navbtn" id="recBtn" style="display:block;float:right;width:calc(40%/3);padding-bottom:1.5%;font-size:2vh;cursor:pointer"><b>추천</b></div>
      <div onclick="openMy();" class="navbtn" id="myBtn" style="display:block;float:right;width:calc(40%/3);padding-bottom:1.5%;font-size:2vh;cursor:pointer;"><b>my</b></div>
    </div>
    <!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->
    <!-- carousel는 특이하게 id를 설정해야 한다.-->
    <div id="carousel-example-generic" class="carousel slide" style="height:92.5%;margin-top:-2.5%;">
      <!-- carousel의 지시자 -->
      <!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
      <!-- 실제 이미지 아이템 -->
      <!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
      <div class="carousel-inner" role="listbox" style="height:100%;">
        <!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
        <c:choose>
        <c:when test="${param.viewState == 1 or param.viewState == 'undefined' or empty param.viewState}">
           <c:set var="views" value="${list}"/>
           <script>$("#allBtn").addClass("selected");</script>
        </c:when>
        <c:when test="${param.viewState == 2}">
          <c:set var="views" value="${recList}"/>
          <script>$("#recBtn").addClass("selected");</script>
        </c:when>
        <c:when test="${param.viewState == 3}">
          <c:set var="views" value="${myList}"/>
          <script>$("#myBtn").addClass("selected");</script>
        </c:when>
      </c:choose>
        <c:set var="postNum" value="0"/>
       <c:forEach var="l" items="${views}">
         <c:if test="${currTime < l.event_end}">     
        <div class="item" style="height:100%;margin-top:7.5%;" id="item_${l.post_id}">
           <img src="${l.image_url}" alt="startup" style="position:absolute;width:70%;height:70%;margin-left:17.5%;z-index:2;cursor:pointer;" onclick="showDetail(${l.post_id}, ${param.viewState});">
          <div style="position:absolute;top:0;width:75%;height:85%;margin-top:5%;margin-left:12.5%;padding-left:2.5%;padding-right:2.5%;background-color:#ccd3db;z-index:1;">
            <div style="position:absolute;bottom:0;width:91%;margin-bottom:20%;margin-left:1%;margin-right:1%;font-size:2vh;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;">
               <b>${l.title}</b>
            </div>
            <div class="foot_bar" style="display:block;position:absolute;width:95%;bottom:0;margin-bottom:8%;font-size:1.6vh;">
             <c:choose>
              <c:when test="${currTime < l.event_start}">
                <c:choose>
                 <c:when test="${currTime < l.apply_start}">
                   <span style="padding:7.5px;background-color:#FFE5C2;border-radius:8px;"><b>접수 예정</b></span>
                   <span>접수 시작 - ${fn:substring(l.apply_start,0,10)}</span>
                 </c:when>
                 <c:when test="${currTime >= l.apply_start and currTime < l.apply_end}">
                   <span style="padding:7.5px;background-color:#A2D5FF;border-radius:8px;"><b>접수중</b></span>
                   <span>${fn:substring(l.apply_start,0,10)} ~ ${fn:substring(l.apply_end,0,10)}</span>
                 </c:when>
                 <c:when test="${currTime >= l.apply_end and currTime < l.event_start}">
                   <span style="padding:7.5px;background-color:#aad9ce;border-radius:8px;"><b>진행 예정</b></span>
                   <span>일정 시작 - ${fn:substring(l.event_start,0,10)}</span>
                 </c:when>
                </c:choose>
               </c:when>
               <c:when test="${currTime >= l.event_start and currTime < l.event_end}">
                 <span style="padding:7.5px;background-color:#aad9ce;border-radius:8px;"><b>진행중</b></span>
                 <span>${fn:substring(l.event_start,0,10)} ~ ${fn:substring(l.event_end,0,10)}</span>
               </c:when>
               </c:choose>
               <c:if test="${param.viewState == 1 or param.viewState == 'undefined' or empty param.viewState}">
                  <form id="add_${postNum}" method="post" action="/addProc">
                     <input type="hidden" name="user_id" value="${user_id}"/>
                     <input type="hidden" name="post_id" value="${l.post_id}"/>
                     <button class="addSubmit" type="submit" style="position:absolute;right:0;margin-bottom:7.5%;margin-right:2.5%;font-size:2.4vh;cursor:pointer;border:none;background:none;"><i class="fas fa-thumbtack"></i></button>
                  </form>
               
               </c:if>
             </div>
          </div>
         </div>
         <c:if test="${postNum < 1 and empty param.starter}">
            <script>$(".item").addClass("active");</script>
         </c:if>
         <c:if test="${not empty param.starter}">
           <script>var starter="#item_" + ${param.starter}; $(starter).addClass("active");</script>
         </c:if>
         <c:set var="postNum" value="${postNum + 1}"/>
         </c:if>
      </c:forEach>
      </div>
      <!-- 왼쪽 화살표 버튼 -->
      <!-- href는 carousel의 id를 가르킨다. -->
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" style="margin-top:7.5%;">
        <!-- 왼쪽 화살표 -->
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      </a>
      <!-- 오른쪽 화살표 버튼 -->
      <!-- href는 carousel의 id를 가르킨다. -->
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" style="margin-top:7.5%;">
        <!-- 오른쪽 화살표 -->
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      </a>
    </div>
  </div>
  <script>

    $(function(){
      // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
      $('#carousel-example-generic').carousel({
        // 슬리아딩 자동 순환 지연 시간
        // false면 자동 순환하지 않는다.
        interval: false,
        // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
        pause: "hover",
        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
        wrap: false,
        // 키보드 이벤트 설정 여부(?)
        keyboard : false
       });
     });
  </script>
  <script>
     
     function showDetail(post_id, viewState) {
       location.href='/detail/' + post_id + "?viewState=" + viewState;
     }
  
    function w3_open() {
      document.getElementById("mySidebar").style.display = "block";
      document.getElementById("modal_back").style.display = "block";
    }
    
    function w3_close() {
      document.getElementById("mySidebar").style.display = "none";
      document.getElementById("modal_back").style.display = "none";
    }
    
    function openAll() {
       location.href='/index?viewState=' + '1';
    }
    function openRecom() {
       location.href='/index?viewState=' + '2';
    }
    function openMy() {
       location.href='/index?viewState=' + '3';
    }
    
    $('.addSubmit').on('click', function(){
        alert("일정에 추가되었습니다.");
      });
    </script>
</body>   
</html>
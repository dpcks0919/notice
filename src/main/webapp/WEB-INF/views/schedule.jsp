<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.text.SimpleDateFormat"%>

<jsp:useBean id="currTime" class="java.util.Date" />
<fmt:formatDate value="${currTime}" var="currTime_date"
   pattern="yyyy-MM" />
<fmt:formatDate value="${currTime}" var="currTime"
   pattern="yyyy-MM-dd HH:mm:ss" />

<c:set var="current" value="current" />
<c:set var="past" value="past" />
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">

<title>plan</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css"
   rel="stylesheet">
<link rel="stylesheet" href="resources/css/schedule.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
</style>
</head>
<body>
   <div class="totalWrapper">
      <div class="header">
         <button class="close_button" onclick="location.href='/index'">
            <i class="fa fa-chevron-left" aria-hidden="true"></i>
         </button>
         <span class="list_title">Pin List</span>
         <button class="filter_button" id="filter_btn"
            onclick="alert('filter');">
            <i class="fa fa-filter" aria-hidden="true"></i>
         </button>
      </div>
      <!-- 현재 일때에는 마감된 것은 보여주지 않고, 현재 시점에서 진행 예정, 진행 중, 접수 예정, 행사 예정 등등일 때만 보여준다. -->
      <!-- 나중에 접수 시작(아이콘), 접수 마감(아이콘), 행사 시작(아이콘), 행사 마감(아이콘) -->
      <div class="Wrapper">
         <c:set var="postNum" value="0" />
         <c:forEach var="l" items="${list}">
            <c:set var="apply_date" value="${l.apply_end}" />
            <c:set var="event_date" value="${l.event_end}" />
            <c:choose>
               <c:when test="${status eq current}">
                  <c:choose>
                     <c:when test="${currTime < l.apply_start}">
                        <div class="newWrapper">
                           <div class="newWrapper_left bg_blue"></div>
                           <div class="newWrapper_center">
                              <span class="new_title">${l.title}</span><br> <span
                                 class="new_date"><i class="fa fa-clock-o"
                                 aria-hidden="true"></i> 접수 시작 :
                                 ${fn:substring(l.apply_start,0,10)} ~ </span>
                           </div>
                           <div class="newWrapper_right bg_blue">접수 예정</div>
                        </div>
                     </c:when>
                     <c:when
                        test="${l.apply_start< currTime && currTime < l.apply_end}">
                        <div class="newWrapper">
                           <div class="newWrapper_left bg_green"></div>
                           <div class="newWrapper_center">
                              <span class="new_title">${l.title}</span><br> <span
                                 class="new_date"><i class="fa fa-clock-o"
                                 aria-hidden="true"></i> 접수 마감 : ~
                                 ${fn:substring(l.apply_end,0,10)}</span>
                           </div>
                           <div class="newWrapper_right bg_green">접수 중</div>
                        </div>
                     </c:when>
                     <c:when test="${currTime < l.event_start}">
                        <div class="newWrapper">
                           <div class="newWrapper_left bg_blue"></div>
                           <div class="newWrapper_center">
                              <span class="new_title">${l.title}</span><br> <span
                                 class="new_date"><i class="fa fa-clock-o"
                                 aria-hidden="true"></i> 행사 시작 :
                                 ${fn:substring(l.event_start,0,10)} ~ </span>
                           </div>
                           <div class="newWrapper_right bg_blue">행사 예정</div>
                        </div>
                     </c:when>
                     <c:when
                        test="${l.event_start < currTime && currTime < l.event_end}">
                        <div class="newWrapper">
                           <div class="newWrapper_left bg_green"></div>
                           <div class="newWrapper_center">
                              <span class="new_title">${l.title}</span><br> <span
                                 class="new_date"><i class="fa fa-clock-o"
                                 aria-hidden="true"></i> 행사 마감 : ~
                                 ${fn:substring(l.event_end,0,10)}</span>
                           </div>
                           <div class="newWrapper_right bg_green">행사 중</div>
                        </div>
                     </c:when>
                  </c:choose>
               </c:when>

               <c:when test="${status eq past}">
                  <div class="newWrapper bg_grey">
                     <div class="newWrapper_left"></div>
                     <div class="newWrapper_center">
                        <span class="new_title">${l.title}</span><br>
                        <!-- 무조건 행사 마감 -->
                        <span class="new_date"><i class="fa fa-clock-o"
                           aria-hidden="true"></i> 행사 마감 : ~
                           ${fn:substring(l.event_end,0,10)}</span>
                     </div>
                     <div class="newWrapper_right"></div>
                  </div>
               </c:when>

            </c:choose>
            <c:set var="postNum" value="${postNum + 1}" />
         </c:forEach>
         <c:if test="${postNum == 0}">
            <div class="empty_schedule">등록된 일정이 없습니다.</div>
         </c:if>
      </div>
   </div>

   <div id="modal">
      <div class="modal_content">
         <h2>분류</h2>
         <div class="modal_categoryBox">
            <!-- 
              <button class="modal_category">전체</button>
              <input type="checkbox" name="all" id="all" value="0" hidden>
                <button class="modal_category category_selected">예정</button>
                <input type="checkbox" name="before" id="before" value="1" checked hidden>
             -->
            <c:choose>
               <c:when test="${status eq current}">
                  <button class="modal_category category_selected"
                     onclick="location.href='/schedule?status=current'">예정 및
                     진행</button>
                  <button class="modal_category"
                     onclick="location.href='/schedule?status=past'">마감</button>
               </c:when>
               <c:when test="${status eq past}">
                  <button class="modal_category"
                     onclick="location.href='/schedule?status=current'">예정 및
                     진행</button>
                  <button class="modal_category category_selected"
                     onclick="location.href='/schedule?status=past'">마감</button>
               </c:when>
            </c:choose>
         </div>
         <!-- 
           <button type="button" class="apply_button" id="modal_close_btn" onclick="alert('적용되었습니다.')
             \;">필터 적용하기</button>
           <button type="button" class="cancel_button" id="close_btn" id="modal_close_btn">취소하기</button>
            -->

      </div>
      <div class="modal_layer" id="close_modal"></div>
   </div>
</body>
</html>

<script type="text/javascript">
   document.getElementById("filter_btn").onclick = function() {
      if ($("#modal").css("display") == "none") {
         document.getElementById("modal").style.display = "block";
      }
      else
         document.getElementById("modal").style.display = "none";
         
   }
   document.getElementById("close_btn").onclick = function() {
      document.getElementById("modal").style.display = "none";
   }
   document.getElementById("close_modal").onclick = function() {
      document.getElementById("modal").style.display = "none";
   }
</script>

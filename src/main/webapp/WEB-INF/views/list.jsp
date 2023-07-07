<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css"
   rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	#title:hover{
		text-decoration: underline; 
		color: #9e001a;
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
</style>
<title>List</title>
</head>
<body>
 
	<button class="close_button" onclick="location.href='/index'">
	        <i class="fa fa-chevron-left" aria-hidden="true"></i>
    </button>

<h2 style="margin-left: 100px;"> 게시글 목록 </h2>
 
<!-- <button class="btn btn-primary" onclick="location.href='/insert'">글쓰기</button> --> 
<div class="container">
    <table class="table table-hover">
        <tr>
            <!-- <th>No</th> -->
            <th>제목</th>
            <th>작성자</th>
            <th>등록날짜</th>
        </tr>
           <c:forEach var="l" items="${list}">
              <tr>
                  <%-- <td id="no">${l.post_id}</td> --%>
                  <td id="title" onclick="update(${l.post_id});">${l.title}</td>
                  <td id="writer" >${l.writer}</td>
                  <td id="regDate" >${l.reg_date}</td>
              </tr>
          </c:forEach>
          
    </table>
</div>
 <script>
 	function update(post_id){
 		location.href='update/'+post_id;
 	}
 </script>
 
 </body>
</html>



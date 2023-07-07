<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css"
   rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert Form</title>
<style>
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
<script>
	$(document).ready(function() {
	    // redirect시 input 세팅
	    $("#title").val('${title}');
	    $("#phone").val('${phone}');
	    $("#email").val('${email}');
	    $("#url").val('${url}');
	    $("#description").val('${description}');
	    
	
	    // 누르면 url 전송
	    $("#crawl_btn").click(function() {
	       var url = $("#crawl_input").val().split('/').join('<');
	       // 유효성 검사(보완필요)
	       //alert(url);
	       if(url.trim() != ""){  // if no contents
	          window.location.href="/insert/cseeCrawling/" + url;
	       }   
	    });
	 });
</script>
</head>
<body>

	<button class="close_button" onclick="location.href='/index'">
            <i class="fa fa-chevron-left" aria-hidden="true"></i>
    </button>
	<h2 style="margin-left: 100px;">게시글 작성</h2>
	
	<br>
	<p><input id="crawl_input" type="text" style="margin-left: 30px"
      placeholder="(only) csee url crawling">
       <button id="crawl_btn" type="submit" class="btn btn-primary">CRAWL</button>
    </p>
   <br>
   <br>

	<div class="container">
		<form action="/insertProc" method="post" enctype="multipart/form-data">
			<!-- 추가 -->
			<div class="form-group" style="width: 50%;">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" name="title"
					placeholder="제목을 입력하세요." required>
			</div>
			<div class="form-group" style="width: 50%;">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="writer" name="writer"
					placeholder="내용을 입력하세요." required>
			</div>
			<div class="form-group" style="width: 30%; display: inline-block;">
				<label for="phone">문의 번호</label> <input type="text"
					class="form-control" id="phone" name="phone"
					placeholder="번호를 입력하세요." required>
			</div>
			<div class="form-group"
				style="margin-left: 10%; width: 30%; display: inline-block;">
				<label for="email">E-mail</label> <input type="text"
					class="form-control" id="email" name="email"
					placeholder="이메일을 입력하세요." required>
			</div>
			<div class="form-group" style="width: 30%;">
				<label for="subject">대상자</label> <input type="text"
					class="form-control" id="subject" name="subject"
					placeholder="대상자를 입력하세요." required>
			</div>

			<div class="form-group">
				<label for="apply">지원 기간</label>
				<p>
					<input type="date" id="apply_start" name="apply_start"
						style="width: 200px;" required> ~ <input type="date"
						id="apply_end" name="apply_end" style="width: 200px;" required>
				</p>
			</div>

			<div class="form-group">
				<label for="event">행사 기간</label>
				<p>
					<input type="date" id="event_start" name="event_start"
						style="width: 200px;" required> ~ <input type="date"
						id="event_end" name="event_end" style="width: 200px;" required>
				</p>
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="description" name="description"
					rows="3" placeholder="세부사항을 입력하세요." required></textarea>
			</div>
			<div class="form-group" style="width: 50%;">
				<label for="content">url</label> <input type="text"
					class="form-control" id="url" name="url" placeholder="url을 입력하세요." required>
			</div>
			<div class="form-group">
				<label for="file">첨부 파일</label> <input type="file" name="files" required>
				<!-- 추가 -->
			</div>

			<button style="float: right" type="submit" class="btn btn-primary">작성</button>
		</form>
	</div>

</body>
</html>
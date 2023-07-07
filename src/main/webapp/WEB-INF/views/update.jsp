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
<title>Update Form</title>
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

<script language="javascript">
	function btn_click(str){
		if(str == "update"){
			updateForm.action = "/updateProc";
			document.updateForm.submit();
		}else if(str == "delete"){
			var result = confirm("정말 삭제하시겠습니까?");
			if(result){
				updateForm.action = "/delete";
				document.updateForm.submit();
			}
		}
	}
</script>
</head>
<body>
	
	<button class="close_button" onclick="location.href='/list'">
	     <i class="fa fa-chevron-left" aria-hidden="true"></i>
	</button>

	<h2 style="margin-left: 100px;">게시글 수정</h2>

	<div class="container">
		<form name= "updateForm" method="post" enctype="multipart/form-data">
			
			<input type="hidden" id="post_id" name="post_id" value ="${post.post_id}" >
			<!-- 추가 -->
			<div class="form-group" style="width: 50%;">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" name="title"
					value="${post.title}" required>
			</div>
			<div class="form-group" style="width: 50%;">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="writer" name="writer"
					value="${post.writer}" required>
			</div>
			<div class="form-group" style="width: 30%; display: inline-block;">
				<label for="phone">문의 번호</label> <input type="text"
					class="form-control" id="phone" name="phone"
					value="${post.phone}" required>
			</div>
			<div class="form-group"
				style="margin-left: 10%; width: 30%; display: inline-block;">
				<label for="email">E-mail</label> <input type="text"
					class="form-control" id="email" name="email"
					value="${post.phone}" required>
			</div>
			<div class="form-group" style="width: 30%;">
				<label for="subject">대상자</label> <input type="text"
					class="form-control" id="subject" name="subject"
					value="${post.subject}" required>
			</div>

			<div class="form-group">
				<label for="apply">지원 기간</label>
				<p>
					<input type="date" id="apply_start" name="apply_start"
						style="width: 200px;" value="${post.apply_start}" required> ~ <input type="date"
						id="apply_end" name="apply_end" style="width: 200px;" value="${post.apply_end}" required>
				</p>
			</div>

			<div class="form-group">
				<label for="event">행사 기간</label>
				<p>
					<input type="date" id="event_start" name="event_start"
						style="width: 200px;" value="${post.event_start}" required> ~ <input type="date"
						id="event_end" name="event_end" style="width: 200px;" value="${post.event_end}" required>
				</p>
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="description" name="description"
					rows="3" required>${post.description}</textarea>
			</div>
			<div class="form-group" style="width: 50%;">
				<label for="content">url</label> <input type="text"
					class="form-control" id="url" name="url" value="${post.url}" required>
			</div>
			<div class="form-group">
				<label for="file">첨부 파일</label> <input type="file" name="files">
				<!-- 추가 -->
			</div>

			<button style="float: right; margin-left: 25px; background-color: #d9190b !important; color: white; text-shadow:0 -1px 0 rgba(0,0,0,.2); box-shadow:inset 0 1px 0 rgba(255,255,255,.15),0 1px 1px rgba(0,0,0,.075)" type="button" onclick="btn_click('delete');" class="btn">삭제하기</button>
			<button style="float: right" type="button" onclick='btn_click("update");' class="btn btn-primary">수정하기</button>
		</form>
	</div>

</body>
</html>
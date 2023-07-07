function showMyNot() {
	$('#my_not').addClass('w3-black');
	$('#rec_not').removeClass('w3-black');
	$('#all_not').removeClass('w3-black');
}
function showRecNot() {
	$('#rec_not').addClass('w3-black');
	$('#my_not').removeClass('w3-black');
	$('#all_not').removeClass('w3-black');
}
function showAllNot() {
	$('#all_not').addClass('w3-black');
	$('#my_not').removeClass('w3-black');
	$('#rec_not').removeClass('w3-black');
}

function showCond(span_id, cond) {
	
	var post = "post_" + span_id;
	var cond_span = document.getElementById(post);
	
	cond_span.innerText = cond;
	if(cond == "예정") {
		cond_span.style.backgroundColor = "#999999";
	} else if(cond == "접수중") {
		cond_span.style.backgroundColor = "#1266FF";
	} else if(cond == "진행중") {
		cond_span.style.backgroundColor = "#0BC904";
	}

}
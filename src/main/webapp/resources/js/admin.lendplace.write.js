$(function() {
	$('.dtpicker').appendDtpicker({
		"futureOnly" : false,
		"autodateOnStart" : false,
		"locale" : "ko"
	});

	$('#startdt').change(function() {
		var startR = new Date($('#startdt').handleDtpicker('getDate'));
		$('#enddt').handleDtpicker('setMinDate', startR);
	});
	$('#enddt').change(function() {
		var endR = new Date($('#enddt').handleDtpicker('getDate'));
		$('#startdt').handleDtpicker('setMaxDate', endR);
		endR.setDate(endR.getDate() + 1);
	});
});

function valueChk(form){
	if(!form.l_name.value){
		alertify.error("이름 값이 없습니다."); return false;
	}
	if(!form.l_email.value){
		alertify.error("메일 값이 없습니다."); return false;
	}
	if(!form.l_phone.value){
		alertify.error("전화번호 값이 없습니다."); return false;
	}
	if(!form.l_title.value){
		alertify.error("장소명 값이 없습니다."); return false;
	}
	if(!form.l_addr.value){
		alertify.error("주소 값이 없습니다."); return false;
	}
	if(!form.file.value){
		alertify.error("이미지 값이 없습니다."); return false;
	}
	if(!form.l_pnum.value){
		alertify.error("인원 값이 없습니다."); return false;
	}
	if(!form.l_sdate.value){
		alertify.error("시작시간 값이 없습니다."); return false;
	}
	if(!form.l_edate.value){
		alertify.error("종료시간 값이 없습니다."); return false;
	}
	if(!form.l_content.value){
		alertify.error("내용 값이 없습니다."); return false;
	}
}
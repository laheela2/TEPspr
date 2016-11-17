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
		$('#startdt2').handleDtpicker('setMinDate', endR);
	});
	$('#startdt2').change(function() {
		var startM = new Date($('#startdt2').handleDtpicker('getDate'));
		$('#enddt2').handleDtpicker('setMinDate', startM);
		startM.setDate(startM.getDate() - 1);
		$('#enddt').handleDtpicker('setMaxDate', startM)
		startM.setDate(startM.getDate() - 1);
		$('#startdt').handleDtpicker('setMaxDate', startM)
	});
	$('#enddt2').change(function() {
		var endM = new Date($('#enddt2').handleDtpicker('getDate'));
		$('#startdt2').handleDtpicker('setMaxDate', endM);
	});
});

function valueCheck() {
	var f = document.omf_form;
	var content = CKEDITOR.instances.l_content;

	if (!f.l_title.value) {
		alertify.error('장소명이 입력되지 않았습니다.');
		f.l_title.focus();
		return false;
	}
	if (!f.l_pnum.value) {
		alertify.error('수용인원이 입력되지 않았습니다.');
		f.l_pnum.focus();
		return false;
	}
	if (!f.l_sdate.value) {
		alertify.error('대관 가능시간이 지정되지 않았습니다.');
		f.l_sdate.focus();
		return false;
	} else if (!f.l_edate.value) {
		alertify.error('대관 가능시간이 지정되지 않았습니다.');
		f.l_edate.focus();
		return false;
	}
	if (!f.l_addr.value) {
		alertify.error('장소 상세주소가 입력되지 않았습니다.');
		f.l_addr.focus();
		return false;
	}
	if (!f.file.value) {
		alertify.error('장소 대표 이미지가 선택되지 않았습니다.');
		f.file.focus();
		return false;
	}
	if (!content.getData()) {
		alertify.error("내용이 입력되지 않았습니다.");
		content.focus();
		return false;
	}
	
	f.submit();
}
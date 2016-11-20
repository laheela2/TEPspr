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
		endR.setDate(endR.getDate());
		$('#startdt2').handleDtpicker('setMinDate', endR);
	});
	$('#startdt2').change(function() {
		var startM = new Date($('#startdt2').handleDtpicker('getDate'));
		$('#enddt2').handleDtpicker('setMinDate', startM);
		startM.setDate(startM.getDate());
		$('#enddt').handleDtpicker('setMaxDate', startM)
		startM.setDate(startM.getDate());
		$('#startdt').handleDtpicker('setMaxDate', startM)
	});
	$('#enddt2').change(function() {
		var endM = new Date($('#enddt2').handleDtpicker('getDate'));
		$('#startdt2').handleDtpicker('setMaxDate', endM);
	});
});

function valueCheck() {
	var f = document.omf_form;
	var content = CKEDITOR.instances.mt_content;

	if (!f.mt_title.value) {
		alertify.error('모임명이 입력되지 않았습니다.');
		f.mt_title.focus();
		return false;
	}
	if (!f.mt_rsdate.value) {
		alertify.error('접수기간이 지정되지 않았습니다.');
		f.mt_rsdate.focus();
		return false;
	} else if (!f.mt_redate.value) {
		alertify.error('접수기간이 지정되지 않았습니다.');
		f.mt_redate.focus();
		return false;
	}
	if (!f.mt_msdate.value) {
		alertify.error('모임기간이 지정되지 않았습니다.');
		f.mt_msdate.focus();
		return false;
	} else if (!f.mt_medate.value) {
		alertify.error('모임기간이 지정되지 않았습니다.');
		f.mt_medate.focus();
		return false;
	}
	if (!f.mt_addr.value) {
		alertify.error('상세주소가 입력되지 않았습니다.');
		f.mt_addr.focus();
		return false;
	}
	if (!f.mt_subject.value) {
		alertify.error('간략소개가 입력되지 않았습니다.');
		f.mt_subject.focus();
		return false;
	}
	if (!f.mt_total_pnum.value) {
		alertify.error('인원이 입력되지 않았습니다.');
		f.mt_total_pnum.focus();
		return false;
	} else if (f.mt_total_pnum.value < 2) {
		alertify.error('최소인원은 2명입니다.');
		f.mt_total_pnum.focus();
		f.mt_total_pnum.value = 2;
		return false;
	}
	if (!f.file.value) {
		alertify.error('대표 이미지가 선택되지 않았습니다.');
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
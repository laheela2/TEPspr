$(function() {
	// -- append by class just for lower strings count --
	$('.dtpicker_omview').appendDtpicker({
		"futureOnly" : false,
		"autodateOnStart" : false,
		"locale" : "ko",
		"dateFormat": "YY/MM/DD",
		"dateOnly": true	
	});

	$('#startdt').change(function() {
		var de = new Date($('#startdt').handleDtpicker('getDate')); // constructor need to avoid linking object
		de.setDate(de.getDate());
		$('#enddt').handleDtpicker('setMinDate', de); //set min end date is 7 day later then start date
	});
	$('#enddt').change(function() {
		var ds = new Date($('#enddt').handleDtpicker('getDate'));
		ds.setDate(ds.getDate());
		$('#startdt').handleDtpicker('setMaxDate', ds); //set max end date is 7 day earlier then end date
	});
});

$(document).ready(function() {
	$('.category').find("td").click(function() {
		$(this).toggleClass("category_select");
	});
	$('.area').find("td").click(function() {
		$(this).toggleClass("category_select");
	});
});

$(function() {
	$('#searchbox').keypress(function(event) {
		if (event.keyCode == 13) {
			searchSubmit();
		}
	});
	
	$('.btnEventSearch').click(function(event) {
		searchSubmit();
		event.preventDefault();
	});
});

function searchSubmit() {
	var category = "";
	var area = "";

	/* if (!$('#searchbox').val()) {
		return false;
	} */

	if ($('.category').find("td").hasClass("category_select")) {
		$('.category').find("td").each(function(i) {
			if ($(this).hasClass("category_select")) {
				category += $(this).text() + "|";
			}
		});
	}

	if ($('.area').find("td").hasClass("category_select")) {
		$('.area').find("td").each(function(i) {
			if ($(this).hasClass("category_select")) {
				area += $(this).text() + "|";
			}
		});
	}

	if (category.length > 0) {
		$('#searchCate').val(category.substring(0, category.length - 1));
	}

	if (area.length > 0) {
		$('#searchAddr').val(area.substring(0, area.length - 1));
	}

	if($('#pay').val() != null){
		$('#searchPay').val($('#pay').val());
	}
	
	if($('#startdt').val() != null){
		$('#searchMStart').val($('#startdt').val());
	}
	
	if($('#enddt').val() != null){
		$('#searchMEnd').val($('#enddt').val());
	}
	
	document.search_form.submit();
}

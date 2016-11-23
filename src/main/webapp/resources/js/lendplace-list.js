$(function() {
	$('.dtpicker').appendDtpicker({
		"futureOnly" : false,
		"autodateOnStart" : false,
		"locale" : "ko",
		"dateFormat": "YYYY-MM-DD",
		"dateOnly": true	
	});

	$('#startdt').change(function() {
		var de = new Date($('#startdt').handleDtpicker('getDate'));
		de.setDate(de.getDate());
		$('#enddt').handleDtpicker('setMinDate', de);
	});
	$('#enddt').change(function() {
		var ds = new Date($('#enddt').handleDtpicker('getDate'));
		ds.setDate(ds.getDate());
		$('#startdt').handleDtpicker('setMaxDate', ds);
	});
});

$(document).ready(function() {
	$('.category').find("td").click(function() {
		$(this).toggleClass('panelSidebarMenuSelect');
	});
	$('.area').find("td").click(function() {
		$(this).toggleClass('panelSidebarMenuSelect');
	});
});

function searchSubmit() {
	var category = "";
	var area = "";

	if ($('.category').find("td").hasClass("panelSidebarMenuSelect")) {
		$('.category').find("td").each(function(i) {
			if ($(this).hasClass("panelSidebarMenuSelect")) {
				category += $(this).text() + "|";
			}
		});
	}

	if ($('.area').find("td").hasClass("panelSidebarMenuSelect")) {
		$('.area').find("td").each(function(i) {
			if ($(this).hasClass("panelSidebarMenuSelect")) {
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
}
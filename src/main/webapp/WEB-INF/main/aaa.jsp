<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>

<script type="text/javascript">
	$(function() {
		$('.dtpicker').appendDtpicker({
			"futureOnly" : false,
			"autodateOnStart" : false,
			"locale" : "ko",
			"dateFormat": "YY/MM/DD hh:mm",
			"dateOnly": false	
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
</script>
</head>
<body>

<input type="text" class="dtpicker" id="startdt"><br>
<input type="text" class="dtpicker" id="enddt">

</body>
</html>
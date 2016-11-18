<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/common-header.jspf"%>
<meta content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Dashboard</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<div class="row">
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-comments fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${fn:length(data1)}</div>
							<div>Board</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View List</span> <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-green">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-calendar-o fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${fn:length(data2)}</div>
							<div>Meetings</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View List</span> <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-yellow">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-calendar-o fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${fn:length(data3)}</div>
							<div>Lendplace</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View List</span> <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-comments fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${fn:length(data4)}</div>
							<div>Q&A</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">View List</span> <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-lg-8">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
					<div class="pull-right">
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
								Actions <span class="caret"></span>
							</button>
							<ul class="dropdown-menu pull-right" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div id="morris-area-chart" style="position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
						<svg height="348" version="1.1" width="765.5875244140625" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative; left: -0.600006px; top: -0.800018px;">
							<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
							<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
							<text x="48.171875" y="312.6000061035156" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
							<tspan dy="4.396881103515625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text>
							<path fill="none" stroke="#aaaaaa" d="M60.671875,312.6000061035156H740.5875244140625" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<text x="48.171875" y="240.70000457763672" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
							<tspan dy="4.403129577636719" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">7,500</tspan></text>
							<path fill="none" stroke="#aaaaaa" d="M60.671875,240.70000457763672H740.5875244140625" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<text x="48.171875" y="168.8000030517578" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
							<tspan dy="4.3937530517578125" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">15,000</tspan></text>
							<path fill="none" stroke="#aaaaaa" d="M60.671875,168.8000030517578H740.5875244140625" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<text x="48.171875" y="96.9000015258789" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
							<tspan dy="4.400001525878906" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">22,500</tspan></text>
							<path fill="none" stroke="#aaaaaa" d="M60.671875,96.9000015258789H740.5875244140625" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<text x="48.171875" y="25" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
							<tspan dy="4.390625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">30,000</tspan></text>
							<path fill="none" stroke="#aaaaaa" d="M60.671875,25H740.5875244140625" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<text x="615.0137957251956" y="325.1000061035156" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
							<tspan dy="4.396881103515625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012</tspan></text>
							<text x="313.4716182815348" y="325.1000061035156" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
							<tspan dy="4.396881103515625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011</tspan></text>
							<path fill="#7cb57c" stroke="none"
								d="M60.671875,261.66604502258303C79.67316289371013,256.39337824401855,117.67573868113038,245.45139634513856,136.6770265748405,240.5753779083252C155.67831446855064,235.69935947151185,193.68089025597092,229.33294174988126,212.68217814968105,222.65789752807618C231.47693030541606,216.05540813476895,269.0664346168861,189.43534321344282,287.8611867726211,187.465243447876C306.449403190381,185.51679313028242,343.62583602590087,205.55083287931168,362.21405244366076,206.98369719543456C381.2153403373709,208.4484029408046,419.2179161247912,198.0800803398132,438.21920401850133,199.05552369384765C457.22049191221146,200.0309670478821,495.22306769963177,232.1025979106632,514.2243555933419,214.78724402770996C533.019107749077,197.66010051304968,570.6086120605469,69.6403142807007,589.403364216282,61.28553410339356C608.198116372017,52.93075392608643,645.7876206834869,135.69864367896326,664.582372839222,147.94900260925294C683.5836607329321,160.3339808684469,721.5862365203524,156.85741279830933,740.5875244140625,159.82688286132813L740.5875244140625,312.6000061035156L60.671875,312.6000061035156Z"
								fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"
							></path>
							<path fill="none" stroke="#4da74d"
								d="M60.671875,261.66604502258303C79.67316289371013,256.39337824401855,117.67573868113038,245.45139634513856,136.6770265748405,240.5753779083252C155.67831446855064,235.69935947151185,193.68089025597092,229.33294174988126,212.68217814968105,222.65789752807618C231.47693030541606,216.05540813476895,269.0664346168861,189.43534321344282,287.8611867726211,187.465243447876C306.449403190381,185.51679313028242,343.62583602590087,205.55083287931168,362.21405244366076,206.98369719543456C381.2153403373709,208.4484029408046,419.2179161247912,198.0800803398132,438.21920401850133,199.05552369384765C457.22049191221146,200.0309670478821,495.22306769963177,232.1025979106632,514.2243555933419,214.78724402770996C533.019107749077,197.66010051304968,570.6086120605469,69.6403142807007,589.403364216282,61.28553410339356C608.198116372017,52.93075392608643,645.7876206834869,135.69864367896326,664.582372839222,147.94900260925294C683.5836607329321,160.3339808684469,721.5862365203524,156.85741279830933,740.5875244140625,159.82688286132813"
								stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
							></path>
							<circle cx="60.671875" cy="261.66604502258303" r="2.12" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="136.6770265748405" cy="240.5753779083252" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="212.68217814968105" cy="222.65789752807618" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="287.8611867726211" cy="187.465243447876" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="362.21405244366076" cy="206.98369719543456" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="438.21920401850133" cy="199.05552369384765" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="514.2243555933419" cy="214.78724402770996" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="589.403364216282" cy="61.28553410339356" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="664.582372839222" cy="147.94900260925294" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="740.5875244140625" cy="159.82688286132813" r="2" fill="#4da74d" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<path fill="#a8b4bd" stroke="none"
								d="M60.671875,287.0419522277832C79.67316289371013,281.2755721054077,117.67573868113038,269.0274068454742,136.6770265748405,263.97643173828124C155.67831446855064,258.92545663108825,193.68089025597092,249.39574006272613,212.68217814968105,246.63415137023927C231.47693030541606,243.902579946149,269.0664346168861,244.22452146643118,287.8611867726211,242.00379127197266C306.449403190381,239.8074647060247,343.62583602590087,232.04616780057634,362.21405244366076,228.96592432861328C381.2153403373709,225.81723100171772,419.2179161247912,216.95742574043274,438.21920401850133,217.0880440765381C457.22049191221146,217.21866241264345,495.22306769963177,243.35734481618078,514.2243555933419,230.01087101745605C533.019107749077,216.80946758610878,570.6086120605469,118.72404865570067,589.403364216282,110.89653515625C608.198116372017,103.06902165679932,645.7876206834869,159.17340483288794,664.582372839222,167.3907630218506C683.5836607329321,175.69842185025243,721.5862365203524,174.59514317474367,740.5875244140625,176.99660322570801L740.5875244140625,312.6000061035156L60.671875,312.6000061035156Z"
								fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"
							></path>
							<path fill="none" stroke="#7a92a3"
								d="M60.671875,287.0419522277832C79.67316289371013,281.2755721054077,117.67573868113038,269.0274068454742,136.6770265748405,263.97643173828124C155.67831446855064,258.92545663108825,193.68089025597092,249.39574006272613,212.68217814968105,246.63415137023927C231.47693030541606,243.902579946149,269.0664346168861,244.22452146643118,287.8611867726211,242.00379127197266C306.449403190381,239.8074647060247,343.62583602590087,232.04616780057634,362.21405244366076,228.96592432861328C381.2153403373709,225.81723100171772,419.2179161247912,216.95742574043274,438.21920401850133,217.0880440765381C457.22049191221146,217.21866241264345,495.22306769963177,243.35734481618078,514.2243555933419,230.01087101745605C533.019107749077,216.80946758610878,570.6086120605469,118.72404865570067,589.403364216282,110.89653515625C608.198116372017,103.06902165679932,645.7876206834869,159.17340483288794,664.582372839222,167.3907630218506C683.5836607329321,175.69842185025243,721.5862365203524,174.59514317474367,740.5875244140625,176.99660322570801"
								stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
							></path>
							<circle cx="60.671875" cy="287.0419522277832" r="2.12" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="136.6770265748405" cy="263.97643173828124" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="212.68217814968105" cy="246.63415137023927" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="287.8611867726211" cy="242.00379127197266" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="362.21405244366076" cy="228.96592432861328" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="438.21920401850133" cy="217.0880440765381" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="514.2243555933419" cy="230.01087101745605" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="589.403364216282" cy="110.89653515625" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="664.582372839222" cy="167.3907630218506" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="740.5875244140625" cy="176.99660322570801" r="2" fill="#7a92a3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<path fill="#2677b5" stroke="none"
								d="M60.671875,287.0419522277832C79.67316289371013,286.77352555541995,117.67573868113038,288.65970226211545,136.6770265748405,285.96824553833005C155.67831446855064,283.27678881454466,193.68089025597092,266.7019263680713,212.68217814968105,265.5102984375C231.47693030541606,264.3316229844349,269.0664346168861,278.7740346674208,287.8611867726211,276.4870320037842C306.449403190381,274.2251612375502,343.62583602590087,249.5701734472002,362.21405244366076,247.31480471801757C381.2153403373709,245.00931668374196,419.2179161247912,255.85892156600954,438.21920401850133,258.2436049499512C457.22049191221146,260.62828833389284,495.22306769963177,277.72177374219217,514.2243555933419,266.39227178955076C533.019107749077,255.18591659726417,570.6086120605469,175.13079818611146,589.403364216282,168.10017637023927C608.198116372017,161.06955455436707,645.7876206834869,202.23265248622792,664.582372839222,210.14729726257326C683.5836607329321,218.14891615733998,721.5862365203524,226.36074760665895,740.5875244140625,231.7652310546875L740.5875244140625,312.6000061035156L60.671875,312.6000061035156Z"
								fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"
							></path>
							<path fill="none" stroke="#0b62a4"
								d="M60.671875,287.0419522277832C79.67316289371013,286.77352555541995,117.67573868113038,288.65970226211545,136.6770265748405,285.96824553833005C155.67831446855064,283.27678881454466,193.68089025597092,266.7019263680713,212.68217814968105,265.5102984375C231.47693030541606,264.3316229844349,269.0664346168861,278.7740346674208,287.8611867726211,276.4870320037842C306.449403190381,274.2251612375502,343.62583602590087,249.5701734472002,362.21405244366076,247.31480471801757C381.2153403373709,245.00931668374196,419.2179161247912,255.85892156600954,438.21920401850133,258.2436049499512C457.22049191221146,260.62828833389284,495.22306769963177,277.72177374219217,514.2243555933419,266.39227178955076C533.019107749077,255.18591659726417,570.6086120605469,175.13079818611146,589.403364216282,168.10017637023927C608.198116372017,161.06955455436707,645.7876206834869,202.23265248622792,664.582372839222,210.14729726257326C683.5836607329321,218.14891615733998,721.5862365203524,226.36074760665895,740.5875244140625,231.7652310546875"
								stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"
							></path>
							<circle cx="60.671875" cy="287.0419522277832" r="2.12" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="136.6770265748405" cy="285.96824553833005" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="212.68217814968105" cy="265.5102984375" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="287.8611867726211" cy="276.4870320037842" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="362.21405244366076" cy="247.31480471801757" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="438.21920401850133" cy="258.2436049499512" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="514.2243555933419" cy="266.39227178955076" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="589.403364216282" cy="168.10017637023927" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="664.582372839222" cy="210.14729726257326" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="740.5875244140625" cy="231.7652310546875" r="2" fill="#0b62a4" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle></svg>
						<div class="morris-hover morris-default-style" style="left: 4.32813px; top: 185px;">
							<div class="morris-hover-row-label">2010 Q1</div>
							<div class="morris-hover-point" style="color: #0b62a4">iPhone: 2,666</div>
							<div class="morris-hover-point" style="color: #7A92A3">iPad: -</div>
							<div class="morris-hover-point" style="color: #4da74d">iPod Touch: 2,647</div>
						</div>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bar-chart-o fa-fw"></i> Bar Chart Example
					<div class="pull-right">
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
								Actions <span class="caret"></span>
							</button>
							<ul class="dropdown-menu pull-right" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-4">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped">
									<thead>
										<tr>
											<th>#</th>
											<th>Date</th>
											<th>Time</th>
											<th>Amount</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>3326</td>
											<td>10/21/2013</td>
											<td>3:29 PM</td>
											<td>$321.33</td>
										</tr>
										<tr>
											<td>3325</td>
											<td>10/21/2013</td>
											<td>3:20 PM</td>
											<td>$234.34</td>
										</tr>
										<tr>
											<td>3324</td>
											<td>10/21/2013</td>
											<td>3:03 PM</td>
											<td>$724.17</td>
										</tr>
										<tr>
											<td>3323</td>
											<td>10/21/2013</td>
											<td>3:00 PM</td>
											<td>$23.71</td>
										</tr>
										<tr>
											<td>3322</td>
											<td>10/21/2013</td>
											<td>2:49 PM</td>
											<td>$8345.23</td>
										</tr>
										<tr>
											<td>3321</td>
											<td>10/21/2013</td>
											<td>2:23 PM</td>
											<td>$245.12</td>
										</tr>
										<tr>
											<td>3320</td>
											<td>10/21/2013</td>
											<td>2:15 PM</td>
											<td>$5663.54</td>
										</tr>
										<tr>
											<td>3319</td>
											<td>10/21/2013</td>
											<td>2:13 PM</td>
											<td>$943.45</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.col-lg-4 (nested) -->
						<div class="col-lg-8">
							<div id="morris-bar-chart" style="position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
								<svg height="348" version="1.1" width="500.38751220703125" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative; left: -0.787537px; top: -0.200012px;">
									<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
									<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
									<text x="32.328125" y="312.6000061035156" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4.396881103515625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text>
									<path fill="none" stroke="#aaaaaa" d="M44.828125,312.6000061035156H475.38751220703125" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="32.328125" y="240.70000457763672" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4.403129577636719" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">25</tspan></text>
									<path fill="none" stroke="#aaaaaa" d="M44.828125,240.70000457763672H475.38751220703125" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="32.328125" y="168.8000030517578" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4.3937530517578125" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">50</tspan></text>
									<path fill="none" stroke="#aaaaaa" d="M44.828125,168.8000030517578H475.38751220703125" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="32.328125" y="96.9000015258789" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4.400001525878906" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">75</tspan></text>
									<path fill="none" stroke="#aaaaaa" d="M44.828125,96.9000015258789H475.38751220703125" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="32.328125" y="25" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal">
									<tspan dy="4.390625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">100</tspan></text>
									<path fill="none" stroke="#aaaaaa" d="M44.828125,25H475.38751220703125" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<text x="444.6332702636719" y="325.1000061035156" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4.396881103515625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012</tspan></text>
									<text x="321.6163024902344" y="325.1000061035156" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4.396881103515625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010</tspan></text>
									<text x="198.59933471679688" y="325.1000061035156" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4.396881103515625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2008</tspan></text>
									<text x="75.58236694335938" y="325.1000061035156" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)">
									<tspan dy="4.396881103515625" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2006</tspan></text>
									<rect x="52.516685485839844" y="25" width="21.56568145751953" height="287.6000061035156" rx="0" ry="0" fill="#0b62a4" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="77.08236694335938" y="53.76000061035154" width="21.56568145751953" height="258.8400054931641" rx="0" ry="0" fill="#7a92a3" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="114.0251693725586" y="96.9000015258789" width="21.56568145751953" height="215.70000457763672" rx="0" ry="0" fill="#0b62a4" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="138.59085083007812" y="125.66000213623047" width="21.56568145751953" height="186.94000396728515" rx="0" ry="0" fill="#7a92a3" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="175.53365325927734" y="168.8000030517578" width="21.56568145751953" height="143.8000030517578" rx="0" ry="0" fill="#0b62a4" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="200.09933471679688" y="197.56000366210935" width="21.56568145751953" height="115.04000244140627" rx="0" ry="0" fill="#7a92a3" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="237.0421371459961" y="96.9000015258789" width="21.56568145751953" height="215.70000457763672" rx="0" ry="0" fill="#0b62a4" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="261.6078186035156" y="125.66000213623047" width="21.56568145751953" height="186.94000396728515" rx="0" ry="0" fill="#7a92a3" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="298.55062103271484" y="168.8000030517578" width="21.56568145751953" height="143.8000030517578" rx="0" ry="0" fill="#0b62a4" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="323.1163024902344" y="197.56000366210935" width="21.56568145751953" height="115.04000244140627" rx="0" ry="0" fill="#7a92a3" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="360.0591049194336" y="96.9000015258789" width="21.56568145751953" height="215.70000457763672" rx="0" ry="0" fill="#0b62a4" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="384.6247863769531" y="125.66000213623047" width="21.56568145751953" height="186.94000396728515" rx="0" ry="0" fill="#7a92a3" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="421.56758880615234" y="25" width="21.56568145751953" height="287.6000061035156" rx="0" ry="0" fill="#0b62a4" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
									<rect x="446.1332702636719" y="53.76000061035154" width="21.56568145751953" height="258.8400054931641" rx="0" ry="0" fill="#7a92a3" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect></svg>
								<div class="morris-hover morris-default-style" style="left: 343.556px; top: 137px; display: none;">
									<div class="morris-hover-row-label">2011</div>
									<div class="morris-hover-point" style="color: #0b62a4">Series A: 75</div>
									<div class="morris-hover-point" style="color: #7a92a3">Series B: 65</div>
								</div>
							</div>
						</div>
						<!-- /.col-lg-8 (nested) -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<ul class="timeline">
						<li>
							<div class="timeline-badge">
								<i class="fa fa-check"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
									<p>
										<small class="text-muted"><i class="fa fa-clock-o"></i> 11 hours ago via Twitter</small>
									</p>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero laboriosam dolor perspiciatis omnis exercitationem. Beatae, officia pariatur? Est cum veniam excepturi. Maiores praesentium, porro voluptas suscipit facere rem dicta, debitis.</p>
								</div>
							</div>
						</li>
						<li class="timeline-inverted">
							<div class="timeline-badge warning">
								<i class="fa fa-credit-card"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem dolorem quibusdam, tenetur commodi provident cumque magni voluptatem libero, quis rerum. Fugiat esse debitis optio, tempore. Animi officiis alias, officia repellendus.</p>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium maiores odit qui est tempora eos, nostrum provident explicabo dignissimos debitis vel! Adipisci eius voluptates, ad aut recusandae minus eaque facere.</p>
								</div>
							</div>
						</li>
						<li>
							<div class="timeline-badge danger">
								<i class="fa fa-bomb"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus numquam facilis enim eaque, tenetur nam id qui vel velit similique nihil iure molestias aliquam, voluptatem totam quaerat, magni commodi quisquam.</p>
								</div>
							</div>
						</li>
						<li class="timeline-inverted">
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates est quaerat asperiores sapiente, eligendi, nihil. Itaque quos, alias sapiente rerum quas odit! Aperiam officiis quidem delectus libero, omnis ut debitis!</p>
								</div>
							</div>
						</li>
						<li>
							<div class="timeline-badge info">
								<i class="fa fa-save"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis minus modi quam ipsum alias at est molestiae excepturi delectus nesciunt, quibusdam debitis amet, beatae consequuntur impedit nulla qui! Laborum, atque.</p>
									<hr>
									<div class="btn-group">
										<button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
											<i class="fa fa-gear"></i> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Something else here</a></li>
											<li class="divider"></li>
											<li><a href="#">Separated link</a></li>
										</ul>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi fuga odio quibusdam. Iure expedita, incidunt unde quis nam! Quod, quisquam. Officia quam qui adipisci quas consequuntur nostrum sequi. Consequuntur, commodi.</p>
								</div>
							</div>
						</li>
						<li class="timeline-inverted">
							<div class="timeline-badge success">
								<i class="fa fa-graduation-cap"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt obcaecati, quaerat tempore officia voluptas debitis consectetur culpa amet, accusamus dolorum fugiat, animi dicta aperiam, enim incidunt quisquam maxime neque eaque.</p>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-8 -->
		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bell fa-fw"></i> Notifications Panel
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="list-group">
						<a href="#" class="list-group-item">
							<i class="fa fa-comment fa-fw"></i> New Comment <span class="pull-right text-muted small"><em>4 minutes ago</em> </span>
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span class="pull-right text-muted small"><em>12 minutes ago</em> </span>
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-envelope fa-fw"></i> Message Sent <span class="pull-right text-muted small"><em>27 minutes ago</em> </span>
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-tasks fa-fw"></i> New Task <span class="pull-right text-muted small"><em>43 minutes ago</em> </span>
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-upload fa-fw"></i> Server Rebooted <span class="pull-right text-muted small"><em>11:32 AM</em> </span>
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-bolt fa-fw"></i> Server Crashed! <span class="pull-right text-muted small"><em>11:13 AM</em> </span>
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-warning fa-fw"></i> Server Not Responding <span class="pull-right text-muted small"><em>10:57 AM</em> </span>
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-shopping-cart fa-fw"></i> New Order Placed <span class="pull-right text-muted small"><em>9:49 AM</em> </span>
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-money fa-fw"></i> Payment Received <span class="pull-right text-muted small"><em>Yesterday</em> </span>
						</a>
					</div>
					<!-- /.list-group -->
					<a href="#" class="btn btn-default btn-block">View All Alerts</a>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bar-chart-o fa-fw"></i> Donut Chart Example
				</div>
				<div class="panel-body">
					<div id="morris-donut-chart">
						<svg height="348" version="1.1" width="351.9875183105469" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative; left: -0.787476px; top: -0.200012px;">
							<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
							<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
							<path fill="none" stroke="#0b62a4" d="M175.99375915527344,287.46250915527344A110.66250610351562,110.66250610351562,0,0,0,280.4750929257914,213.26699018593513" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path>
							<path fill="#0b62a4" stroke="#ffffff" d="M175.99375915527344,290.46250915527344A113.66250610351562,113.66250610351562,0,0,0,283.3075247253962,214.25559025703956L327.9950401450425,229.8528169678497A160.99375915527344,160.99375915527344,0,0,1,175.99375915527344,337.79376220703125Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#3980b5" d="M280.4750929257914,213.26699018593513A110.66250610351562,110.66250610351562,0,0,0,76.72200037739297,127.89899931710073" stroke-width="2" opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path>
							<path fill="#3980b5" stroke="#ffffff" d="M283.3075247253962,214.25559025703956A113.66250610351562,113.66250610351562,0,0,0,74.03079730582093,126.57331985827173L27.086120988452734,103.4484974497722A165.99375915527344,165.99375915527344,0,0,1,332.71575981105036,231.5004837530238Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#679dc6" d="M76.72200037739297,127.89899931710073A110.66250610351562,110.66250610351562,0,0,0,175.95899350422505,287.4625036942977" stroke-width="2" opacity="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path>
							<path fill="#679dc6" stroke="#ffffff" d="M74.03079730582093,126.57331985827173A113.66250610351562,113.66250610351562,0,0,0,175.95805102644448,290.46250354625363L175.94318147500184,337.79375426230774A160.99375915527344,160.99375915527344,0,0,1,31.571459441072818,105.65796321448722Z" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<text x="175.99375915527344" y="166.8000030517578" text-anchor="middle" font-family="&quot;Arial&quot;" font-size="15px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 15px; font-weight: 800;" font-weight="800" transform="matrix(1.722,0,0,1.722,-127.2215,-128.2312)" stroke-width="0.5807039352395096">
							<tspan dy="6.0031280517578125" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">In-Store Sales</tspan></text>
							<text x="175.99375915527344" y="186.8000030517578" text-anchor="middle" font-family="&quot;Arial&quot;" font-size="14px" stroke="none" fill="#000000" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 14px;" transform="matrix(2.3055,0,0,2.3055,-229.8849,-233.4138)" stroke-width="0.4337512468324182">
							<tspan dy="4.8000030517578125" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">30</tspan></text></svg>
					</div>
					<a href="#" class="btn btn-default btn-block">View Details</a>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
			<div class="chat-panel panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> Chat
					<div class="btn-group pull-right">
						<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-chevron-down"></i>
						</button>
						<ul class="dropdown-menu slidedown">
							<li><a href="#">
									<i class="fa fa-refresh fa-fw"></i> Refresh
								</a></li>
							<li><a href="#">
									<i class="fa fa-check-circle fa-fw"></i> Available
								</a></li>
							<li><a href="#">
									<i class="fa fa-times fa-fw"></i> Busy
								</a></li>
							<li><a href="#">
									<i class="fa fa-clock-o fa-fw"></i> Away
								</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<i class="fa fa-sign-out fa-fw"></i> Sign Out
								</a></li>
						</ul>
					</div>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix"><span class="chat-img pull-left"> <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle">
						</span>
							<div class="chat-body clearfix">
								<div class="header">
									<strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted"> <i class="fa fa-clock-o fa-fw"></i> 12 mins ago
									</small>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</p>
							</div></li>
						<li class="right clearfix"><span class="chat-img pull-right"> <img src="http://placehold.it/50/FA6F57/fff" alt="User Avatar" class="img-circle">
						</span>
							<div class="chat-body clearfix">
								<div class="header">
									<small class=" text-muted"> <i class="fa fa-clock-o fa-fw"></i> 13 mins ago
									</small> <strong class="pull-right primary-font">Bhaumik Patel</strong>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</p>
							</div></li>
						<li class="left clearfix"><span class="chat-img pull-left"> <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle">
						</span>
							<div class="chat-body clearfix">
								<div class="header">
									<strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted"> <i class="fa fa-clock-o fa-fw"></i> 14 mins ago
									</small>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</p>
							</div></li>
						<li class="right clearfix"><span class="chat-img pull-right"> <img src="http://placehold.it/50/FA6F57/fff" alt="User Avatar" class="img-circle">
						</span>
							<div class="chat-body clearfix">
								<div class="header">
									<small class=" text-muted"> <i class="fa fa-clock-o fa-fw"></i> 15 mins ago
									</small> <strong class="pull-right primary-font">Bhaumik Patel</strong>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</p>
							</div></li>
					</ul>
				</div>
				<!-- /.panel-body -->
				<div class="panel-footer">
					<div class="input-group">
						<input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here...">
						<span class="input-group-btn">
							<button class="btn btn-warning btn-sm" id="btn-chat">Send</button>
						</span>
					</div>
				</div>
				<!-- /.panel-footer -->
			</div>
			<!-- /.panel .chat-panel -->
		</div>
		<!-- /.col-lg-4 -->
	</div>

</body>
</html>
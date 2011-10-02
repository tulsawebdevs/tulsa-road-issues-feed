

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="ctl00_ctl00_ctl00_ContentPlaceHolderDefault_head"><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=8" /><title>
	Live Traffic Report - The City of Tulsa Online
</title><link rel="canonical" href="http://www.cityoftulsa.org/live-traffic-report.aspx" /><link rel="stylesheet" type="text/css" href="/css/COTMainV3.css" /><link rel="stylesheet" type="text/css" href="/css/cotinlineStyles.css" /><link rel="stylesheet" type="text/css" href="/css/prettyPhoto.css" /><link rel="stylesheet" type="text/css" href="/css/print.css" media="print" />
		<script type="text/javascript" src="/scripts/jquery.js"></script>
		<script type="text/javascript" src="/scripts/COTscriptV2.js"></script>
		<script type="text/javascript" src="/scripts/jquery.prettyPhoto.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function(){
			$("a[rel^='prettyPhoto']").prettyPhoto();
			});
		</script>
		<!--[if IE 6]>
		<script src="/scripts/pngFix.js"></script>
		<script>
 		 DD_belatedPNG.fix('#searchInput,a,#header img,#leftColumn img,li');
		</script>
		<style type="text/css">
		div {zoom: 1;}
		#leftColumn
		{display:inline;}
		#rightColumn
		{display:inline;  padding-left:0px; width:538px;}
		</style>
		<![endif]-->
	<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAgvwysS0TkOd2bBSMrDhOHxSIzZOMvttUGN-bHrFwQaATjWectxQqgkV6uugLlrhic5Q0vgOTsy7r4A" type="text/javascript"></script>
<script type="text/javascript">
   var ondetail='no';  
   var defaultpoint = new GLatLng(36.11, -95.92);     
    //<![CDATA[
var map; 
var xmarker;
function load() {
      if (GBrowserIsCompatible()) {
	  map = new GMap2(document.getElementById("map"));
geocode('4047 E 24 PL S, Tulsa, OK $10/01/11 9:08:11 PM<br />INJURY CRASH<br />4047 E 24 PL S ; ROLLOVER');
geocode('5200 E PINE ST, Tulsa, OK $10/01/11 9:05:40 PM<br />INJURY CRASH<br />5200 E PINE ST');
geocode('11111 E 13 PL S, Tulsa, OK $10/01/11 8:55:45 PM<br />HIT&amp;RUN/NON-INJ<br />11111 E 13 PL S ;TOWNHOUSE');
geocode('2122 E SEMINOLE ST, Tulsa, OK $10/01/11 8:39:54 PM<br />HIT&amp;RUN/NON-INJ<br />2122 E SEMINOLE ST ; HSE');
      }
    }
    //]]>
function geocode(address){
	var geocoder = new GClientGeocoder();
	var setpoint = defaultpoint;
	var divpoint = address.indexOf('$');
	var xaddress = Left(address, divpoint);
	divpoint = address.length - divpoint - 1;
	var xinfo = Right(address, divpoint);
	geocoder.getLatLng(xaddress, function(point) 
	{if (!point) {map.setCenter(defaultpoint, 11, G_NORMAL_MAP)} 
	else 
	{ 
	map.setCenter(defaultpoint, 11, G_NORMAL_MAP);        
	var marker = new GMarker(point);        
	map.addOverlay(marker);  
	xmarker = marker;
	GEvent.addListener(marker, "click", function() {
	setpoint = point;
	zoomit(setpoint);
	});
	GEvent.addListener(marker, "mouseover", function() {
	marker.openInfoWindowHtml(xinfo);
	});
    
	 }    }  );}
	 
function resetMap()
   {   if (ondetail=='yes')
       {    map.setCenter(defaultpoint, 11, G_NORMAL_MAP);
	   		ondetail=='no';
	   }
   }

function zoomit(setpoint){
	map.setCenter(setpoint, 16, G_HYBRID_MAP);
	ondetail='yes';
	 }
	 
	 function Left(str, n){
	if (n <= 0)
	    return "";
	else if (n > String(str).length)
	    return str;
	else
	    return String(str).substring(0,n);
}
function Right(str, n){
    if (n <= 0)
       return "";
    else if (n > String(str).length)
       return str;
    else {
       var iLen = String(str).length;
       return String(str).substring(iLen, iLen - n);
    }
}
$(document).ready(function() {
load();
});
</script>
</head>
<body>
<div id="pageWrap">
<div id="globalNav"><a href="/">Home</a> | <a href="/services-a-z.aspx">Services A-Z</a> | <a href="/our-city/meeting-agendas.aspx">Meeting Agendas</a> | <a href="/our-city/jobs.aspx">Employment</a> | <a href="/reporting/general-contact.aspx">Contact Information</a></div>
<div id="page">
<div id="header">
<div id="headerBanner">&nbsp;<a href="/" class="homelink" title="City of Tulsa Homepage">&nbsp;</a></div>
<div id="headerSearch"><div id="weather"><div id="weatherImage" xmlns:yweather="http://xml.weather.yahoo.com/ns/rss/1.0" xmlns:date="urn:Exslt.ExsltDatesAndTimes"><img src="/images/weather/33.png" alt="Weather Image" /></div><div id="weatherCurrentTemp" xmlns:yweather="http://xml.weather.yahoo.com/ns/rss/1.0" xmlns:date="urn:Exslt.ExsltDatesAndTimes">58°</div><div id="weatherCity" xmlns:yweather="http://xml.weather.yahoo.com/ns/rss/1.0" xmlns:date="urn:Exslt.ExsltDatesAndTimes">Tulsa, OK</div><div id="weatherDate" xmlns:yweather="http://xml.weather.yahoo.com/ns/rss/1.0" xmlns:date="urn:Exslt.ExsltDatesAndTimes">Oct 1, 2011</div><div id="weatherTemps" xmlns:yweather="http://xml.weather.yahoo.com/ns/rss/1.0" xmlns:date="urn:Exslt.ExsltDatesAndTimes">H77° / L43°</div></div><div id="search"><form id="searchbox_004980302676479492860:6dthu0_g3mu" action="/site-search-results.aspx" name="searchForm"><div id="searchBox"><label for="q1" id="searchLabel">Search</label><div id="searchInput"><input type="hidden" name="cx" value="004980302676479492860:6dthu0_g3mu" /><input type="hidden" name="cof" value="FORID:11" /><input id="q1" name="q" type="text" class="searchBox" alt="Search" /><a href="#" onclick="document.searchForm.submit(); return false"><img src="/images/searchInputButton.png" width="18" height="15" alt="Search" /></a></div></div></form></div></div>

</div>
<div id="topNav">
<ul class="sf-menu"><li><a href="/community-programs.aspx">Community Programs</a><ul><li><a href="/community-programs/community-overview.aspx">Community Overview</a></li><li><a href="/community-programs/human-rights.aspx">Human Rights</a></li><li><a href="/community-programs/neighborhoods.aspx">Neighborhoods</a></li><li><a href="/community-programs/small-area-and-neighborhood-revitalization-planning.aspx">Small Area and Neighborhood Revitalization Planning</a></li><li><a href="/community-programs/planning.aspx">Planning</a></li><li><a href="/community-programs/grants.aspx">Grants</a></li><li><a href="/community-programs/veteran's-resources.aspx">Veteran's Resources</a></li><li><a href="/community-programs/housing.aspx">Housing</a></li><li><a href="/community-programs/social-innovation-fund.aspx">Social Innovation Fund</a></li><li><a href="/community-programs/mentoring-to-the-max!.aspx">Mentoring to the Max!</a></li><li><a href="/community-programs/early-settlement-mediation.aspx">Early Settlement Mediation</a></li><li><a href="/community-programs/drive-25.aspx">Drive 25</a></li><li><a href="http://www.incog.org/Agency_on_Aging/aaa_main.html">Tulsa Agency on Aging</a></li></ul></li><li><a href="/our-city.aspx">Our City</a><ul><li><a href="/our-city/our-city-overview.aspx">Our City Overview</a></li><li><a href="/our-city/managing-change.aspx">Managing Change</a></li><li><a href="/our-city/about-tulsa.aspx">About Tulsa</a></li><li><a href="/our-city/elected-officials.aspx">Elected Officials</a></li><li><a href="/our-city/city-charter--ordinances.aspx">City Charter &amp; Ordinances</a></li><li><a href="/our-city/doing-business-with-the-city.aspx">Doing Business with the City</a></li><li><a href="/our-city/financial-reports.aspx">Financial Reports</a></li><li><a href="/our-city/economic-development.aspx">Economic Development</a></li><li><a href="/our-city/departments.aspx">Departments</a></li><li><a href="/our-city/boards-and-commissions.aspx">Boards and Commissions</a></li><li><a href="/our-city/city-elections.aspx">City Elections</a></li><li><a href="/our-city/city-hall.aspx">City Hall</a></li><li><a href="/our-city/customer-care-center.aspx">Customer Care Center</a></li><li><a href="/our-city/special-events.aspx">Special Events</a></li><li><a href="/our-city/meeting-agendas.aspx">Meeting Agendas</a></li><li><a href="/our-city/public-records.aspx">Public Records</a></li><li><a href="/our-city/jobs.aspx">Jobs</a></li><li><a href="/our-city/tulsa-blue-employee-recognition-program.aspx">Tulsa Blue Employee Recognition Program</a></li><li><a href="/our-city/lobbying.aspx">Lobbying</a></li><li><a href="/our-city/sales-tax-rebate-form.aspx">Sales Tax Rebate Form</a></li><li><a href="/our-city/annexation.aspx">Annexation</a></li></ul></li><li><a href="/public-safety.aspx">Public Safety</a><ul><li><a href="/public-safety/public-safety-overview.aspx">Public Safety Overview</a></li><li><a href="http://www.tulsapolice.org/">Police</a></li><li><a href="/public-safety/fire.aspx">Fire</a></li><li><a href="/public-safety/911-center.aspx">911 Center</a></li><li><a href="/public-safety/municipal-courts.aspx">Municipal Courts</a></li><li><a href="/public-safety/hazard-mitigation.aspx">Hazard Mitigation</a></li></ul></li><li><a href="/city-services.aspx">City Services</a><ul><li><a href="/city-services/city-services-overview.aspx">City Services Overview</a></li><li><a href="/city-services/refuse.aspx">Refuse</a></li><li><a href="/city-services/streets.aspx">Streets</a></li><li><a href="/city-services/utilities.aspx">Utilities</a></li><li><a href="/city-services/water.aspx">Water</a></li><li><a href="/city-services/wastewater.aspx">Wastewater</a></li><li><a href="/city-services/flood-control.aspx">Flood Control</a></li><li><a href="/reporting/reporting-problems.aspx">Report a Problem</a></li><li><a href="/our-city/doing-business-with-the-city/permits-and-licensing.aspx">Permits, Licensing &amp; Land Development</a></li><li><a href="/city-services/engineering.aspx">Engineering</a></li><li><a href="http://www.emsaonline.com/">EMSA</a></li><li><a href="http://tulsatransit.org/">Tulsa Transit</a></li><li><a href="http://www.tulsaairports.com/">Tulsa Airports</a></li><li><a href="/city-services/animal-welfare.aspx">Animal Welfare</a></li></ul></li><li><a href="/environmental-programs.aspx">Environmental Programs</a><ul><li><a href="/environmental-programs/environmental-programs-overview.aspx">Environmental Programs Overview</a></li><li><a href="/environmental-programs/office-of-sustainability.aspx">Office of Sustainability</a></li><li><a href="/environmental-programs/recycling.aspx">Recycling</a></li><li><a href="/environmental-programs/greenwaste.aspx">Greenwaste</a></li><li><a href="/environmental-programs/stormwater-quality.aspx">Stormwater Quality</a></li><li><a href="/environmental-programs/pace.aspx">PACE</a></li><li><a href="/environmental-programs/trap-the-grease.aspx">Trap the Grease</a></li><li><a href="/environmental-programs/regreen-tulsa.aspx">ReGreen Tulsa</a></li></ul></li><li><a href="/culture--recreation.aspx">Culture &amp; Recreation</a><ul><li><a href="/culture--recreation/culture--recreation-overview.aspx">Culture &amp; Recreation Overview</a></li><li><a href="/culture--recreation/tulsa-parks.aspx">Tulsa Parks</a></li><li><a href="http://www.tulsazoo.com/">Tulsa Zoo</a></li><li><a href="http://www.gilcrease.org/">Gilcrease Museum</a></li><li><a href="http://www.tulsapac.com/">Performing Arts Center</a></li><li><a href="http://www.tulsaconvention.com/">Convention Center</a></li><li><a href="http://www.tulsalibrary.org/">Tulsa Library</a></li><li><a href="http://www.tulsagardencenter.com/">Tulsa Garden Center</a></li><li><a href="http://www.bokcenter.com/">BOK Center</a></li></ul></li></ul>
</div>
<div id="rightColumn">
<form name="aspnetForm" method="post" action="/live-traffic-report.aspx?" id="aspnetForm">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUENTM4MQ9kFgJmD2QWAmYPZBYCZg9kFgJmD2QWAgINEGRkFgICBw9kFgICAQ9kFgICAQ9kFgJmD2QWBAIBDw8WAh4LTmF2aWdhdGVVcmwFGS9saXZlLXRyYWZmaWMtcmVwb3J0LmFzcHhkZAIDDw8WAh8ABTcvbGl2ZS10cmFmZmljLXJlcG9ydC9saXZlLXRyYWZmaWMtcmVwb3J0LXRleHQtb25seS5hc3B4ZGQYAQVjY3RsMDAkY3RsMDAkY3RsMDAkQ29udGVudFBsYWNlSG9sZGVyRGVmYXVsdCRDT1RUZXh0cGFnZVBsYWNlSG9sZGVyJGN0bDAwJENPVEFjY2lkZW50TWFwXzckR3JpZFZpZXcxDzwrAAoBCAIBZERwddLkMibqVuJR6Xtur4gzl5tL" />
</div>


<script src="/ScriptResource.axd?d=wsJTX6zxPADReOGEdGEYoSzOx40XRhyit0PiusQJKvXt9HxCepulXtxASy2yhNJhcM62ROPTX9yuKbTn81MpmTBPjHniRMt4edzrvqdyzmqhFHYKqH2NBLcz8JqUhXcM8Xvmk1gBbug6akAhWyDmp3nW39M1&amp;t=240d5ec3" type="text/javascript"></script>
<div id="breadcrumb"><ul><li><a href="/">Home</a></li><li>››</li><li>Live Traffic Report</li></ul></div>

<div id="contentBox">
<h1 class="underline">
Live Traffic Report
</h1>

<p>Not all incidents will display on the map. See the table below
for the complete list.</p>



    <div id="map_wrapper">
    <div id="map" style="width: 470px; height: 450px; margin-left:auto; margin-right:auto;" onclick="resetMap();"></div></div>
<p class="centered">This map does not refresh automatically. 
    <a id="ctl00_ctl00_ctl00_ContentPlaceHolderDefault_COTTextpagePlaceHolder_ctl00_COTAccidentMap_7_mapLink" href="/live-traffic-report.aspx">Click here</a> to refesh the map.<br />
    <a id="ctl00_ctl00_ctl00_ContentPlaceHolderDefault_COTTextpagePlaceHolder_ctl00_COTAccidentMap_7_textLink" href="/live-traffic-report/live-traffic-report-text-only.aspx">Click here</a> to see the auto-refreshing text-only page.</p>
<div id="accidentGrid">
<div>
	<table cellspacing="0" cellpadding="4" align="Center" border="0" id="ctl00_ctl00_ctl00_ContentPlaceHolderDefault_COTTextpagePlaceHolder_ctl00_COTAccidentMap_7_GridView1" style="color:#333333;width:470px;border-collapse:collapse;">
		<tr style="color:White;background-color:#5D7B9D;font-weight:bold;">
			<th align="left" scope="col" abbr="Number">#</th><th align="left" scope="col" abbr="Type">Type</th><th align="left" scope="col" abbr="Date">Date</th><th align="left" scope="col" abbr="Time">Time</th><th align="left" scope="col" abbr="Location">Location</th>
		</tr><tr style="color:#333333;background-color:#F7F6F3;">
			<td align="center">1</td><td>Injury</td><td>10/01/11</td><td style="white-space:nowrap;">9:08:11 PM</td><td>4047 E 24 PL S ; ROLLOVER</td>
		</tr><tr style="color:#284775;background-color:White;">
			<td align="center">2</td><td>Injury</td><td>10/01/11</td><td style="white-space:nowrap;">9:05:40 PM</td><td>5200 E PINE ST</td>
		</tr><tr style="color:#333333;background-color:#F7F6F3;">
			<td align="center">3</td><td>Hit &amp; Run</td><td>10/01/11</td><td style="white-space:nowrap;">8:55:45 PM</td><td>11111 E 13 PL S ;TOWNHOUSE</td>
		</tr><tr style="color:#284775;background-color:White;">
			<td align="center">4</td><td>Hit &amp; Run</td><td>10/01/11</td><td style="white-space:nowrap;">8:39:54 PM</td><td>2122 E SEMINOLE ST ; HSE</td>
		</tr>
	</table>
</div>
</div> 

<p>&nbsp;</p>

<p><span class="actionLink"><a href="/road-closure-map/map.aspx"
title="Map">Map of Tulsa Road Closures</a></span></p>

<p><strong><a
href="http://www.odot.org/newsmedia/traffic-advisory.htm"
class="actionLink">ODOT Highway Improvement
Updates</a></strong></p>

<p><strong><span class="actionLink"><a
href="http://www.fixourstreetslive.com/">A full list of City
construction projects can be seen on Fix Our Streets
Live</a></span></strong></p>

</div>


<script type="text/javascript">
//<![CDATA[
Sys.Application.initialize();
//]]>
</script>
</form>
</div>
<div id="leftColumn">
<h1></h1>
<h1>Quick Links</h1>
<div class="leftColumnBox"><div id="quickLinks"><form action="#"><label for="quicklinkSEL">I want to:</label><div><select id="quicklinkSEL" class="actionNav"><option value="#">Select a task...</option><option value="/our-city/jobs.aspx">Fill Out a Job Application</option><option value="/public-safety/municipal-courts/pay-tickets-online.aspx">Pay My Traffic Ticket</option><option value="https://secure2.cityoftulsa.org/account/login.aspx">Pay My Utility Bill</option><option value="/our-city/financial-reports/city-budget-archive/2009-2010-adopted-budget.aspx">Read the City Budget</option><option value="/reporting/reporting-problems.aspx">Report a Problem</option><option value="/district-finder.aspx">Find my Council District</option><option value="/live-traffic-report.aspx">View Live Traffic Report</option><option value="/our-city/city-hall.aspx">Visit City Hall</option><option value="/content/more-information-quicklinks.aspx">More...</option></select></div></form></div>&nbsp;</div>
<div class="leftColumnBox"><a href="/reporting.aspx"><img src="/images/macPhone.png" width="211" height="57" alt="Mayor's Action Center" /></a></div>
</div>
<div id="footer"><p><a href="/privacy.aspx">Privacy Policy</a> | <a href="/accessibility.aspx">Accessibility Policy</a> | <a href="/links.aspx">Link Policy</a> | <a href="/legal.aspx">Legal Disclaimer</a> | <a href="/reporting/website-problems.aspx">Report site problems</a> | <a href="/reporting/general-contact.aspx">Contact us</a> | <a href="/sitemap.aspx">Site Map</a></p></div>
</div>
<div>&nbsp;</div>
</div>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-1537320-6");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>
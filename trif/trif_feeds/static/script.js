var map;
var lat = 36.1113;
var lon = -95.931;
var zoom = 12;

function initialize() {
    if (navigator.geolocation){
        navigator.geolocation.getCurrentPosition(function(position){
            map.setCenter(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
            map.setZoom(13);
        });
    }
    var latlng = new google.maps.LatLng(lat, lon);
    var myOptions = {
      zoom: zoom,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    trafficLayer = new google.maps.TrafficLayer();
    trafficLayer.setMap(map);

}

// From http://anentropic.wordpress.com/2009/06/25/javascript-iso8601-parser-and-pretty-dates/
function parseISO8601(str) {
    // we assume str is a UTC date ending in 'Z'

    var parts = str.split('T'),
    dateParts = parts[0].split('-'),
    timeParts = parts[1].split('Z'),
    timeSubParts = timeParts[0].split(':'),
    timeSecParts = timeSubParts[2].split('.'),
    timeHours = Number(timeSubParts[0]),
    _date = new Date;

    _date.setUTCFullYear(Number(dateParts[0]));
    _date.setUTCMonth(Number(dateParts[1])-1);
    _date.setUTCDate(Number(dateParts[2]));
    _date.setUTCHours(Number(timeHours));
    _date.setUTCMinutes(Number(timeSubParts[1]));
    _date.setUTCSeconds(Number(timeSecParts[0]));
    if (timeSecParts[1]) _date.setUTCMilliseconds(Number(timeSecParts[1]));

    // by using setUTC methods the date has already been converted to local time(?)
    return _date;
}

function place_alert_markers(json_resp){
    alerts = json_resp.alerts;
    var open_infowindow;
    for(a in alerts){
        if(alerts[a].geo.latitude && alerts[a].geo.longitude){
            var position = new google.maps.LatLng(alerts[a].geo.latitude, alerts[a].geo.longitude);
            var icon;
            if(alerts[a].type === 'closure'){
                icon = 'https://maps.google.com/mapfiles/ms/icons/red.png';
            }else if(alerts[a].type === 'incident'){
                icon = 'https://maps.google.com/mapfiles/ms/icons/yellow.png';
            }
            var marker = new google.maps.Marker({
                position: position,
                map: map,
                title: alerts[a].title,
                icon: icon
            });

            d = parseISO8601(alerts[a].start);
            start = d.toLocaleDateString() + " " +d.toLocaleTimeString();

            info_content = '<dl>' +
                '<dt>Title</dt><dd>' + alerts[a].title + '</dd>' +
                '<dt>Description</dt><dd>' + alerts[a].description + '</dd>' +
                '<dt>Type</dt><dd>' + alerts[a].type + '</dd>' +
                '<dt>Category</dt><dd>' + alerts[a].category + '</dd>' +
                '<dt>Started</dt><dd>' + start + '</dd>' +
                '<dt>TRIF Details</dt><dd><a href="' + alerts[a].detail_link + '" target="trif_link">Trif</a></dd>';
            if(alerts[a].hasOwnProperty('source_link')){
                info_content += '<dt>Source Details</dt><dd><a href="' + alerts[a].source_link + '" target="src_link">Source</a></dd>';
            }
            info_content += '</dl>';

            marker.info_window = new google.maps.InfoWindow({
                content: info_content 
            });

            google.maps.event.addListener(marker, 'click', function(){
                if(open_infowindow){open_infowindow.close();}
                this.info_window.open(map, this);
                open_infowindow = this.info_window;
            });
        }else{
            table_body = $('#side_bar .unmapped tbody');
            d = parseISO8601(alerts[a].start);
            start = d.toLocaleDateString() + " " +d.toLocaleTimeString();
            row = $('<tr />');
            row.append('<td>' + alerts[a].type + '</td>')
                .append('<td>' + start + '</td>')
                .append('<td>' + alerts[a].title + '</td>')
                .appendTo(table_body);
        }
    }
}

$(function(){
    $('#side_bar .close_btn').click(function(){
        btn = $(this);

        if($('#side_bar').css('left') != '0px'){
            $('#side_bar')
                .css('position', 'relative')
                .animate({'left': 0}, 500, function(){
                    $('#map_canvas').css('position', 'relative');
                    btn.html('&lt;&lt;');
                });
        }else{
            $('#map_canvas').css('position', 'static');
            $('#side_bar')
                .css('position', 'absolute')
                .animate({'left': -400}, 500, function(){
                    btn.html('&gt;&gt;');
                });
        }
    });

});

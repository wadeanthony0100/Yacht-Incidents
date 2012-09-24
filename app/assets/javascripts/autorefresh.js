function timedRefresh(timeoutPeriod) {
	setTimeout("location.reload(true);",timeoutPeriod);
}

$(document).ready(function(){
	if($(".counter").length > 0){
		var seconds = 60;
		timedRefresh(seconds * 1000);
	}
});
$('.submit').on('change', function (e) {
      $(this).find("form").submit();
});
$('.btn_grey').on('click', function (e) {
      alert(1);
});
$(document).ready(function() {
  $('#nav').onePageNav();
  
});
	$(function(){
		var d = new Date();
		var dt = Math.round((new Date('1/'+(d.getDate()+1).toString()+'/2014 00:00:01')).getTime()/1000)
		$('#flipcountdownbox').flipcountdown({
			tick:function(){
				var nol = function(h){
					return h>9?h:'0'+h;
				}
				var	range  	= dt-Math.round((new Date()).getTime()/1000),
					secday = 86400, sechour = 3600,
					days 	= parseInt(range/secday),
					hours	= parseInt((range%secday)/sechour),
					min		= parseInt(((range%secday)%sechour)/60),
					sec		= ((range%secday)%sechour)%60;
				return nol(days)+' '+nol(hours)+' '+nol(min)+' '+nol(sec);
			}
		});
	});
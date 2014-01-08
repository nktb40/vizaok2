var aktive_seite = location.href;	

/*
SLIDER ++++++++++++ START ++++++++++++++++++++++++++++++++++++++++++++++++
*/
var timer;
var nr 			= 1;
direction 	= 'left';

var aktion_laeuft1 = aktion_laeuft2 = false;

$(document).ready( function(){
	if($("#slider_prev").length > 0){
		timer = window.setInterval("slide()",10000);	
	}
	
	$("#slider_prev").click(function(){		
		if(!aktion_laeuft1 && !aktion_laeuft2){	
			window.clearInterval(timer);		
			direction = 'right';
			slide();
			timer = window.setInterval("slide()",10000);	
		}
	});
	
	$("#slider_next").click(function(){	
		if(!aktion_laeuft1 && !aktion_laeuft2){	
			window.clearInterval(timer);		
			direction = 'left';			
			slide();
			timer = window.setInterval("slide()",10000);	
		}
	});
	
});

function slide(){		
	aktion_laeuft1 = aktion_laeuft2 = true;
	$("#slider_next").fadeOut('fast');
	$("#slider_prev").fadeOut('fast');
	$('#g'+nr).delay(500).animate({ left: (direction=='left' ? '-2200px':'2200px') }, 2000, 'swing', function() { aktion_laeuft1 = false; });
	if(direction=="left") {
		naechster = parseInt(nr)+1;	
		if(naechster > max_nr) naechster = 1;
	}
	if(direction=="right") {
		naechster = parseInt(nr)-1;	
		if(naechster < 1) naechster = max_nr;
	}
	$('#g'+naechster).css('z-index','18');
	$('#g'+naechster).css('left',(direction=='left' ? '2200px':'-2200px'));
	$('#g'+naechster).css('display','block');		
	$('#g'+naechster).animate({ left: '0px' }, 1700, 'swing', function() { 
		aktion_laeuft2 = false; 
		$("#slider_next").fadeIn('fast');	
		$("#slider_prev").fadeIn('fast');	
	});
	$('#g'+nr).css('z-index','17');
	nr = naechster;	
}

/*
SLIDER ++++++++++++ ENDE ++++++++++++++++++++++++++++++++++++++++++++++++
*/




/*
NAVI ++++++++++++ START +++++++++++++++++++++++++++++++++++++++++++++++++
*/
$(document).ready( function(){	
	change_li = null;
	footer_li	= null;
	
	$("#navigation li").each(function(){
		ahref = $(this).children().attr('href');		
		if(aktive_seite.indexOf(ahref)!=-1){
			change_li = $(this);
		}
	});		
	if($(change_li).length > 0){				
		papa = change_li.parents('li')		
		if($(papa).length > 0){
			papa.addClass('aktiv');			
		}else{
			change_li.addClass('aktiv');
		}		
	}
	
	$("#footer-links li").each(function(){
		ahref = $(this).children().attr('href');
		if(aktive_seite.indexOf(ahref)!=-1){
			footer_li = $(this).children();
		}
	});
	if($(footer_li).length > 0){				
		footer_li.css('color','#cc0000');		
	}
	
});
/*
NAVI ++++++++++++ ENDE +++++++++++++++++++++++++++++++++++++++++++++++++
*/


function scrollToDiv(nr){	
	if($("."+nr)){
		scrollz = $("."+nr).offset().top;
		scrollz -= 20;
		$('html,body').animate({scrollTop: scrollz },'slow');		
		return false;
	}
}


function startHaendler(c,o,pp,plz){	
	$.ajax({
		type: "POST",
		url: pp+"/support_ajax.php",
		data: { mod: 'support_haendler_land', land: c, ortvalue: o, plzvalue:plz }
	})
	.done(function( msg ) {
		m = msg.split("||!||");
		$("#hs-ajax-ort-ausgabe").html(m[0]);
		$("#hs-ajax-plz-ausgabe").html(m[1]);
		$("#hs-ajax-ort").show();
		$("#hs-ajax-plz").show();
		$("#hs-ajax-plz-submit").show();
		$("#hs-ajax-ort-submit").show();			
	});  		
}




// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function showLayerForGSESSION(){
	
	Shadowbox.open({
        content:    '<div id="welcome-msg">Welcome to my website!</div>',
        player:     "html",
        title:      "Welcome",
        height:     350,
        width:      350
    });
	
}


$(document).ready( function(){
	
	/*
	ALLE auswärtigen Links mit TARGET="_BLANK" füllen ++++++++++++ START +++++++++++++++++++++++++++++++++++++++++++++++++
	*/
	servername = "http://"+window.location.hostname;	
	$("a").each(function(){
		hre = $(this).attr('href');
		
		if(hre!="" && typeof(hre)!="undefined"){
			if(hre.indexOf(servername)==-1 && !$(this).hasClass('ignore')){
				$(this).attr('target','_blank');
			}
		}
	});
	
	
	/*
	Sprachweiche am Seitenanfang
	*/
	var lang_ausgeklappt = false;
	$("#choose_language").click(function(){
		if(lang_ausgeklappt){
			$("#header-language-all").hide('slow');
			$("#header-language-aktuell").show('slow');			
		}else{
			$("#header-language-aktuell").hide('slow');
			$("#header-language-all").show('slow');
		}
		lang_ausgeklappt = !lang_ausgeklappt;
	});
	
	
	/* 
	Brands Rondel / Karussel
	*/
	var slider_watch_active;
	
	$("#watches-rondel li").mouseover(function(){
		$(this).children().next().children().css('color','#333');
		if($(slider_watch_active).length>0){
			$(slider_watch_active).removeClass('liaktiv');			
		}
	})	
	$("#watches-rondel li").mouseout(function(){
		$(this).children().next().children().css('color','#fff');
	});
	
	
	/*
	Watches-Slider / Rondel
	*/
	function watchSlide(l){
		$('#watches-rondel-slider').animate({ left: l+'px' }, 750 , 'swing', function() { slider_laeuft = false; }); 
	}
	function checkSliderBtn(){		
		if(watch_slider >= 0){ $("#watches-rondel-prev").children().slideUp('slow'); }else{	$("#watches-rondel-prev").children().slideDown('slow');	}		
		if(watch_slider <= watch_slider_max){ $("#watches-rondel-next").children().slideUp('slow'); }else{	$("#watches-rondel-next").children().slideDown('slow');	}
	}
	
	var watch_slider_width = 239;
	var watch_slider_max = (parseInt(($("#watches-rondel-slider ul li").length))*-1)+4;
	var watch_slider = 0;		
	var slider_laeuft = false;
	
	$("#watches-rondel-prev").click(function(){
		if(!slider_laeuft){
			slider_laeuft = true;
			watch_slider += 1;
			watchSlide(watch_slider*watch_slider_width);		
			checkSliderBtn();		
		}
	});
	$("#watches-rondel-next").click(function(){
		if(!slider_laeuft){
			slider_laeuft = true;
			watch_slider += -1;
			watchSlide(watch_slider*watch_slider_width);		
			checkSliderBtn();		
		}
	});
	
	
	// Springe zur Uhr in URL #
	if((aktive_seite.indexOf('watches/premium')!=-1 || aktive_seite.indexOf('watches/classic')!=-1 || aktive_seite.indexOf('watches/specials')!=-1) && aktive_seite.indexOf('#')!=-1){
		modell = aktive_seite.split("#");
		if($("#li_"+modell[1]).length > 0){
			slider_laeuft = true;
			
			// Aufblinken
			$("#li_"+modell[1]).addClass('liaktiv');
			$("#li_"+modell[1]).children().next().children().css('color','#333');
			slider_watch_active = $("#li_"+modell[1]);
				
			nw = (parseInt(($("#li_"+modell[1]).attr('class')))*-1);							
			watch_slider = nw;			
			watchSlide(watch_slider*watch_slider_width);					
			checkSliderBtn();		
		}
	}
	
	$aboutgshock_prev = null;
	// About-GSHOCK: Zeige eingeklappten Inhalt an
	if( (aktive_seite.indexOf('aboutgshock/toughness')!=-1 || aktive_seite.indexOf('aboutgshock/technology')!=-1 || aktive_seite.indexOf('aboutgshock/history')!=-1)){
		
		if(aktive_seite.indexOf('#')!=-1){
			klapper = aktive_seite.split("#");
			if(klapper[1]!=""){
				jumping = true;
				if(klapper[1].indexOf("-nojump")!=-1){
					klapper[1] = klapper[1].replace("-nojump","");
					jumping = false;
				}
				
				$("."+klapper[1]).removeClass('aboutgshock-pfeil');
		  	$("."+klapper[1]).addClass('aboutgshock-pfeilunten');
				$("."+klapper[1]).next().slideDown('slow');
				$("."+klapper[1]).next().removeClass('dn');
				if(jumping){
					scrollToDiv(klapper[1]);
				}
				$aboutgshock_prev = $("."+klapper[1]);
			}
		}else{
			//erster = $("#aboutgshock").first(".aboutgshock-textlink");
			//alert(erster);
			//erster.addClass('aboutgshock-pfeilunten');
			erster = $(".aboutgshock-textlink").first();
			erster.addClass('aboutgshock-pfeilunten');
			erster.next().slideDown('slow');
			erster.next().removeClass('dn');
			$aboutgshock_prev = erster;
		}
	}
	
	
	
	// Watchdetailseite: Zoombild 
	$('.jqzoom').jqzoom({
  	zoomType: 'standard',
    lens:true,
    preloadImages: false,
    alwaysOn:false,
    title:false,
    yOffset:100,
    xOffset:18,
    zoomWidth: 320,
		zoomHeight:320		
  });
	/*
	showEffect : 'fadein',
  hideEffect: 'fadeout'
  */
  
  // Watchdetailseite: Ausklappmechanismus
  $("#watchesdetail-features a").click(function(){
  	if($(this).hasClass('aktiv')){
  		$(this).removeClass('aktiv');
  		$(this).next().slideUp('slow');
  	}else{
  		$(this).addClass('aktiv');
  		$(this).next().slideDown('slow');
  	}
  	return false;
  });
   

   $("#hs-ajax-ort-ausgabe").on('change','#ort',function() {
		ort_focus = true;
		plz_focus = false;
	});
	
	$("#hs-ajax-ort-ausgabe").on('click','#ort',function() {
		ort_focus = true;
		plz_focus = false;
	});

	$("#hs-ajax-plz-ausgabe").on('click','#plz',function() { // LIVE extra für Daten die mit Ajax reingeladen werden
		ort_focus = false;
		plz_focus = true;
	});
	
	$(document).on('keypress',this,function(e) {
	    if(e.which == 13) {
	    	if(ort_focus) {
	    		e.preventDefault();
    		 	pp 	= $("#haendlersuche-ort-submit").data('patr');
			   	sp 	= $("#haendlersuche-ort-submit").data('modell');
			   	if(typeof(hsform)!="undefined"){  	
			   		if(typeof(hsform.hsmodellwahl)!="undefined"){
			   			if(hsform.hsmodellwahl[1].checked) sp = "";
			   		}
			   	}
			   	la 	= $("#country").val();
			   	ort = $("#ort").val();   	
			   	window.open(pp+"/support/distributor/"+(sp!="" ? sp+"/":"")+"?country="+la+"&ort="+ort,'_self');   	
	    	} else if(plz_focus) {
	    		e.preventDefault();
				pp 	= $("#haendlersuche-plz-submit").data('patr');
				sp 	= $("#haendlersuche-plz-submit").data('modell');
				if(typeof(hsform)!="undefined"){   		
					if(typeof(hsform.hsmodellwahl)!="undefined"){
						if(hsform.hsmodellwahl[1].checked) sp = "";
					}
				}
				la 	= $("#country").val();
				plz = $("#plz").val();
				window.open(pp+"/support/distributor/"+(sp!="" ? sp+"/":"")+"?country="+la+"&plz="+plz,'_self');
	    	}
    	}
	});
   
   
   
   // Händlersuche Länderauswahl
   $(".haendlersuche-country").change(function(){
   	if($(this).val()!=""){
   		
   		$("#hs-ajax-ort-ausgabe").html('');
			$("#hs-ajax-plz-ausgabe").html('');
			$("#hs-ajax-ort").hide();
			$("#hs-ajax-plz").hide();
			$("#hs-ajax-plz-submit").hide();
			$("#hs-ajax-ort-submit").hide();		
   		
   		var tv = $(this).val();
   		pp = $(this).data('patr');
   		$.ajax({
				type: "POST",
				url: pp+"/support_ajax.php",
				data: { mod: 'support_haendler_land', land: tv, ortvalue:'' }
			})
			.done(function( msg ) {
				m = msg.split("||!||");
				$("#hs-ajax-ort-ausgabe").html(m[0]);
				$("#hs-ajax-plz-ausgabe").html(m[1]);
				$("#hs-ajax-ort").show();
				$("#hs-ajax-plz").show();
				$("#hs-ajax-plz-submit").show();
				$("#hs-ajax-ort-submit").show();			
			});  		
   	}
   });	
   
   $("#haendlersuche-ort-submit").click(function(){
   	
   	pp 	= $(this).data('patr');
   	sp 	= $(this).data('modell');
   	if(typeof(hsform)!="undefined"){  	
   		if(typeof(hsform.hsmodellwahl)!="undefined"){
   			if(hsform.hsmodellwahl[1].checked) sp = "";
   		}
   	}
   	la 	= $("#country").val();
   	ort = $("#ort").val();
   	window.open(pp+"/support/distributor/"+(sp!="" ? sp+"/":"")+"?country="+la+"&ort="+ort,'_self');   	
   });
   
   $("#haendlersuche-plz-submit").click(function(){
   	pp 	= $(this).data('patr');
   	sp 	= $(this).data('modell');
   	if(typeof(hsform)!="undefined"){   		
   		if(typeof(hsform.hsmodellwahl)!="undefined"){
   			if(hsform.hsmodellwahl[1].checked) sp = "";
   		}
   	}
   	la 	= $("#country").val();
   	plz = $("#plz").val();
   	window.open(pp+"/support/distributor/"+(sp!="" ? sp+"/":"")+"?country="+la+"&plz="+plz,'_self');
   });
   
    $("#haendlersuche-ort-bt-submit").click(function(){
   	
   	pp 	= $(this).data('patr');
   	sp 	= $(this).data('modell');
   	if(typeof(hsform)!="undefined"){  	
   		if(typeof(hsform.hsmodellwahl)!="undefined"){
   			if(hsform.hsmodellwahl[1].checked) sp = "";
   		}
   	}
   	la 	= $("#country").val();
   	ort = $("#ort").val();
   	window.open(pp+"/aboutgshock/bluetooth/distributors/?country="+la+"&ort="+ort,'_self');   	
   });
   
   $("#haendlersuche-plz-bt-submit").click(function(){
   	pp 	= $(this).data('patr');
   	sp 	= $(this).data('modell');
   	if(typeof(hsform)!="undefined"){   		
   		if(typeof(hsform.hsmodellwahl)!="undefined"){
   			if(hsform.hsmodellwahl[1].checked) sp = "";
   		}
   	}
   	la 	= $("#country").val();
   	plz = $("#plz").val();
   	window.open(pp+"/aboutgshock/bluetooth/distributors/?country="+la+"&plz="+plz,'_self');
   });
   
   
   
   
   // Support-Feld Nummer bei Manual
   $("#module").focus(function(){
   	if($(this).val() == $(this).attr('rel')){
   		$(this).val('');
   	}   	
   }).blur(function(){
   	if($(this).val()==""){
   		ow = $(this).attr('rel');
   		$(this).val(ow);
   	}   	
   });
   
   
   // DIV-Boxen gleiche Höhe
    tallest = 0;
	  $('.sameheight', this).each(function(){    		  	
	    if ($(this).height() > tallest) {
	    	//$(this).css('background-color','#ff0000');
	      tallest = $(this).height();	      
	    }    
	  });
	  //tallest = tallest -80;
	  $('.sameheight', this).height(tallest);
	  $(this).height($(this).height()+8);  
	
		
		// CMS - Zeige Liste
		$(".cms_edit_a").click(function(){
			if($("#cms_edit_choose").is(":visible")){
				$("#cms_edit_choose").slideUp('slow');
			}else{
				$("#cms_edit_choose").slideDown('slow');
			}			
			return false;	
		});
		
		
		// Tausche Text
		$(".wait-text").click(function(){			
			$(this).val('Please wait...');
		});
		
		var cmsgallery_li	= $("#cmsgallery-ul").children();
  	var cmsgallery_position = 0;  	
		// Gallery Slider
		$(".cmsgallery-btn").click(function(){
			direction = $(this).attr('rel'); 
			if(direction=='next' && cmsgallery_position!=0) cmsgallery_li = cmsgallery_li.next();  					  				
  		item_width = parseInt(cmsgallery_li.children().children().attr('width'))+5;  				
  		cmsgallery_position = (direction=='prev' ? cmsgallery_position+item_width : cmsgallery_position-item_width);  				
  		new_pos = cmsgallery_position+'px';			  				  				
  		$('#cmsgallery-innerpicture').animate({ left: new_pos }, 1000 , 'swing', function() { });  				
  		if(direction=='prev' && cmsgallery_position!=0) cmsgallery_li = cmsgallery_li.prev();  					
  		if(cmsgallery_position < 0) $("#cmsgallery-prev").slideDown('slow'); else $("#cmsgallery-prev").slideUp('slow');				  				  					
  		//alert((Math.abs(cmsgallery_position)+7) +">"+ cmsgallery_breite_gesamt);
  		if((Math.abs(cmsgallery_position)+7) > cmsgallery_breite_gesamt) $("#cmsgallery-next").slideUp('slow'); else $("#cmsgallery-next").slideDown('slow');	
		});
		
		
		/*
		$(".cmsgallery-big").click(function(){
			link2pic = $(this).attr('href');
			Shadowbox.open({
				player: 'img',
				content: link2pic
			});
			return false;
		});
		*/
		
		
		$("#hide_element").click(function(){
			if($("#show_element").hasClass('dn')){
				$("#show_element").slideDown('slow');
				$("#hide_element").slideUp('slow');
			}else{
				$("#show_element").slideUp('slow');
				$("#hide_element").slideDown('slow');
			}			
			return false;
		});
		
		
		// G-SHOCK Life Trennstrich verkleinern    
    trenner_height_z = 0;
	  $('.gshocklife-teaser', this).each(function(){    		  	
	    if ($(this).height() > 20) {	    		      
	      trenner_height_z++;
	    }    
	  });
	  
	  if(trenner_height_z >= 1){
	  	trenner_anz = Math.ceil(trenner_height_z/2);
	  	trenner_anz = trenner_anz * 304;	  	
	  	$("#friends-trenner").attr('height',trenner_anz);	  	
	  }
	  
	  
	  // About G-SHOCK - Div-Container ein- und ausblenden
	  $("a.aboutgshock-textlink").click(function(){	  	
	  	if($(this).next().hasClass('dn')){
	  		$(this).removeClass('aboutgshock-pfeil');
	  		$(this).addClass('aboutgshock-pfeilunten');
				$(this).next().slideDown('slow');
				$(this).next().removeClass('dn');				
				if($aboutgshock_prev != null){					
					$aboutgshock_prev.removeClass('aboutgshock-pfeilunten');
					$aboutgshock_prev.addClass('aboutgshock-pfeil');	  		
					$aboutgshock_prev.next().slideUp('slow');
					$aboutgshock_prev.next().addClass('dn');
				}				
				$aboutgshock_prev = $(this);
				
			}else{
				$(this).removeClass('aboutgshock-pfeilunten');
				$(this).addClass('aboutgshock-pfeil');	  		
				$(this).next().slideUp('slow');
				$(this).next().addClass('dn');
				$aboutgshock_prev = null;
			}		
	  	return false;	  	
	  });
	  
		// View All - Watches
		$(".watches-viewall-item").mouseover(function(){				
			$(this).addClass('watches-viewall-item-aktiv');		
			$(this).children().next().children().css('color','#333');			
		})	
		$(".watches-viewall-item").mouseout(function(){
			$(this).removeClass('watches-viewall-item-aktiv');					
			$(this).children().next().children().css('color','#fff');			
		});
		
		
		// Watches View-All - Filter
		$(".viewall-watches-select").change(function(){
			//alert($(this).val());
			$(this).parent().submit();
		});
		
		
		// Alle Teaser mit Background verlinken
		hr = new Array();
		$(".teaserverlinkung").each(function (i) {
			hr[i] = $(this).find('a').attr('href');
			if(hr[i]){				
				if(hr[i].indexOf('http://')!=-1){
					$(this).css('cursor','pointer');
					$(this).bind('click', function(){
						window.open(hr[i],'_self');
					});					
				}
			}		
		});

		// Bluetooth-Logo auf View All
		$(".watches-viewall-item-bluetooth").click(function(){
			window.open( $(this).next().attr('href') ,'_self');
		});
		
});


function callVideo(flv,breite,hoehe){
	Shadowbox.open({
  		content:    flv,      
      player:     'flv',
      height:     hoehe,
      width:      breite
  });
}
/*
function gallerie(){
	Shadowbox.open({

		 player: 'img',
		height: 600,
		width: 800
	})
}
*/
function siteReady(){
	$(document).ready( function(){
		$("#fade").fadeOut('slow');
	});
	//document.getElementById('fade').style.display = 'none';
}


$(function()
{
	
	$("#topBar").css("position", "absolute");
	$("#topBar").css("top","470px");
	$("#topBar").css("right","0px");
	$("#topBar").css("position","fixed");

	$(window).scroll(function() 
	{
    	
    	var topPosBrowser = $(window).scrollTop();

    	
    	//$("#topBar").css("top", $(window).scrollTop() + "px");
    	

    	/*console.log(topPosBrowser);*/
	});


	$('#icon1').hover(function() {


        //$(this).find('ul').show();
        $('#iconGS').css('left','-95px');
		$('#iconGS').css('top','0px');

       $('#iconGS').fadeIn();
     	

       
       $('#iconGS, #icon1').click(function () 
		{
				//location.href = "https://www.facebook.com/CASIO.GSHOCK";
				if(jslanguage=="es"){
					window.open("https://www.facebook.com/casioshocktime", "_blank");
				}else if(jslanguage=="pt"){
					window.open("https://www.facebook.com/gshockpt?fref=ts", "_blank");
				}else{
					window.open("https://www.facebook.com/CASIO.GSHOCK", "_blank");
				}
		});

    },
    function() {
	      //$(this).find('ul').hide();
	       $('#iconGS').hide();
	});


	$('#icon2').hover(function() 
	{


        //$(this).find('ul').show();
       $('#iconGS').css('left','-95px');
	   $('#iconGS').css('top','50px');

       $('#iconGS').fadeIn();
     	

       
       $('#iconGS, #icon2').click(function () 
		{
				//location.href = "http://instagram.com/gshockeu";
				if(jslanguage=="es"){
					window.open("http://instagram.com/gshock_es", "_blank");
				}else{
					window.open("http://instagram.com/gshockeu", "_blank");
				}
		});

    },
    function() {
	      //$(this).find('ul').hide();
	       $('#iconGS').hide();
	});


	$('#icon3').hover(function() 
	{

       $('#iconGS').css('left','-95px');
	   $('#iconGS').css('top','95px');

       $('#iconGS').fadeIn();
     	

       
       $('#iconGS, #icon3').click(function () 
		{
				//location.href = "http://www.youtube.com/user/gshockeu";

				window.open("http://www.youtube.com/user/gshockeu", "_blank");
		});

    },
    function() {
	      //$(this).find('ul').hide();
	       $('#iconGS').hide();
	});


	$('#icon4').hover(function() 
	{

       $('#iconGS').css('left','-95px');
	   $('#iconGS').css('top','140px');

       $('#iconGS').fadeIn();
     	

       
       $('#iconGS, #icon4').click(function () 
		{
				//location.href = "https://itunes.apple.com/de/app/tryme-by-casio/id319508605?mt=8";

				window.open("https://itunes.apple.com/de/app/tryme-by-casio/id319508605?mt=8", "_blank");
		});

    },
    function() {
	      //$(this).find('ul').hide();
	       $('#iconGS').hide();
	});




});
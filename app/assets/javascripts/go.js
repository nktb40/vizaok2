<!--
	document.cookie = false;
	var toSleep = true; 
	function stopTimer(){toSleep=false;} 
	function goLink(LinkName, href, nogo) {
		var now = new Date();
		u="ur="+escape(LinkName);
		u=u+"&nw="+now.getTime();
		u=u+"&rf="+escape(window.location.hostname+window.location.pathname+window.location.search);
		u=u+'&server='+reporter_server;
		u=u+'&hr='+escape(href);
		u=u+"&fuid="+escape(navigator.userAgent+"\t"+navigator.platform+"\t"+screen.width+"\t"+"\t"+screen.pixelDepth)
		reporterImg=new Image(1,1);
		toSleep=true;
		if (document.cookie) {
			reporterImg.src = "http://www.stats.casio.de/go.php?"+u+"&ck=true";
		} else {
			reporterImg.src = "http://www.stats.casio.de/go.php?"+u;
		}
		reporterImg.onload=stopTimer;
		maxDelay(500);
		if (nogo == 1) {
			document.location.href = href;
		}
		return true;
	}
	function maxDelay(gap){
		var then,now;
		then=new Date().getTime();
		now=then; 
		while( toSleep==true&&(now-then)<gap){
			now=new Date().getTime();
		}
	}
// -->
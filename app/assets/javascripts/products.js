$('.quantity').live('change', function (e) {
			var items = JSON.parse($.cookie("gshock_cart_items"));
			var total_q = 0;
			for (var i=0; i < items.length; i++) {
        		if(items[i].id==e.target.getAttribute("product_id")){
        			//alert(items[i].quantity);
        			items[i].quantity = parseInt(e.target.value);
        			//alert($("#price"+items[i].id).text());
        			$("#total_sum"+items[i].id).html((items[i].quantity*$("#price"+items[i].id).text())+" руб.");     			
        		}
        		total_q+=items[i].quantity;
    		}
    		$.cookie("gshock_cart_items", JSON.stringify(items), { path: '/' });
    		$("#count").html("("+total_q+")");
    		
	});
	
$('.remove').live('click',function(e){
        var items = JSON.parse($.cookie("gshock_cart_items"));
        for (var i=0; i < items.length; i++) {
        		if(items[i].id==$(this).attr('product_id')){
        			items.splice(items[i], 1); 		
        		}
    		}
    		var total_q = 0;
    		for (var i=0; i < items.length; i++) {
        		total_q+=items[i].quantity;
    		}
    		$.cookie("gshock_cart_items", JSON.stringify(items), { path: '/' });
    		$("#item"+$(this).attr('product_id')).remove();
    		$("#count").html("("+total_q+")");
    });

$(".submit").on("change",function(event) {

      // Show Progress Indicator
      //$("#myModal").modal('hide');
      //$("#ajax-progress").show();
      //$(this).find("form").submit();
    });
   
 

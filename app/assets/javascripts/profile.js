// Dashboard
$(document).ready(function() {
    if(location.hash) {
        $('a[href=' + location.hash + ']').tab('show');
    }
    $(document.body).on("click", "a[data-toggle]", function(event) {
        location.hash = this.getAttribute("href");
    });

    $('[rel="details"]').popover({
    	trigger: 'hover',
    	placement: 'right',
    	container: 'body',
	    "html": true,
	    "content": function(){
	        var div_id =  "tmp-id-" + $.now();
	        return details_in_popup($(this).attr('value'), div_id);
	    }
	});

	function details_in_popup(value, div_id){
	    $.ajax({
	        url: '/reviews/1',
	        dataType: 'json',
	        data: {
	        	id: value
	        },
	        success: function(response){
	            $('#'+div_id).html(response.comment);
	        }
	    });
	    return '<div id="'+ div_id +'">Loading...</div>';
	}
});

$(window).on('popstate', function() {
    var anchor = location.hash || $("a[data-toggle=tab]").first().attr("href");
    $('a[href=' + anchor + ']').tab('show');
});

// var popoverSettings = {
// 	trigger: 'hover',
//     placement: 'top',
//     container: 'body',
//     html: true,
//     selector: '[rel="details"]', //Sepcify the selector here
//     content: function () {
//         $.ajax({
// 	    	url : '/reviews',
// 	     	dataType: 'json',
// 	     	data: {
// 	     		id: $(this).attr('value')
// 	     	},
// 	     	success : function(data) {
// 	     		var r = $.parseJSON(data);
// 	        	return 'hellololol';
// 	     	}
// 	  	});
//     }
// }

// $('body').popover(popoverSettings);

// var popover = $("[rel=details]").popover({
//  trigger : 'hover',  
//  placement : 'top',
//  html: 'true'
//   }).on('show.bs.popover', function() { 
//   $.ajax({
//      url : '/reviews',
//      dataType: 'json',
//      data: {
//      	id: $(this).attr('value')
//      },
//      success : function(data) {
//      	// var r = $.parseJSON(data);
//         popover.attr('hellololol', html);
//      }
//   });
//  });

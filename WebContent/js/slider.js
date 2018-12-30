jQuery.fn.prepare_slider = function(){	
		var x_pos = 0;
		var li_items_n = 0;	
		var right_clicks = 0;		
		var left_clicks = 0;					
		var li_col = jQuery("#slider_list > li");		
		var li_width = li_col.outerWidth(true);		
		var viewWindow = Math.round(jQuery('.block-slider').width()/li_width);
		
		li_col.each(function(index){			
			x_pos += jQuery(this).outerWidth(true);
			li_items_n++;								
		})	
		
		right_clicks = li_items_n - viewWindow;
		total_clicks = li_items_n - viewWindow;		
		
		jQuery('#slider_list').css('position','relative');
		jQuery('#slider_list').css('left','0px');
		jQuery('#slider_list').css('width', x_pos+'px');
		
		var is_playing = false;
		var completed = function() { is_playing = false; }
		
		jQuery('#left_but').click( function(){									
			cur_offset = jQuery('#slider_list').position().left;
			if (!is_playing){						
				if (left_clicks > 0) {
						is_playing = true; jQuery('#slider_list').animate({'left': cur_offset + li_width + 'px'}, 700, "linear", completed); 
						right_clicks++; 
						left_clicks--;
					} 
					else {
						is_playing = true;
						jQuery('#slider_list').animate({'left':    -li_width*total_clicks	+ 'px'}, 700, "linear", completed); 
						right_clicks = 0;
						left_clicks = total_clicks;
					}
			}
		});		

		jQuery('#right_but').click( function(){
			if (!is_playing){			
				cur_offset = jQuery('#slider_list').position().left;			
			 	if (right_clicks > 0) {
						is_playing = true; 
						jQuery('#slider_list').animate({'left': cur_offset - li_width + 'px'},700, "linear", completed );
						right_clicks--; left_clicks++; 
				} 
				else { 
						is_playing = true; jQuery('#slider_list').animate({'left':    0	+ 'px'},700, "linear", completed ); 
						left_clicks = 0;
						right_clicks = total_clicks;
					}			 
			}
		});	
		
	}

jQuery.fn.over = function(){						
	jQuery(this).hover(
	   function () {
	 	 jQuery(this).addClass("over");
	   },
	   function () {
	 	 jQuery(this).removeClass("over");
	   }
	 );		
   }
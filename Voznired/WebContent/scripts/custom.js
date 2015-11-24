//var a = {
//	pero : function(){
//		
//	},
//		
//};
//a.pero();
function getRoute(){
		$("#map").gmap3({
			      getroute:{
			    	  options:{
				       origin: $("#polaziste2").val(),
				       destination: $("#odrediste2").val(),
				       travelMode: google.maps.TravelMode.TRANSIT,
				       unitSystem: google.maps.DirectionsUnitSystem.IMPERIAL
			    	    },
			    	    callback: function (results) {
			    	    	  var html = "";
			    	    	  if (!results){
			    	    		html += "Ne postoji povezana ruta!!!";
					            $("#ispisRez").html( html ); 
					        	return;
			    	    	  }
			    	          $("#map").gmap3({
			    	            map:{
			    	              options:{
			    	                zoom: 10,  
			    	                
				      
			    	    }
				  },
				  directionsrenderer:{
			          options:{
			            directions:results
			          } 
			        }
			      });
			    }
			  }
			})
		}

function minDistance(){
		$("#map").gmap3({
		    getroute:{
		      options:{
		          origin:$("#polaziste2").val(),
		          destination:$("#odrediste2").val(),
		          travelMode: google.maps.DirectionsTravelMode.DRIVING,
		          unitSystem: google.maps.DirectionsUnitSystem.IMPERIAL,
		      },
		      callback: function(results){
		    	var html = "";
		        if (!results){
		            html += "Ne postoji povezana ruta!!!";
		            $("#ispisRez").html( html ); 
		        	return;
		          }
		          
		        $("#map").gmap3({
		          map:{
		            options:{
		              zoom: 10
		            }
		          },
		          directionsrenderer:{
		            //container: $(document.createElement("div")).addClass("googlemap").insertAfter($("#map")),
		            options:{ directions:results }
		          }
		        });
		      }
		    }
		  })
		}


		
		function distance(){
		    $("#map").gmap3({
		      getdistance:{
		        options:{ 
		          origins:[$("#polaziste2").val()], 
		          destinations:[$("#odrediste2").val()],
		          travelMode: google.maps.TravelMode.DRIVING
		        },
		        callback: function(results, status){
		          var html = "";
		          if (results){
		            for (var i = 0; i < results.rows.length; i++){
		              var elements = results.rows[i].elements;
		              
		              for(var j=0; j<elements.length; j++){
		            	  
		                switch(elements[j].status){
		                  case "OK":
		                    html +="Udaljenost u kilometrima " + elements[j].distance.text + " vrijeme potrebno auto prijevozom (" + elements[j].duration.text + ")<br />";
		                    break;
		                  case "NOT_FOUND":
		                    html += "The origin and/or destination of this pairing could not be geocoded<br />";
		                    break;
		                  case "ZERO_RESULTS":
		                    html += "No route could be found between the origin and destination.<br />";
		                    break;
		                }
		              }
		            } 
		          } else {
		            html = "error";
		          }
		          $("#ispisRez").html( html );
		        }
		      }
		    })
		  }
	/* ---------------------------------------------- /*
	 * Preloader
	/* ---------------------------------------------- */

	$(window).load(function() {
		$('#status').fadeOut();
		$('#preloader').delay(300).fadeOut('slow');
	});
	
	

		      //knob
		      $(function() {
		        $(".knob").knob({
		          'draw' : function () { 
		            $(this.i).val(this.cv + '%')
		          }
		        })
		      });

		      //carousel
//		       $(document).ready(function() {
//		           $("#owl-slider").owlCarousel({
//		               navigation : true,
//		               slideSpeed : 300,
//		               paginationSpeed : 400,
//		               singleItem : true

//		           });
//		       });

		      //custom select box

		      $(function(){
		          $('select.styled').customSelect();
		      });
			  
			 

	$(document).ready(function() {
		
		/* ---------------------------------------------- /*
		 * Map
		/* ---------------------------------------------- */
		
		$('#map').gmap3({
		  map:{
			  options:{
				  zoom:10,
				  center:[45.8144400,15.9779800]
			  }
		  },
			
		  marker:{
		    values:[
		            
		     
		    	{   
		    		address:"Zadar",
		    		callback: function(){ 
		    			
		    		}
		    	},
			    {
		    		address:"Pag",
			        callback: function(){
			        	
			        }
		    	},
			    {
		        	address:"Osijek",
			        callback: function(){
			        
			        }
		    	},
		    ]
		 },
		 getgeoloc:{
		     callback : function(latLng){
		         $(this).gmap3({ 
		        	 
		           marker:{ 
		             latLng:latLng,
		           },
		           
		           map:{	
		        		options:{
		        			  zoom:10,
		        			  center:{latLng:latLng}
		        				}		
		        		}
		         }); 
		     }
		   }
		 
		});



		
		/* ---------------------------------------------- /*
		 * Smooth scroll / Scroll To Top
		/* ---------------------------------------------- */

		$('a[href*=#]').bind("click", function(e){
           
			var anchor = $(this);
			$('html, body').stop().animate({
				scrollTop: $(anchor.attr('href')).offset().top
			}, 1000);
			e.preventDefault();
		});
 
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('.scroll-up').fadeIn();
			} else {
				$('.scroll-up').fadeOut();
			}
		});
		
		/* ---------------------------------------------- /*
		 * Navbar
		/* ---------------------------------------------- */


		$('body').scrollspy({
			target: '.navbar-custom',
			offset: 70
		});

        
        /* ---------------------------------------------- /*
		 * Skills
        /* ---------------------------------------------- */    
        //var color = $('#home').css('backgroundColor');

        
        /* ---------------------------------------------- /*
		 * Quote Rotator
		/* ---------------------------------------------- */
       
		
        
		/* ---------------------------------------------- /*
		 * Home BG
		/* ---------------------------------------------- */


		/* ---------------------------------------------- /*
		 * WOW Animation When You Scroll
		/* ---------------------------------------------- */
//
//		wow = new WOW({
//			mobile: false
//		});
//		wow.init();
	

		/* ---------------------------------------------- /*
		 * E-mail validation
		/* ---------------------------------------------- */
//
//		function isValidEmailAddress(emailAddress) {
//			var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
//			return pattern.test(emailAddress);
//		};

		/* ---------------------------------------------- /*
		 * Contact form ajax
		/* ---------------------------------------------- */

		$('#login-form').submit(function(e) {

			e.preventDefault();

			var user = $('#user').val();
			var pwd = $('#pwd').val();
			
			var response = $('#login-form .ajax-response');

			if (( user === '' || pwd === '')) {
				response.fadeIn(500);
				response.html('<i class="fa fa-warning"></i> Please fix the errors and try again.');
			}

			else {				
				    $('#login-form .ajax-hidden').fadeOut(500);
				    response.html("You are logged on...").fadeIn(500);
                                    
                                    console.log( $( this ).serialize() );
                                    $.post( "LogServlet", $( this ).serialize() );    
				}
            
            	return false;
			});

	});


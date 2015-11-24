<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="JopyCopy">
    <meta name="keyword" content="">
    <link rel="shortcut icon" href="img/favicon.png">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet" />
<link type="text/css" href="css/bootstrap-theme.css" rel="stylesheet" />
<link type="text/css" href="css/elegant-icons-style.css" rel="stylesheet" />	
<link type="text/css" href="css/font-awesome.css" rel="stylesheet" />
<link type="text/css" href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<link type="text/css" href="css/widgets.css" rel="stylesheet">
<link type="text/css" href="css/xcharts.min.css" rel=" stylesheet">	
<link type="text/css" href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <!-- full calendar css-->
<link type="text/css" href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
<link type="text/css" href="assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="css/fullcalendar.css">
    <!-- Custom styles -->
<link type="text/css" href="css/style-responsive.css" rel="stylesheet" />
<link type="text/css" href="css/style.css" rel="stylesheet" /> 
	
<!-- 	 easy pie chart-->
<!-- <link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/> -->
<!--     owl carousel -->
<!-- <link rel="stylesheet" href="css/owl.carousel.css" type="text/css"> -->


     <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
<script type="text/javascript">
	<%-- AJAX dokumenti i carinska rjesenja - POCETAK --%>
	// create the XMLHttpRequest object, according browser
	function get_XmlHttp() {
	  // create the variable that will contain the instance of the XMLHttpRequest object (initially with null value)
	  var xmlHttp = null;

	  if(window.XMLHttpRequest) {		// for Forefox, IE7+, Opera, Safari, ...
	    xmlHttp = new XMLHttpRequest();
	  }
	  else if(window.ActiveXObject) {	// for Internet Explorer 5 or 6
	    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	  }

	  return xmlHttp;
	}//END OF get_XmlHttp

	// sends data to a php file, via GET, and displays the received answer
	function ajaxrequest(serverPage, idVoznja, action) {
		
	  var request =  get_XmlHttp();		// call the function for the XMLHttpRequest instance
	  
      
	  // create the URL with data that will be sent to the server (a pair index=value)
	  var  url = serverPage+'?action=' + action + '&idVoznja=' + idVoznja;

	  request.open("POST", url, true);			// define the request
	  request.send(null);		// sends data
	  
	  // Check request status
	  // If the response is received completely, will be transferred to the HTML tag with tagID
	  request.onreadystatechange = function() {
	      //document.getElementById(tagID).innerHTML = request.responseText;  //ISPISUJE U PROZORU, NO NEMA MJESTA
// 	      document.getElementById('context_any').innerHTML = request.responseText; // ISPISUJE ISPRED TABLICE
	      $('#context_any').html(request.responseText);
	      $('#context_any').trigger('CREATE');
	  }
	}//END OF ajaxrequest	
	function ajaxrequest2(serverPage, polaziste, odrediste, action) {
		  
		  var request =  get_XmlHttp();		// call the function for the XMLHttpRequest instance
		  //alert('serverpage=' + serverPage + ', isosobe=' + IDosobe + ', tipoperacije=' + tipoperacije);

		  // create the URL with data that will be sent to the server (a pair index=value)
		  var  url = serverPage + '?action=' + action + '&polaziste=' + polaziste + '&odrediste=' + odrediste ;

		  request.open("POST", url, true);			// define the request
		  request.send(null);		// sends data

		  // Check request status
		  // If the response is received completely, will be transferred to the HTML tag with tagID
		  request.onreadystatechange = function() {
		      //document.getElementById(tagID).innerHTML = request.responseText;  //ISPISUJE U PROZORU, NO NEMA MJESTA
//	 	      document.getElementById('context_any').innerHTML = request.responseText; // ISPISUJE ISPRED TABLICE
		      $('#context_any').html(request.responseText);
		      $('#context_any').trigger('CREATE');
		  }
		}//END OF ajaxrequest	
		
		function ajaxrequest3(serverPage, idVoznja, polazistep, odredistep, nazPrijevoznika, regAutobusa, datumPolaska, vrijemePolaska , trajanjeVoz , action) {
			  
			  var request =  get_XmlHttp();		// call the function for the XMLHttpRequest instance
			  //alert('serverpage=' + serverPage + ', isosobe=' + IDosobe + ', tipoperacije=' + tipoperacije);

			  // create the URL with data that will be sent to the server (a pair index=value)
			  var  url = serverPage + '?action=' + action +'&idVoznja='+ idVoznja +'&nazPrijevoznika=' + nazPrijevoznika + '&polazistep=' + polazistep 
					  + '&odredistep=' + odredistep +'&regAutobusa=' + regAutobusa +'&datumPolaska=' + datumPolaska + '&vrijemePolaska=' + vrijemePolaska +'&trajanjeVoz=' + trajanjeVoz;

			  request.open("POST", url, true);			// define the request
			  request.send(null);		// sends data

			  // Check request status
			  // If the response is received completely, will be transferred to the HTML tag with tagID
			  request.onreadystatechange = function() {
			      //document.getElementById(tagID).innerHTML = request.responseText;  //ISPISUJE U PROZORU, NO NEMA MJESTA
//		 	      document.getElementById('context_any').innerHTML = request.responseText; // ISPISUJE ISPRED TABLICE
			      $('#context_any').html(request.responseText);
			      $('#context_any').trigger('CREATE');
			  }
			}//END OF ajaxrequest	
			
	<%-- <u style="cursor:pointer;" onclick="brisiDivTablica()"> Makni prikaz</u> --%>
	function brisiDivTablica() { 
	    document.getElementById('context_any').innerHTML = ""; // BRISI ELEMENT IZNAD TABLICE
	}//end of brisiDivPremaID
	
	<%--
	<u style="cursor:pointer;" onclick="brisiDivPremaID('context_${zakljucak.zakljucak_id}')"> Makni prikaz</u>
	<div id="context_${zakljucak.zakljucak_id}"></div>
	--%>
	function brisiDivPremaID(elementID) { 
	    document.getElementById(elementID).innerHTML = ""; // BRISI ELEMENT UNUTAR PROZORA
	}//end of brisiDivPremaID

	<%-- AJAX dokumenti i carinska rjesenja - KRAJ --%>
</script>	


<title>Vozni red</title>
</head>
<body>

<div id="container" class="">

<header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
            </div>

            <!--logo start-->
            <a href="pretraga.jsp" class="logo">Vozni <span class="lite">Red</span></a>
            <!--logo end-->

            <div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <ul class="nav top-menu">                    
                    <li>
                        <form class="navbar-form">
                            <input class="form-control" placeholder="Search" type="text">
                        </form>
                    </li>                    
                </ul>
                <!--  search form end -->                
            </div>

            <div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                    
                    <!-- task notificatoin start -->
                    <li id="task_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="icon-task-l"></i>
                            <span class="badge bg-important">6</span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 6 pending letter</p>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Design PSD </div>
                                        <div class="percent">90%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                            <span class="sr-only">90% Complete (success)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">
                                            Project 1
                                        </div>
                                        <div class="percent">30%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                                            <span class="sr-only">30% Complete (warning)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Digital Marketing</div>
                                        <div class="percent">80%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Logo Designing</div>
                                        <div class="percent">78%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%">
                                            <span class="sr-only">78% Complete (danger)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Mobile App</div>
                                        <div class="percent">50%</div>
                                    </div>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar"  role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                            <span class="sr-only">50% Complete</span>
                                        </div>
                                    </div>

                                </a>
                            </li>
                            <li class="external">
                                <a href="#">See All Tasks</a>
                            </li>
                        </ul>
                    </li>
                    <!-- task notificatoin end -->
                    <!-- inbox notificatoin start-->
                    <li id="mail_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-envelope-l"></i>
                            <span class="badge bg-important">5</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="./img/avatar-mini.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Greg  Martin</span>
                                    <span class="time">1 min</span>
                                    </span>
                                    <span class="message">
                                        I really like this admin panel.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="./img/avatar-mini2.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Bob   Mckenzie</span>
                                    <span class="time">5 mins</span>
                                    </span>
                                    <span class="message">
                                     Hi, What is next project plan?
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="./img/avatar-mini3.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Phillip   Park</span>
                                    <span class="time">2 hrs</span>
                                    </span>
                                    <span class="message">
                                        I am like to buy this Admin Template.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="./img/avatar-mini4.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Ray   Munoz</span>
                                    <span class="time">1 day</span>
                                    </span>
                                    <span class="message">
                                        Icon fonts are great.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">See all messages</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox notificatoin end -->
                    <!-- alert notification start-->
                    <li id="alert_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                            <i class="icon-bell-l"></i>
                            <span class="badge bg-important">7</span>
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 4 new notifications</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary"><i class="icon_profile"></i></span> 
                                    Friend Request
                                    <span class="small italic pull-right">5 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-warning"><i class="icon_pin"></i></span>  
                                    John location.
                                    <span class="small italic pull-right">50 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-danger"><i class="icon_book_alt"></i></span> 
                                    Project 3 Completed.
                                    <span class="small italic pull-right">1 hr</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-success"><i class="icon_like"></i></span> 
                                    Mick appreciated your work.
                                    <span class="small italic pull-right"> Today</span>
                                </a>
                            </li>                            
                            <li>
                                <a href="#">See all notifications</a>
                            </li>
                        </ul>
                    </li>
                    <!-- alert notification end-->
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="img/avatar-mini2.jpg">
                            </span>
                            <span class="username">Josip Rebrnjak</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="#"><i class="icon_profile"></i> My Profile</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_mail_alt"></i> My Inbox</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_clock_alt"></i> Timeline</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_chat_alt"></i> Chats</a>
                            </li>
                            <li>
                                <a href="login.html"><i class="icon_key_alt"></i> Log Out</a>
                            </li>
                            <li>
                                <a href="documentation.html"><i class="icon_key_alt"></i> Documentation</a>
                            </li>
                            <li>
                                <a href="documentation.html"><i class="icon_key_alt"></i> Documentation</a>
                            </li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!-- notificatoin dropdown end-->
            </div>
      </header> 
      
 <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="active">
                      <a class="" href="WEB-INF/JSP/pretraga.jsp">
                          <i class="icon_house_alt"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>  
                  
                   <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_documents_alt"></i>
                          <span>Pages</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">                          
                          <li><a class="" href="profile.html">Profile</a></li>
                          <li><a class="" href="login.html"><span>Login Page</span></a></li>
                          <li><a class="" href="blank.html">Blank Page</a></li>
                          <li><a class="" href="404.html">404 Error</a></li>
                      </ul>
                  </li>
            
                  <li>
                 
                 
                  <div class="container">
                    <br>
                   <span id="gcont">PRETRAGA GOOGLE MAPE</span>
                    <br>
                    <br>
<%--                       <form method="post" class="form-group has-primary" action="<%=response.encodeURL(request.getContextPath() + "PrometController") %>" name="frmPretraga">    --%>
    					<label class="control-label" for="polaziste2">Polazište vožnje : </label> 	    
       					 <input type="text" class="form-control" id="polaziste2" name="polaziste2"/>
      
       						 <label class="control-label" for="odrediste2">Odredište vožnje : </label>        
        				 <input type="text" class="form-control" id="odrediste2" name="odrediste2"/> 
       						 <br>
       					 
<!--     				</form> -->
    				<input type="submit" class="btn btn-primary" value="Udaljenost" onclick="distance();" />
    				<br>
    				<input type="submit" class="btn btn-success" value="Ruta" onclick="minDistance();" />
    				<br>
    				<input type="submit" class="btn btn-primary" value="Trans. ruta" onclick="getRoute();" />
    				</div>
    				
                  </li>
                                            
              </ul>
              <!-- sidebar menu end-->
          </div>
 </aside>
<section id="main-content">
    <section class="wrapper">  
    	<div>
        <div class="col-lg-8">
					<div class="panel panel-defaultMap">
						<div class="panel-heading">
							<h2><i class="fa fa-map-marker red"></i><strong>Ispis vožnji</strong></h2>
							
							<div class="panel-actions">
								<a href="#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
								<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
							</div>
								
						</div>
						<div class="panel panel-ispis" id="ispis">
							
							<div id="context_any"></div>	
							
						</div>
	
					</div>
				</div>
				</div>
				
	<div class="col-lg-4">	
		<strong id="PZV">PRETRAGA ZAKAZANIH VOŽNJI</strong>
		<br>	
		<br>	
<%--    	 <form method="post" class="form-group has-primary" action="<%=response.encodeURL(request.getContextPath() + "/PrometController") %>" name="frmPretraga">    --%>
    	<label class="control-label" for="inputSuccess1">Polazište vožnje : </label>   	    
        <input type="text" class="form-control" id="polaziste" name="polaziste"/>
        <br> 
        <br>
        <label class="control-label" for="inputSuccess2">Odredište vožnje : </label>        
        <input type="text" class="form-control" id="odrediste" name="odrediste"/> 
        <br>
        <button class="btn btn-primary" onclick="ajaxrequest2('<%=response.encodeURL(request.getContextPath() + "/PrometController") %>', $('#polaziste').val(), $('#odrediste').val() , 'pretraga' )">Pretraži</button>
<!--      </form>  -->
    <br>
    <br>
    <form action="LogoutServlet" method="post">
    <input type="submit" class="btn btn-info" value="Logout" >
    </form>
    <br>
    <button class="btn btn-info" onclick="ajaxrequest('<%=response.encodeURL(request.getContextPath() + "/PrometController") %>', '', '' )">Ispis vožnji</button>
    <p><a href="PrometController?action=signUp">Ako nemate svoj account, ovdje ga napravite.</a></p>
    </div>
    		 <div>
             <div class="col-md-6 portlets">
					<div class="panel panel-defaultMap">
						<div class="panel-heading">
							<h2><i class="fa fa-map-marker red"></i><strong>Mapa vožnji</strong></h2>
							<div class="panel-actions">
								<a href="#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
								<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
							</div>	
						</div>
						<div class="panel-body-map">
							<div id="map"></div>	
						</div>
	                 <div id="ispisRez"></div>
					</div>
				</div>
				</div>
			
				
	<div class="col-md-6 portlets">
          <div class="panel panel-default">
				<div class="panel-heading">
                  <h2><strong>Calendar</strong></h2>
				<div class="panel-actions">
                    <a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="fa fa-times"></i></a>
                </div>  
                 
                </div><br><br><br>
                <div class="panel-body">
                  <!-- Widget content -->
                  
                    <!-- Below line produces calendar. I am using FullCalendar plugin. -->
                    <div id="calendar"></div>
                  
         	 </div>
   	 </div> 
	</div> 						
	
    </div>
  </section>
</section>
 




<!-- javascripts -->
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.10.4.min.js"></script>

<script type="text/javascript" src="scripts/jquery-ui-1.9.2.custom.min.js"></script>

<!-- bootstrap --> 
<script type="text/javascript" src="scripts/bootstrap.min.js"></script> 
<!-- nice scroll -->
<script type="text/javascript" src="scripts/jquery.scrollTo.min.js"></script>
<script type="text/javascript" src="scripts/jquery.nicescroll.js" type="text/javascript"></script>

<!-- charts scripts -->
<script type="text/javascript" src="assets/jquery-knob/js/jquery.knob.js"></script>
<script type="text/javascript" src="scripts/jquery.sparkline.js" type="text/javascript"></script>
<!--scripts arent included, cause i dont use them yet...-->
<!-- charts scripts -->
<!--     <script type="text/javascript" src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script> -->
<!--     <script type="text/javascript" src="scripts/owl.carousel.js" ></script> -->

<!-- Full Google Calendar - Calendar -->
<script type="text/javascript" src="scripts/fullcalendar.min.js"></script> 
<script type="text/javascript" src="assets/fullcalendar/fullcalendar/fullcalendar.js"></script>

<!--script for this page only-->
<script type="text/javascript" src="scripts/calendar-custom.js"></script>
<script type="text/javascript" src="scripts/jquery.rateit.min.js"></script>

<!-- custom select -->
<script type="text/javascript" src="scripts/jquery.customSelect.min.js" ></script>
<script type="text/javascript" src="assets/chart-master/Chart.js"></script>

  <!--custome script for all pages-->
<script type="text/javascript" src="scripts/scripts.js"></script>	    

 <!-- custom script for this page-->

<script type="text/javascript" src="scripts/sparkline-chart.js"></script>
<!-- <script type="text/javascript" src="scripts/easy-pie-chart.js"></script> -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript" src="assets/gmap3-6.0.0/gmap3.min.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>
<script type="text/javascript" src="scripts/xcharts.min.js"></script>
<script type="text/javascript" src="scripts/jquery.autosize.min.js"></script>
<script type="text/javascript" src="scripts/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="scripts/gdp-data.js"></script>	
<script type="text/javascript" src="scripts/morris.min.js"></script>
<script type="text/javascript" src="scripts/sparklines.js"></script>	
<script type="text/javascript" src="scripts/charts.js"></script>
<script type="text/javascript" src="scripts/jquery.slimscroll.min.js"></script>

<script>
      //knob
      $(function() {
        $(".knob").knob({
          'draw' : function () { 
            $(this.i).val(this.cv + '%')
          }
        })
      });

      //carousel
//       $(document).ready(function() {
//           $("#owl-slider").owlCarousel({
//               navigation : true,
//               slideSpeed : 300,
//               paginationSpeed : 400,
//               singleItem : true

//           });
//       });

      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });
	  



</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-55234356-2', 'auto');
  ga('send', 'pageview');

</script>
  
</body>
</html>
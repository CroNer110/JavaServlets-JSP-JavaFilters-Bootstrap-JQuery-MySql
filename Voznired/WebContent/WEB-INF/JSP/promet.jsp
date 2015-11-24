<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="css/bootstrap-theme.css" rel="stylesheet" />
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet" />
<link type="text/css" href="css/jquery-ui-1.10.4.min.css" rel="stylesheet" />
<link type="text/css" href="css/style.css" rel="stylesheet" />
<link type="text/css" href="css/font-awesome.css" rel="stylesheet" />
<title>Dodavanje nove vožnje</title>
</head>
<body>
 <div class="container">
    <div class="content">
    <script>
        $(function() {
            $('input[name=datumPolaska]').datepicker();
        });
    </script>
     <br />
<%--     <form method="POST" class="form-group has-success" action="<%=response.encodeURL(request.getContextPath() + "/PrometController") %>" name="frmAddVoznja"> --%>
        ID vožnje : 
        <input type="text" readonly="readonly" name="idVoznja" id="idVoznja"
            value="<c:out value="${promet.idVoznja}" />" /> <br /> 
        Odredište vožnje : 
        <input type="text" name="odredistep" id="odredistep"
            value="<c:out value="${promet.odrediste}" />" /> <br />     
        Polazište vožnje : 
        <input type="text" name="polazistep" id="polazistep"
            value="<c:out value="${promet.polaziste}" />" /> <br />      
        Naziv autoprijevoznika : 
        <input type="text" name="nazPrijevoznika" id="nazPrijevoznika"
            value="<c:out value="${promet.nazPrijevoznika}" />" /> <br /> 
        Registracija vozila : 
        <input type="text" name="regAutobusa" id="regAutobusa"
            value="<c:out value="${promet.regAutobusa}" />" /> <br /> 
        Datum polaska : 
        <input type="text" name="datumPolaska" id="datumPolaska"
            value="<fmt:formatDate pattern="yyyy-MM-dd" value="${promet.datumPolaska}" />" /> <br /> 
        Vrijeme polaska :
        <input type="text" name="vrijemePolaska" id="vrijemePolaska"
            value="<c:out value="${promet.vrijemePolaska}" />" /> <br />   
		Trajanje vožnje : 
        <input type="text" name="trajanjeVoz" id="trajanjeVoz"
             value="<c:out value="${promet.trajanjeVoz}" />" /> <br />   
       	<button class="btn btn-info" onclick="ajaxrequest3('<%=response.encodeURL(request.getContextPath() + "/PrometController") %>', $('#idVoznja').val(), $('#polazistep').val() , $('#odredistep').val(), $('#nazPrijevoznika').val(), $('#regAutobusa').val() , $('#datumPolaska').val(), $('#vrijemePolaska').val(), $('#trajanjeVoz').val() ,'zapis' )">Unos</button>
       	
<!--     </form> -->
    </div>
    </div>
</body>
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="scripts/bootstrap.min.js"></script>
</html>
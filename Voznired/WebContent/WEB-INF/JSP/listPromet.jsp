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
<title>Prikaz svih vožnji</title>
</head>
<body>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>ID vožnje</th>
                <th>Odredište vožnje</th>
                <th>Polazište vožnje</th>
                <th>Naziv autoprijevoznika</th>
                <th>Registracija vozila</th>
                <th>Datum polaska</th>  
                <th>Vrijeme polaska</th>  
                <th>Trajanje vožnje</th>            
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${prometl}" var="promet">
                <tr>
                    <td><c:out value="${promet.idVoznja}" /></td>
                    <td><c:out value="${promet.odrediste}" /></td>
                     <td><c:out value="${promet.polaziste}" /></td>
                    <td><c:out value="${promet.nazPrijevoznika}" /></td>
                    <td><c:out value="${promet.regAutobusa}" /></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${promet.datumPolaska}" /></td>
                    <td><c:out value="${promet.vrijemePolaska}" /></td>
                    <td><c:out value="${promet.trajanjeVoz}" /></td>
                    <td><button onclick="ajaxrequest('<%=response.encodeURL(request.getContextPath() + "/PrometController") %>', '${promet.idVoznja}', 'edit') ">Update</button></td>
                    <td><button onclick="ajaxrequest('<%=response.encodeURL(request.getContextPath() + "/PrometController") %>', '${promet.idVoznja}', 'delete') ">Delete</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="scripts/bootstrap.min.js"></script>

</html>
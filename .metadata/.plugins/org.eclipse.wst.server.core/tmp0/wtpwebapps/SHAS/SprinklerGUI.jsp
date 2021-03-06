<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  
<title>Sprinkler GUI page</title>

<link rel="stylesheet" type="text/css"
	href="css/ui-lightness/jquery-ui-1.10.1.custom.css" />
<link rel="stylesheet" type="text/css"
	href="css/ui-lightness/jquery-ui-1.10.1.custom.min.css" />
<link rel="stylesheet" type="text/css" href="css/timepicker.css" />

<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.1.custom.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript" src="js/timepicker.js"></script>

<script>



	$(document).ready(function() {
		$(function() {
			$('#selectedDateTime').datetimepicker();
		});
		$(function() {
			$('#fromDate').datetimepicker({
				dateFormat : 'yy-mm-dd'

			});
		});
		$(function() {
			$('#toDate').datetimepicker({
				dateFormat : 'yy-mm-dd'

			});
		});
		$(function() {
			$('#overridefromDate').datetimepicker({
				dateFormat : 'yy-mm-dd'

			});
		});
		$(function() {
			$('#overrideToDate').datetimepicker({
				dateFormat : 'yy-mm-dd'

			});
		});
		$(function() {
			$('#shutFromDate').datetimepicker({
				dateFormat : 'yy-mm-dd'

			});
		});
		$(function() {
			$('#shutToDate').datetimepicker({
				dateFormat : 'yy-mm-dd'

			});
		});

	});

	function clickschedule() {
		document.sprinklerform.btnSchedule.value = "Sprinkler Off";
		//sprinklerform.submit();
	}
</script>

</head>
<body>
<form name="sprinklerform" action="SprinklerServlet" method="post"><br>
<%
System.out.println("in scripletttttttttttttttttt");
	String btnScheduleValue;
	boolean ten = false;
	boolean twenty = false;
	boolean thirty = false;
	boolean forty = false;
	boolean fifty = false;
	boolean sixty = false;
	boolean seventy = false;
	boolean eighty = false;
	boolean ninety = false;
	boolean hundred = false;

	boolean minfifteen = false;
	boolean minthirty = false;
	boolean minfortyfive = false;
	boolean minsixty = false;

	System.out.println("in scriplet");
	if (request.getAttribute("schedulerstatus") == null) {
		btnScheduleValue = "Scheduler On";

	} else {

		btnScheduleValue = (String) request
				.getAttribute("schedulerstatus");

	}

	String selectedFromdate = (String) request
			.getAttribute("cfromDate");
	String selectedTodate = (String) request.getAttribute("ctoDate");
	if (selectedFromdate == null) {
		selectedFromdate = "";
	}
	if (selectedTodate == null) {
		selectedTodate = "";
	}

	//------------ for setting field values ----------------------------//
	System.out.println("beforen switch");

	String electedlevel = (String) request.getAttribute("clevel");
	if (electedlevel == null)
		electedlevel = "10";
	switch (Integer.parseInt(electedlevel)) {
	case 10:
		ten = true;
		System.out.println("in ten");
		break;
	case 20:
		twenty = true;
		System.out.println("in twenty");
		break;
	case 30:
		thirty = true;
		break;
	case 40:
		forty = true;
		break;
	case 50:
		fifty = true;
		break;
	case 60:
		sixty = true;
		break;
	case 70:
		seventy = true;
		break;
	case 80:
		eighty = true;
		break;
	case 90:
		ninety = true;
		break;
	case 100:
		hundred = true;
		System.out.println("in hindred");
		break;
	default:
		ten = true;
		break;
	}

	//-------maintain duration list ---------------------------------//
	String selectedDuration = (String) request
			.getAttribute("cduration");
	if (selectedDuration == null)
		selectedDuration = "15";
	switch (Integer.parseInt(selectedDuration)) {
	case 15:
		minfifteen = true;
		break;
	case 30:
		minthirty = true;
		System.out.println("in twenty");
		break;
	case 45:
		minfortyfive = true;
		break;
	case 60:
		minsixty = true;
		break;
	default:
		minfifteen = true;
		break;
	}

	System.out.println("outn switch");
%>





<table border="5" width="100%">
	<tr>
		<td colspan="6" align="center"><%@ include
			file="/WEB-INF/header.jsp"%></td>
	</tr>
</table>


<table width="100%" border="4" cellspacing="0" cellpadding="0">
	<tr>

		<td colspan="6">
		<h3>Sprinkler</h3>
		</td>
	<tr>
		<td>
		<table border="2">
			<tr height="60px">
				<td colspan="6">Default Setting:</td>
			</tr>
			<tr>
				<td>From Date :</td>
				<td><input type="text" id="fromDate" name="fromDate"
					value="<%=selectedFromdate%>" /></td>
				<td>To Date :</td>
				<td><input type="text" id="toDate" name="toDate"
					value="<%=selectedTodate%>" /></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Sprinkler Level</td>
				<td><select name="level">
					<option value="10" <%if (ten == true) {%> selected="selected" <%}%>>10%</option>
					<option value="20" <%if (twenty == true) {%> selected="selected"
						<%}%>>20%</option>
					<option value="30" <%if (thirty == true) {%> selected="selected"
						<%}%>>30%</option>
					<option value="40" <%if (forty == true) {%> selected="selected"
						<%}%>>40%</option>
					<option value="50" <%if (fifty == true) {%> selected="selected"
						<%}%>>50%</option>
					<option value="60" <%if (sixty == true) {%> selected="selected"
						<%}%>>60%</option>
					<option value="70" <%if (seventy == true) {%> selected="selected"
						<%}%>>70%</option>
					<option value="80" <%if (eighty == true) {%> selected="selected"
						<%}%>>80%</option>
					<option value="90" <%if (ninety == true) {%> selected="selected"
						<%}%>>90%</option>
					<option value="100" <%if (hundred == true) {%> selected="selected"
						<%}%>>100%</option>
				</select></td>
				<td>Duration</td>
				<td><select name="duration">
					<option value="15" <%if (minfifteen == true) {%>
						selected="selected" <%}%>>15 Min</option>
					<option value="30" <%if (minthirty == true) {%> selected="selected"
						<%}%>>30 Min</option>
					<option value="45" <%if (minfortyfive == true) {%>
						selected="selected" <%}%>>45 Min</option>
					<option value="60" <%if (minsixty == true) {%> selected="selected"
						<%}%>>60 Min</option>
				</select></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td><input type="submit" id="btnSchedule" name="btnSchedule"
					value="<%=btnScheduleValue%>" /></td>
			<tr>
		</table>
		</td>
	</tr>
	
	<tr>
		<td>
		<table border="2">
			<tr>
				<td colspan=6">Schedule Override:</td>

			</tr>
			<tr>
				<td>From Date :</td>
				<td><input type="text" id="overridefromDate"
					name="overridefromDate" /></td>
				<td>To Date :</td>
				<td><input type="text" id="overrideToDate"
					name="overrideToDate" /></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Sprinkler Level</td>
				<td><select name="overrideLevel">
					<option value="10">10%</option>
					<option value="20">20%</option>
					<option value="30">30%</option>
					<option value="40">40%</option>
					<option value="50">50%</option>
					<option value="60">60%</option>
					<option value="70">70%</option>
					<option value="80">80%</option>
					<option value="90">90%</option>
					<option value="100">100%</option>
				</select></td>
				<td>Duration</td>
				<td><select name="overrideDuration">
					<option value="10">15 Min</option>
					<option value="30">30 Min</option>
					<option value="40">45 Min</option>
					<option value="60">60 Min</option>
					<option value="75">1 hr 15 Min</option>
					<option value="90">1 hr 30 Min</option>
				</select></td>
				<td>Recur:<input type="checkbox" name="chkRecur"
					name="chkRecur" checked="checked"></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="submit" name="btnApplyOverride"
					value="Override On" /></td>

			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
		<table border="2">
			<tr>
				<td colspan="6">Maintenance Shutdown Setting:</td>

			</tr>
			<tr>
				<td>From Date :</td>
				<td><input type="text" id="shutFromDate" name="shutFromDate" /></td>
				<td>To Date :</td>
				<td><input type="text" id="shutToDate" name="shutToDate" /></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="submit" name="btnApplyMaintenance"
					value="Maintenance On" /></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
		</table>
		</td>
	</tr>
</table>


<table>
	<tr>
		<td colspan="6" align="center"><%@ include file="footer.jsp"%></td>
	</tr>
</table>




</form>
</body>
</html>
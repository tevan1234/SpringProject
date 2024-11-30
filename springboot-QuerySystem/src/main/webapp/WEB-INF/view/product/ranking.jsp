<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product Ranking</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
			google.charts.load('current', {'packages':['corechart']});
	      	google.charts.setOnLoadCallback(drawChart);
	      	google.charts.setOnLoadCallback(drawChart2);
	      	google.charts.setOnLoadCallback(drawChart3);
	      	function drawChart() {
				var data = google.visualization.arrayToDataTable([
					['Type', 'total'],
			          
			          <c:forEach var="entry" items="${ranking}">
			          	['${entry.key}', ${entry.value}],
			          </c:forEach>
			          
			    ]);			
	      	
		      	var options = {
		  	          title: 'Sales Ranking'
		  	    };
		      	
		      	var chart = new google.visualization.ColumnChart(document.getElementById('piechart1'));	      	
		      	chart.draw(data, options);		      	
	      	}
	      	function drawChart2() {
				var data = google.visualization.arrayToDataTable([
					['Type', 'total'],
			          
			          <c:forEach var="entry" items="${ranking}">
			          	['${entry.key}', ${entry.value}],
			          </c:forEach>
			          
			    ]);			
	      	
		      	var options = {
		  	          title: 'Sales Ranking'
		  	    };
		      	
		      	var chart = new google.visualization.PieChart(document.getElementById('piechart2'));	      	
		      	chart.draw(data, options);		      	
	      	}
	      	function show1() {
	      		document.getElementById("piechart1").style.display = "block";
	      		document.getElementById("piechart2").style.visibility = "hidden";
			}
	      	function show2() {
	      		document.getElementById("piechart1").style.display = "none";
	      		document.getElementById("piechart2").style.visibility = "visible";
			}
		</script>
	</head>
	<body style="background-color: #f4e500 ;">
		<%@ include file="/WEB-INF/view/menu.jsp" %>
		<div class="pure-form" style="padding: 15px;">
			<fieldset>
				<legend><strong>銷售排行</strong></legend>
				<button id="btn1" onclick="show1()" class="pure-button pure-button-primary">柱狀圖</button>
				<button id="btn2" onclick="show2()" class="pure-button pure-button-primary">圓餅圖</button><p/>
				<!-- ${ ranking } -->
				<div id="piechart1" style="width: 800px; height: 500px;display: block;"></div><p/>
				<div id="piechart2" style="width: 800px; height: 500px;visibility: hidden;"></div><p/>
			</fieldset>
		</div>
	</body>
</html>
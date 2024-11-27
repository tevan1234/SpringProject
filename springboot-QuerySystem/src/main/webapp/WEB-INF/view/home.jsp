<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>保險資訊</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            margin: 0;
	            padding: 0;
	            background-color: #f4f4f4;
	        }	        
	        .container {
	        	
	            display: grid;
	            grid-template-columns: repeat(3, 1fr);
	            gap: 20px;
	            padding: 20px;
	        }
	        .card {
	            background: white;
	            border-radius: 5px;
	            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	            overflow: hidden;
	            text-align: center;
	            padding: 15px;
	        }
	        .card img {
	            width: 100%;
	            height: 50%;
	        }
	        footer {
	            text-align: center;
	            padding: 10px;
	            background: #007bff;
	            color: white;
	            position: fixed;
	            bottom: 0;
	            width: 100%;
	        }
	    </style>
	</head>
	<body style="background-color: #f4e500">
	    <%@ include file="/WEB-INF/view/menu.jsp" %>
	
	    <div class="container">
	        <div class="card" id="home">
	            <h2>保險的重要性</h2>
	            <img src="image/5.jpg" alt="保險的重要性">
	            <p style="text-align: justify">保險在現代生活中扮演著不可或缺的角色，其主要目的在於分散風險並提供經濟保障。</p>
	        </div>
	
	        <div class="card" id="about">
	            <h2>關於我們</h2>
	            <img src="image/2.jpg" alt="關於我們">
	            <p style="text-align: justify">我們是一家專注於提供全方位保險解決方案的保險公司，致力於為客戶的生活、財產及健康提供最堅實的保障。</p>
	        </div>
	
	        <div class="card" id="services">
	            <h2>關於保險</h2>
	            <img src="image/3.jpg" alt="關於保險">
	            <p style="text-align: justify">保險不僅是風險管理的工具，還可以是有效的理財選擇。壽險中的終身壽險和投資型保險產品在保單持有期間會累積現金價值。</p>           
	        </div>
	    </div>
	
	    <footer>
	        <h2>聯絡我們</h2>
	        <p>電話: 123-456-7890</p>
	        <p>電子郵件: info@insurance.com</p>
	    </footer>
	</body>
</html>
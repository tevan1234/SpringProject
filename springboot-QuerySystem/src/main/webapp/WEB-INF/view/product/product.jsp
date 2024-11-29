<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>保險類別</title>
    <style>
        /* Reset and basic styles */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f9f9f9; }

        /* Tab Navigation */
        .tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .tab {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            background-color: #e8f0ff;
            color: #007bff;
            font-size: 16px;
            cursor: pointer;
            border-radius: 25px;
            transition: background-color 0.3s ease;
        }
        .tab.active {
            background-color: #007bff;
            color: #fff;
        }
        
        /* Cards Container */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        /* Card Styling */
        .card {
            background-color: #fff;
            width: 300px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 20px;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card img {
            width: 80px;
            height: 80px;
            margin-bottom: 15px;
            margin-left: auto;
            margin-right: auto;
        }
        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .card-description {
            font-size: 14px;
            color: #666;
            margin-bottom: 15px;
        }
        .card-button {
            background-color: #ff6b6b;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .card-button:hover {
            background-color: #ff4757;
        }
    </style>
</head>
<body style="background-color: #f4e500">
	<%@ include file="/WEB-INF/view/menu.jsp" %>
    <!-- Tabs Navigation -->
    <div class="tabs" style="padding: 15px" >
        <button class="tab active" onclick="printAll()">全部</button>
        <button class="tab" onclick="print1()">汽車險</button>
        <button class="tab" onclick="print2()">旅平險</button>
        <button class="tab" onclick="print3()">重大傷病險</button>
        <button class="tab" onclick="print4()">意外險</button>
        <button class="tab" onclick="print5()">天災險</button>
        <button class="tab" onclick="print6()">儲蓄險</button>
    </div>
    
	<script>
		function printAll() {
			 document.getElementById("1").style.display = "block";
			 document.getElementById("2").style.display = "block";
			 document.getElementById("3").style.display = "block";
			 document.getElementById("4").style.display = "block";
			 document.getElementById("5").style.display = "block";
			 document.getElementById("6").style.display = "block";
		}
		function print1() {
			 document.getElementById("1").style.display = "block";
			 document.getElementById("2").style.display = "none";
			 document.getElementById("3").style.display = "none";
			 document.getElementById("4").style.display = "none";
			 document.getElementById("5").style.display = "none";
			 document.getElementById("6").style.display = "none";
		}
		function print2() {
			 document.getElementById("1").style.display = "none";
			 document.getElementById("2").style.display = "block";
			 document.getElementById("3").style.display = "none";
			 document.getElementById("4").style.display = "none";
			 document.getElementById("5").style.display = "none";
			 document.getElementById("6").style.display = "none";
		}
		function print3() {
			 document.getElementById("1").style.display = "none";
			 document.getElementById("2").style.display = "none";
			 document.getElementById("3").style.display = "block";
			 document.getElementById("4").style.display = "none";
			 document.getElementById("5").style.display = "none";
			 document.getElementById("6").style.display = "none";
		}
		function print4() {
			 document.getElementById("1").style.display = "none";
			 document.getElementById("2").style.display = "none";
			 document.getElementById("3").style.display = "none";
			 document.getElementById("4").style.display = "block";
			 document.getElementById("5").style.display = "none";
			 document.getElementById("6").style.display = "none";
		}
		function print5() {
			 document.getElementById("1").style.display = "none";
			 document.getElementById("2").style.display = "none";
			 document.getElementById("3").style.display = "none";
			 document.getElementById("4").style.display = "none";
			 document.getElementById("5").style.display = "block";
			 document.getElementById("6").style.display = "none";
		}
		function print6() {
			 document.getElementById("1").style.display = "none";
			 document.getElementById("2").style.display = "none";
			 document.getElementById("3").style.display = "none";
			 document.getElementById("4").style.display = "none";
			 document.getElementById("5").style.display = "none";
			 document.getElementById("6").style.display = "block";
		}
	</script>
	
    <!-- Card Container -->
    <div class="card-container">
        <!-- Card 1 -->
        <div class="card" id=1>
            <img src="image/p1.jpg" alt="汽車險">
            <div class="card-title">汽車險</div>
            <div class="card-description">強制險2年期還更優惠!</div>
            <button class="card-button">了解更多</button>
        </div>

        <!-- Card 2 -->
        <div class="card" id=2>
            <img src="image/p2.jpg" alt="旅平險">
            <div class="card-title">旅平險</div>
            <div class="card-description">快速秒懂各險種組合保障!</div>
            <button class="card-button">了解更多</button>
        </div>

        <!-- Card 3 -->
        <div class="card" id=3>
            <img src="image/p3.jpg" alt="重大傷病險">
            <div class="card-title">重大傷病險</div>
            <div class="card-description">別跟荷包過不去，補救方法看過來！</div>
            <button class="card-button">了解更多</button>
        </div>

        <!-- Card 4 -->
        <div class="card" id=4>
            <img src="image/p4.jpg" alt="意外險">
            <div class="card-title">意外險</div>
            <div class="card-description">3方案推薦 讓你輕鬆保險煩惱!</div>
            <button class="card-button">了解更多</button>
        </div>

        <!-- Card 5 -->
        <div class="card" id=5>
            <img src="image/p5.jpg" alt="天災險">
            <div class="card-title">天災險</div>
            <div class="card-description">受夠淹水及颱風，不要再當冤大頭!</div>
            <button class="card-button">了解更多</button>
        </div>

        <!-- Card 6 -->
        <div class="card" id=6>
            <img src="image/p6.jpg" alt="Supercar Coverage">
            <div class="card-title">儲蓄險</div>
            <div class="card-description">買保險還能夠存錢!</div>
            <button class="card-button">了解更多</button>
        </div>
    </div>
</body>
</html>
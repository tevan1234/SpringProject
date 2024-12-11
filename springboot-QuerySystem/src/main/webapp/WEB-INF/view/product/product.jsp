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
        
        /* Popup Overlay */
        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        /* Popup Content */
        .popup-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .popup-close {
            background-color: red;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }
    </style>
</head>
<body style="background-color: #f4e500">
	<%@ include file="/WEB-INF/view/menu.jsp" %>
    <!-- Tabs Navigation -->
    <div class="tabs" style="padding: 15px" >
        <button class="tab active" onclick="printAll()">全部</button>
        <button id="11" class="tab" onclick="print(id)">汽車險</button>
        <button id="12" class="tab" onclick="print(id)">旅平險</button>
        <button id="13" class="tab" onclick="print(id)">重大傷病險</button>
        <button id="14" class="tab" onclick="print(id)">意外險</button>
        <button id="15" class="tab" onclick="print(id)">天災險</button>
        <button id="16" class="tab" onclick="print(id)">儲蓄險</button>
    </div>
    
	<script>
		function printAll() {
			for (let i = 1; i <= 6; i++) {
             	document.getElementById(i).style.display = "block" ;                
            }			 
		}
		function print(id) {
			for (let i = 1; i <= 6; i++) {
             	if(i == (id-10))
                	document.getElementById(i).style.display = "block" ;
                else
                	document.getElementById(i).style.display = "none";
            }
		}
		function showPopup(title, description) {
	        document.getElementById("popup-title").innerText = title;
	        document.getElementById("popup-description").innerText = description;
	        document.getElementById("popup").style.display = "block";
	    }

	    function closePopup() {
	        document.getElementById("popup").style.display = "none";
	    }

	    // Close popup when clicking outside the content
	    document.getElementById("popup").addEventListener("click", function (e) {
	    	if (e.target === this) closePopup();
	    });
	</script>
	
    <!-- Card Container -->
    <div class="card-container">
        <!-- Card 1 -->
        <div class="card" id=1>
            <img src="image/p1.jpg" alt="汽車險">
            <div class="card-title">汽車險</div>
            <div class="card-description">強制險2年期還更優惠!</div>
            <button class="card-button" onclick="showPopup('汽車險', '專為汽車車主設計的保險，涵蓋車輛在事故中可能產生的損失與責任，包括車體損壞、第三方責任及駕駛人意外保障等。根據需求，可選擇強制險、第三責任險或全險，提供全面保障。同時，長期方案如2年期保單更具優惠，讓您安心駕駛，減少經濟負擔。')">了解更多</button>
        </div>

        <!-- Card 2 -->
        <div class="card" id=2>
            <img src="image/p2.jpg" alt="旅平險">
            <div class="card-title">旅平險</div>
            <div class="card-description">快速秒懂各險種組合保障!</div>
            <button class="card-button" onclick="showPopup('旅平險','專為旅客設計的保險，涵蓋旅途中可能發生的意外風險，包括意外身故、醫療費用、行李遺失及旅程延誤等保障。根據需求，可選擇單次旅程或全年保障計劃，提供靈活的保障選項。讓您在旅途中安心無憂，減少突發狀況帶來的經濟負擔與壓力。')">了解更多</button>
        </div>

        <!-- Card 3 -->
        <div class="card" id=3>
            <img src="image/p3.jpg" alt="重大傷病險">
            <div class="card-title">重大傷病險</div>
            <div class="card-description">別跟荷包過不去，補救方法看過來！</div>
            <button class="card-button" onclick="showPopup('重大傷病險','針對特定重大疾病與傷病提供保障的保險，涵蓋罹患癌症、中風、心肌梗塞等重大疾病或遭遇重大傷害時的醫療與經濟需求。此險種通常提供一次性理賠金，幫助被保人支付高額醫療費用、康復開銷或日常生活支出，減輕財務壓力。適合希望為自身健康提供額外保障的個人或家庭，確保重大健康事件時安心應對。')">了解更多</button>
        </div>

        <!-- Card 4 -->
        <div class="card" id=4>
            <img src="image/p4.jpg" alt="意外險">
            <div class="card-title">意外險</div>
            <div class="card-description">3方案推薦 讓你輕鬆保險煩惱!</div>
            <button class="card-button" onclick="showPopup('意外險','針對突發意外事件提供保障的保險，涵蓋意外導致的身故、失能、燒燙傷、住院醫療等費用。此險種範圍廣泛，包括交通事故、運動傷害或其他意外事故，並可依需求選擇不同保障項目。保費相對低廉，但能在關鍵時刻提供即時的經濟支持，減輕個人或家庭的財務壓力，是日常生活中不可或缺的風險管理工具。')">了解更多</button>
        </div>

        <!-- Card 5 -->
        <div class="card" id=5>
            <img src="image/p5.jpg" alt="天災險">
            <div class="card-title">天災險</div>
            <div class="card-description">受夠淹水及颱風，不要再當冤大頭!</div>
            <button class="card-button" onclick="showPopup('天災險','專為應對自然災害所設計的保險，涵蓋因颱風、地震、洪水、火山爆發等災害導致的財物損失。它提供修繕或重建的經濟支援，有效減輕災後的財務壓力。適用於個人住宅、商業建築及其他資產，保障範圍靈活可選，是為應對不可抗力風險的重要防護措施，助您安心度過難關。')">了解更多</button>
        </div>

        <!-- Card 6 -->
        <div class="card" id=6>
            <img src="image/p6.jpg" alt="Supercar Coverage">
            <div class="card-title">儲蓄險</div>
            <div class="card-description">買保險還能夠存錢!</div>
            <button class="card-button" onclick="showPopup('儲蓄險','兼具保障與理財功能的保險，透過定期繳納保費累積資金，提供穩定的儲蓄收益。同時，儲蓄險還包含壽險保障，確保在被保人發生意外或身故時提供經濟支援。適合有理財需求且希望兼顧家庭保障的人士，是一種穩健、安全的長期財務規劃工具，幫助實現教育金、退休金等目標。')">了解更多</button>
        </div>
        
        <!-- Popup Overlay -->
	    <div class="popup-overlay" id="popup">
	        <div class="popup-content">
	            <button class="popup-close" onclick="closePopup()">&times;</button>
	            <h2 id="popup-title">Title</h2>
	            <p id="popup-description">Description</p>
	        </div>
	    </div>
	    
    </div>
</body>
</html>
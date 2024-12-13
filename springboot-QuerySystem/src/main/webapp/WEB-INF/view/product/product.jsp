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
                
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 600px;
            max-height: 90%; /* 限制最大高度 */
    		overflow-y: auto; /* 啟用垂直滾動條 */
            z-index: 1000;
        }
        .popup h1 {
            text-align: center;
            color: #4CAF50;
        }
        .popup .section {
            margin-bottom: 20px;
        }
        .popup .section h2 {
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 5px;
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        .show {
            display: block;
        }
        .close-btn {
            display: block;
            margin: 20px auto 0;
            padding: 10px 20px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }
        .close-btn:hover {
            background: #45a049;
        }
        .open-btn {
            padding: 10px 20px;
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }
        .open-btn:hover {
            background: #45a049;
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
	    
	    function openPopup(title,age,sp1,sp2,sp3,item,type,time,limit) {
            document.querySelector('.popup').classList.add('show');
            document.querySelector('.overlay').classList.add('show');
            document.getElementById("title").innerText = title;
            document.getElementById("age").innerText = age;
            document.getElementById("sp1").innerText = sp1;
            document.getElementById("sp2").innerText = sp2;
            document.getElementById("sp3").innerText = sp3;
            document.getElementById("item").innerText = item;
            document.getElementById("type").innerText = type;
            document.getElementById("time").innerText = time;
            document.getElementById("limit").innerText = limit;
        }

        function closePopup() {
            document.querySelector('.popup').classList.remove('show');
            document.querySelector('.overlay').classList.remove('show');
        }

	</script>
	
    <!-- Card Container -->
    <div class="card-container">
        <!-- Card 1 -->
        <div class="card" id=1>
            <img src="image/p1.jpg" alt="汽車險">
            <div class="card-title">汽車險</div>
            <div class="card-description">強制險2年期還更優惠!</div>
            <button class="card-button" onclick="openPopup('汽車險','18歲以上，並且需持有有效駕照者。','多元保障內容','高額賠償保障','附加服務多元化','車輛損失補償、道路救援服務、租車補助','躉繳、分期','一年期','車齡及使用目的限制 : 針對高齡車輛、營業車輛需加收保費')">了解更多</button>
        </div>		
			
        <!-- Card 2 -->
        <div class="card" id=2>
            <img src="image/p2.jpg" alt="旅平險">
            <div class="card-title">旅平險</div>
            <div class="card-description">快速秒懂各險種組合保障!</div>
            <button class="card-button" onclick="openPopup('旅平險','0歲~99歲','意外事故保障','高額賠償保障','醫療費用補償','旅行相關保障','躉繳','國內旅遊投保期間上限為30天，國外旅遊投保期間上限180天','國外旅遊團體最高限額得為 200 萬元')">了解更多</button>
        </div>

        <!-- Card 3 -->
        <div class="card" id=3>
            <img src="image/p3.jpg" alt="重大傷病險">
            <div class="card-title">重大傷病險</div>
            <div class="card-description">別跟荷包過不去，補救方法看過來！</div>
            <button class="card-button" onclick="openPopup('重大傷病險','21歲~60歲','多元保障內容','提供全面保障','高額保險金給付','醫療與復健費用補償','年繳','5年期','限50萬元')">了解更多</button>
        </div>

        <!-- Card 4 -->
        <div class="card" id=4>
            <img src="image/p4.jpg" alt="意外險">
            <div class="card-title">意外險</div>
            <div class="card-description">3方案推薦 讓你輕鬆保險煩惱!</div>
            <button class="card-button" onclick="openPopup('意外險','20歲~65歲','短期高保障','職業與生活風險保障','海外及跨區域保障','意外身故、失能金','躉繳','1年期','限10萬')">了解更多</button>
        </div>

        <!-- Card 5 -->
        <div class="card" id=5>
            <img src="image/p5.jpg" alt="天災險">
            <div class="card-title">天災險</div>
            <div class="card-description">受夠淹水及颱風，不要再當冤大頭!</div>
            <button class="card-button" onclick="openPopup('天災險','18歲~65歲','快速理賠','針對多種自然災害的全面保障','靈活投保','財物保障、責任保障、損失補償','躉繳、分期','短期、1年期、長期',' 50 萬元到 300 萬元')">了解更多</button>
        </div>

        <!-- Card 6 -->
        <div class="card" id=6>
            <img src="image/p6.jpg" alt="Supercar Coverage">
            <div class="card-title">儲蓄險</div>
            <div class="card-description">買保險還能夠存錢!</div>
            <button class="card-button" onclick="openPopup('儲蓄險','0歲~74歲','保障與儲蓄雙重功能','現金價值與紅利','長期儲蓄，短期負擔','財物保障、責任保障、損失補償','年繳、半年繳、季繳、月繳','6年期','身故/完全失能給付、滿期給付、紅利給付')">了解更多</button>
        </div>
        
        <div class="overlay" onclick="closePopup()"></div>
	    <div class="popup">
	        <h1 id="title"></h1>
	
	        <div class="section">
	            <h2>承保年齡</h2>
	            <p id="age"></p>
	        </div>
	
	        <div class="section">
	            <h2>商品特色</h2>
	            <ul>
	                <li id="sp1"></li>
	                <li id="sp2"></li>
	                <li id="sp3"></li>
	            </ul>
	        </div>
	
	        <div class="section">
	            <h2>給付項目</h2>
	            <p id="item"></p>
	        </div>
	
	        <div class="section">
	            <h2>繳費方式</h2>
	            <p id="type"></p>
	        </div>
	
	        <div class="section">
	            <h2>保險期間</h2>
	            <p id="time"></p>
	        </div>	
	        	
	        <div class="section">
	            <h2>所繳保險費限制</h2>
	            <p id="limit"></p>
	        </div>
	
	        <button class="close-btn" onclick="closePopup()">關閉</button>
	    </div>        
	    
    </div>
</body>
</html>
package querysystem.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ExchangeRate {
	
	public static Map<String, String[]> getRate() {		
		
		String url = "https://tw.stock.yahoo.com/currency-converter";
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		// 找到 <ul> 下的 <li class="price-detail-item"> 前面幾個字是 price-detail-item 的元素
		Elements Currency = doc.select("div.table-body-wrapper > ul > li");
		// 過濾 html tag
		Map<String, String[]> currencyMap = new HashMap<>();		
		
		for (Element row : Currency) {
			// Extract data from spans
            Elements spans = row.select("span");
            
            // Ensure there are enough elements for proper parsing
            if (spans.size() >= 6) {
                String currencyName = spans.get(0).text().trim();  // Currency name
                String timeUpdated = spans.get(1).text().trim();  // Last updated time
                String cashBuy = spans.get(2).text().trim();      // Cash Buy
                String cashSell = spans.get(3).text().trim();     // Cash Sell
                String spotBuy = spans.get(4).text().trim();      // Spot Buy
                String spotSell = spans.get(5).text().trim();     // Spot Sell
                
                // Store in the map
                currencyMap.put(currencyName, new String[]{timeUpdated, cashBuy, cashSell, spotBuy, spotSell});
            }
		}		
		
		return currencyMap;
	}
}
package gs.service;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Service;

@Service
public class Weather {
	public String returnTemp(double lat, double lng) {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection();
			r.eval("library(rvest)");
			r.eval("url <- 'https://weather.com/ko-KR/weather/today/l/"+lat+","+lng+"'");
			r.eval("text <- read_html(url, encoding='UTF-8')");
			r.eval("nodes <- html_nodes(text,'div > div.today_nowcard-temp > span')");
			r.eval("result <- html_text(nodes,trim=TRUE)");
			r.eval("result <- substr(result,1,length(result))");
			return r.eval("result").asString();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retStr;
	}
	
	public String returnComm(double lat, double lng) {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection();
			r.eval("library(rvest)");
			r.eval("url <- 'https://weather.com/ko-KR/weather/today/l/"+lat+","+lng+"'");
			r.eval("text <- read_html(url, encoding='UTF-8')");
			r.eval("nodes <- html_nodes(text,'div > section div.today_nowcard-phrase')");
			r.eval("result2 <- html_text(nodes,trim=TRUE)");
			return r.eval("result2").asString();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retStr;
	}
}
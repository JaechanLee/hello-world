package gs.service;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Service;

@Service
public class RChart {	
	public String returnLeaflet2(String path, double lat, double lng)  {
		RConnection r = null;
		String retStr = "";
		String path_ = path + "leafletchart";
		try {
			r = new RConnection(); 
			String dataX = ""+lat;
			String dataY = ""+lng;
			r.assign("x", dataX); // java data를 assign이라는 메소드를 사용해 x라는 이름으로 r로 보내준다.
			r.assign("y", dataY); // java data를 assign이라는 메소드를 사용해 x라는 이름으로 r로 보내준다.

//			r.eval("setwd('D:/Programming_Source/Java/workspace/GothamSeoul/GothamSeoul/src/main/webapp/r/')");
			r.eval("setwd('" + path + "/r/')"); 

			r.eval("source(file='script.R', encoding='UTF-8')"); 
            String fileName = path_+"/index.html";
            String libPath = path_ + "/lib";
		    r.eval("save_html(multilayer_map,'"+fileName+"', libdir = '"+libPath+"')");
			retStr = r.eval("'index.html'").asString();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			r.close(); 
		}
		return retStr;
	}
	
	public byte[] graphy()  {
		RConnection r = null;
		byte[] imgByte = null;
		try {
			r = new RConnection();
			r.eval("setwd('c:/Rstudy')");
			r.eval("source(file='district_crime.R', encoding='UTF-8')");
			System.out.println("1");
			r.eval("r<-''");
			r.eval("r<-readBin('district_crime.jpg','raw',1024*1024)");
			imgByte = r.eval("r").asBytes();
			System.out.println("2");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			r.close(); 
		}
		return imgByte;
	}
	
	
}

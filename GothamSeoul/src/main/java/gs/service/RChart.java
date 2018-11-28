package gs.service;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Service;

@Service
public class RChart {	
	public String returnLeaflet2(String path, double lat, double lng)  {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection(); 
			System.out.println(r); 
			String dataX = ""+lat;
			String dataY = ""+lng;
			r.assign("x", dataX); // java data를 assign이라는 메소드를 사용해 x라는 이름으로 r로 보내준다.
			r.assign("y", dataY); // java data를 assign이라는 메소드를 사용해 x라는 이름으로 r로 보내준다.
			System.out.println(r);
			r.eval("setwd('D:/Programming_Source/Java/workspace/GothamSeoul/GothamSeoul/src/main/webapp/r/')");
//			r.eval("setwd('r/')"); 
			r.eval("source(file='script.R', encoding='UTF-8')"); 
            String fileName = path+"/index.html";
            String libPath = path + "/lib";
            System.out.println(fileName);
            System.out.println(libPath);
		    r.eval("save_html(multilayer_map,'"+fileName+"', libdir = '"+libPath+"')");
			retStr = r.eval("'index.html'").asString();	
			System.out.println(retStr);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close(); 
		}
		return retStr;
	}	
	
	
}

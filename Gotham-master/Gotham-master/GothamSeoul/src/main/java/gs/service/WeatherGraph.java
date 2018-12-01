package gs.service;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Service;
@Service
public class WeatherGraph {
	public byte[] returnWG1(String path) {
		RConnection r = null;
		byte retImg [] = null;
		try {
			r = new RConnection();
			
			r.eval("setwd('" + path + "/r/')"); 
//			r.eval("setwd('C:/Users/student/git/Gotham/GothamSeoul/src/main/webapp/r/')");
			r.eval("jpeg('test1.jpg')");
			r.eval("source(file='kw01.R', encoding='UTF-8')");
			r.eval("dev.off()");
			r.eval("r<-readBin('test1.jpg','raw',1024*1024)");
			retImg = r.eval("r").asBytes();
//			r.eval("unlink('test.jpg')");			
		} catch(Exception e) {
			System.out.println(e);	
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retImg; 
	}
	
	public byte[] returnWG2(String path) {
		RConnection r = null;
		byte retImg [] = null;
		try {
			r = new RConnection();
			r.eval("setwd('" + path + "/r/')"); 
//			r.eval("setwd('C:/Users/student/git/Gotham/GothamSeoul/src/main/webapp/r/')");
			r.eval("jpeg('test2.jpg')");
			r.eval("source(file='kw02.R', encoding='UTF-8')");
			r.eval("dev.off()");
			r.eval("r<-readBin('test2.jpg','raw',1024*1024)");
			retImg = r.eval("r").asBytes();
//			r.eval("unlink('test.jpg')");			
		} catch(Exception e) {
			System.out.println(e);	
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retImg; 
	}
	
}

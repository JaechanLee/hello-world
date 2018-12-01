package gs.controller;

import java.io.FileWriter;
import java.util.Base64;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import gs.service.AlarmCrawler;
import gs.service.RChart;
import gs.service.Weather;
import gs.service.WeatherGraph;
import gs.vo.mainVO;

@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	RChart rc;
	
	@Autowired
	Weather wt;
	
	@Autowired
	WeatherGraph wg;
	
	@Autowired
	AlarmCrawler ac;
	
	@RequestMapping(value="/main.do")
	public ModelAndView openMain(mainVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("mainPage");
		log.debug("Test");
				
		return mv;
	}
	
	@RequestMapping(value="/locationData.do", method=RequestMethod.GET)
	public ModelAndView locationData(HttpServletRequest request, @RequestParam("lat") double lat, @RequestParam("lng") double lng) {  
	    ModelAndView mav = new ModelAndView();
	    
		String real_path = request.getSession().getServletContext().getRealPath("/");
	    real_path = real_path.replace("\\", "/");

		String result = rc.returnLeaflet2(real_path, lat, lng);
		mav.addObject("leafletChartName", "http://localhost:8000/GothamSeoul/leafletchart/"+result);
		mav.addObject("temp", wt.returnTemp(lat, lng));
		mav.addObject("comm", wt.returnComm(lat, lng));
		
		mav.addObject("w_graph1", wg.returnWG1(real_path));
		mav.addObject("w_graph2", wg.returnWG2(real_path));

		mav.setViewName("jsonView");
				
	    return mav;
	}
	
	@RequestMapping(value="/accidentAlarm.do")
	public ModelAndView accidentAlarm(HttpServletRequest request) throws Exception {  
	    
		request.setCharacterEncoding("UTF-8");
		
	    ModelAndView mav = new ModelAndView();
	    
		Map<String, String> resultMap = ac.accidentCrawler();
		
		System.out.println("Main Controller : " + resultMap.get("1"));
		
		mav.addAllObjects(resultMap);
		mav.setViewName("jsonView");
				
	    return mav;
	}
	
	@RequestMapping(value="/fireAlarm.do")
	public ModelAndView fireAlarm(HttpServletRequest request) throws Exception {  
	    
		request.setCharacterEncoding("UTF-8");
		
	    ModelAndView mav = new ModelAndView();
	    
		JSONArray resultArray = ac.fireCrawler();
				
		String real_path = request.getSession().getServletContext().getRealPath("/");
	    real_path = real_path.replace("\\", "/");

		System.out.println(real_path);

        FileWriter file = new FileWriter(real_path + "/dataset/fireAlarm.json");
        file.write(resultArray.toJSONString());
        file.flush();
		
		mav.addObject("result", resultArray);
		
		mav.setViewName("jsonView");
				
	    return mav;
	}
	
	@RequestMapping(produces="text/plain; charset=utf-8")
	@ResponseBody
	public String graphy() {		
		return Base64.getEncoder().encodeToString(rc.graphy());
	}
	
}

package gs.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gs.service.RChart;
import gs.service.Weather;
import gs.vo.mainVO;

@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	RChart rc;
	
	@Autowired
	Weather wt;
	
	@RequestMapping(value="/main.do")
	public ModelAndView openMain(mainVO vo) throws Exception {
		ModelAndView mv = new ModelAndView("mainPage");
		log.debug("Test");
				
		return mv;
	}
	
	@RequestMapping(value="/locationData.do", method=RequestMethod.GET)
	public ModelAndView ajaxView(HttpServletRequest request, @RequestParam("lat") double lat, @RequestParam("lng") double lng) {  
	    ModelAndView mav = new ModelAndView();
	    
		String real_path = request.getSession().getServletContext().getRealPath("/");
	    real_path = real_path.replace("\\", "/");
		String result = rc.returnLeaflet2(real_path+"leafletchart", lat, lng);
		mav.addObject("leafletChartName", "http://localhost:8080/GothamSeoul/leafletchart/"+result);
//		mav.addObject("temp", wt.returnTemp(lat, lng));
//		mav.addObject("comm", wt.returnComm(lat, lng));
		mav.setViewName("jsonView");
		
	    return mav;
	}
}

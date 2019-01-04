package studyPlan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import studyPlan.model.StudyPlan;
import studyPlan.service.StudentPunchService;
import studyPlan.util.JsonUtils;

@Controller
public class StudentPunchController {
	
	@Autowired
	StudentPunchService studentPunchService= null;
	
	/**
	 * 
	 * 返回打卡界面
	 * 
	 * */	
	@RequestMapping(value = { "/punch" }, method = RequestMethod.GET)
	public String searchandchoose() {
		return "student/studentPunch/punch";
	}	
	
//	/**
//	 * 
//	 * @功能:获取老师发布的所有计划
//	 * @返回值:返回发布计划的JSON格式
//	 * 
//	 */
//	@RequestMapping(value = {"/punch"}, method = RequestMethod.POST)
//	public  @ResponseBody String getStudyPlan(String num) {
//		int number =  Integer.parseInt(num.trim());
//		StudyPlan[] sp = studentPunchService.findPlanByNumber(number);
//		String jsonStr = JsonUtils.objectToJson(sp);
//		return jsonStr;
//	}
//	
	/**
	 * 
	 * @功能:打卡，把合法数据插入到阶段性打卡表
	 * @查询是否当日已经打卡，一天只允许插入一次
	 * @返回值:返回int
	 * 
	 */
	@RequestMapping(value = {"/punch"}, method = RequestMethod.POST)
	public  @ResponseBody int punch(@RequestParam String planNo,
			@RequestParam String number) {
		int planno =  Integer.parseInt(planNo.trim());
		int num = Integer.parseInt(number.trim());;
		int ans = studentPunchService.punch(planno,num);
		return ans;
	}
}

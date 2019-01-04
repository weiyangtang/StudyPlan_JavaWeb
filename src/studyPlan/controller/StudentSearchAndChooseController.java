package studyPlan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import studyPlan.model.PlanPublish;
import studyPlan.model.StudyPlan;
import studyPlan.service.StudentSearchAndChooseService;
import studyPlan.util.JsonUtils;

@Controller
public class StudentSearchAndChooseController {
	
	@Autowired
	StudentSearchAndChooseService studentSearchAndChoose = null;
	
	/**
	 * 
	 * 返回查询和选择界面
	 * 
	 * */	
	@RequestMapping(value = { "/choose" }, method = RequestMethod.GET)
	public String searchandchoose() {		
		//返回"StudentSearchAndChoose"视图，对应StudentSearchAndChoose.jsp
		return "student/studentSearchAndChoose/StudentSearchAndChoose";
	}	
	
	/**
	 * 
	 * @功能:获取老师发布的所有计划
	 * @返回值:返回发布计划的JSON格式
	 * 
	 */
	@RequestMapping(value = {"/choose"}, method = RequestMethod.POST)
	public  @ResponseBody String getStudyPlan() {
		StudyPlan[] sp = studentSearchAndChoose.findAllStudyPlan();
		String jsonStr = JsonUtils.objectToJson(sp);
		return jsonStr;
	}
	
	/**
	 * @功能：获取学生选择的所有计划
	 * @返回值：返回json格式
	 */
	@RequestMapping(value = {"/stuplan"}, method = RequestMethod.POST)
	public  @ResponseBody String getPlanSelected(@RequestParam String number) {
		int num = Integer.parseInt(number);
		StudyPlan[] sp = studentSearchAndChoose.findPlanByNumber(num);
		String jsonStr = JsonUtils.objectToJson(sp);
		return jsonStr;
	}
	
	/**
	 * @功能：将合法数据添加到学生选择计划
	 * @返回值：返回int
	 */
	@RequestMapping(value = {"/addstuplan"}, method = RequestMethod.POST)
	public  @ResponseBody int addPlanSlected(@RequestParam String planNo,
			@RequestParam String number) {
		int planno =  Integer.parseInt(planNo.trim());
		int num = Integer.parseInt(number.trim());
//		int acceptionno = Integer.parseInt(acceptionNo.trim());
//		int stagecardco = Integer.parseInt(stageCardNo.trim());
		System.out.println(planno+"   "+num);
		int ans = studentSearchAndChoose.addPlanSelected(planno, num);
//		System.out.println(ans);
		return ans;
	}
	
	/**
	 * @功能：删除对应的学生计划
	 * @返回值：返回json格式
	 */
	@RequestMapping(value = {"/plandelete"}, method = RequestMethod.POST)
	public  @ResponseBody int PlanDelete(@RequestParam String planNo,
			@RequestParam String number) {
		System.out.println("controller");
		int planno =  Integer.parseInt(planNo.trim());
		int num = Integer.parseInt(number.trim());
		System.out.println("计划删除controller:"+planno+"   "+num);
		
		int ans = studentSearchAndChoose.plandelete(planno, num);
//		System.out.println(ans);
		return ans;
	}
	
}

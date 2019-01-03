package studyPlan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import studyPlan.model.CardCondition;
import studyPlan.model.StudyPlan;
import studyPlan.service.StudentCardConditionService;

@Controller
public class StudentCardConditonController {
	@Autowired
	StudentCardConditionService service = null;

	/* 返回教师所有发布的学习计划界面 */
	@RequestMapping(value = { "/planList" }, method = RequestMethod.GET)
	public String planList() {
		return "teacher/cardCondition/planList";
	}

	/**
	 * @功能:返回教师所有发布的学习计划
	 */
	@RequestMapping(value = { "/planList" }, method = RequestMethod.POST)
	public @ResponseBody StudyPlan[] findAllPlanType(HttpSession session) {

		session.setAttribute("teacherNo", "1605010203");// 测试,合并删除

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return null;
		return service.findStudyPlan(teacherNo);
	}

	/**
	 * @功能:返回计划的打卡情况页面
	 * 
	 */
	@RequestMapping(value = { "/cardCondition" }, method = RequestMethod.GET)
	public String get() {

		return "teacher/cardCondition/cardConditon";
	}

	/**
	 * @功能:返回打卡情况
	 * 
	 */
	@RequestMapping(value = { "/cardCondition" }, method = RequestMethod.POST)
	public @ResponseBody CardCondition[] cardCondition(@RequestParam String planNo) {
		System.out.println(planNo);
		return service.findCardCondition(planNo);

	}

}

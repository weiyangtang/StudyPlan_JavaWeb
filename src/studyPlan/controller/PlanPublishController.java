package studyPlan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import studyPlan.model.PlanType;
import studyPlan.model.StudyPlan;
import studyPlan.service.PlanPublishService;

@Controller
public class PlanPublishController {

	@Autowired
	PlanPublishService planPublishService = null;

	/**
	 *
	 * @功能:返回计划发布页面
	 * 
	 */
	@RequestMapping(value = { "/planPublish" }, method = RequestMethod.GET)
	public String getPlanPublish(HttpSession session) {

		// session.setAttribute("teacherNo", "1605010203");// 测试,合并删除

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return null;
		return "teacher/planPublish/planPublish";
	}

	/**
	 * @功能:返回计划的类型
	 */
	@RequestMapping(value = { "/PlanType" }, method = RequestMethod.POST)
	public @ResponseBody PlanType[] findAllPlanType(HttpSession session) {

		// session.setAttribute("teacherNo", "1605010203");// 测试,合并删除

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return null;
		return planPublishService.findAllPlanType();
	}

	/**
	 * @功能:计划发布
	 * @返回值:0 失败,1成功
	 */
	@RequestMapping(value = { "/PlanPublish" }, method = RequestMethod.POST)
	public @ResponseBody int PlanPublish(HttpSession session, StudyPlan plan,
			@RequestParam(value = "uploadFile") MultipartFile uploadFile) {
		
        System.out.println(plan.getPlanTypeNo()+plan.getPlanContext()+plan.getCoinNum()+plan.getPlanName()+plan.getStartTime()+plan.getEndTime());
		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return 0;
		else {
			plan.setTeacherNo(teacherNo);
			return planPublishService.planPublish(plan,uploadFile);
		}
	}

}

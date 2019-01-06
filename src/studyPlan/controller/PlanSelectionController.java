package studyPlan.controller;



import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import studyPlan.model.PlanType;
import studyPlan.model.StudentPlanSelection;
import studyPlan.model.StudyPlan;
import studyPlan.model.StudyPlanInfo;
import studyPlan.service.PlanSelectionService;

@Controller
public class PlanSelectionController {

	@Autowired
	PlanSelectionService planSelectionService = null;

	/**
	 * @功能:返回计划类型的视图
	 * 
	 */
	@RequestMapping(value = { "/planTypeList" }, method = RequestMethod.GET)
	public String planTypeList() {

		return "student/studentSearchAndChoose/planTypeList";
	}

	/**
	 * @功能:返回所有的计划类型
	 * 
	 */
	@RequestMapping(value = { "/planTypeList" }, method = RequestMethod.POST)
	public @ResponseBody PlanType[] planTypeInfo() {

		return planSelectionService.findAllPlanType();
	}

	/**
	 * @功能:返回某种类型的学习计划的视图
	 * 
	 */
	@RequestMapping(value = { "/planListInfo" }, method = RequestMethod.GET)
	public String planList() {

		return "student/studentSearchAndChoose/planList";
	}

	/**
	 * @功能:按计划类型找出所有该类型的学习计划
	 * 
	 */
	@RequestMapping(value = { "/planListInfo" }, method = RequestMethod.POST)
	public @ResponseBody StudyPlanInfo[] planListInfo(@RequestParam(value = "planTypeNo") String planTypeNo) {

		return planSelectionService.findStudyPlan(planTypeNo);
	}

	/**
	 * @功能:返回计划的具体信息视图
	 */
	@RequestMapping(value = { "/planInfo" }, method = RequestMethod.GET)
	public String planInfo() {

		return "student/studentSearchAndChoose/planInfo";
	}
	
	/**
	 * @功能:安装计划编号查询学习计划
	 * 
	 * */
	@RequestMapping(value = { "/planInfo" }, method = RequestMethod.POST)
	public @ResponseBody StudyPlanInfo planInfo(@RequestParam(value = "planNo") String planNo) {
		return planSelectionService.findStudyPlanInfo(planNo);
	}
	
	@RequestMapping(value = { "/planSelection" }, method = RequestMethod.POST)
	public @ResponseBody int planSelection(@RequestParam(value = "planNo") String planNo,HttpSession session) {
		
		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return 0;
		Date date = new java.sql.Date(new java.util.Date().getTime());
		int pno=Integer.parseInt(planNo);
		StudentPlanSelection planSelection=new StudentPlanSelection(0,pno,studentNo,date);
		return planSelectionService.planSelection(planSelection);
	}
	
	/**
	 * @功能:返回学生已选的学习计划视图
	 * 
	 * */
	@RequestMapping(value = { "/SelectedPlan" }, method = RequestMethod.GET)
	public String SelectedPlan() {
		return "student/studentSearchAndChoose/planSelectedList";
	}
	

	/**
	 * @功能:返回学生已选的学习计划视图
	 * 
	 * */
	@RequestMapping(value = { "/SelectedPlan" }, method = RequestMethod.POST)
	public @ResponseBody StudyPlanInfo[] SelectedPlan(HttpSession session) {
		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return null;
		return planSelectionService.findallSelectedPlan(studentNo);
	}
	
	
	
	
	

}

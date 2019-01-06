package studyPlan.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import studyPlan.model.CheckWork;
import studyPlan.model.StudyPlan;
import studyPlan.service.CheckWorkService;

@Controller
public class CheckWorkController {
	@Autowired
	CheckWorkService checkWorkService = null;

	/**
	 *
	 * @功能:返回计划成果提交页面
	 */
	@RequestMapping(value = { "/submitWork" }, method = RequestMethod.GET)
	public String getPlanPublish(HttpSession session) {

		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return null;
		return "student/submitWorks/submitWork";
	}

	/**
	 * @学生提交作业
	 * @返回值:0失败,1成功
	 */
	@RequestMapping(value = { "/submitWork" }, method = RequestMethod.POST)
	public @ResponseBody int submitWork(HttpSession session,
			@RequestParam(value = "uploadFile") MultipartFile uploadFile, @RequestParam("planNo") String planNo) {

		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return 0;
		System.out.println(uploadFile.getOriginalFilename());
		Date date = new java.sql.Date(new java.util.Date().getTime());
		int pno = Integer.parseInt(planNo);
		CheckWork checkWork = new CheckWork();
		checkWork.setPlanNo(pno);
		checkWork.setCheckWorkTime(date);
		checkWork.setStudentNo(studentNo);

		return checkWorkService.submitWork(checkWork, uploadFile);
	}

	/**
	 *
	 * @功能:返回教师验收界面,计划类型
	 */
	@RequestMapping(value = { "/checkWorkPlanType" }, method = RequestMethod.GET)
	public String checkWork(HttpSession session) {

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return null;

		return "teacher/checkWork/planTypeList";
	}

	/**
	 * @功能:按计划类型返回教师所发布的学习计划视图
	 */
	@RequestMapping(value = { "/checkWorkPlanList" }, method = RequestMethod.GET)
	public String checkWorkPlanList(HttpSession session) {

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return null;
		return "teacher/checkWork/planList";
	}

	/**
	 * 
	 * @功能:返回教师所有发布的计划
	 */
	@RequestMapping(value = { "/teacherPlanList" }, method = RequestMethod.POST)
	public @ResponseBody StudyPlan[] teacherPlanList(HttpSession session,
			@RequestParam(value = "planTypeNo") String planTypeNo) {

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return null;
		return checkWorkService.findStudyPlan(teacherNo, planTypeNo);
	}

	/**
	 * @功能:按计划编号返回提交计划成果的学生
	 */
	@RequestMapping(value = { "/AllSubmitStudentList" }, method = RequestMethod.GET)
	public String AllSubmitStudentList(HttpSession session) {

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return null;
		return "teacher/checkWork/checkWorkStudentList";
	}

	/**
	 * @功能:按计划编号返回提交计划成果的学生
	 */
	@RequestMapping(value = { "/AllSubmitStudentList" }, method = RequestMethod.POST)
	public @ResponseBody CheckWork[] AllSubmitStudentList(HttpSession session,
			@RequestParam(value = "planNo") String planNo) {
		System.out.println("ok");
		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return null;
		return checkWorkService.findAllSubmitStudent(planNo);
	}

	/**
	 *
	 * @功能:教师验收
	 */

	@RequestMapping(value = { "/checkWork" }, method = RequestMethod.POST)
	public @ResponseBody int checkWork(HttpSession session, @RequestParam(value = "planNo") int planNo,
			@RequestParam(value = "studentNo") String studentNo, @RequestParam(value = "score") double score) {
        System.out.println(planNo+"\t"+studentNo+"\t"+score);
		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return 0;

		return checkWorkService.CheckWork(planNo, studentNo, score);
	}

}

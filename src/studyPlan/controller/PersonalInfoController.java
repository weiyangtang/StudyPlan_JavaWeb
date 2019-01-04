package studyPlan.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import studyPlan.model.Student;
import studyPlan.model.Teacher;
import studyPlan.service.LoginService;
import studyPlan.service.StudentService;
import studyPlan.service.TeacherService;
import studyPlan.util.FilePathUtil;

@Controller
public class PersonalInfoController {
	@Autowired
	StudentService studentService = null;
	@Autowired
	TeacherService teacherService = null;

	/**
	 *
	 * @功能:返回页面
	 * 
	 */
	@RequestMapping(value = { "/studentInfo" }, method = RequestMethod.GET)
	public String studentInfo(HttpSession session) {

		session.setAttribute("studentNo", "1605010203");// 测试,合并删除

		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return null;
		return "student/personalInfo/studentPersonalInfo";
	}

	/**
	 * @功能:获取学生的个人信息
	 * @返回值:返回学生个人信息的JSON格式
	 * 
	 */
	@RequestMapping(value = { "/studentInfo" }, method = RequestMethod.POST)
	public @ResponseBody Student getStudentInfo(HttpSession session) {

		System.out.println("学生端请求数据");
		// session.setAttribute("studentNo", "1605010203");// 测试,合并删除

		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return null;
		return studentService.findStudent(studentNo);
	}

	/**
	 * @功能:修改学生的个人信息
	 * @返回值:0修改失败,1修改成功
	 * 
	 */
	@RequestMapping(value = { "/updateStudentInfo" }, method = RequestMethod.POST)
	public @ResponseBody int updateStudentInfo(HttpSession session, @RequestParam String userNames,
			@RequestParam String passwords, @RequestParam String majors, @RequestParam String sex) {
		System.out.println(userNames + "\t" + passwords + "\t" + majors + "\t" + sex);

		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return 0;
		Student student = new Student(studentNo, userNames, passwords, majors, 0, sex, null);
		System.out.println(studentService.updateStudentInfo(student));
		return studentService.updateStudentInfo(student);
	}

	/*************************************************************/

	/**
	 *
	 * @功能:返回教师页面
	 * 
	 */
	@RequestMapping(value = { "/teacherInfo" }, method = RequestMethod.GET)
	public String teacherInfo(HttpSession session) {

		session.setAttribute("teacherNo", "1663710324");// 测试,合并删除

		String studentNo = (String) session.getAttribute("teacherNo");
		if (studentNo == null)
			return null;
		return "teacher/personalInfo/teacherPersonalInfo";
	}

	/**
	 * @功能:获取教师的个人信息
	 * @返回值:返回教师个人信息的JSON格式
	 * 
	 */
	@RequestMapping(value = { "/teacherInfo" }, method = RequestMethod.POST)
	public @ResponseBody Teacher getTeacherInfo(HttpSession session) {

		System.out.println("教师端请求数据");
		// session.setAttribute("teacherNo", "1663710324");// 测试,合并删除

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return null;
		return teacherService.findTeacher(teacherNo);
	}

	/**
	 * @功能:修改教师的个人信息
	 * @返回值:0修改失败,1修改成功
	 * 
	 */
	@RequestMapping(value = { "/updateTeacherInfo" }, method = RequestMethod.POST)
	public @ResponseBody int updateTeacherInfo(HttpSession session, @RequestParam String userNames,
			@RequestParam String passwords, @RequestParam String ResearchDirections, @RequestParam String titles,
			@RequestParam String sex) {
		System.out.println(userNames + "\t" + passwords + "\t" + ResearchDirections + "\t" + titles + "\t" + sex);

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return 0;
		Teacher teacher = new Teacher(teacherNo, userNames, passwords, sex, titles, ResearchDirections, null);
		return teacherService.updateTeacherInfo(teacher);
	}
}

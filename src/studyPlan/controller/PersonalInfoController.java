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

import studyPlan.model.Major;
import studyPlan.model.Student;
import studyPlan.model.Teacher;
import studyPlan.service.LoginService;
import studyPlan.service.StudentService;
import studyPlan.service.TeacherService;
import studyPlan.util.FilePathUtil;
import studyPlan.util.FileUploadUtil;

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

		// session.setAttribute("studentNo", "1605010203");// 测试,合并删除

		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return null;
		return "student/personalInfo/studentPersonalInfo";
	}

	/**
	 * @功能:获取所有的专业名
	 */
	@RequestMapping(value = { "/findAllMajor" }, method = RequestMethod.POST)
	public @ResponseBody Major[] findAllMajor(HttpSession session) {

		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return null;
		return studentService.findAllMajor();
	}

	/**
	 * @功能:获取学生的个人信息
	 * @返回值:返回学生个人信息的JSON格式
	 * 
	 */
	@RequestMapping(value = { "/studentInfo" }, method = RequestMethod.POST)
	public @ResponseBody Student getStudentInfo(HttpSession session) {

		System.out.println("学生端请求数据");

		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return null;
		return studentService.findStudent(studentNo);
	}

	/**
	 * @功能:修改学生的个人信息
	 * @返回值:0修改失败,1修改成功
	 * @附加功能:学生头像上传
	 */
	@RequestMapping(value = { "/updateStudentInfo" }, method = RequestMethod.POST)
	public @ResponseBody int updateStudentInfo(HttpSession session,
			@RequestParam(value = "uploadFile") MultipartFile uploadFile, @RequestParam String userNames,
			@RequestParam String passwords, @RequestParam String majors, @RequestParam String sex) {

		System.out.println(userNames + "\t" + passwords + "\t" + majors + "\t" + sex);
		String studentNo = (String) session.getAttribute("studentNo");

		if (studentNo == null)
			return 0;
		String headImage = "";
		if (uploadFile == null || uploadFile.getSize() <= 0) {// 上传头像为空,即用户不修改头像
			Student student = studentService.findStudent(studentNo);
			headImage = student.getHeadImage();
		} else {// 修改头像
			String fileExtends = uploadFile.getOriginalFilename()
					.substring(uploadFile.getOriginalFilename().lastIndexOf(".") + 1);
			headImage = studentNo + "." + fileExtends;
			String filePath = System.getProperty("studyPlan.root") + "uploads" + File.separator + "headImage"
					+ File.separator + "student" + File.separator + headImage;
			FileUploadUtil.FileUpload(uploadFile, filePath);
		}

		Student student = new Student(studentNo, userNames, passwords, majors, 0, sex, headImage);
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

		// session.setAttribute("teacherNo", "1663710324");// 测试,合并删除

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
	 * @附加功能:头像上传,头像名称为教师工号+头像的后缀名,文件地址在项目部署下的uploads/headerImage/teacher文件夹下
	 */
	@RequestMapping(value = { "/updateTeacherInfo" }, method = RequestMethod.POST)
	public @ResponseBody int updateTeacherInfo(HttpSession session,
			@RequestParam(value = "uploadFile") MultipartFile uploadFile, @RequestParam String userNames,
			@RequestParam String passwords, @RequestParam String ResearchDirections, @RequestParam String titles,
			@RequestParam String sex) {

		String teacherNo = (String) session.getAttribute("teacherNo");
		if (teacherNo == null)
			return 0; // 未登录

		String headImage = "";
		if (uploadFile == null || uploadFile.getSize() <= 0) {// 头像为空,即
			Teacher teacher = teacherService.findTeacher(teacherNo);
			headImage = teacher.getHeadImage();
		} else {// 修改头像

			String fileExtends = uploadFile.getOriginalFilename()
					.substring(uploadFile.getOriginalFilename().lastIndexOf(".") + 1);
			headImage = teacherNo + "." + fileExtends;
			String filePath = System.getProperty("studyPlan.root") + "uploads" + File.separator + "headImage"
					+ File.separator + "teacher" + File.separator + headImage;
			FileUploadUtil.FileUpload(uploadFile, filePath);
		}

		Teacher teacher = new Teacher(teacherNo, userNames, passwords, sex, titles, ResearchDirections, headImage);
		return teacherService.updateTeacherInfo(teacher);
	}
}

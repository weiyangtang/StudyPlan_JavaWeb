package studyPlan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import studyPlan.service.LoginService;
import studyPlan.service.StudentService;

@Controller
public class LoginController {

	@Autowired
	StudentService studentService = null;
	@Autowired
	LoginService loginService = null;

	/* 返回登录界面 */
	@RequestMapping(value = { "/login", "/", "/index" }, method = RequestMethod.GET)
	public String login() {
		System.out.println("/login is request!");// 测试

		// 返回"login"视图，对应login.jsp
		return "login";
	}

	/*
	 * @功能:登录,校验身份密码
	 * 
	 * @返回方式:写入响应代码
	 * 
	 * @响应代码:0密码错误,1学生密码正确,2教师密码正确
	 */
	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public @ResponseBody int login(HttpSession session,@RequestParam String username, @RequestParam String password,
			@RequestParam String identity) {
		System.out.println(username + " " + password + " " + identity);// 测试
		int flag = loginService.login(username, password, identity);
		if(flag==1)
			session.setAttribute("studentNo", username);
		else if(flag==2)
			session.setAttribute("teacherNo", username);
		return flag;
		
	}
	
	/**
	 * @功能:返回学生总体的框架frame视图,导航
	 * */
	@RequestMapping(value = { "/studentFrame" }, method = RequestMethod.GET)
	public String studentFrame() {
		
		return "student/studentFrame";
	}
	
	/**
	 * @功能:返回教师总体的框架frame视图,导航
	 * */
	@RequestMapping(value = { "/teacherFrame" }, method = RequestMethod.GET)
	public String teacherFrame() {
		
		return "teacher/teacherFrame";
	}
	
	

}

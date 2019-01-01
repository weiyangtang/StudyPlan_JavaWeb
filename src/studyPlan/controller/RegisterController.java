package studyPlan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import studyPlan.model.Student;
import studyPlan.service.StudentService;
import studyPlan.service.LoginService;
import studyPlan.service.RegisterService;

@Controller
public class RegisterController {

	@Autowired
	LoginService loginService = null;
	
	@Autowired
	RegisterService registerService = null;
	//记住一个@Autowired 只管一个注入,否则报你个JavaNullPoint,那就开心了,哈哈
	/* 返回注册界面 */
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String login() {
		System.out.println("/请求注册界面!");// 测试

		// 返回"register"视图，对应register.jsp
		return "register";
	}

	/*
	 * @功能:注册
	 * 
	 * @返回方式:写入响应代码
	 * 
	 * @响应代码:0 注册失败,原因可能是账号已经存在了,1注册成功
	 */
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public @ResponseBody int register(@RequestParam String userId, @RequestParam String username,
			@RequestParam String password, @RequestParam String identity) {

		System.out.println(userId + " " + username + " " + password + " " + identity);// 测试

		return registerService.register(userId, username, password, identity);

	}

}

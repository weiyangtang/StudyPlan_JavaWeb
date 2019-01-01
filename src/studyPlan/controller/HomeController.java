package studyPlan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import studyPlan.model.Student;
import studyPlan.service.StudentService;

/*
 * 
 * 测试SpringMVC配置是否成功
 * */
@Controller
public class HomeController {

	@Autowired
	StudentService studentService = null;

	@RequestMapping(value = { "/Student" }, method = RequestMethod.POST)
	public @ResponseBody Student getStudentInfo(@RequestBody Student student) {
		System.out.println("测试2");
		Student stu = studentService.findStudent(student.getStudentNo());
		return stu;
	}

	@RequestMapping(value = { "/StudentInfo" }, method = RequestMethod.GET)
	public @ResponseBody Student[] get() {
		Student[] stu = studentService.findAllStudent();
		return stu;
	}
	
	

}

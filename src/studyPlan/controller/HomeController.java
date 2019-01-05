package studyPlan.controller;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import studyPlan.model.Student;
import studyPlan.service.StudentService;
import studyPlan.util.FilePathUtil;
import studyPlan.util.FileUploadUtil;

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

	@RequestMapping(value = { "/upload" })
	public @ResponseBody String fileUpload(@RequestParam MultipartFile uploadFile,@RequestParam String userName,@RequestParam String userId) {
		System.out.println(System.getProperty("studyPlan.root"));
		System.out.println(userName);
		System.out.println(userId);
		System.out.println(FileUploadUtil.FileUpload(uploadFile,"1663710324"));
		return "1";
	}
	
	@RequestMapping(value = { "/uploadfile" },method = RequestMethod.POST)
	public String uploadfile(MultipartFile uploadFile,@RequestParam String userNames,@RequestParam String passwords) {
		System.out.println(System.getProperty("studyPlan.root"));
		System.out.println(userNames);
		System.out.println(passwords);
		System.out.println(uploadFile.getOriginalFilename());
		FileUploadUtil.FileUpload(uploadFile,"1663710324");
		/*String uploadPath =System.getProperty("studyPlan.root") + uploadFile.getOriginalFilename();
		try {
			FileOutputStream fs = new FileOutputStream(uploadPath);
			fs.write(uploadFile.getBytes());
			fs.close();
			System.out.println(uploadPath);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		return "login";
	}
	@RequestMapping(value = { "/uploadfile" },method = RequestMethod.GET)
	public String uploadfiles() {
		
		return "uploadFileDemo";
	}

}

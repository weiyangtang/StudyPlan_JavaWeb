package studyPlan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import studyPlan.dao.StudentDao;
import studyPlan.dao.TeacherDao;
import studyPlan.model.Student;
import studyPlan.model.Teacher;

@Service
public class LoginService {
	@Autowired
	StudentDao studentDao = null;
	@Autowired
	TeacherDao teacherDao = null;

	/*
	 * @功能:登录密码检查
	 * 
	 * @返回值:0密码错误,1学生密码正确,2教师密码正确
	 * 
	 */
	public int login(String username, String password, String identity) {

		int type = Integer.parseInt(identity);
		if (type == 1) {// 学生
			Student student = studentDao.findStudent(username);
			if (student.getStudentPassword().trim().equals(password.trim()))
				return 1;
			else
				return 0;

		} else if (type == 2) {// 教师
			Teacher teacher = teacherDao.findTeacher(username);
			if (teacher.getTeacherPassword().trim().equals(password.trim()))
				return 2;
			else
				return 0;
		}

		return 0;

	}

}

package studyPlan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import studyPlan.dao.StudentDao;
import studyPlan.dao.TeacherDao;
import studyPlan.model.Student;
import studyPlan.model.Teacher;

@Service
public class RegisterService {
	@Autowired
	StudentDao studentDao = null;
	@Autowired
	TeacherDao teacherDao = null;

	/*
	 * @功能:学生教师注册
	 * 
	 * @返回值:0 注册失败,原因可能是账号已经存在了,1注册成功
	 * 
	 */

	public int register(String userId, String username, String password, String identity) {
		int type = Integer.parseInt(identity);
		if (type == 1) {// 学生
			if (studentDao.findStudent(userId) != null)
				return 0;
			return studentDao.addStudent(userId, username, password);
		} else if (type == 2) {// 教师
			if (teacherDao.findTeacher(userId) != null)
				return 0;
			return teacherDao.addTeacher(userId, username, password);
		}
		return 0;

	}

}

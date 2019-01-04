package studyPlan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studyPlan.dao.TeacherDao;
import studyPlan.model.Teacher;

@Service
public class TeacherService {
	@Autowired
	TeacherDao dao = null;

	public Teacher findTeacher(String teacherNo) {
		return dao.findTeacher(teacherNo);

	}

	public Teacher[] findAllTeacher() {
		return dao.findAllTeacher();
	}

	/**
	 * @功能:修改教师的个人信息
	 * @返回值:0修改失败,1修改成功
	 * 
	 * 
	 * */
	public int updateTeacherInfo(Teacher teacher) {
		return dao.updateTeacherInfo(teacher);
	}
}

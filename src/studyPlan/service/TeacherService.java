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

}

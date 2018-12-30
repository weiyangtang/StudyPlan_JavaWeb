package studyPlan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studyPlan.dao.StudentDao;
import studyPlan.model.Student;

@Service
public class StudentService {
	@Autowired
	StudentDao dao = null;

	public Student findStudent(String studentNo) {
		return dao.findStudent(studentNo);
	}

	public Student[] findAllStudent() {
		return dao.findAllStudent();
	}
}

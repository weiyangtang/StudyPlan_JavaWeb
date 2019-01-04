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

	/**
	 * 
	 * @功能:修改学生个人信息
	 * @返回值:0修改失败,1修改成功
	 * 
	 */
	public int updateStudentInfo(Student student) {
		return dao.updateStudentInfo(student);
	}

}

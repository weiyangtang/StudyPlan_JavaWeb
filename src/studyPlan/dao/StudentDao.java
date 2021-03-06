package studyPlan.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studyPlan.model.Major;
import studyPlan.model.Student;

@Repository
public class StudentDao {

	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper mapper = BeanPropertyRowMapper.newInstance(Student.class);
	BeanPropertyRowMapper majorMapper = BeanPropertyRowMapper.newInstance(Major.class);

	/* 根据学号找出学生 */
	public Student findStudent(String studentNo) {
		String sql = "select * from student where studentNo=?";
		List<Student> list = jdbcTemplate.query(sql, mapper, studentNo);
		if (list == null || list.size() <= 0)
			return null;
		else
			return list.get(0);
	}

	/* 找出所有学生 */
	public Student[] findAllStudent() {
		String sql = "select * from student";
		List<Student> list = jdbcTemplate.query(sql, mapper);
		return list.toArray(new Student[0]);
	}

	/*
	 * @功能: 添加学生
	 * 
	 * @返回值:0用户账号已存在,1注册成功
	 * 
	 * 
	 */
	public int addStudent(String studentNo, String studentName, String studentPassword) {

		String sql = "insert student(studentNo,studentName,studentPassword,coin) values(?,?,?,0)";
		int flag = jdbcTemplate.update(sql, studentNo, studentName, studentPassword);
		if (flag > 0)
			return 1;
		return 0;
	}

	/**
	 * 
	 * @功能:修改学生个人信息
	 * @返回值:0修改失败,1修改成功
	 * 
	 */
	public int updateStudentInfo(Student student) {
		String sql = "update student  set studentName=?,studentPassword=?,major=?,studentSex=?,headImage=? where studentNo=?";
		int flag = jdbcTemplate.update(sql, student.getStudentName(), student.getStudentPassword(), student.getMajor(),
				student.getStudentSex(), student.getHeadImage(), student.getStudentNo());
		if (flag > 0)
			return 1;
		return 0;
	}

	/**
	 * @功能:获取专业名称
	 */
	public Major[] findAllMajor() {
		String sql = "select * from major";
		List<Major> list = jdbcTemplate.query(sql, majorMapper);
		if (list == null || list.size() <= 0)
			return null;
		return list.toArray(new Major[0]);
	}

}

package studyPlan.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studyPlan.model.Student;

@Repository
public class StudentDao {

	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper mapper = BeanPropertyRowMapper.newInstance(Student.class);

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

}

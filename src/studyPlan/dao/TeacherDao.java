package studyPlan.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studyPlan.model.Student;
import studyPlan.model.Teacher;

@Repository
public class TeacherDao {
	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper mapper = BeanPropertyRowMapper.newInstance(Teacher.class);

	/* 根据教师工号找教师 */
	public Teacher findTeacher(String teacherNo) {
		String sql = "select * from teacher where teacherNo=?";
		List<Teacher> list = jdbcTemplate.query(sql, mapper, teacherNo);
		if (list == null || list.size() <= 0)
			return null;
		else
			return list.get(0);
	}

	/* 找出所有教师 */
	public Teacher[] findAllTeacher() {
		String sql = "select * from teacher";
		List<Student> list = jdbcTemplate.query(sql, mapper);
		return list.toArray(new Teacher[0]);
	}

	/*
	 * @功能: 添加教师
	 * 
	 * @返回值:0用户账号已存在,1注册成功
	 * 
	 */
	public int addTeacher(String teacherNo, String teacherName, String teacherPassword) {

		String sql = "insert teacher(teacherNo,teacherName,teacherPassword) values(?,?,?)";
		int flag = jdbcTemplate.update(sql, teacherNo, teacherName, teacherPassword);
		if (flag > 0)
			return 1;
		return 0;
	}

	/**
	 * @功能:修改教师的个人信息
	 * @返回值:0修改失败,1修改成功
	 * */
	public int updateTeacherInfo(Teacher teacher) {
		String sql = "update teacher set teacherName=?,teacherPassword=?,ResearchDirection=?,teacherSex=?,title=? where teacherNo=?";
		int flag = jdbcTemplate.update(sql, teacher.getTeacherName(), teacher.getTeacherPassword(),
				teacher.getResearchDirection(), teacher.getTeacherSex(), teacher.getTitle(),
				teacher.getTeacherNo());
		if (flag > 0)
			return 1;
		return 0;

	}

}

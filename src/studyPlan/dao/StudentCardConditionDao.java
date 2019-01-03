package studyPlan.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studyPlan.model.CardCondition;
import studyPlan.model.Student;
import studyPlan.model.StudyPlan;
import studyPlan.model.Teacher;

@Repository
public class StudentCardConditionDao {
	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper StudyPlanMapper = BeanPropertyRowMapper.newInstance(StudyPlan.class);
	BeanPropertyRowMapper CardConditionMapper = BeanPropertyRowMapper.newInstance(CardCondition.class);

	/**
	 * @功能:获取教师所有发布的学习计划
	 */
	public StudyPlan[] findStudyPlan(String teacherNo) {
		String sql = "select * from studyPlan where teacherNo=?";
		List<Student> list = jdbcTemplate.query(sql, StudyPlanMapper, teacherNo);
		return list.toArray(new StudyPlan[0]);
	}
   
	/*获取计划学生完成情况*/
	public CardCondition[] findCardCondition(String planNo) {
		String sql = "select * from cardCondition where planNo=?";
		List<Student> list = jdbcTemplate.query(sql, CardConditionMapper, planNo);
		return list.toArray(new CardCondition[0]);
	}

}

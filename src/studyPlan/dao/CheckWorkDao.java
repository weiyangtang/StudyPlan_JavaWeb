package studyPlan.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studyPlan.model.CardCondition;
import studyPlan.model.CheckWork;
import studyPlan.model.PunchCard;
import studyPlan.model.Student;
import studyPlan.model.StudyPlan;

@Repository
public class CheckWorkDao {
	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper CheckWorkMapper = BeanPropertyRowMapper.newInstance(CheckWork.class);
	BeanPropertyRowMapper StudyPlanMapper = BeanPropertyRowMapper.newInstance(StudyPlan.class);

	/**
	 * 
	 * @功能:学生提交成果
	 * @返回值:0失败,1成功
	 */
	public int submitWork(CheckWork checkWork) {
		String sql = "insert checkWork(planNo,studentNo,checkWorkTime,score,studentFile) values(?,?,?,?,?)";
		int flag = jdbcTemplate.update(sql, checkWork.getPlanNo(), checkWork.getStudentNo(),
				checkWork.getCheckWorkTime(), checkWork.getScore(), checkWork.getStudentFile());
		if (flag > 0)
			return 1;
		return 0;
	}

	/**
	 * @功能:按计划类型获取教师所有发布的学习计划
	 */
	public StudyPlan[] findStudyPlan(String teacherNo, String planTypeNo) {
		String sql = "select * from studyPlan where teacherNo=? and planTypeNo=?";
		List<Student> list = jdbcTemplate.query(sql, StudyPlanMapper, teacherNo, planTypeNo);
		return list.toArray(new StudyPlan[0]);
	}

	/**
	 * @功能:按计划编号获取已提交计划成果学生相关信息
	 * 
	 */

	public CheckWork[] findAllSubmitStudent(String planNO) {
		String sql = "select * from studyPlan,checkWork,student where studyPlan.planNo=checkWork.planNo and student.studentNo=checkWork.studentNo and checkWork.planNo=?";
		List<Student> list = jdbcTemplate.query(sql, CheckWorkMapper, planNO);
		return list.toArray(new CheckWork[0]);
	}

	/**
	 * @功能:评分
	 */
	public int CheckWork(int planNO, String studentNo, double score) {
		String sql = "update checkWork set score=? where studentNo=? and planNo=?";
		int flag = jdbcTemplate.update(sql, score, studentNo, planNO);
		if (flag > 0)
			return 1;
		return 0;
	}

	/**
	 * @功能:修改学生积分
	 */
	public int updateStudentCoin(String studentNo, double score) {
		String sql = "update student set coin=? where studentNo=?";
		int flag = jdbcTemplate.update(sql, score, studentNo);
		if (flag > 0)
			return 1;
		return 0;
	}

}

package studyPlan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import studyPlan.model.PlanType;
import studyPlan.model.Student;
import studyPlan.model.StudyPlan;

@Repository
public class PlanPublishDao {
	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper StudyPlanMapper = BeanPropertyRowMapper.newInstance(StudyPlan.class);
	BeanPropertyRowMapper PlanTypeMapper = BeanPropertyRowMapper.newInstance(PlanType.class);
	BeanPropertyRowMapper PlanPublishMapper = BeanPropertyRowMapper.newInstance(PlanPublishDao.class);

	/**
	 * @功能:返回所有学习计划 的类型
	 * 
	 */
	public PlanType[] findAllPlanType() {
		String sql = "select * from planType";
		List<Student> list = jdbcTemplate.query(sql, PlanTypeMapper);
		return list.toArray(new PlanType[0]);
	}

	/**
	 * @功能:添加计划类型
	 * 
	 */
	public int addPlanType(String planTypeName) {
		String sql = "insert planType(planTypeName) values(?)";
		int falg = jdbcTemplate.update(sql, planTypeName);
		if (falg > 0)
			return 1;
		else
			return 0;
	}

	/**
	 * @功能:计划发布
	 * @返回值:自增主键
	 */
	public StudyPlan planPublish(StudyPlan plan) {

		final String sql = "insert studyPlan(planName,planTypeNo,planContext,coinNum,teacherNo,planInfoFile,startTime,endTime) values(?,?,?,?,?,?,?,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// 设置返回的主键字段名
				PreparedStatement ps = (con).prepareStatement(sql, new String[] { "planNo" });
				ps.setString(1, plan.getPlanName());
				ps.setString(2, plan.getPlanTypeNo());
				ps.setString(3, plan.getPlanContext());
				ps.setFloat(4, plan.getCoinNum());
				ps.setString(5, plan.getTeacherNo());
				ps.setString(6, plan.getPlanInfoFile());
				ps.setDate(7, plan.getStartTime());
				ps.setDate(8, plan.getEndTime());
				return ps;
			}
		}, keyHolder);
		int PrimaryKey = keyHolder.getKey().intValue();
		plan.setPlanNo(PrimaryKey);
		return plan;
	}

	/**
	 * @功能:修改学习计划的文件名称,文件为计划编号+文件后缀名
	 */
	public int updatePlan(StudyPlan plan) {

		String sql = "update studyPlan set planInfoFile=? where planNo=?";
		int falg = jdbcTemplate.update(sql, plan.getPlanInfoFile(), plan.getPlanNo());
		if (falg > 0)
			return 1;
		else
			return 0;
	}

}

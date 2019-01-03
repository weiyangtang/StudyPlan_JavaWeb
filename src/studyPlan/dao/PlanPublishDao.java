package studyPlan.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
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

	public PlanType[] findAllPlanType() {
		String sql = "select * from planType";
		List<Student> list = jdbcTemplate.query(sql, PlanTypeMapper);
		return list.toArray(new PlanType[0]);
	}

	public int planPublish(StudyPlan plan) {
		String sql = "insert studyPlan(planName,planTypeNo,planContext,coinNum,teacherNo) values(?,?,?,?,?)";
		int flag = jdbcTemplate.update(sql, plan.getPlanName(), plan.getPlanTypeNo(),plan.getPlanContext(), plan.getCoinNum(),plan.getTeacherNo());
		if (flag > 0)
			return 1;
		return 0;
	}

}

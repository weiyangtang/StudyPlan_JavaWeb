package studyPlan.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studyPlan.model.CardCondition;
import studyPlan.model.PunchCard;
import studyPlan.model.Student;
import studyPlan.model.StudentPlanSelection;
import studyPlan.model.StudyPlanInfo;

@Repository
public class PunchCardDao {
	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper PunchCardMapper = BeanPropertyRowMapper.newInstance(PunchCard.class);
	BeanPropertyRowMapper CardConditionMapper = BeanPropertyRowMapper.newInstance(CardCondition.class);

	/**
	 * 
	 * @功能:查询今日是否已打卡
	 * @返回值:0 表示未打卡,1 已经打卡
	 */
	public int findTodayPunchCard(PunchCard punchCard) {
		String sql = "select *  from punchCard where studentNo=? and planNo=? and punchCardTime=?";
		List<StudentPlanSelection> list = jdbcTemplate.query(sql, PunchCardMapper, punchCard.getStudentNo(),
				punchCard.getPlanNo(), punchCard.getPunchCardTime());
		if (list == null || list.size() <= 0)
			return 0;
		else
			return 1;
	}

	/**
	 * 
	 * @功能:计划打卡
	 * @返回:0 失败,1成功
	 */
	public int punchCard(PunchCard punchCard) {
		String sql = "insert punchCard(planNo,studentNo,punchCardTime,timeLength) values(?,?,?,?)";
		int flag = jdbcTemplate.update(sql, punchCard.getPlanNo(), punchCard.getStudentNo(),
				punchCard.getPunchCardTime(), punchCard.getTimeLength());
		if (flag > 0)
			return 1;
		return 0;
	}
    /**
     * @功能:返回学生的打卡信息
     * */
	public CardCondition[] studentPunchCondition(String studentNo) {
		String sql = "select * from cardCondition where studentNo=?";
		List<CardCondition> list = jdbcTemplate.query(sql, CardConditionMapper, studentNo);
		return list.toArray(new CardCondition[0]);
	}

}

package studyPlan.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studyPlan.model.PlanType;
import studyPlan.model.Student;
import studyPlan.model.StudentPlanSelection;
import studyPlan.model.StudyPlan;
import studyPlan.model.StudyPlanInfo;
import studyPlan.model.Teacher;

@Repository
public class StudyPlanDao {
	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper studyPlanMapper = BeanPropertyRowMapper.newInstance(StudyPlan.class);
	BeanPropertyRowMapper studyPlanInfoMapper = BeanPropertyRowMapper.newInstance(StudyPlanInfo.class);
	BeanPropertyRowMapper PlanSelectionMapper = BeanPropertyRowMapper.newInstance(StudentPlanSelection.class);
	BeanPropertyRowMapper PlanTypeMapper = BeanPropertyRowMapper.newInstance(PlanType.class);

	/**
	 * @功能:返回所有学习计划 的类型
	 * 
	 */
	public PlanType[] findAllPlanType() {
		String sql = "select * from planType";
		List<Student> list = jdbcTemplate.query(sql, PlanTypeMapper);
		return list.toArray(new PlanType[0]);
	}

	/* 找所有已经发布的计划 */
	public StudyPlan[] findAllStudyPlan() {
		String sql = "select * from studyPlan";
		List<StudyPlan> list = jdbcTemplate.query(sql, studyPlanMapper);
		return list.toArray(new StudyPlan[0]);
	}

	/**
	 * 按照学号查出选择的所有计划
	 */
	public StudyPlan[] findPlanByNumber(int number) {
		String sql = "SELECT * FROM studyPlan WHERE PLANNO IN"
				+ "(SELECT PLANNO FROM studentPlanSelection WHERE STUDENTNO = '" + number + "')";
		List<StudyPlan> list = jdbcTemplate.query(sql, studyPlanMapper);
		return list.toArray(new StudyPlan[0]);
	}

	/**
	 * 查询某计划是否已被学生选择
	 */
	public int findPlanByNumberAndID(int planNo, int number) {
		String sql = "SELECT * FROM studentPlanSelection WHERE planNo='" + planNo + "'AND studentNo='" + number + "'";
		List<StudyPlan> list = jdbcTemplate.query(sql, studyPlanMapper);
		return list.size();
	}

	/**
	 * 
	 * 添加计划
	 * 
	 */
	public int addPlanSelected(int planNo, int num) {
		String sql = "INSERT INTO studentPlanSelection(planNo,studentNo," + "selectionTime) VALUES('" + planNo + "','"
				+ num + "',GETDATE())";
		int ans = 0;
		try {
			ans = jdbcTemplate.update(sql);
		} catch (Exception e) {
			return 0;
		}
		return ans;
	}

	/**
	 * 
	 * 删除计划
	 * 
	 */
	public int plandelete(int planno, int num) {
		// 这里其实该在service层做
		String sql1 = "SELECT planSelectionNo FROM studentPlanSelection " + "WHERE PLANNO ='" + planno
				+ "' AND STUDENTNO ='" + num + "'";
		System.out.println("sql1:" + sql1);
		List<StudentPlanSelection> list = jdbcTemplate.query(sql1, PlanSelectionMapper);
		int ans = 0;
		if (list.get(0) != null) {
			// 查询到该计划时删除该计划的打卡计划
			int PlanSelectionNo = list.get(0).getPlanSelectionNo();
			String sql3 = "SELECT * FROM stageAcceptanceRecord WHERE planSelectionNo = '" + PlanSelectionNo + "'";
			System.out.println("sql3:" + sql3);
			List<StudyPlan> list1 = jdbcTemplate.query(sql3, studyPlanMapper);
			if (list1.size() != 0) {
				// 查询到该计划的打卡情况时删除该打卡情况
				String sql2 = "DELETE stageAcceptanceRecord WHERE planSelectionNo = '" + PlanSelectionNo + "'";
				System.out.println("sql2:" + sql2);
				try {
					ans = jdbcTemplate.update(sql2);
				} catch (Exception e) {
					return 0;
				}
				if (ans == 0) {
					return ans;
				}
			}
		}

		String sql = "DELETE FROM studentPlanSelection WHERE planNo='" + planno + "' AND studentNo='" + num + "'";
		System.out.println(sql);

		try {
			ans = jdbcTemplate.update(sql);
		} catch (Exception e) {
			return 0;
		}
		return ans;
	}

	/**
	 * @功能:返回某个类型的学习计划,按类型查询学习计划
	 * 
	 */
	public StudyPlanInfo[] findStudyPlan(String planTypeNo) {
		String sql = "select * from studyPlanInfo where planTypeNo=?";
		List<StudyPlanInfo> list = jdbcTemplate.query(sql, studyPlanInfoMapper, planTypeNo);
		return list.toArray(new StudyPlanInfo[0]);
	}

	/**
	 * @功能:根据计划编号返回学习计划
	 */
	public StudyPlanInfo findStudyPlanInfo(String planNo) {
		String sql = "select * from studyPlanInfo where planNo=?";
		List<StudyPlanInfo> list = jdbcTemplate.query(sql, studyPlanInfoMapper, planNo);
		if (list == null || list.size() <= 0)
			return null;
		else
			return list.get(0);
	}

	/**
	 * @功能:学生选择学习计划
	 */
	public int planSelection(StudentPlanSelection planSelection) {

		String sql = "insert studentPlanSelection (studentNo,planNo,selectionTime) values(?,?,?)";
		int flag = jdbcTemplate.update(sql, planSelection.getStudentNo(), planSelection.getPlanNo(),
				planSelection.getSelectionTime());
		if (flag > 0)
			return 1;
		return 0;
	}

	/**
	 * @功能:查看是否已经选择过该计划
	 */
	public int checkPlanSelection(StudentPlanSelection planSelection) {

		String sql = "select * from studentPlanSelection where studentNo=? and planNo=?";
		List<StudentPlanSelection> list = jdbcTemplate.query(sql, PlanSelectionMapper, planSelection.getStudentNo(),
				planSelection.getPlanNo());
		if (list == null || list.size() <= 0)
			return 0;
		else
			return 1;
	}
	
	/**
	 * @功能:根据学号查找所有已选的学习计划
	 * */
	public StudyPlanInfo[] findallSelectedPlan(String studentNo) {
		String sql = "select * from studentPlanSelection,studyPlanInfo where studentPlanSelection.planNo=studyPlanInfo.planNo and studentPlanSelection.studentNo=?";
		List<StudyPlanInfo> list = jdbcTemplate.query(sql, studyPlanInfoMapper, studentNo);
		return list.toArray(new StudyPlanInfo[0]);
	}

}

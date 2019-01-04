package studyPlan.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studyPlan.model.StudentPlanSelection;
import studyPlan.model.StudyPlan;

@Repository
public class StudyPlanDao {
	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper mapper = BeanPropertyRowMapper.newInstance(StudyPlan.class);
	BeanPropertyRowMapper mapper1 = BeanPropertyRowMapper.newInstance(StudentPlanSelection.class);
	
	/*找所有已经发布的计划*/
	public StudyPlan[] findAllStudyPlan() {
		String sql = "select * from studyPlan";
		List<StudyPlan> list = jdbcTemplate.query(sql, mapper);
		return list.toArray(new StudyPlan[0]);
	}
	
	/**
	 * 按照学号查出选择的所有计划
	 */
	public StudyPlan[] findPlanByNumber(int number) {
		String sql = "SELECT * FROM studyPlan WHERE PLANNO IN"
				+ "(SELECT PLANNO FROM studentPlanSelection WHERE STUDENTNO = '"+number+"')";
		List<StudyPlan> list = jdbcTemplate.query(sql, mapper);
		return list.toArray(new StudyPlan[0]);
	}
	/**
	 * 查询某计划是否已被学生选择
	 */
	public int findPlanByNumberAndID(int planNo,int number) {
		String sql = "SELECT * FROM studentPlanSelection WHERE planNo='"+planNo+"'AND studentNo='"+number+"'";
		List<StudyPlan> list = jdbcTemplate.query(sql, mapper);
		return list.size();
	}
	/**
	 * 
	 * 添加计划
	 * 
	 */
	public int addPlanSelected(int planNo,int num) {
		String sql = "INSERT INTO studentPlanSelection(planNo,studentNo,"
				+ "selectionTime) VALUES('"+planNo+"','"+num+"',GETDATE())";
		int ans =0;
		try 
		{		
			ans =jdbcTemplate.update(sql);	
		}catch(Exception e) {
			return 0;
		}
		return ans;
	}
	/**
	 * 
	 * 删除计划
	 * 
	 * */
	public int plandelete(int planno,int num){
		//这里其实该在service层做
		String sql1 ="SELECT planSelectionNo FROM studentPlanSelection "
				+ "WHERE PLANNO ='"+planno+"' AND STUDENTNO ='"+num+"'";
		System.out.println("sql1:"+sql1);
		List<StudentPlanSelection> list = jdbcTemplate.query(sql1, mapper1);
		int ans =0;
		if(list.get(0) != null) {
			//查询到该计划时删除该计划的打卡计划
			int PlanSelectionNo = list.get(0).getPlanSelectionNo();
			String sql3 = "SELECT * FROM stageAcceptanceRecord WHERE planSelectionNo = '"+PlanSelectionNo+"'";
			System.out.println("sql3:"+sql3);
			List<StudyPlan> list1 = jdbcTemplate.query(sql3, mapper);
			if (list1.size() != 0) {
				//查询到该计划的打卡情况时删除该打卡情况
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

		
		String sql = "DELETE FROM studentPlanSelection WHERE planNo='"+planno+"' AND studentNo='"+num+"'";
		System.out.println(sql);
		
		try 
		{		
			ans =jdbcTemplate.update(sql);	
		}catch(Exception e) {
			return 0;
		}
		return ans;
	}
}

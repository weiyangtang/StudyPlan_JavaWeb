package studyPlan.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import studyPlan.model.StageAcceptanceRecord;
import studyPlan.model.StudentPlanSelection;
import studyPlan.model.StudyPlan;


@Repository
public class StudentPunchDao {

	@Autowired
	JdbcTemplate jdbcTemplate = null;
	BeanPropertyRowMapper mapper1 = BeanPropertyRowMapper.newInstance(StudentPlanSelection.class);
	BeanPropertyRowMapper mapper = BeanPropertyRowMapper.newInstance(StageAcceptanceRecord.class);
	
	/**
	 * 1.打卡，插入合法数据到stageAcceptanceRecord表中
	 * */
	public int punch(int planNo,int number) {
		String sql1 = "SELECT * FROM studentPlanSelection "
				+ "WHERE STUDENTNO = '"+number+"' AND [planNo]='"+planNo+"'";
		List<StudentPlanSelection> list = jdbcTemplate.query(sql1, mapper1);
		int planSelectionNo = list.get(0).getPlanSelectionNo();
		String sql = "INSERT INTO stageAcceptanceRecord"
				+ "([completionTime],[planSelectionNo]) "
				+ "VALUES(GETDATE(),'"+planSelectionNo+"')";
		int ans =0;
		try 
		{		
			ans =jdbcTemplate.update(sql);	
			System.out.println("插入结果："+ans);

		}catch(Exception e) {
			System.out.println("error");
			return 0;
		}
		return ans;
	}
	
	/**
	 * 2.防止重复打卡，查询当天是否已经插入
	 * */
	public int punchready(int planNo,int number) {
		String sql1 = "SELECT * FROM studentPlanSelection "
				+ "WHERE STUDENTNO = '"+number+"' AND [planNo]='"+planNo+"'";
		List<StudentPlanSelection> list1 = jdbcTemplate.query(sql1, mapper1);
		int planSelectionNo = list1.get(0).getPlanSelectionNo();
		
		String sql ="\r\n" + 
				"SELECT * FROM stageAcceptanceRecord "
				+ "WHERE planSelectionNo ='"+planSelectionNo+"'AND "
				+ "completionTime=CONVERT(varchar(10),GETDATE(),120) ";
		List<StageAcceptanceRecord> list = jdbcTemplate.query(sql, mapper);
		System.out.println(sql);
		System.out.println("查询到的打卡记录："+list.size());
		return list.size();
	}
	
	/**
	 * 
	 * */
	/**
	 * 
	 * */
	
}

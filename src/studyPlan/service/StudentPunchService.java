package studyPlan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studyPlan.dao.StudentPunchDao;
import studyPlan.model.StudyPlan;

@Service

public class StudentPunchService {

	@Autowired
	StudentPunchDao dao =null;

	public int punch(int planNo,int number) {
		int ans = dao.punchready(planNo,number);
		int ans2 = 0;
		if(ans == 0) {
			ans2 = dao.punch(planNo,number);
			return ans2;
		}
		return ans2;
	}
}

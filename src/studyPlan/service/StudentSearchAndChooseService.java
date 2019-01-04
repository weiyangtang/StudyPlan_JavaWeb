package studyPlan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studyPlan.dao.StudyPlanDao;
import studyPlan.model.PlanPublish;
import studyPlan.model.StudyPlan;

@Service
public class StudentSearchAndChooseService {

	@Autowired
	StudyPlanDao dao =null;
	
	public StudyPlan[] findAllStudyPlan() {
		return dao.findAllStudyPlan();
	}
	
	public StudyPlan[] findPlanByNumber(int number) {
		return dao.findPlanByNumber(number);
	}
	
	public int addPlanSelected(int planNo,int num) {
		int ans = dao.findPlanByNumberAndID(planNo, num);
		if(ans == 0) {		
			return dao.addPlanSelected(planNo,num);
		}else {
			return 0;
		}

	}
	
	public int plandelete(int planno,int num) {
		return dao.plandelete(planno, num);
	}
	
}

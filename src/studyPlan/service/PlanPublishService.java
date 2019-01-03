package studyPlan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studyPlan.dao.PlanPublishDao;
import studyPlan.model.PlanType;
import studyPlan.model.StudyPlan;

@Service
public class PlanPublishService {
	@Autowired
	PlanPublishDao planPublishDao = null;

	/**
	 * @功能:找到所有计划类型
	 */
	public PlanType[] findAllPlanType() {
		return planPublishDao.findAllPlanType();
	}

	/**
	 * @功能:教师发布学习计划
	 * */
	public int planPublish(StudyPlan plan) {

		return planPublishDao.planPublish(plan);

	}

}

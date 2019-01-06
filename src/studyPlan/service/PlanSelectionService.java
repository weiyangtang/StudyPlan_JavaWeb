package studyPlan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studyPlan.dao.PlanPublishDao;
import studyPlan.dao.StudyPlanDao;
import studyPlan.model.PlanType;
import studyPlan.model.StudentPlanSelection;
import studyPlan.model.StudyPlan;
import studyPlan.model.StudyPlanInfo;

@Service
public class PlanSelectionService {

	@Autowired
	StudyPlanDao studyPlanDao = null;

	@Autowired
	PlanPublishDao planPublishDao = null;

	/**
	 * @功能:找到所有计划类型
	 */
	public PlanType[] findAllPlanType() {
		return planPublishDao.findAllPlanType();
	}

	/**
	 * @功能:根据计划类型编号找出所有的学习计划
	 * 
	 */
	public StudyPlanInfo[] findStudyPlan(String planTypeNo) {
		return studyPlanDao.findStudyPlan(planTypeNo);
	}

	/**
	 * @功能:安装计划编号查询学习计划
	 * 
	 */
	public StudyPlanInfo findStudyPlanInfo(String planNo) {
		return studyPlanDao.findStudyPlanInfo(planNo);
	}

	/**
	 * @功能:计划选择
	 * @返回值:0失败,已选择过该计划,1选择成功
	 */
	public int planSelection(StudentPlanSelection planSelection) {
		if (studyPlanDao.checkPlanSelection(planSelection) == 0)
			return studyPlanDao.planSelection(planSelection);
		else
			return 0;
	}
	
	/**
	 * @功能:根据学号查找所有已选的学习计划
	 * */
	public StudyPlanInfo[] findallSelectedPlan(String studentNo) {
		return studyPlanDao.findallSelectedPlan(studentNo);
	}

}

package studyPlan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studyPlan.dao.StudentCardConditionDao;
import studyPlan.model.CardCondition;
import studyPlan.model.Student;
import studyPlan.model.StudyPlan;
import studyPlan.model.Teacher;

@Service
public class StudentCardConditionService {
	@Autowired
	StudentCardConditionDao dao = null;

	/**
	 * @功能:获取教师所有发布的学习计划
	 */
	public StudyPlan[] findStudyPlan(String teacherNo) {
		return dao.findStudyPlan(teacherNo);
	}

	/**
	 * 
	 * @功能:获取计划学生完成情况
	 * 
	 */
	public CardCondition[] findCardCondition(String planNo) {
		return dao.findCardCondition(planNo);
	}
}

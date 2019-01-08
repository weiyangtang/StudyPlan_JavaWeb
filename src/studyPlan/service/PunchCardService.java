package studyPlan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studyPlan.dao.PunchCardDao;
import studyPlan.dao.StudentDao;
import studyPlan.model.CardCondition;
import studyPlan.model.PunchCard;

@Service
public class PunchCardService {

	@Autowired
	PunchCardDao punchCardDao = null;

	/**
	 * 
	 * @功能:计划打卡
	 * @返回:0 失败,1成功
	 */
	public int punchCard(PunchCard punchCard) {
		int flag = punchCardDao.findTodayPunchCard(punchCard);
		if (flag == 0)
			return punchCardDao.punchCard(punchCard);
		else
			return 0;
	}
	  /**
     * @功能:返回学生的打卡信息
     * */
	public CardCondition[] studentPunchCondition(String studentNo) {
		return punchCardDao.studentPunchCondition(studentNo);
	}
}

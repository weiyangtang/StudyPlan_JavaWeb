package studyPlan.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import studyPlan.dao.CheckWorkDao;
import studyPlan.dao.StudentDao;
import studyPlan.model.CheckWork;
import studyPlan.model.StudyPlan;
import studyPlan.util.FileUploadUtil;

@Service
public class CheckWorkService {
	@Autowired
	CheckWorkDao checkWorkDao = null;
	@Autowired
	StudentDao studentDao = null;

	/**
	 * 
	 * @功能:学生提交成果
	 * @返回值:0失败,1成功
	 */
	public int submitWork(CheckWork checkWork, MultipartFile uploadFile) {
		//检查是否已提交
		int falg = checkWorkDao.checkStudentSubmit(checkWork.getStudentNo(), checkWork.getPlanNo());
		if (falg == 1)
			return 0;
		String fileExtends = uploadFile.getOriginalFilename()
				.substring(uploadFile.getOriginalFilename().lastIndexOf(".") + 1);
		String fileName = checkWork.getStudentNo() + "." + fileExtends;
		String filePath = System.getProperty("studyPlan.root") + "uploads" + File.separator + "plan" + File.separator
				+ "studyPlan_student" + File.separator + checkWork.getPlanNo() + File.separator + fileName;
		if (FileUploadUtil.FileUpload(uploadFile, filePath) == 0)
			return 0;

		// fileName = checkWork.getPlanNo() + File.separator + fileName;// 计划编号/学号.后缀名
		checkWork.setStudentFile(fileName);
		return checkWorkDao.submitWork(checkWork);
	}

	/**
	 * @功能:按计划类型获取教师所有发布的学习计划
	 */
	public StudyPlan[] findStudyPlan(String teacherNo, String planTypeNo) {
		return checkWorkDao.findStudyPlan(teacherNo, planTypeNo);
	}

	/**
	 * @功能:按计划编号获取已提交计划成果学生相关信息
	 * 
	 */
	public CheckWork[] findAllSubmitStudent(String planNO) {
		return checkWorkDao.findAllSubmitStudent(planNO);
	}

	/**
	 * @功能:评分
	 */

	public int CheckWork(int planNO, String studentNo, double score) {
		checkWorkDao.CheckWork(planNO, studentNo, score);
		double coin = studentDao.findStudent(studentNo).getCoin();
		coin = coin + score;
		return checkWorkDao.updateStudentCoin(studentNo, coin);
	}
	
	/**
	 * @功能:查询每次提交成果的积分信息
	 * @返回值:积分
	 * */
	public CheckWork[] findPersonalSubmitStudent(String studentNo) {
		return checkWorkDao.findPersonalSubmitStudent(studentNo);
	}
}

package studyPlan.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import studyPlan.dao.PlanPublishDao;
import studyPlan.model.PlanType;
import studyPlan.model.StudyPlan;
import studyPlan.util.FileUploadUtil;

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
	 * @步骤:获取计划的自增编号,然后以编号命名文件,将文件名再次存入表中
	 */
	public int planPublish(StudyPlan plan, MultipartFile uploadFile) {
		// 获取了自增主键编号
		plan = planPublishDao.planPublish(plan);
		if (uploadFile == null || uploadFile.getSize() <= 0)
			return 2;
		String fileExtends = uploadFile.getOriginalFilename()
				.substring(uploadFile.getOriginalFilename().lastIndexOf(".") + 1);
		String fileName = plan.getPlanNo() + "." + fileExtends;
		plan.setPlanInfoFile(fileName);
		String filePath = System.getProperty("studyPlan.root") + "uploads" + File.separator + "plan" + File.separator
				+ "studyPlan_teacher" + File.separator + fileName;
		if (FileUploadUtil.FileUpload(uploadFile, filePath) == 0)
			return 0;
		return planPublishDao.updatePlan(plan);
	}

}

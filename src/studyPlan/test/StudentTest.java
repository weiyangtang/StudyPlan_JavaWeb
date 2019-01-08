package studyPlan.test;

import org.springframework.beans.factory.BeanFactory;

import studyPlan.dao.PlanPublishDao;
import studyPlan.dao.StudyPlanDao;
import studyPlan.model.Student;
import studyPlan.model.StudentPlanSelection;
import studyPlan.model.StudyPlan;
import studyPlan.service.StudentService;
import studyPlan.util.SpringUtils;

/**
 * 测试Spring JDBCTemplate配置是否成功
 * 
 * 
 */
public class StudentTest {

	public static void main(String[] args) {
		BeanFactory factory = SpringUtils.getBeanFactory();
		/*
		 * StudentService service = factory.getBean(StudentService.class); Student stu =
		 * service.findStudent("1663710324");
		 * System.out.println(stu.getStudentName()+stu.getMajor());
		 * System.out.println(stu.getStudentPassword());
		 */
		/**
		 * @功能:测试获取自增主键
		 * 
		 */

		PlanPublishDao dao = factory.getBean(PlanPublishDao.class);
		StudyPlan plan = new StudyPlan(0,"1", "考研", 5, "认真准备", "1.txt", "1663710324");
		StudyPlan id=dao.planPublish(plan);
		System.out.println(id.getPlanNo());
		
		
		StudyPlanDao studyPlanDao=factory.getBean(StudyPlanDao.class);
		StudentPlanSelection selection=new StudentPlanSelection();
		selection.setPlanNo(5);
		selection.setStudentNo("16605010203");
	}
}

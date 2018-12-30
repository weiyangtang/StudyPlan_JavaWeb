package studyPlan.test;

import org.springframework.beans.factory.BeanFactory;

import studyPlan.model.Student;
import studyPlan.service.StudentService;
import studyPlan.util.SpringUtils;
/**
 * 测试Spring JDBCTemplate配置是否成功
 * 
 * 
 * */
public class StudentTest {

	public static void main(String[] args) {
		BeanFactory factory = SpringUtils.getBeanFactory();
		StudentService service = factory.getBean(StudentService.class);
		Student stu = service.findStudent("1663710324");
		System.out.println(stu.getStudentName()+stu.getMajor());
		System.out.println(stu.getStudentPassword());
	}
}

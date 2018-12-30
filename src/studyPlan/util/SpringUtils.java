package studyPlan.util;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
public class SpringUtils {
	private final static String BEANS_XML = "beans.xml";
	private static BeanFactory factory = null;
	/**
	 * 禁止实例对象
	 */
	private SpringUtils() {
	}

	static {
		if (factory == null)
			factory = new ClassPathXmlApplicationContext(BEANS_XML);
	}

	public static BeanFactory getBeanFactory() {
		return factory;
	}
}

package studyPlan.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	private DateUtils(){}

	public static Date strToDate(String str,String dateFormat) {
		SimpleDateFormat format = new SimpleDateFormat(dateFormat);
		try {
			Date date = format.parse(str);
			return date;
		} catch (Exception e) {
			return null;
		}
	}
	
	public static final String dateToStr(Date date,String dateFormat){
		SimpleDateFormat format = new SimpleDateFormat(dateFormat);
		String str = format.format(date);
		return str;
	}
}

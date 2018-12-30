package studyPlan.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonUtils {
	private static Gson gson=null;
	private JsonUtils(){}
	static{
		gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").create();	
	}
	
	public static String objectToJson(Object obj){
		String str = gson.toJson(obj, obj.getClass());
		return str;
	}
	

	
	public static Object jsonToObject(String str,Class cls){
		Object obj=gson.fromJson(str,cls);
		return obj;
	}
}

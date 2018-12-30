package studyPlan.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.TimeZone;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.converters.basic.DateConverter;
import com.thoughtworks.xstream.io.xml.DomDriver;

public class XmlUtils {
	private static XStream xStream=null;
	static{
	    xStream=new XStream(new DomDriver("utf-8"));
		xStream.registerConverter(new DateConverter("yyyy-MM-dd HH:mm:ss", null,  
	            TimeZone.getTimeZone("GMT+8")));  
	}
	public static Object loadFromFile(String filePath){
		try {
			InputStream is = new FileInputStream(filePath);
			ObjectInputStream input = xStream.createObjectInputStream(is);
			Object obj=input.readObject();
			is.close();
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void saveToFile(String filePath,Object obj){
		try { 
			OutputStream os = new FileOutputStream(filePath);
			ObjectOutputStream out = xStream.createObjectOutputStream(os);
			out.writeObject(obj);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

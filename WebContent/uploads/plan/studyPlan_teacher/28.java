package studyPlan.util;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @功能:文件上传的简单的封装
 * @注意:不同项目请将地址更改
 */
public class FileUploadUtil {
	private FileUploadUtil() {
	}

	// 项目的根目录
	public static String rootPath = System.getProperty("studyPlan.root") + "uploads" + File.separator;

	/**
	 * @功能:文件上传
	 * @author tangweiyang
	 * @param uploadFile
	 * @return:1成功,0失败
	 */
	public static int FileUpload(MultipartFile uploadFile, String filePath) {

		if (uploadFile == null)
			return 0;
		try {
			File file = new File(filePath);
			FileOutputStream fs = new FileOutputStream(file);
			fs.write(uploadFile.getBytes());
			fs.close();
			System.out.println(filePath);
		} catch (Exception e) {
			return 0;
		}

		return 1;
	}

}

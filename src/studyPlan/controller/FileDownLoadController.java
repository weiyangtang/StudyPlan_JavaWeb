package studyPlan.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownLoadController {

	@RequestMapping(value = { "/download" })
	public ResponseEntity<byte[]> download1(HttpServletRequest request, @RequestParam("fileName") String fileName,
			@RequestParam("fileType") String fileType) throws Exception {
		/* 文件类型:1为教师发布的学习计划相关资料,2为学生提交的学习成果 */
		System.out.println(fileName);
		int typeFile = Integer.parseInt(fileType);
		String filePath = "";
		if (typeFile == 1) {
			filePath = "/uploads/plan/studyPlan_teacher/" + fileName;
		} else if (typeFile == 2) {
			filePath = "/uploads/plan/studyPlan_student/" + fileName;
		}
		System.out.println(filePath);

		// 下载文件路径
		String path = request.getServletContext().getRealPath(filePath);
		System.out.println(path);
		File file = new File(path);
		HttpHeaders headers = new HttpHeaders(); // 下载显示的文件名，解决中文名称乱码问题
		String downloadFielName = new String(fileName.getBytes("UTF-8"), "iso-8859-1"); // 通知浏览器以attachment（下载方式）打开图片
		headers.setContentDispositionFormData("attachment", downloadFielName); // application/octet-stream ：
																				// 二进制流数据（最常见的文件下载）。
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);

	}

}

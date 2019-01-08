package studyPlan.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownLoadController {

	@RequestMapping("/testHttpMessageDown")
	public ResponseEntity<byte[]> download(HttpServletRequest request, @RequestParam("filename") String filename)
			throws IOException {
		File file = new File("E://web03.docx");
		System.out.println(filename);
		byte[] body = null;
		InputStream is = new FileInputStream(file);
		body = new byte[is.available()];
		is.read(body);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.add("Content-Disposition", "attchement;filename=" + file.getName());
		HttpStatus statusCode = HttpStatus.OK;
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
		return entity;
	}

	@RequestMapping("/testdownload")
	public ResponseEntity<byte[]> export(String fileName, String filePath) throws IOException {

		HttpHeaders headers = new HttpHeaders();
		File file = new File(filePath);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = { "/download" })
	public ResponseEntity<byte[]> download1(HttpServletRequest request, @RequestParam("fileName") String fileName,@RequestParam("fileType") String fileType)
			throws Exception {
		System.out.println("qingqiu");

		// 下载文件路径
		String path = request.getServletContext().getRealPath("/uploads/plan/studyPlan_teacher");
		File file = new File(path + File.separator + fileName);
		HttpHeaders headers = new HttpHeaders(); // 下载显示的文件名，解决中文名称乱码问题
		String downloadFielName = new String(fileName.getBytes("UTF-8"), "iso-8859-1"); // 通知浏览器以attachment（下载方式）打开图片
		headers.setContentDispositionFormData("attachment", downloadFielName); // application/octet-stream ：
																				// 二进制流数据（最常见的文件下载）。
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);

	}

}

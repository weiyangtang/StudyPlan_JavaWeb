package studyPlan.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import studyPlan.model.PunchCard;
import studyPlan.service.PunchCardService;

@Controller
public class StudentPunchController {

	@Autowired
	PunchCardService punchCardService = null;

	/**
	 * @功能:返回打卡页面
	 * 
	 */
	@RequestMapping(value = { "/punch" }, method = RequestMethod.GET)
	public String searchandchoose() {
		return "student/studentPunch/punch";
	}

	/**
	 * 
	 * @功能:打卡，把合法数据插入到阶段性打卡表
	 * @查询是否当日已经打卡，一天只允许插入一次
	 * @返回值:返回int
	 * 
	 */
	@RequestMapping(value = { "/punch" }, method = RequestMethod.POST)
	public @ResponseBody int punch(@RequestParam("planNo") String planNo, @RequestParam("timeLength") String timeLength,
			HttpSession session) {
	
		String studentNo = (String) session.getAttribute("studentNo");
		if (studentNo == null)
			return 0;
		Date date = new java.sql.Date(new java.util.Date().getTime());
		int pno = Integer.parseInt(planNo);
		double timeLen = Double.parseDouble(timeLength);

		PunchCard punchCard = new PunchCard(0, pno, studentNo, date, timeLen);
		return punchCardService.punchCard(punchCard);
	}
}

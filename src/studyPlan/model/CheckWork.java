package studyPlan.model;

import java.sql.Date;

public class CheckWork {
	/**
	 * @param checkWorkNo
	 * @param planNo
	 * @param checkWorkTime
	 * @param score
	 * @param studentNo
	 * @param studentFile
	 * @param teacherFile
	 * @param studentName
	 * @param planName
	 */
	public CheckWork(int checkWorkNo, int planNo, Date checkWorkTime, double score, String studentNo,
			String studentFile, String teacherFile, String studentName, String planName) {
		super();
		CheckWorkNo = checkWorkNo;
		this.planNo = planNo;
		this.checkWorkTime = checkWorkTime;
		this.score = score;
		this.studentNo = studentNo;
		this.studentFile = studentFile;
		this.teacherFile = teacherFile;
		this.studentName = studentName;
		this.planName = planName;
	}
	/**
	 * 
	 */
	public CheckWork() {
		super();
	}
	/**
	 * @param checkWorkNo
	 * @param planNo
	 * @param checkWorkTime
	 * @param score
	 * @param studentNo
	 * @param studentFile
	 * @param teacherFile
	 */
	public CheckWork(int checkWorkNo, int planNo, Date checkWorkTime, double score, String studentNo,
			String studentFile, String teacherFile) {
		super();
		CheckWorkNo = checkWorkNo;
		this.planNo = planNo;
		this.checkWorkTime = checkWorkTime;
		this.score = score;
		this.studentNo = studentNo;
		this.studentFile = studentFile;
		this.teacherFile = teacherFile;
	}
	private int CheckWorkNo;
	private int planNo;
	private Date checkWorkTime;
	private double score;
	private String studentNo;
	private String studentFile;
	private String teacherFile;
	private String studentName;
	private String planName;
	public int getCheckWorkNo() {
		return CheckWorkNo;
	}
	public void setCheckWorkNo(int checkWorkNo) {
		CheckWorkNo = checkWorkNo;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public Date getCheckWorkTime() {
		return checkWorkTime;
	}
	public void setCheckWorkTime(Date checkWorkTime) {
		this.checkWorkTime = checkWorkTime;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public String getStudentFile() {
		return studentFile;
	}
	public void setStudentFile(String studentFile) {
		this.studentFile = studentFile;
	}
	public String getTeacherFile() {
		return teacherFile;
	}
	public void setTeacherFile(String teacherFile) {
		this.teacherFile = teacherFile;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}

}

package studyPlan.model;

import java.sql.Date;

public class StudyPlan {
	/**
	 * @param planNo
	 * @param planTypeNo
	 * @param planName
	 * @param coinNum
	 * @param planContext
	 * @param planInfoFile
	 * @param teacherNo
	 * @param startTime
	 * @param endTime
	 */
	public StudyPlan(int planNo, String planTypeNo, String planName, float coinNum, String planContext,
			String planInfoFile, String teacherNo, Date startTime, Date endTime) {
		super();
		this.planNo = planNo;
		this.planTypeNo = planTypeNo;
		this.planName = planName;
		this.coinNum = coinNum;
		this.planContext = planContext;
		this.planInfoFile = planInfoFile;
		this.teacherNo = teacherNo;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	/**
	 * 
	 */
	public StudyPlan() {
		
	}
	/**
	 * @param planNo
	 * @param planTypeNo
	 * @param planName
	 * @param coinNum
	 * @param planContext
	 * @param planInfoFile
	 * @param teacherNo
	 */
	public StudyPlan(int planNo, String planTypeNo, String planName, float coinNum, String planContext,
			String planInfoFile, String teacherNo) {
		super();
		this.planNo = planNo;
		this.planTypeNo = planTypeNo;
		this.planName = planName;
		this.coinNum = coinNum;
		this.planContext = planContext;
		this.planInfoFile = planInfoFile;
		this.teacherNo = teacherNo;
	}

	/**
	 * @param planNo
	 * @param planTypeNo
	 * @param planName
	 * @param coinNum
	 * @param planContext
	 * @param planInfoFile
	 */
	public StudyPlan(int planNo, String planTypeNo, String planName, float coinNum, String planContext,
			String planInfoFile) {
		super();
		this.planNo = planNo;
		this.planTypeNo = planTypeNo;
		this.planName = planName;
		this.coinNum = coinNum;
		this.planContext = planContext;
		this.planInfoFile = planInfoFile;
	}
	
	private int planNo;
	private String planTypeNo;
	private String planName;
	private float coinNum;
	private String planContext;
	private String planInfoFile;
	private String teacherNo;
	private Date startTime;
	private Date endTime;
	
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public String getPlanTypeNo() {
		return planTypeNo;
	}
	public void setPlanTypeNo(String planTypeNo) {
		this.planTypeNo = planTypeNo;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public float getCoinNum() {
		return coinNum;
	}
	public void setCoinNum(float coinNum) {
		this.coinNum = coinNum;
	}
	public String getPlanContext() {
		return planContext;
	}
	public void setPlanContext(String planContext) {
		this.planContext = planContext;
	}
	public String getPlanInfoFile() {
		return planInfoFile;
	}
	public void setPlanInfoFile(String planInfoFile) {
		this.planInfoFile = planInfoFile;
	}
	public String getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(String teacherNo) {
		this.teacherNo = teacherNo;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
}

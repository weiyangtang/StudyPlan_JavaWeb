package studyPlan.model;

import java.sql.Date;

public class StudyPlanInfo {
	/**
	 * @param planNo
	 * @param planName
	 * @param planTypeNo
	 * @param planTypeName
	 * @param planContext
	 * @param planInfoFile
	 * @param teacherName
	 * @param coinNum
	 * @param startTime
	 * @param endTime
	 */
	public StudyPlanInfo(int planNo, String planName, int planTypeNo, String planTypeName, String planContext,
			String planInfoFile, String teacherName, int coinNum, Date startTime, Date endTime) {
		super();
		this.planNo = planNo;
		this.planName = planName;
		this.planTypeNo = planTypeNo;
		this.planTypeName = planTypeName;
		this.planContext = planContext;
		this.planInfoFile = planInfoFile;
		this.teacherName = teacherName;
		this.coinNum = coinNum;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	/**
	 * @param planNo
	 * @param planName
	 * @param planTypeNo
	 * @param planTypeName
	 * @param planContext
	 * @param planInfoFile
	 * @param teacherName
	 * @param coinNum
	 */
	public StudyPlanInfo(int planNo, String planName, int planTypeNo, String planTypeName, String planContext,
			String planInfoFile, String teacherName, int coinNum) {
		super();
		this.planNo = planNo;
		this.planName = planName;
		this.planTypeNo = planTypeNo;
		this.planTypeName = planTypeName;
		this.planContext = planContext;
		this.planInfoFile = planInfoFile;
		this.teacherName = teacherName;
		this.coinNum = coinNum;
	}
	/**
	 * 
	 */
	public StudyPlanInfo() {
		super();
	}
	/**
	 * @param planNo
	 * @param planName
	 * @param planTypeNo
	 * @param planTypeName
	 * @param planContext
	 * @param planInfoFile
	 * @param teacherName
	 */
	public StudyPlanInfo(int planNo, String planName, int planTypeNo, String planTypeName, String planContext,
			String planInfoFile, String teacherName) {
		super();
		this.planNo = planNo;
		this.planName = planName;
		this.planTypeNo = planTypeNo;
		this.planTypeName = planTypeName;
		this.planContext = planContext;
		this.planInfoFile = planInfoFile;
		this.teacherName = teacherName;
	}
	private int planNo;
	private String planName;
	private int planTypeNo;
	private String planTypeName;
	private String planContext;
	private String planInfoFile;
	private String teacherName;
	private int coinNum;
	private Date startTime;
	private Date endTime;
	
	
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public int getPlanTypeNo() {
		return planTypeNo;
	}
	public void setPlanTypeNo(int planTypeNo) {
		this.planTypeNo = planTypeNo;
	}
	public String getPlanTypeName() {
		return planTypeName;
	}
	public void setPlanTypeName(String planTypeName) {
		this.planTypeName = planTypeName;
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
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public int getCoinNum() {
		return coinNum;
	}
	public void setCoinNum(int coinNum) {
		this.coinNum = coinNum;
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

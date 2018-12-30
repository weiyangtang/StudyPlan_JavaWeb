package studyPlan.model;

import java.sql.Date;

public class PlanPublish {
	/**
	 * 
	 */
	public PlanPublish() {
		super();
	}
	/**
	 * @param teacherNo
	 * @param planNo
	 * @param publishTime
	 */
	public PlanPublish(String teacherNo, int planNo, Date publishTime) {
		super();
		this.teacherNo = teacherNo;
		this.planNo = planNo;
		this.publishTime = publishTime;
	}
	private String teacherNo;
	private int planNo;
	private Date publishTime;
	public String getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(String teacherNo) {
		this.teacherNo = teacherNo;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	
}

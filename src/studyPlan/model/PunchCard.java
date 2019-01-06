package studyPlan.model;

import java.sql.Date;

public class PunchCard {
	/**
	 * 
	 */
	public PunchCard() {
		super();
	}
	/**
	 * @param punchCardNo
	 * @param planNo
	 * @param studentNo
	 * @param punchCardTime
	 * @param timeLength
	 */
	public PunchCard(int punchCardNo, int planNo, String studentNo, Date punchCardTime, double timeLength) {
		super();
		this.punchCardNo = punchCardNo;
		this.planNo = planNo;
		this.studentNo = studentNo;
		this.punchCardTime = punchCardTime;
		this.timeLength = timeLength;
	}
	private int punchCardNo;
	private int planNo;
	private String studentNo;
	private Date punchCardTime;
	private double timeLength;
	public int getPunchCardNo() {
		return punchCardNo;
	}
	public void setPunchCardNo(int punchCardNo) {
		this.punchCardNo = punchCardNo;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public String getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public Date getPunchCardTime() {
		return punchCardTime;
	}
	public void setPunchCardTime(Date punchCardTime) {
		this.punchCardTime = punchCardTime;
	}
	public double getTimeLength() {
		return timeLength;
	}
	public void setTimeLength(double timeLength) {
		this.timeLength = timeLength;
	}

}

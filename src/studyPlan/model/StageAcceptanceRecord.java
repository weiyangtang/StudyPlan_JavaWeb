package studyPlan.model;

import java.sql.Date;

public class StageAcceptanceRecord {
	/**
	 * @param stageCardNo
	 * @param completionStatus
	 * @param completionTime
	 * @param planSelectionNo
	 * @param timeLength
	 */
	public StageAcceptanceRecord(int stageCardNo, String completionStatus, Date completionTime, int planSelectionNo,
			double timeLength) {
		super();
		this.stageCardNo = stageCardNo;
		this.completionStatus = completionStatus;
		this.completionTime = completionTime;
		this.planSelectionNo = planSelectionNo;
		this.timeLength = timeLength;
	}
	/**
	 * 
	 */
	public StageAcceptanceRecord() {
		super();
	}
	/**
	 * @param stageCardNo
	 * @param completionStatus
	 * @param completionTime
	 * @param planSelectionNo
	 */
	public StageAcceptanceRecord(int stageCardNo, String completionStatus, Date completionTime,
			int planSelectionNo) {
		super();
		this.stageCardNo = stageCardNo;
		this.completionStatus = completionStatus;
		this.completionTime = completionTime;
		this.planSelectionNo = planSelectionNo;
	}
	private int stageCardNo;
	private String completionStatus;
	private Date completionTime;
	private int planSelectionNo;
	private double timeLength;
	
	public int getStageCardNo() {
		return stageCardNo;
	}
	public void setStageCardNo(int stageCardNo) {
		this.stageCardNo = stageCardNo;
	}
	public String getCompletionStatus() {
		return completionStatus;
	}
	public void setCompletionStatus(String completionStatus) {
		this.completionStatus = completionStatus;
	}
	public Date getCompletionTime() {
		return completionTime;
	}
	public void setCompletionTime(Date completionTime) {
		this.completionTime = completionTime;
	}
	public int getPlanSelectionNo() {
		return planSelectionNo;
	}
	public void setPlanSelectionNo(int planSelectionNo) {
		this.planSelectionNo = planSelectionNo;
	}
	public double getTimeLength() {
		return timeLength;
	}
	public void setTimeLength(double timeLength) {
		this.timeLength = timeLength;
	}
}

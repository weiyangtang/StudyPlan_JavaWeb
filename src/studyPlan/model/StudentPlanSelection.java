package studyPlan.model;

import java.sql.Date;

public class StudentPlanSelection {
	/**
	 * 
	 */
	public StudentPlanSelection() {
		super();
	}
	/**
	 * @param planSelectionNo
	 * @param planNo
	 * @param studentNo
	 * @param selectionTime
	 */
	public StudentPlanSelection(int planSelectionNo, int planNo, String studentNo, Date selectionTime) {
		super();
		this.planSelectionNo = planSelectionNo;
		this.planNo = planNo;
		this.studentNo = studentNo;
		this.selectionTime = selectionTime;
	}
	private int planSelectionNo;
	private int planNo;
	private String studentNo;
	private Date selectionTime;

	public int getPlanSelectionNo() {
		return planSelectionNo;
	}

	public void setPlanSelectionNo(int planSelectionNo) {
		this.planSelectionNo = planSelectionNo;
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

	public Date getSelectionTime() {
		return selectionTime;
	}

	public void setSelectionTime(Date selectionTime) {
		this.selectionTime = selectionTime;
	}

}

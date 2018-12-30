package studyPlan.model;

public class PlanType {
	/**
	 * 
	 */
	public PlanType() {
		super();
	}
	/**
	 * @param planTypeNo
	 * @param planTypeName
	 */
	public PlanType(int planTypeNo, String planTypeName) {
		super();
		this.planTypeNo = planTypeNo;
		this.planTypeName = planTypeName;
	}
	private int planTypeNo;
	private String planTypeName;
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
}

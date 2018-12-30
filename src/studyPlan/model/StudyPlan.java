package studyPlan.model;

public class StudyPlan {
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
	
}

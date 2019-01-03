package studyPlan.model;

public class CardCondition {
	/**
	 * 
	 */
	public CardCondition() {
		super();
	}
	/**
	 * @param planNo
	 * @param planName
	 * @param studentNo
	 * @param studentName
	 * @param cardNum
	 */
	public CardCondition(String planNo, String planName, String studentNo, String studentName, int cardNum) {
		super();
		this.planNo = planNo;
		this.planName = planName;
		this.studentNo = studentNo;
		this.studentName = studentName;
		this.cardNum = cardNum;
	}
	private String planNo;
	private String planName;
	private String studentNo;
	private String studentName;
	private int cardNum;
	public String getPlanNo() {
		return planNo;
	}
	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public int getCardNum() {
		return cardNum;
	}
	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}

}

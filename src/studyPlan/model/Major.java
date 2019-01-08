package studyPlan.model;

public class Major {
	
	/**
	 * 
	 */
	public Major() {
		super();
	}
	/**
	 * @param majorId
	 * @param major
	 */
	public Major(int majorId, String major) {
		super();
		this.majorId = majorId;
		this.major = major;
	}
	private int majorId;
	private String major;
	public int getMajorId() {
		return majorId;
	}
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}

}

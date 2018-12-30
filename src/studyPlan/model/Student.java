package studyPlan.model;

public class Student {

	private String studentNo;
	private String studentName;
	private String studentPassword;
	private String major;
	private double coin;
	private String studentSex;
	private String headImage;
	
	/**
	 * 
	 */
	public Student() {
	}
	/**
	 * @param studentNo
	 * @param studentName
	 * @param studentPassword
	 * @param major
	 * @param coin
	 * @param studentSex
	 * @param headImage
	 */
	public Student(String studentNo, String studentName, String studentPassword, String major, double coin,
			String studentSex, String headImage) {
		super();
		this.studentNo = studentNo;
		this.studentName = studentName;
		this.studentPassword = studentPassword;
		this.major = major;
		this.coin = coin;
		this.studentSex = studentSex;
		this.headImage = headImage;
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
	public String getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public double getCoin() {
		return coin;
	}
	public void setCoin(double coin) {
		this.coin = coin;
	}
	public String getStudentSex() {
		return studentSex;
	}
	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}
	public String getHeadImage() {
		return headImage;
	}
	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}
	
	

}

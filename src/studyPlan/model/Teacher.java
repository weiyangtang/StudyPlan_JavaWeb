package studyPlan.model;

public class Teacher {
	/**
	 * 
	 */
	public Teacher() {
		super();
	}
	/**
	 * @param teacherNo
	 * @param teacherName
	 * @param teacherPassword
	 * @param teacherSex
	 * @param title
	 * @param researchDirection
	 * @param headImage
	 */
	public Teacher(String teacherNo, String teacherName, String teacherPassword, String teacherSex, String title,
			String researchDirection, String headImage) {
		super();
		this.teacherNo = teacherNo;
		this.teacherName = teacherName;
		this.teacherPassword = teacherPassword;
		this.teacherSex = teacherSex;
		this.title = title;
		ResearchDirection = researchDirection;
		this.headImage = headImage;
	}
	private String teacherNo;
	private String teacherName;
	private String teacherPassword;
	private String teacherSex;
	private String title;
	private String ResearchDirection;
	private String headImage;
	
	public String getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(String teacherNo) {
		this.teacherNo = teacherNo;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherPassword() {
		return teacherPassword;
	}
	public void setTeacherPassword(String teacherPassword) {
		this.teacherPassword = teacherPassword;
	}
	public String getTeacherSex() {
		return teacherSex;
	}
	public void setTeacherSex(String teacherSex) {
		this.teacherSex = teacherSex;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getResearchDirection() {
		return ResearchDirection;
	}
	public void setResearchDirection(String researchDirection) {
		ResearchDirection = researchDirection;
	}
	public String getHeadImage() {
		return headImage;
	}
	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

}

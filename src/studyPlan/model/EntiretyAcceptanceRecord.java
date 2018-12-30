package studyPlan.model;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class EntiretyAcceptanceRecord {
	/**
	 * 
	 */
	public EntiretyAcceptanceRecord() {
		super();
	}
	/**
	 * @param acceptionNo
	 * @param acceptionTime
	 * @param score
	 * @param comment
	 * @param commentFile
	 * @param planSelectionNo
	 */
	public EntiretyAcceptanceRecord(int acceptionNo, Date acceptionTime, float score, String comment,
			String commentFile, int planSelectionNo) {
		super();
		this.acceptionNo = acceptionNo;
		this.acceptionTime = acceptionTime;
		this.score = score;
		this.comment = comment;
		this.commentFile = commentFile;
		this.planSelectionNo = planSelectionNo;
	}
	private int acceptionNo;
	private Date acceptionTime;
	private float score;
	private String comment;
	private String commentFile;
	private int planSelectionNo;
	public int getAcceptionNo() {
		return acceptionNo;
	}
	public void setAcceptionNo(int acceptionNo) {
		this.acceptionNo = acceptionNo;
	}
	public Date getAcceptionTime() {
		return acceptionTime;
	}
	public void setAcceptionTime(Date acceptionTime) {
		this.acceptionTime = acceptionTime;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommentFile() {
		return commentFile;
	}
	public void setCommentFile(String commentFile) {
		this.commentFile = commentFile;
	}
	public int getPlanSelectionNo() {
		return planSelectionNo;
	}
	public void setPlanSelectionNo(int planSelectionNo) {
		this.planSelectionNo = planSelectionNo;
	}
}

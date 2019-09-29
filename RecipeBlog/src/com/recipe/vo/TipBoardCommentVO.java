package com.recipe.vo;

import java.sql.Timestamp;

public class TipBoardCommentVO {
	private int reNum;
	private String name;
	private String content;
	private Timestamp reDate;
	private int num;
	
	public int getReNum() {
		return reNum;
	}
	public void setReNum(int reNum) {
		this.reNum = reNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReDate() {
		return reDate;
	}
	public void setReDate(Timestamp reDate) {
		this.reDate = reDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TipBoardCommentVO [reNum=").append(reNum).append(", name=").append(name).append(", content=")
				.append(content).append(", reDate=").append(reDate).append(", num=").append(num).append("]");
		return builder.toString();
	}
}

package com.care.root.suggestion.dto;

import java.sql.Timestamp;

public class SuggestionDTO {
	private int num;
	private String suggTitle;
	private String suggContent;
	private String suggId;
	private Timestamp suggTime;
	private String suggStatus;
	private String answContent;
	private Timestamp answTime;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSuggTitle() {
		return suggTitle;
	}

	public void setSuggTitle(String suggTitle) {
		this.suggTitle = suggTitle;
	}

	public String getSuggContent() {
		return suggContent;
	}

	public void setSuggContent(String suggContent) {
		this.suggContent = suggContent;
	}

	public String getSuggId() {
		return suggId;
	}

	public void setSuggId(String suggId) {
		this.suggId = suggId;
	}

	public Timestamp getSuggTime() {
		return suggTime;
	}

	public void setSuggTime(Timestamp suggTime) {
		this.suggTime = suggTime;
	}

	public String getSuggStatus() {
		return suggStatus;
	}

	public void setSuggStatus(String suggStatus) {
		this.suggStatus = suggStatus;
	}

	public String getAnswContent() {
		return answContent;
	}

	public void setAnswContent(String answContent) {
		this.answContent = answContent;
	}

	public Timestamp getAnswTime() {
		return answTime;
	}

	public void setAnswTime(Timestamp answTime) {
		this.answTime = answTime;
	}
}

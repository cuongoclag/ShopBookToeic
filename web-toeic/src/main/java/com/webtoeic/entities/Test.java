package com.webtoeic.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class Test {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "testId", nullable = false)
	private Integer testId;


	@Column(name = "testTitle")
	private String testTitle;

	@Column(name = "testImage")
	private String testImage;



	public Test() {

	}

	public Test(Integer testId, String testTitle, String testImage) {
		super();
		this.testId = testId;
		this.testTitle = testTitle;
		this.testImage = testImage;
	}

	public Integer getTestId() {
		return testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	public String getTestTitle() {
		return testTitle;
	}

	public void setTestTitle(String testTitle) {
		this.testTitle = testTitle;
	}

	public String getTestImage() {
		return testImage;
	}

	public void setTestImage(String testImage) {
		this.testImage = testImage;
	}


}

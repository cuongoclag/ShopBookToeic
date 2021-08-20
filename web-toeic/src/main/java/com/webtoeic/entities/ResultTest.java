package com.webtoeic.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class ResultTest {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ketquaid", nullable = false)
	private Integer resultId;

	@Column(name = "numberCorrectAnswers")
	private int numberCorrectAnswers;

	@Column(name = "numberWrongAnswers")
	private int numberWrongAnswers;

	@Column(name = "time")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+7")
	private Date dayTest;


	@Column(name = "correctRead")
	private int correctReading;

	@Column(name = "correctListen")
	private int correctListen;

	@ManyToOne
	@JoinColumn(name="userId",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private NguoiDung nguoidung;

	@ManyToOne
	@JoinColumn(name="testId",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private Test test;
	public ResultTest() {
	}

	public ResultTest(Integer resultId, int numberCorrectAnswers, int numberWrongAnswers, Date dayTest, int correctReading, int correctListen, NguoiDung nguoidung, Test test) {
		this.resultId = resultId;
		this.numberCorrectAnswers = numberCorrectAnswers;
		this.numberWrongAnswers = numberWrongAnswers;
		this.dayTest = dayTest;
		this.correctReading = correctReading;
		this.correctListen = correctListen;
		this.nguoidung = nguoidung;
		this.test = test;
	}

	public Integer getResultId() {
		return resultId;
	}

	public void setResultId(Integer resultId) {
		this.resultId = resultId;
	}

	public int getNumberCorrectAnswers() {
		return numberCorrectAnswers;
	}

	public void setNumberCorrectAnswers(int numberCorrectAnswers) {
		this.numberCorrectAnswers = numberCorrectAnswers;
	}

	public int getNumberWrongAnswers() {
		return numberWrongAnswers;
	}

	public void setNumberWrongAnswers(int numberWrongAnswers) {
		this.numberWrongAnswers = numberWrongAnswers;
	}

	public Date getDayTest() {
		return dayTest;
	}

	public void setDayTest(Date dayTest) {
		this.dayTest = dayTest;
	}

	public int getCorrectReading() {
		return correctReading;
	}

	public void setCorrectReading(int correctReading) {
		this.correctReading = correctReading;
	}

	public int getCorrectListen() {
		return correctListen;
	}

	public void setCorrectListen(int correctListen) {
		this.correctListen = correctListen;
	}

	public NguoiDung getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(NguoiDung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}
}

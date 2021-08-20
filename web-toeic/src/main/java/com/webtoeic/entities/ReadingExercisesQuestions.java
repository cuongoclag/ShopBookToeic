package com.webtoeic.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;



@Entity
public class ReadingExercisesQuestions {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String numericalOrder;
	@Column(columnDefinition = "TEXT")
	private String questions;


	private String answer_1;
	private String answer_2;
	private String answer_3;
	private String answer_4;
	private String correctAnswer;
	private String explains;

	@Column(columnDefinition = "TEXT")
	private String paragraph;


	@ManyToOne
	@JoinColumn(name = "readingExerciseId")
	private ReadingExercises readingExercises;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNumericalOrder() {
		return numericalOrder;
	}

	public void setNumericalOrder(String numericalOrder) {
		this.numericalOrder = numericalOrder;
	}

	public String getExplains() {
		return explains;
	}

	public void setExplains(String explains) {
		this.explains = explains;
	}

	public String getParagraph() {
		return paragraph;
	}

	public void setParagraph(String paragraph) {
		this.paragraph = paragraph;
	}

	public String getAnswer_1() {
		return answer_1;
	}

	public void setAnswer_1(String answer_1) {
		this.answer_1 = answer_1;
	}

	public String getAnswer_2() {
		return answer_2;
	}

	public void setAnswer_2(String answer_2) {
		this.answer_2 = answer_2;
	}

	public String getAnswer_3() {
		return answer_3;
	}

	public void setAnswer_3(String answer_3) {
		this.answer_3 = answer_3;
	}

	public String getAnswer_4() {
		return answer_4;
	}

	public void setAnswer_4(String answer_4) {
		this.answer_4 = answer_4;
	}

	public String getQuestions() {
		return questions;
	}

	public void setQuestions(String questions) {
		this.questions = questions;
	}

	public String getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public ReadingExercises getReadingExercises() {
		return readingExercises;
	}

	public void setReadingExercises(ReadingExercises readingExercises) {
		this.readingExercises = readingExercises;
	}

	@Override
	public String toString() {
		return "CauHoiBaiTapDoc [id=" + id + ", numericalOrder=" + numericalOrder + ", questions=" + questions + ",  paragraph=" + paragraph + ", answer_1=" + answer_1 + ", answer_2=" + answer_2
				+ ", answer_3=" + answer_3 + ", answer_4=" + answer_4 + ", correctAnswer=" + correctAnswer + ", explains="
				+ explains + "]";
	}
	
	
}

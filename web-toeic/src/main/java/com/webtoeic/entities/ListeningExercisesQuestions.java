package com.webtoeic.entities;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class ListeningExercisesQuestions {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String numericalOrder;
	private String question;
	private String photoName;

	@Transient
	@JsonIgnore
	private byte[] photoData;

	@Column(columnDefinition ="TEXT")
	private String script;

	private String answer_1;
	private String answer_2;
	private String answer_3;
	private String answer_4;
	private String correctAnswer;

	@Column(columnDefinition = "TEXT")
	private String explains;

	@ManyToOne
	@JoinColumn(name = "listeningExercisesId")
	private ListeningExercises listeningExercises;

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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
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

	public String getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public String getExplains() {
		return explains;
	}

	public void setExplains(String explains) {
		this.explains = explains;
	}

	public ListeningExercises getListeningExercises() {
		return listeningExercises;
	}

	public void setListeningExercises(ListeningExercises listeningExercises) {
		this.listeningExercises = listeningExercises;
	}

	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}

	public byte[] getPhotoData() {
		return photoData;
	}

	public void setPhotoData(byte[] photoData) {
		this.photoData = photoData;
	}

	@Override
	public String toString() {
		return "CauHoiBaiTapNghe [id=" + id + ", numericalOrder=" + numericalOrder + ", question=" + question + ", photoName=" + photoName + ", photoData="
				+ Arrays.toString(photoData) + ", answer_1=" + answer_1 + ", answer_2=" + answer_2 + ", answer_3=" + answer_3 + ", answer_4=" + answer_4
				+ ", correctAnswer=" + correctAnswer + ", explains=" + explains + "]";
	}

}

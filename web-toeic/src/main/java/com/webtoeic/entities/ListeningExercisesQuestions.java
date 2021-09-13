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
	private Integer id;
	@Column(name = "number")
	private Integer number;

	@Column(name = "image")
	private String image;

	@Column(name = "audiomp3")
	private String audiomp3;

	@Column(columnDefinition = "TEXT")
	private String question;

	private String answer_1;
	private String answer_2;
	private String answer_3;
	private String answer_4;
	private String correctAnswer;
	private String answerUser;

	@ManyToOne
	@JoinColumn(name = "listeningExercisesId")
	private ListeningExercises listeningExercises;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAudiomp3() {
		return audiomp3;
	}

	public void setAudiomp3(String audiomp3) {
		this.audiomp3 = audiomp3;
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

	public String getAnswerUser() {
		return answerUser;
	}

	public void setAnswerUser(String answerUser) {
		this.answerUser = answerUser;
	}

	public ListeningExercises getListeningExercises() {
		return listeningExercises;
	}

	public void setListeningExercises(ListeningExercises listeningExercises) {
		this.listeningExercises = listeningExercises;
	}

	public ListeningExercisesQuestions() {
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public ListeningExercisesQuestions(Integer id, Integer number, String image, String audiomp3, String question, String answer_1, String answer_2, String answer_3, String answer_4, String correctAnswer, String answerUser, ListeningExercises listeningExercises) {
		this.id = id;
		this.number = number;
		this.image = image;
		this.audiomp3 = audiomp3;
		this.question = question;
		this.answer_1 = answer_1;
		this.answer_2 = answer_2;
		this.answer_3 = answer_3;
		this.answer_4 = answer_4;
		this.correctAnswer = correctAnswer;
		this.answerUser = answerUser;
		this.listeningExercises = listeningExercises;
	}
}

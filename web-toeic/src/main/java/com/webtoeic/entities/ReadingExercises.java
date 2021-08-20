package com.webtoeic.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class ReadingExercises {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String listeningTitle;

	private int difficult; // 1: dễ, 2:trung bình, 3: khó

	@Transient
	@JsonIgnore
	private MultipartFile listeningPhoto; // ảnh bài nghe nếu có

	private int part; // phần 1,2,3,4 ?

	@JsonIgnore
	@Transient
	private MultipartFile audio; // audio bài nghe

	@JsonIgnore
	@Transient
	private MultipartFile fileExcelQuestions;

	@Column(columnDefinition = "TEXT")
	private String script; // chi tiết bài nghe

	@OneToMany(mappedBy = "listeningExercises", cascade = CascadeType.ALL)
	@JsonBackReference
	List<ListeningExercisesQuestions> listListeningExercisesQuestions;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getListeningTitle() {
		return listeningTitle;
	}

	public void setListeningTitle(String listeningTitle) {
		this.listeningTitle = listeningTitle;
	}

	public MultipartFile getListeningPhoto() {
		return listeningPhoto;
	}

	public void setListeningPhoto(MultipartFile listeningPhoto) {
		this.listeningPhoto = listeningPhoto;
	}

	public MultipartFile getAudio() {
		return audio;
	}

	public void setAudio(MultipartFile audio) {
		this.audio = audio;
	}

	public List<ListeningExercisesQuestions> getListListeningExercisesQuestions() {
		return listListeningExercisesQuestions;
	}

	public void setListListeningExercisesQuestions(List<ListeningExercisesQuestions> listListeningExercisesQuestions) {
		this.listListeningExercisesQuestions = listListeningExercisesQuestions;
	}

	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}

	public MultipartFile getFileExcelQuestions() {
		return fileExcelQuestions;
	}

	public void setFileExcelQuestions(MultipartFile fileExcelQuestions) {
		this.fileExcelQuestions = fileExcelQuestions;
	}

	public int getDifficult() {
		return difficult;
	}

	public void setDifficult(int difficult) {
		this.difficult = difficult;
	}

	public int getPart() {
		return part;
	}

	public void setPart(int part) {
		this.part = part;
	}

	@Override
	public String toString() {
		return "ListeningExercises listeningTitle=" + listeningTitle;
	}
}

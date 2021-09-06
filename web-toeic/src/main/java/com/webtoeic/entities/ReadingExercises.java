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
	private Integer id;
	private String readingTitle;

	private int difficult; // 1: dễ, 2:trung bình, 3: khó

	@Transient
	@JsonIgnore
	private MultipartFile readingPhoto; // ảnh bài nghe nếu có

	private int part; // phần 1,2,3,4 ?

	@JsonIgnore
	@Transient
	private MultipartFile audio; // audio bài nghe

	@JsonIgnore
	@Transient
	private MultipartFile fileExcelQuestions;

	@OneToMany(mappedBy = "readingExercises", cascade = CascadeType.ALL)
	@JsonBackReference
	List<ReadingExercisesQuestions> readingExercisesQuestions;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReadingTitle() {
		return readingTitle;
	}

	public void setReadingTitle(String readingTitle) {
		this.readingTitle = readingTitle;
	}

	public int getDifficult() {
		return difficult;
	}

	public void setDifficult(int difficult) {
		this.difficult = difficult;
	}

	public MultipartFile getReadingPhoto() {
		return readingPhoto;
	}

	public void setReadingPhoto(MultipartFile readingPhoto) {
		this.readingPhoto = readingPhoto;
	}

	public int getPart() {
		return part;
	}

	public void setPart(int part) {
		this.part = part;
	}

	public MultipartFile getAudio() {
		return audio;
	}

	public void setAudio(MultipartFile audio) {
		this.audio = audio;
	}

	public MultipartFile getFileExcelQuestions() {
		return fileExcelQuestions;
	}

	public void setFileExcelQuestions(MultipartFile fileExcelQuestions) {
		this.fileExcelQuestions = fileExcelQuestions;
	}

	public List<ReadingExercisesQuestions> getReadingExercisesQuestions() {
		return readingExercisesQuestions;
	}

	public void setReadingExercisesQuestions(List<ReadingExercisesQuestions> readingExercisesQuestions) {
		this.readingExercisesQuestions = readingExercisesQuestions;
	}
	@Override
	public String toString() {
		return "ReadingExercises readingTitle=" + readingTitle;
	}
}

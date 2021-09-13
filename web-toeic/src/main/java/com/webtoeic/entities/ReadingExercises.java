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

	private String readingImage;


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

	public String getReadingImage() {
		return readingImage;
	}

	public void setReadingImage(String readingImage) {
		this.readingImage = readingImage;
	}

	@Override
	public String toString() {
		return "ReadingExercises readingTitle=" + readingTitle;
	}
}

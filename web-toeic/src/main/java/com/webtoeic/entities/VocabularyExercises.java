package com.webtoeic.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
public class VocabularyExercises {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false)
	private Integer id;

	private String vocabularyTitle;
	private String vocabularyImage;

	public VocabularyExercises() {}

	public VocabularyExercises(Integer id, String vocabularyTitle, String vocabularyImage) {
		this.id = id;
		this.vocabularyTitle = vocabularyTitle;
		this.vocabularyImage = vocabularyImage;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVocabularyTitle() {
		return vocabularyTitle;
	}

	public void setVocabularyTitle(String vocabularyTitle) {
		this.vocabularyTitle = vocabularyTitle;
	}

	public String getVocabularyImage() {
		return vocabularyImage;
	}

	public void setVocabularyImage(String vocabularyImage) {
		this.vocabularyImage = vocabularyImage;
	}
	
}

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

public class CommentVocabulary {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false)
	private Integer cmtId;


	private String cmtVocabularyContent;

	@Column(name = "time")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+7")
	private Date dayComment;

	@Override
	public String toString() {
		return "{"+"\"cmtVocabularyContent\":"+"\""+cmtVocabularyContent+"\""
				+ ","+"\"user\":" + "\""+users.getFullName() +"\""+"}";
	}

	@ManyToOne
	@JoinColumn(name="userId",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private NguoiDung users;

	@ManyToOne
	@JoinColumn(name="vocabularyExercisesId",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private VocabularyExercises vocabularyExercises;


	public CommentVocabulary() {

	}

	public CommentVocabulary(Integer cmtId, String cmtVocabularyContent, Date dayComment, NguoiDung users, VocabularyExercises vocabularyExercises) {
		this.cmtId = cmtId;
		this.cmtVocabularyContent = cmtVocabularyContent;
		this.dayComment = dayComment;
		this.users = users;
		this.vocabularyExercises = vocabularyExercises;
	}

	public Integer getCmtId() {
		return cmtId;
	}

	public void setCmtId(Integer cmtId) {
		this.cmtId = cmtId;
	}

	public String getCmtVocabularyContent() {
		return cmtVocabularyContent;
	}

	public void setCmtVocabularyContent(String cmtVocabularyContent) {
		this.cmtVocabularyContent = cmtVocabularyContent;
	}

	public Date getDayComment() {
		return dayComment;
	}

	public void setDayComment(Date dayComment) {
		this.dayComment = dayComment;
	}

	public NguoiDung getUsers() {
		return users;
	}

	public void setUsers(NguoiDung users) {
		this.users = users;
	}

	public VocabularyExercises getVocabularyExercises() {
		return vocabularyExercises;
	}

	public void setVocabularyExercises(VocabularyExercises vocabularyExercises) {
		this.vocabularyExercises = vocabularyExercises;
	}
}

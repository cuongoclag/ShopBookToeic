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
public class CommentGrammar {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cmtgrammarid", nullable = false)
	private Integer cmtGrammarId;

	@Column(name = "cmtgrammarcontent")
	private String cmtGrammarContent;


	@Column(name = "time")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+7")
	private Date dayComment;

	@ManyToOne
	@JoinColumn(name="id",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private NguoiDung nguoidung;

	@ManyToOne
	@JoinColumn(name="grammarId",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private Grammar grammar;

	public Integer getCmtGrammarId() {
		return cmtGrammarId;
	}

	public void setCmtGrammarId(Integer cmtGrammarId) {
		this.cmtGrammarId = cmtGrammarId;
	}

	public String getCmtGrammarContent() {
		return cmtGrammarContent;
	}

	public void setCmtGrammarContent(String cmtGrammarContent) {
		this.cmtGrammarContent = cmtGrammarContent;
	}

	public Date getDayComment() {
		return dayComment;
	}

	public void setDayComment(Date dayComment) {
		this.dayComment = dayComment;
	}

	public NguoiDung getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(NguoiDung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public Grammar getGrammar() {
		return grammar;
	}

	public void setGrammar(Grammar grammar) {
		this.grammar = grammar;
	}

	public CommentGrammar() {

	}

	@Override
	public String toString() {
		return "{"+"\"cmtgrammarcontent\":"+"\""+cmtGrammarContent+"\""
				+ ","+"\"date\":"+"\""+dayComment+"\""
				+","+"\"nguoidung\":" + "\""+nguoidung.getFullName() +"\""+"}";
	}
	public CommentGrammar(Integer cmtGrammarId, String cmtGrammarContent, Date dayComment, NguoiDung nguoidung, Grammar grammar) {
		this.cmtGrammarId = cmtGrammarId;
		this.cmtGrammarContent = cmtGrammarContent;
		this.dayComment = dayComment;
		this.nguoidung = nguoidung;
		this.grammar = grammar;
	}
}

package com.webtoeic.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class Grammar {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "grammarId", nullable = false)
	private Integer grammarId;
	@Column(name = "grammarTitle")
	private String grammarTitle;
	@Column(name = "grammarImage")
	private String grammarImage;
	@Column(columnDefinition = "TEXT",name="content_HTML")
	private String contentHTML;
	@Column(columnDefinition = "TEXT",name="content_MarkDown")
	private String contentMarkDown;
	public Integer getGrammarId() {
		return grammarId;
	}
	public void setGrammarId(Integer grammarId) {
		this.grammarId = grammarId;
	}
	public String getGrammarTitle() {
		return grammarTitle;
	}
	public void setGrammarTitle(String grammarTitle) {
		this.grammarTitle = grammarTitle;
	}
	public String getGrammarImage() {
		return grammarImage;
	}
	public void setGrammarImage(String grammarImage) {
		this.grammarImage = grammarImage;
	}
	public String getContentHTML() {
		return contentHTML;
	}
	public void setContentHTML(String contentHTML) {
		this.contentHTML = contentHTML;
	}
	public String getContentMarkDown() {
		return contentMarkDown;
	}
	public void setContentMarkDown(String contentMarkDown) {
		this.contentMarkDown = contentMarkDown;
	}

	public Grammar() {
	}
	public Grammar(Integer grammarId, String grammarTitle, String grammarImage, String contentHTML,
				   String contentMarkDown) {
		super();
		this.grammarId = grammarId;
		this.grammarImage = grammarTitle;
		this.grammarImage = grammarImage;
		this.contentHTML = contentHTML;
		this.contentMarkDown = contentMarkDown;
	}
}

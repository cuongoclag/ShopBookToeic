package com.webtoeic.service;

import java.util.List;

import com.webtoeic.entities.Grammar;
import com.webtoeic.entities.CommentGrammar;


public interface CommentGrammarService {
	List<CommentGrammar> findByBaiGrammar(Grammar baigrammar);
	void save(CommentGrammar commentGrammar);
}

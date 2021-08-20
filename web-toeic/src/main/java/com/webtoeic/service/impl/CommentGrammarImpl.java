package com.webtoeic.service.impl;

import java.util.List;

import com.webtoeic.entities.Grammar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.CommentGrammar;
import com.webtoeic.repository.CommentGrammarRepository;
import com.webtoeic.service.CommentGrammarService;

@Service
public class CommentGrammarImpl implements  CommentGrammarService {
	@Autowired
	CommentGrammarRepository commentgrammarRepo;

	@Override
	public List<CommentGrammar> findByBaiGrammar(Grammar grammar){
		return commentgrammarRepo.findByGrammar(grammar);
	}

	@Override
	public void save(CommentGrammar commentGrammar) {
		commentgrammarRepo.save(commentGrammar);

	}
}

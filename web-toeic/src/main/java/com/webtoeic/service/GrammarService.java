package com.webtoeic.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.webtoeic.entities.Grammar;

public interface GrammarService {
	void save(Grammar grammar);
	List<Grammar> getGrammar(int id);
	Page<Grammar> getGrammar(int page, int limit);
	List<Grammar> getAllGrammar();
	void delete(int id);
	List<Grammar> searchListGrammar(String search);
}

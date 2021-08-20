package com.webtoeic.service.impl;

import java.util.List;

import com.webtoeic.entities.Grammar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.webtoeic.repository.GrammarRepository;
import com.webtoeic.service.GrammarService;

@Service
public class GrammarImpl implements GrammarService {
	@Autowired
	GrammarRepository grammarRepository;

	@Override
	public void save(Grammar grammar) {
		grammarRepository.save(grammar);
	}

	@Override
	public List<Grammar> getGrammar(int id){
		return grammarRepository.findBygrammarId(id);
	}

	@Override
	public Page<Grammar> getGrammar(int page, int size){
		return grammarRepository.findAll(PageRequest.of(page, size));

	}

	@Override
	public List<Grammar>getAllGrammar(){
		return grammarRepository.findAll();
	}

	@Override
	public void delete(int id) {
		grammarRepository.deleteById(id);
	}

	@Override
	public List<Grammar> searchListGrammar(String search){
		return grammarRepository.searchGrammar(search);

	}
}

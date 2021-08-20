package com.webtoeic.service.impl;

import java.util.*;

import com.webtoeic.entities.CommentVocabulary;
import com.webtoeic.entities.VocabularyExercises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.repository.CommentVocabularyRepository;
import com.webtoeic.service.CommentVocabularyService;

@Service
public class CommentVocabularyImpl implements CommentVocabularyService {

	@Autowired
	CommentVocabularyRepository commentVocabularyRepository;

	@Override
	public List<CommentVocabulary> findByBaiTapTuVung(VocabularyExercises vocabularyExercises){
		return commentVocabularyRepository.findByVocabularyExercises(vocabularyExercises);
	}

	@Override
	public void save(CommentVocabulary commentVocabulary) {
		commentVocabularyRepository.save(commentVocabulary);

	}
}

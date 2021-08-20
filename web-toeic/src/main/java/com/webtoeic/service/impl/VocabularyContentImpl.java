package com.webtoeic.service.impl;

import java.util.List;

import com.webtoeic.entities.VocabularyExercises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.VocabularyContent;
import com.webtoeic.repository.VocabularyContentRepository;
import com.webtoeic.service.VocabularyContentService;

@Service
public class VocabularyContentImpl implements VocabularyContentService {

	@Autowired
	VocabularyContentRepository vocabularyContentRepository;
	@Override
	public void save(VocabularyContent vocabularyContent) {
		vocabularyContentRepository.save(vocabularyContent);
	}


	@Override
	public void delete(Integer id) {
		vocabularyContentRepository.deleteById(id);
	}


	@Override
	public List<VocabularyContent> getListVocabularyExercises(VocabularyExercises vocabularyExercises){

		return vocabularyContentRepository.findByVocabularyExercises(vocabularyExercises);
	}

}

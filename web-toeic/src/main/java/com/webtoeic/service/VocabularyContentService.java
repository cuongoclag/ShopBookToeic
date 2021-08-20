package com.webtoeic.service;

import java.util.List;

import com.webtoeic.entities.VocabularyContent;
import com.webtoeic.entities.VocabularyExercises;

public interface VocabularyContentService {

	void save(VocabularyContent noidungbaitaptuvung);
	void delete(Integer id);

	List<VocabularyContent> getListVocabularyExercises(VocabularyExercises vocabularyExercises);
	
}

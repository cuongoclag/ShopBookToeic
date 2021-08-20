package com.webtoeic.service;

import java.util.List;
import java.util.Optional;

import com.webtoeic.entities.VocabularyExercises;
import org.springframework.data.domain.Page;


public interface VocabularyExercisesService {

	List<VocabularyExercises> findAll();
	void save(VocabularyExercises vocabularyExercises);
	void delete(Integer id);

	Page<VocabularyExercises> getVocabularyExercises(int page, int limit);

	Optional<VocabularyExercises>  getVocabularyExercisesById(Integer id);

	List<VocabularyExercises> getVocabularyExercises(int id);

	List<VocabularyExercises> searchListVocabularyExercises(String search);

}

package com.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.VocabularyExercises;
import com.webtoeic.entities.VocabularyContent;

@Repository
public interface VocabularyContentRepository extends JpaRepository<VocabularyContent,Integer>{

	List<VocabularyContent> findByVocabularyExercises(VocabularyExercises vocabularyExercises);
	
}

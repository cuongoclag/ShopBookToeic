package com.webtoeic.repository;

import java.util.List;

import com.webtoeic.entities.VocabularyExercises;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VocabularyExercisesRepository extends JpaRepository<VocabularyExercises,Integer> {

	List<VocabularyExercises> findById(int id);

	@Query("select vocab FROM VocabularyExercises vocab WHERE vocab.vocabularyTitle LIKE CONCAT('%',:search,'%')")
	List<VocabularyExercises> searchVocab(@Param("search") String search);
}

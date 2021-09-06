package com.webtoeic.service;


import com.webtoeic.entities.ReadingExercises;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ReadingExercisesService {
	void save(ReadingExercises readingExercises);

	List<ReadingExercises> getReading(int id);

	Page<ReadingExercises> getReading(int page, int limit);

	List<ReadingExercises> getAllReading();

	void delete(int id);
}

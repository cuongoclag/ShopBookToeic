package com.webtoeic.service;

import com.webtoeic.entities.ListeningExercises;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ListeningExercisesService {
	void save(ListeningExercises listeningExercises);

	List<ListeningExercises> getListening(int id);

	Page<ListeningExercises> getListening(int page, int limit);

	List<ListeningExercises> getAllListening();

	void delete(int id);
}

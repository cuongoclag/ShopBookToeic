package com.webtoeic.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.VocabularyExercises;
import com.webtoeic.repository.VocabularyExercisesRepository;
import com.webtoeic.service.VocabularyExercisesService;

@Service
public class VocabularyExercisesImpl implements VocabularyExercisesService {
	@Autowired
	VocabularyExercisesRepository vocabularyExercisesRepository;

	@Override
	public List<VocabularyExercises> findAll(){
		return (List<VocabularyExercises>) vocabularyExercisesRepository.findAll();
	}

	@Override
	public void save(VocabularyExercises baitaptuvung) {
		vocabularyExercisesRepository.save(baitaptuvung);
	}

	@Override
	public void delete(Integer id) {
		vocabularyExercisesRepository.deleteById(id);
	}

	@Override
	public Page<VocabularyExercises> getVocabularyExercises(int page, int size){
		return vocabularyExercisesRepository.findAll(PageRequest.of(page, size));
		//return baitaptuvungRepository.f

	}

	@Override
	public Optional<VocabularyExercises> getVocabularyExercisesById(Integer id) {
		return vocabularyExercisesRepository.findById(id);
	}

	@Override
	public List<VocabularyExercises> getVocabularyExercises(int id){
		return vocabularyExercisesRepository.findById(id);
	}

	@Override
	public List<VocabularyExercises> searchListVocabularyExercises(String search){
		return vocabularyExercisesRepository.searchVocab(search);
	}
}

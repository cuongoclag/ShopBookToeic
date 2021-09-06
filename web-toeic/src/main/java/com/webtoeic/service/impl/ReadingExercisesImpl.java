package com.webtoeic.service.impl;

import com.webtoeic.entities.ListeningExercises;
import com.webtoeic.entities.ReadingExercises;
import com.webtoeic.repository.ListeningExercisesRepository;
import com.webtoeic.repository.ReadingExercisesRepository;
import com.webtoeic.service.ReadingExercisesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReadingExercisesImpl implements ReadingExercisesService {
    @Autowired
    ReadingExercisesRepository readingExercisesRepository;

    @Override
    public void save(ReadingExercises readingExercises) {
        readingExercisesRepository.save(readingExercises);
    }

    @Override
    public List<ReadingExercises> getReading(int id){
        return readingExercisesRepository.findById(id);
    }

    @Override
    public Page<ReadingExercises> getReading(int page, int size){
        return readingExercisesRepository.findAll(PageRequest.of(page, size));

    }
    @Override
    public List<ReadingExercises>getAllReading(){
        return readingExercisesRepository.findAll();
    }

    @Override
    public void delete(int id) {
        readingExercisesRepository.deleteById(id);
    }
}

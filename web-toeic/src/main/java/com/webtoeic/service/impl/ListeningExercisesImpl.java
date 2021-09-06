package com.webtoeic.service.impl;

import com.webtoeic.entities.ListeningExercises;
import com.webtoeic.entities.Test;
import com.webtoeic.repository.ListeningExercisesRepository;
import com.webtoeic.repository.TestRespository;
import com.webtoeic.service.ListeningExercisesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ListeningExercisesImpl implements ListeningExercisesService {
    @Autowired
    ListeningExercisesRepository listeningExercisesRepository;

    @Override
    public void save(ListeningExercises listeningExercises) {
        listeningExercisesRepository.save(listeningExercises);
    }

    @Override
    public List<ListeningExercises> getListening(int id){
        return listeningExercisesRepository.findById(id);
    }

    @Override
    public Page<ListeningExercises> getListening(int page, int size){
        return listeningExercisesRepository.findAll(PageRequest.of(page, size));

    }
    @Override
    public List<ListeningExercises>getAllListening(){
        return listeningExercisesRepository.findAll();
    }

    @Override
    public void delete(int id) {
        listeningExercisesRepository.deleteById(id);
    }
}

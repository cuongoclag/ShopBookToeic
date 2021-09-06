package com.webtoeic.service.impl;

import com.webtoeic.entities.ListeningExercises;
import com.webtoeic.entities.ListeningExercisesQuestions;
import com.webtoeic.entities.ReadingExercises;
import com.webtoeic.entities.ReadingExercisesQuestions;
import com.webtoeic.repository.ReadingExercisesQuestionsRepository;
import com.webtoeic.service.ReadingExercisesQuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Service
public class ReadingExercisesQuestionsImpl implements ReadingExercisesQuestionsService {
    @PersistenceContext
    protected EntityManager entityManager;
    @Autowired
    ReadingExercisesQuestionsRepository readingExercisesQuestionsRepository;

    @Override
    public void save (ReadingExercisesQuestions ReadingQuestions){
        readingExercisesQuestionsRepository.save(ReadingQuestions);
    }
    public List<ReadingExercisesQuestions> findReadingById(int id) {
        String sql = "select * from reading_exercises_questions where reading_exercises_id = '" + id + "'";
        Query query = entityManager.createNativeQuery(sql, ReadingExercisesQuestions.class);
        return query.getResultList();
    }
}

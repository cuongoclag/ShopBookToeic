package com.webtoeic.service.impl;

import com.webtoeic.entities.ListeningExercises;
import com.webtoeic.entities.ListeningExercisesQuestions;
import com.webtoeic.repository.ListeningExercisesQuestionsRepository;
import com.webtoeic.service.ListeningExercisesQuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Service
public class ListeningExercisesQuestionsImpl implements ListeningExercisesQuestionsService {
    @PersistenceContext
    protected EntityManager entityManager;
    @Autowired
    ListeningExercisesQuestionsRepository ListeningQuestionrRepository;

    @Override
    public void save (ListeningExercisesQuestions listeningQuestions){
        ListeningQuestionrRepository.save(listeningQuestions);
    }
    public List<ListeningExercisesQuestions> findListeningById(int id) {
        String sql = "select * from listening_exercises_questions where listening_exercises_id = '" + id + "'";
        Query query = entityManager.createNativeQuery(sql, ListeningExercisesQuestions.class);
        return query.getResultList();
    }
}

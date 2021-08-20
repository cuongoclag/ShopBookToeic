package com.webtoeic.service;

import java.util.List;

import com.webtoeic.entities.CommentVocabulary;
import com.webtoeic.entities.VocabularyExercises;


public interface CommentVocabularyService {

 List<CommentVocabulary> findByBaiTapTuVung(VocabularyExercises baitaptuvung);
 void save(CommentVocabulary commentVocabulary);
 
}

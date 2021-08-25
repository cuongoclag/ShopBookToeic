package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.*;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QReadingExercises is a Querydsl query type for ReadingExercises
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QReadingExercises extends EntityPathBase<ReadingExercises> {

    private static final long serialVersionUID = -1138448565L;

    public static final QReadingExercises readingExercises = new QReadingExercises("readingExercises");

    public final NumberPath<Integer> difficult = createNumber("difficult", Integer.class);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath listeningTitle = createString("listeningTitle");

    public final ListPath<ListeningExercisesQuestions, QListeningExercisesQuestions> listListeningExercisesQuestions = this.<ListeningExercisesQuestions, QListeningExercisesQuestions>createList("listListeningExercisesQuestions", ListeningExercisesQuestions.class, QListeningExercisesQuestions.class, PathInits.DIRECT2);

    public final NumberPath<Integer> part = createNumber("part", Integer.class);

    public final StringPath script = createString("script");

    public QReadingExercises(String variable) {
        super(ReadingExercises.class, forVariable(variable));
    }

    public QReadingExercises(Path<? extends ReadingExercises> path) {
        super(path.getType(), path.getMetadata());
    }

    public QReadingExercises(PathMetadata metadata) {
        super(ReadingExercises.class, metadata);
    }

}


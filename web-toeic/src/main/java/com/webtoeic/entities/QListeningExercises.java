package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.*;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QListeningExercises is a Querydsl query type for ListeningExercises
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QListeningExercises extends EntityPathBase<ListeningExercises> {

    private static final long serialVersionUID = -310750468L;

    public static final QListeningExercises listeningExercises = new QListeningExercises("listeningExercises");

    public final NumberPath<Integer> difficult = createNumber("difficult", Integer.class);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath listeningTitle = createString("listeningTitle");

    public final ListPath<ListeningExercisesQuestions, QListeningExercisesQuestions> listListeningExercisesQuestions = this.<ListeningExercisesQuestions, QListeningExercisesQuestions>createList("listListeningExercisesQuestions", ListeningExercisesQuestions.class, QListeningExercisesQuestions.class, PathInits.DIRECT2);

    public final NumberPath<Integer> part = createNumber("part", Integer.class);

    public final StringPath script = createString("script");

    public QListeningExercises(String variable) {
        super(ListeningExercises.class, forVariable(variable));
    }

    public QListeningExercises(Path<? extends ListeningExercises> path) {
        super(path.getType(), path.getMetadata());
    }

    public QListeningExercises(PathMetadata metadata) {
        super(ListeningExercises.class, metadata);
    }

}


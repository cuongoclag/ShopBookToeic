package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.PathInits;
import com.querydsl.core.types.dsl.StringPath;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QReadingExercisesQuestions is a Querydsl query type for ReadingExercisesQuestions
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QReadingExercisesQuestions extends EntityPathBase<ReadingExercisesQuestions> {

    private static final long serialVersionUID = 870497858L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QReadingExercisesQuestions readingExercisesQuestions = new QReadingExercisesQuestions("readingExercisesQuestions");

    public final StringPath answer_1 = createString("answer_1");

    public final StringPath answer_2 = createString("answer_2");

    public final StringPath answer_3 = createString("answer_3");

    public final StringPath answer_4 = createString("answer_4");

    public final StringPath correctAnswer = createString("correctAnswer");

    public final StringPath explains = createString("explains");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath numericalOrder = createString("numericalOrder");

    public final StringPath paragraph = createString("paragraph");

    public final StringPath questions = createString("questions");

    public final QReadingExercises readingExercises;

    public QReadingExercisesQuestions(String variable) {
        this(ReadingExercisesQuestions.class, forVariable(variable), INITS);
    }

    public QReadingExercisesQuestions(Path<? extends ReadingExercisesQuestions> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QReadingExercisesQuestions(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QReadingExercisesQuestions(PathMetadata metadata, PathInits inits) {
        this(ReadingExercisesQuestions.class, metadata, inits);
    }

    public QReadingExercisesQuestions(Class<? extends ReadingExercisesQuestions> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.readingExercises = inits.isInitialized("readingExercises") ? new QReadingExercises(forProperty("readingExercises")) : null;
    }

}


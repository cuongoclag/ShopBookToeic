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
 * QListeningExercisesQuestions is a Querydsl query type for ListeningExercisesQuestions
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QListeningExercisesQuestions extends EntityPathBase<ListeningExercisesQuestions> {

    private static final long serialVersionUID = -1484478031L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QListeningExercisesQuestions listeningExercisesQuestions = new QListeningExercisesQuestions("listeningExercisesQuestions");

    public final StringPath answer_1 = createString("answer_1");

    public final StringPath answer_2 = createString("answer_2");

    public final StringPath answer_3 = createString("answer_3");

    public final StringPath answer_4 = createString("answer_4");

    public final StringPath correctAnswer = createString("correctAnswer");

    public final StringPath explains = createString("explains");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final QListeningExercises listeningExercises;

    public final StringPath numericalOrder = createString("numericalOrder");

    public final StringPath photoName = createString("photoName");

    public final StringPath question = createString("question");

    public final StringPath script = createString("script");

    public QListeningExercisesQuestions(String variable) {
        this(ListeningExercisesQuestions.class, forVariable(variable), INITS);
    }

    public QListeningExercisesQuestions(Path<? extends ListeningExercisesQuestions> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QListeningExercisesQuestions(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QListeningExercisesQuestions(PathMetadata metadata, PathInits inits) {
        this(ListeningExercisesQuestions.class, metadata, inits);
    }

    public QListeningExercisesQuestions(Class<? extends ListeningExercisesQuestions> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.listeningExercises = inits.isInitialized("listeningExercises") ? new QListeningExercises(forProperty("listeningExercises")) : null;
    }

}


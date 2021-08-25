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
 * QTestQuestions is a Querydsl query type for TestQuestions
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTestQuestions extends EntityPathBase<TestQuestions> {

    private static final long serialVersionUID = -1447530625L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTestQuestions testQuestions = new QTestQuestions("testQuestions");

    public final StringPath answerUser = createString("answerUser");

    public final StringPath audiomp3 = createString("audiomp3");

    public final StringPath correctAnswer = createString("correctAnswer");

    public final StringPath image = createString("image");

    public final NumberPath<Integer> number = createNumber("number", Integer.class);

    public final StringPath option1 = createString("option1");

    public final StringPath option2 = createString("option2");

    public final StringPath option3 = createString("option3");

    public final StringPath option4 = createString("option4");

    public final StringPath paragraph = createString("paragraph");

    public final StringPath question = createString("question");

    public final QTest test;

    public final NumberPath<Integer> testQuestionId = createNumber("testQuestionId", Integer.class);

    public QTestQuestions(String variable) {
        this(TestQuestions.class, forVariable(variable), INITS);
    }

    public QTestQuestions(Path<? extends TestQuestions> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTestQuestions(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTestQuestions(PathMetadata metadata, PathInits inits) {
        this(TestQuestions.class, metadata, inits);
    }

    public QTestQuestions(Class<? extends TestQuestions> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.test = inits.isInitialized("test") ? new QTest(forProperty("test")) : null;
    }

}


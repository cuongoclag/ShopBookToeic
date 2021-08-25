package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.DateTimePath;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.PathInits;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QResultTest is a Querydsl query type for ResultTest
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QResultTest extends EntityPathBase<ResultTest> {

    private static final long serialVersionUID = 2087779883L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QResultTest resultTest = new QResultTest("resultTest");

    public final NumberPath<Integer> correctListen = createNumber("correctListen", Integer.class);

    public final NumberPath<Integer> correctReading = createNumber("correctReading", Integer.class);

    public final DateTimePath<java.util.Date> dayTest = createDateTime("dayTest", java.util.Date.class);

    public final QNguoiDung nguoidung;

    public final NumberPath<Integer> numberCorrectAnswers = createNumber("numberCorrectAnswers", Integer.class);

    public final NumberPath<Integer> numberWrongAnswers = createNumber("numberWrongAnswers", Integer.class);

    public final NumberPath<Integer> resultId = createNumber("resultId", Integer.class);

    public final QTest test;

    public QResultTest(String variable) {
        this(ResultTest.class, forVariable(variable), INITS);
    }

    public QResultTest(Path<? extends ResultTest> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QResultTest(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QResultTest(PathMetadata metadata, PathInits inits) {
        this(ResultTest.class, metadata, inits);
    }

    public QResultTest(Class<? extends ResultTest> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.nguoidung = inits.isInitialized("nguoidung") ? new QNguoiDung(forProperty("nguoidung")) : null;
        this.test = inits.isInitialized("test") ? new QTest(forProperty("test")) : null;
    }

}


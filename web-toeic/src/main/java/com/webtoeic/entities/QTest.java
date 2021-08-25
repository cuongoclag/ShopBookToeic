package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringPath;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QTest is a Querydsl query type for Test
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTest extends EntityPathBase<Test> {

    private static final long serialVersionUID = 1911565678L;

    public static final QTest test = new QTest("test");

    public final NumberPath<Integer> testId = createNumber("testId", Integer.class);

    public final StringPath testImage = createString("testImage");

    public final StringPath testTitle = createString("testTitle");

    public QTest(String variable) {
        super(Test.class, forVariable(variable));
    }

    public QTest(Path<? extends Test> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTest(PathMetadata metadata) {
        super(Test.class, metadata);
    }

}


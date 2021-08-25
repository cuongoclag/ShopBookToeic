package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringPath;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QGrammar is a Querydsl query type for Grammar
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QGrammar extends EntityPathBase<Grammar> {

    private static final long serialVersionUID = -2110422709L;

    public static final QGrammar grammar = new QGrammar("grammar");

    public final StringPath contentHTML = createString("contentHTML");

    public final StringPath contentMarkDown = createString("contentMarkDown");

    public final NumberPath<Integer> grammarId = createNumber("grammarId", Integer.class);

    public final StringPath grammarImage = createString("grammarImage");

    public final StringPath grammarTitle = createString("grammarTitle");

    public QGrammar(String variable) {
        super(Grammar.class, forVariable(variable));
    }

    public QGrammar(Path<? extends Grammar> path) {
        super(path.getType(), path.getMetadata());
    }

    public QGrammar(PathMetadata metadata) {
        super(Grammar.class, metadata);
    }

}


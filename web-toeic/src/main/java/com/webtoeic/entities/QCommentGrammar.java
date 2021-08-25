package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.*;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QCommentGrammar is a Querydsl query type for CommentGrammar
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCommentGrammar extends EntityPathBase<CommentGrammar> {

    private static final long serialVersionUID = -1594851804L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QCommentGrammar commentGrammar = new QCommentGrammar("commentGrammar");

    public final StringPath cmtGrammarContent = createString("cmtGrammarContent");

    public final NumberPath<Integer> cmtGrammarId = createNumber("cmtGrammarId", Integer.class);

    public final DateTimePath<java.util.Date> dayComment = createDateTime("dayComment", java.util.Date.class);

    public final QGrammar grammar;

    public final QNguoiDung nguoidung;

    public QCommentGrammar(String variable) {
        this(CommentGrammar.class, forVariable(variable), INITS);
    }

    public QCommentGrammar(Path<? extends CommentGrammar> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QCommentGrammar(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QCommentGrammar(PathMetadata metadata, PathInits inits) {
        this(CommentGrammar.class, metadata, inits);
    }

    public QCommentGrammar(Class<? extends CommentGrammar> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.grammar = inits.isInitialized("grammar") ? new QGrammar(forProperty("grammar")) : null;
        this.nguoidung = inits.isInitialized("nguoidung") ? new QNguoiDung(forProperty("nguoidung")) : null;
    }

}


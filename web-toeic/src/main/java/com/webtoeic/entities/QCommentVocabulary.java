package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.*;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QCommentVocabulary is a Querydsl query type for CommentVocabulary
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCommentVocabulary extends EntityPathBase<CommentVocabulary> {

    private static final long serialVersionUID = -1993192119L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QCommentVocabulary commentVocabulary = new QCommentVocabulary("commentVocabulary");

    public final NumberPath<Integer> cmtId = createNumber("cmtId", Integer.class);

    public final StringPath cmtVocabularyContent = createString("cmtVocabularyContent");

    public final DateTimePath<java.util.Date> dayComment = createDateTime("dayComment", java.util.Date.class);

    public final QNguoiDung users;

    public final QVocabularyExercises vocabularyExercises;

    public QCommentVocabulary(String variable) {
        this(CommentVocabulary.class, forVariable(variable), INITS);
    }

    public QCommentVocabulary(Path<? extends CommentVocabulary> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QCommentVocabulary(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QCommentVocabulary(PathMetadata metadata, PathInits inits) {
        this(CommentVocabulary.class, metadata, inits);
    }

    public QCommentVocabulary(Class<? extends CommentVocabulary> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.users = inits.isInitialized("users") ? new QNguoiDung(forProperty("users")) : null;
        this.vocabularyExercises = inits.isInitialized("vocabularyExercises") ? new QVocabularyExercises(forProperty("vocabularyExercises")) : null;
    }

}


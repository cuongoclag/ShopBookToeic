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
 * QVocabularyContent is a Querydsl query type for VocabularyContent
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QVocabularyContent extends EntityPathBase<VocabularyContent> {

    private static final long serialVersionUID = 1009199447L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QVocabularyContent vocabularyContent = new QVocabularyContent("vocabularyContent");

    public final StringPath audiomp3 = createString("audiomp3");

    public final StringPath content = createString("content");

    public final NumberPath<Integer> id = createNumber("id", Integer.class);

    public final StringPath image = createString("image");

    public final StringPath meaning = createString("meaning");

    public final NumberPath<Integer> number = createNumber("number", Integer.class);

    public final StringPath sentence = createString("sentence");

    public final StringPath transcribe = createString("transcribe");

    public final QVocabularyExercises vocabularyExercises;

    public QVocabularyContent(String variable) {
        this(VocabularyContent.class, forVariable(variable), INITS);
    }

    public QVocabularyContent(Path<? extends VocabularyContent> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QVocabularyContent(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QVocabularyContent(PathMetadata metadata, PathInits inits) {
        this(VocabularyContent.class, metadata, inits);
    }

    public QVocabularyContent(Class<? extends VocabularyContent> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.vocabularyExercises = inits.isInitialized("vocabularyExercises") ? new QVocabularyExercises(forProperty("vocabularyExercises")) : null;
    }

}


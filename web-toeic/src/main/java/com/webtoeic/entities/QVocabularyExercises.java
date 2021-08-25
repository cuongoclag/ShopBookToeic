package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringPath;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QVocabularyExercises is a Querydsl query type for VocabularyExercises
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QVocabularyExercises extends EntityPathBase<VocabularyExercises> {

    private static final long serialVersionUID = -1093308679L;

    public static final QVocabularyExercises vocabularyExercises = new QVocabularyExercises("vocabularyExercises");

    public final NumberPath<Integer> id = createNumber("id", Integer.class);

    public final StringPath vocabularyImage = createString("vocabularyImage");

    public final StringPath vocabularyTitle = createString("vocabularyTitle");

    public QVocabularyExercises(String variable) {
        super(VocabularyExercises.class, forVariable(variable));
    }

    public QVocabularyExercises(Path<? extends VocabularyExercises> path) {
        super(path.getType(), path.getMetadata());
    }

    public QVocabularyExercises(PathMetadata metadata) {
        super(VocabularyExercises.class, metadata);
    }

}


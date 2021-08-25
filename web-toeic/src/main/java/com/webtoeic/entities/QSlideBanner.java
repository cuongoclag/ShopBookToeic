package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringPath;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QSlideBanner is a Querydsl query type for SlideBanner
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QSlideBanner extends EntityPathBase<SlideBanner> {

    private static final long serialVersionUID = -585988127L;

    public static final QSlideBanner slideBanner = new QSlideBanner("slideBanner");

    public final NumberPath<Integer> slidebannerid = createNumber("slidebannerid", Integer.class);

    public final StringPath slidecontent = createString("slidecontent");

    public final StringPath slideimage = createString("slideimage");

    public final StringPath slidename = createString("slidename");

    public QSlideBanner(String variable) {
        super(SlideBanner.class, forVariable(variable));
    }

    public QSlideBanner(Path<? extends SlideBanner> path) {
        super(path.getType(), path.getMetadata());
    }

    public QSlideBanner(PathMetadata metadata) {
        super(SlideBanner.class, metadata);
    }

}


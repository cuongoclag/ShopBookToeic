package com.webtoeic.entities;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.EnumPath;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringPath;

import javax.annotation.Generated;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;


/**
 * QNguoiDung is a Querydsl query type for NguoiDung
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QNguoiDung extends EntityPathBase<NguoiDung> {

    private static final long serialVersionUID = -2027072380L;

    public static final QNguoiDung nguoiDung = new QNguoiDung("nguoiDung");

    public final StringPath address = createString("address");

    public final StringPath email = createString("email");

    public final StringPath fullName = createString("fullName");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath password = createString("password");

    public final StringPath phone = createString("phone");

    public final EnumPath<Roles> roles = createEnum("roles", Roles.class);

    public QNguoiDung(String variable) {
        super(NguoiDung.class, forVariable(variable));
    }

    public QNguoiDung(Path<? extends NguoiDung> path) {
        super(path.getType(), path.getMetadata());
    }

    public QNguoiDung(PathMetadata metadata) {
        super(NguoiDung.class, metadata);
    }

}


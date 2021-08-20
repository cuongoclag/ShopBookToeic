package com.webtoeic.jpautil;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import com.webtoeic.entities.Roles;

@Converter
public class VaiTroTypeConverter implements AttributeConverter<Roles, Integer> {

	@Override
	public Integer convertToDatabaseColumn(Roles roles) {
		return roles.getValue();
	}

	@Override
	public Roles convertToEntityAttribute(Integer value) {
		for (Roles type : Roles.values()) {
			if (type.getValue() == value) {
				return type;
			}
		}
		throw new IllegalArgumentException(" Illegal tagType value exception.");
	}
}

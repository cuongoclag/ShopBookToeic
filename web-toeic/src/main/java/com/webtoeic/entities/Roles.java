package com.webtoeic.entities;


public enum Roles {

	ROLE_MEMBER(1), ROLE_ADMIN(2);
	
	private int value;
	
	Roles(int value) {
		this.value = value;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
	
    public static Roles findByAbbr(int item) {
        for (Roles object : values()) {
            if (object.value == item) {
                return object;
            }
        }
        return null;
    }
	
	
}

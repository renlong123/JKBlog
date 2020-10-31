package com.jkblog.entity;

public enum UserGender {

    无("0"),男("1"),女("2");

    private String value;

    UserGender(String value){
        this.value = value;
    }

    public static UserGender getEnum(String value){
        switch (value){
            case "1":
                return UserGender.男;
            case "2":
                return UserGender.女;
            default:
                return UserGender.无;
        }
    }
}

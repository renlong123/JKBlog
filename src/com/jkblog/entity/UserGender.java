package com.jkblog.entity;

public enum UserGender {

    未知("0"),男("1"),女("2");

    private String value;

    UserGender(String value){
        this.value = value;
    }
}

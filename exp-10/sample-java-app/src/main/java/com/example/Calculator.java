package com.example;

public class Calculator {

    public int divide(int a, int b) {
        return a / b; // bug
    }

    public int add(int a, int b) {
        int result = a + b;
        return result;
    }

    public String getUser(String userId) {
        String query = "SELECT * FROM users WHERE id = " + userId; // vulnerability
        return query;
    }
}
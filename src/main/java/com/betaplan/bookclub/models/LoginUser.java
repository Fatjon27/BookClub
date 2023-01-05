package com.betaplan.bookclub.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {
    @Email
    @NotEmpty(message = "Email must not be empty")
    @Size(min=5,message = "Email must be longer")
    private String email;
    @NotEmpty(message = "Password must not be empty")
    @Size(min=8,message = "Password must be longer")
    private String password;
    public LoginUser(){
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

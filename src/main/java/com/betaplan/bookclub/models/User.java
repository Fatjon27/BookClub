package com.betaplan.bookclub.models;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name ="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message = "Name must not be empty")
    @Size(min = 3,message = "Name must be longer")
    private String name;
    @Email
    @NotEmpty(message = "Email must not be empty")
    @Size(min=5,message = "Email must be longer")
    private String email;
    @NotEmpty(message = "Password must not be empty")
    @Size(min=8,message = "Password must be longer")
    private String password;
    @Transient
    @NotEmpty(message = "Confirm Password must not be empty")
    @Size(min=8,message = "Confirm Password must be longer")
    private String confirm;
    @Column(updatable = false)
    private Date createdAt;
    private Date updatedAt;
    @OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
    private List<Book> books;
    @OneToMany(mappedBy = "borrower",fetch = FetchType.LAZY)
    private List<Book> borrowedBooks;
    public User(){
    }
    public User(String name,String email,String password,String confirm){
        this.name=name;
        this.email=email;
        this.password=password;
        this.confirm=confirm;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public List<Book> getBorrowedBooks() {
        return borrowedBooks;
    }

    public void setBorrowedBooks(List<Book> borrowedBooks) {
        this.borrowedBooks = borrowedBooks;
    }

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt= new Date();
    }

}

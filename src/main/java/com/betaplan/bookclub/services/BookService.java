package com.betaplan.bookclub.services;

import com.betaplan.bookclub.models.Book;
import com.betaplan.bookclub.repositories.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;
    public List<Book> findAll(){
        return bookRepository.findAll();
    }
    public Book findById(Long id){
        Optional<Book> optionalBook = bookRepository.findById(id);
        if(optionalBook.isPresent()){
            return optionalBook.get();
        }
        else {
            return null;
        }
    }
    public Book create(Book book){
        return bookRepository.save(book);
    }
    public Book update(Book book){
        return bookRepository.save(book);
    }
    public void deleteById(Long id){
        bookRepository.deleteById(id);
    }

}

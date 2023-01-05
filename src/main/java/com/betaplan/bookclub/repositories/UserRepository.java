package com.betaplan.bookclub.repositories;

import com.betaplan.bookclub.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends CrudRepository<User,Long> {
    List<User> findAll() ;
    Optional<User> findByEmail(String email) ;
}

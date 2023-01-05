package com.betaplan.bookclub.services;

import com.betaplan.bookclub.models.LoginUser;
import com.betaplan.bookclub.models.User;
import com.betaplan.bookclub.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    public List<User> findAll(){
        return userRepository.findAll();
    }
    public User findById(Long id){
        Optional<User> optionalUser = userRepository.findById(id);
        if(optionalUser.isPresent()){
            return optionalUser.get();
        }
        else {
            return null;
        }
    }

    public User register(User newUser, BindingResult result){
        Optional<User> potentialUser = this.userRepository.findByEmail(newUser.getEmail());
        if(potentialUser.isPresent()){
            result.rejectValue("email","Invalid email","Email Adress already exists.");
        }
        if(!newUser.getPassword().equals(newUser.getConfirm())){
            result.rejectValue("confirm","Different","Confirm must be the same as password");
        }
        if(result.hasErrors()){
            return null;
        }
        else {
            String hashed = BCrypt.hashpw(newUser.getPassword(),BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepository.save(newUser);
        }
    }

    public User login(LoginUser newLoginObject,BindingResult result){
        Optional<User> potentialUser = this.userRepository.findByEmail(newLoginObject.getEmail());
        if(!potentialUser.isPresent()){
            result.rejectValue("email","Invalid email","Email Adress does not exist.");
        }
        else {
            if(!BCrypt.checkpw(newLoginObject.getPassword(),potentialUser.get().getPassword())) {
                result.rejectValue("password","Different passowrd","Your password is not correct");
            }
        }
        if(result.hasErrors()){
            return null;
        }
        else {
            return potentialUser.get();
        }
    }

}

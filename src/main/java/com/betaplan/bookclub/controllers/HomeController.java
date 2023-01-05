package com.betaplan.bookclub.controllers;

import com.betaplan.bookclub.models.Book;
import com.betaplan.bookclub.models.LoginUser;
import com.betaplan.bookclub.models.User;
import com.betaplan.bookclub.services.BookService;
import com.betaplan.bookclub.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;
    @RequestMapping("/")
    public String index(Model model, @ModelAttribute("newUser") User newUser, @ModelAttribute("newLogin")LoginUser newLogin){
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin",new LoginUser());
        return "index";
    }
    @PostMapping("/register")
    public String register(HttpSession session, Model model, @Valid @ModelAttribute("newUser") User newUser, BindingResult result){
        userService.register(newUser,result);
        if(result.hasErrors()){
            model.addAttribute("newLogin", new LoginUser());
            return "index";
        }
        else {
            session.setAttribute("loggedInUserId",newUser.getId());
            return "redirect:/dashboard";
        }
    }

    @PostMapping("/login")
    public String login(HttpSession session,Model model,@Valid @ModelAttribute("newLogin") LoginUser newLogin,BindingResult result){
        User user = userService.login(newLogin,result);
        if(result.hasErrors()){
            model.addAttribute("newUser",new User());
            return "index";
        }
        else{
            session.setAttribute("loggedInUserId",user.getId());
            return "redirect:/dashboard";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session,Model model){
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        ArrayList<Book> books = new ArrayList<Book>() ;
        if(loggedInUserId==null){
            return "redirect:/";
        }
        else {
            User loggedInUser = userService.findById(loggedInUserId);
            List<User> users = userService.findAll();
            for(User i : users){
                for(Book books1: i.getBooks()) {
                    books.add(books1);
                }
            }
            model.addAttribute("books",books);
            model.addAttribute("user",loggedInUser);
            return "dashboard";
        }
    }

    @GetMapping("/books/new")
    public String createBook(Model model, @ModelAttribute("book")Book book){
        List<User> users = userService.findAll();
        model.addAttribute("users",users);
        return "createBook";
    }
    @PostMapping("/books/new")
    public String newBook(HttpSession session,Model model,@Valid @ModelAttribute("book")Book book,BindingResult result){
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
            User user = userService.findById(loggedInUserId);
        if (result.hasErrors()){
            List<User> users = userService.findAll();
            model.addAttribute("users",users);
            return "createBook";
        }
        else {
            book.setPostedBy(user.getName());
            book.setUser(user);
            bookService.create(book);
            return "redirect:/dashboard";
        }
    }

    @GetMapping("/books/{id}")
    public String books(@PathVariable("id") Long id,Model model,HttpSession session){
        Book book = bookService.findById(id);
        model.addAttribute("book",book);
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        User user = userService.findById(loggedInUserId);
        if(user.equals(book.getUser())){
            model.addAttribute("creator","You are the author of this post");
        }
        return "bookDetails";
    }
}

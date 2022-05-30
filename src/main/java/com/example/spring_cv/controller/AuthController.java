package com.example.spring_cv.controller;

import com.example.spring_cv.model.user.User;
import com.example.spring_cv.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String getLogin(){
        return "/auth/login";
    }

    @GetMapping("/register")
    public String getRegister(){
        return "/auth/register";
    }

    @PostMapping("/register")
    public RedirectView postNewTask(User user) {
        userService.saveUser(user);
        return new RedirectView("/login");
    }


}

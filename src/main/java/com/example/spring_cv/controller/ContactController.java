package com.example.spring_cv.controller;

import com.example.spring_cv.model.aboutMe.AboutMe;
import com.example.spring_cv.model.user.User;
import com.example.spring_cv.service.UserService;
import com.example.spring_cv.service.aboutMe.AboutMeService;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContactController {
    private final UserService userService;
    private final AboutMeService aboutMeService;

    public ContactController(UserService userService, AboutMeService aboutMeService) {
        this.userService = userService;
        this.aboutMeService = aboutMeService;
    }

    @GetMapping("/contact")
    public String getContact(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            User currentUser = userService.loadUserById(authentication.getName());
            model.addAttribute("user", currentUser);
        }

        AboutMe info = aboutMeService.getInfo();
        model.addAttribute("about", info);


        return "/contact/contact";
    }
}

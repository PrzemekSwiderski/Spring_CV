package com.example.spring_cv.controller;

import com.example.spring_cv.model.aboutMe.AboutMe;
import com.example.spring_cv.model.aboutMe.Skill;
import com.example.spring_cv.model.user.User;
import com.example.spring_cv.service.aboutMe.AboutMeService;
import com.example.spring_cv.service.aboutMe.SkillService;
import com.example.spring_cv.service.UserService;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AboutController {
    private final UserService userService;
    private final AboutMeService aboutMeService;
    private final SkillService skillService;

    public AboutController(UserService userService, AboutMeService aboutMeService, SkillService skillService) {
        this.userService = userService;
        this.aboutMeService = aboutMeService;
        this.skillService = skillService;
    }

    @GetMapping("/about")
    public String getAbout(Model model) {
       getData(model);
        return "/about/about";
    }

    @GetMapping("/editAbout")
    public String getEditAbout(Model model) {
        getData(model);
        return "/about/editAbout";
    }


    @PostMapping("/editAbout")
    public RedirectView postEditAbout(AboutMe aboutMe) {
        aboutMeService.saveInfo(aboutMe);
        return new RedirectView("/about");
    }

    @PostMapping("/addSkill")
    public RedirectView postNewSkill(Skill skill) {
        skillService.saveSkill(skill);
        return new RedirectView("/editAbout");
    }


    @PostMapping("/editAbout/{id}")
    public RedirectView postDeleteSkill(@PathVariable("id") Long id) {
        skillService.deleteSkillById(id);

        return new RedirectView("/editAbout");
    }

    private void getData(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User user = null;
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            user =  userService.loadUserById(authentication.getName());
        }

        model.addAttribute("user", user);
        AboutMe aboutMe = aboutMeService.getInfo();
        model.addAttribute("aboutMe", aboutMe);
        List<Skill> skills = new ArrayList<>(aboutMe.getSkills());
        List<Skill> rightSkills = skills.stream()
                .filter(skill -> skills.indexOf(skill)%2 == 1)
                .collect(Collectors.toList());
        List<Skill> leftSkills = skills.stream()
                .filter(skill -> skills.indexOf(skill)%2 == 0)
                .collect(Collectors.toList());
        model.addAttribute("leftSkills", leftSkills);
        model.addAttribute("rightSkills", rightSkills);
    }
}

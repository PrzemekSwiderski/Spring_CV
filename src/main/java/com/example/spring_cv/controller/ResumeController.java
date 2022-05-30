package com.example.spring_cv.controller;

import com.example.spring_cv.model.aboutMe.AboutMe;
import com.example.spring_cv.model.curriculumVitae.Curriculum;
import com.example.spring_cv.model.curriculumVitae.Education;
import com.example.spring_cv.model.curriculumVitae.Experience;
import com.example.spring_cv.model.curriculumVitae.Task;
import com.example.spring_cv.model.user.User;
import com.example.spring_cv.service.*;
import com.example.spring_cv.service.aboutMe.AboutMeService;
import com.example.spring_cv.service.curriculum.*;
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
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ResumeController {
    private final UserService userService;
    private final AboutMeService aboutMeService;
    private final CurriculumService curriculumService;
    private final EducationService educationService;
    private final ExperienceService experienceService;
    private final TaskService taskService;

    public ResumeController(UserService userService, AboutMeService aboutMeService,
                            CurriculumService curriculumService, EducationService educationService,
                            ExperienceService experienceService, TaskService taskService) {
        this.userService = userService;
        this.aboutMeService = aboutMeService;
        this.curriculumService = curriculumService;
        this.educationService = educationService;
        this.experienceService = experienceService;
        this.taskService = taskService;
    }


    @GetMapping("/resume")
    public String getResume(Model model) {
        getData(model);
        return "/resume/resume";
    }

    @GetMapping("/editResume/resume")
    public String getEditResume(Model model) {
        getData(model);

        return "/resume/editResume";
    }

    @PostMapping("/editResume/editSummary")
    public RedirectView postEditSummary(Curriculum curriculum) {
        curriculumService.saveCurriculum(curriculum);
        return new RedirectView("/editResume/resume");
    }


    @PostMapping("/editResume/addEducation")
    public RedirectView postNewEducation(Education education) {
        educationService.saveEducation(education);
        return new RedirectView("/editResume/resume");
    }

    @PostMapping("/editResume/deleteEducation/{id}")
    public RedirectView postDeleteEducation(@PathVariable("id") Long id) {
        educationService.deleteEducation(id);
        return new RedirectView("/editResume/resume");
    }

    @PostMapping("/editResume/addExperience")
    public RedirectView postNewExperience(Experience experience){
        experienceService.saveExperience(experience);
        return new RedirectView("/editResume/resume");
    }

    @PostMapping("/editResume/deleteExperience/{id}")
    public RedirectView postDeleteExperience(@PathVariable("id") Long id){
        experienceService.deleteExperience(id);
        return new RedirectView("/editResume/resume");
    }

    @PostMapping("/editResume/addTask")
    public RedirectView postNewTask(Task task){
        taskService.saveTask(task);
        return new RedirectView("/editResume/resume");
    }

    @PostMapping("/editResume/deleteTask/{id}")
    public RedirectView postNewTask(@PathVariable("id") Long id){
        taskService.deleteTask(id);
        return new RedirectView("/editResume/resume");
    }


    private void getData(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            User currentUser = userService.loadUserById(authentication.getName());
            model.addAttribute("user", currentUser);
        }

        AboutMe aboutMe = aboutMeService.getInfo();
        model.addAttribute("aboutMe", aboutMe);

        Curriculum curriculum = curriculumService.loadCurriculum();
        model.addAttribute("cv", curriculum);

        List<Education> educationList = new ArrayList<>(curriculum.getEducation());
        educationList = educationList.stream()
                .sorted(Comparator.comparing(Education::getBegin).reversed())
                .collect(Collectors.toList());
        model.addAttribute("education", educationList);

        List<Experience> experiences = new ArrayList<>(curriculum.getExperiences());
        experiences = experiences.stream()
                .sorted(Comparator.comparing(Experience::getBegin).reversed())
                .collect(Collectors.toList());
        experiences.forEach(experience -> experience.setTasks(experience.getTasks().stream()
                .sorted(Comparator.comparing(Task::getId)).collect(Collectors.toList())));

        model.addAttribute("experience", experiences);

    }
}

package com.example.spring_cv.controller;

import com.example.spring_cv.model.portfolio.Form;
import com.example.spring_cv.model.portfolio.Picture;
import com.example.spring_cv.model.portfolio.Portfolio;
import com.example.spring_cv.model.portfolio.ResponsePicture;
import com.example.spring_cv.model.user.User;
import com.example.spring_cv.service.UserService;
import com.example.spring_cv.service.portfolio.PictureService;
import com.example.spring_cv.service.portfolio.PortfolioService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PortfolioController {
    private final UserService userService;
    private final PortfolioService portfolioService;
    private final PictureService pictureService;

    public PortfolioController(UserService userService, PortfolioService portfolioService, PictureService pictureService) {
        this.userService = userService;
        this.portfolioService = portfolioService;
        this.pictureService = pictureService;
    }

    @GetMapping("/portfolio")
    public String getPortfolio(Model model) {
        getData(model);

        return "/portfolio/portfolio";
    }

    @GetMapping("/editPortfolio/portfolio")
    public String getEditPortfolio(Model model) {
        getData(model);

        return "/portfolio/editPortfolio";
    }

    @PostMapping("/editPortfolio/uploadImg")
    public RedirectView postNewImage(Form form) {
        try {
            form.getPortfolio().setPicture(pictureService.savePicture(form.getFile()));
            portfolioService.savePortfolio(form.getPortfolio());

        } catch (IOException e) {
            e.printStackTrace();
        }
        return new RedirectView("/editPortfolio/portfolio");
    }

    private void getData(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            User currentUser = userService.loadUserById(authentication.getName());
            model.addAttribute("user", currentUser);
        }

        List<Portfolio> portfolios = portfolioService.getAll();
        model.addAttribute("portfolios", portfolios);

    }

    @GetMapping("/files")
    public ResponseEntity<List<ResponsePicture>> getListFiles() {
        List<ResponsePicture> files = pictureService.getAll().stream().map(dbFile -> {
            String fileDownloadUri = ServletUriComponentsBuilder
                    .fromCurrentContextPath()
                    .path("/files/")
                    .path(dbFile.getId().toString())
                    .toUriString();
            return new ResponsePicture(
                    dbFile.getName(),
                    fileDownloadUri,
                    dbFile.getType(),
                    dbFile.getData().length);
        }).collect(Collectors.toList());
        return ResponseEntity.status(HttpStatus.OK).body(files);
    }

    @GetMapping("/files/{id}")
    public ResponseEntity<byte[]> getFile(@PathVariable("id") Long id) {
        Picture picture = pictureService.getPictureById(id);
        return ResponseEntity.ok()
                .contentType(MediaType.IMAGE_JPEG)
                .body(picture.getData());
    }

    @PostMapping("/editPortfolio/deletePortfolio/{id}")
    public RedirectView postDeletePortfolio(@PathVariable("id") Long id){
        System.out.println(id);
        portfolioService.deleteById(id);
        return new RedirectView("/editPortfolio/portfolio");
    }

}

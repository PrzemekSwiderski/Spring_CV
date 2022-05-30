package com.example.spring_cv.controller;


import com.example.spring_cv.model.Mail;
import com.example.spring_cv.service.MailService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.MessagingException;

@RestController
public class MailController {

    private MailService mailService;


    public MailController(MailService mailService) {
        this.mailService = mailService;
    }

    @PostMapping("/sendMail")
    public String sendMail(Mail mail) throws MessagingException {
        mailService.sendMail("xxx", //wasz email, na ktory ma przychodzic poczta
                mail.getMail(),
                mail.getSubject(),
                mail.getText(), true);
        return "wysłano";
    }
}

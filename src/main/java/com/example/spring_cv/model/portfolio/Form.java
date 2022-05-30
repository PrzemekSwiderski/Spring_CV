package com.example.spring_cv.model.portfolio;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.sound.sampled.Port;

@Getter
@Setter
@AllArgsConstructor
public class Form {
    private MultipartFile file;
    private Portfolio portfolio;
}

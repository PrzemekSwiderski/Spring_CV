package com.example.spring_cv.service.aboutMe;

import com.example.spring_cv.model.aboutMe.AboutMe;
import com.example.spring_cv.repository.aboutMe.AboutMeRepository;
import org.springframework.stereotype.Service;

@Service
public class AboutMeService {

    private final AboutMeRepository aboutMeRepository;

    public AboutMeService(AboutMeRepository aboutMeRepository) {
        this.aboutMeRepository = aboutMeRepository;
    }

    public AboutMe getInfo() {
        return aboutMeRepository.findById(1L).orElse(null);
    }

    public void saveInfo(AboutMe aboutMe) {
        aboutMeRepository.save(aboutMe);
    }
}

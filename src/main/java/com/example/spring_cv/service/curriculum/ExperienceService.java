package com.example.spring_cv.service.curriculum;

import com.example.spring_cv.model.curriculumVitae.Experience;
import com.example.spring_cv.repository.curriculum.ExperienceRepository;
import org.springframework.stereotype.Service;

@Service
public class ExperienceService {
    private final ExperienceRepository experienceRepository;

    public ExperienceService(ExperienceRepository experienceRepository) {
        this.experienceRepository = experienceRepository;
    }

    public void saveExperience(Experience experience) {
        experienceRepository.save(experience);
    }

    public void deleteExperience(Long id) {
        experienceRepository.deleteById(id);
    }
}

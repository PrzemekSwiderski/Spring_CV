package com.example.spring_cv.service.curriculum;

import com.example.spring_cv.model.curriculumVitae.Education;
import com.example.spring_cv.repository.curriculum.EducationRepository;
import org.springframework.stereotype.Service;

@Service
public class EducationService {

    private final EducationRepository educationRepository;

    public EducationService(EducationRepository educationRepository) {
        this.educationRepository = educationRepository;
    }

    public void saveEducation(Education education){
        educationRepository.save(education);
    }

    public void deleteEducation(Long id){
        educationRepository.deleteById(id);
    }


}

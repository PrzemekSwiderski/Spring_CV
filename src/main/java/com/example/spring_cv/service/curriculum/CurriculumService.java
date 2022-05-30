package com.example.spring_cv.service.curriculum;

import com.example.spring_cv.model.curriculumVitae.Curriculum;
import com.example.spring_cv.repository.curriculum.CurriculumRepository;
import org.springframework.stereotype.Service;

@Service
public class CurriculumService {
    private final CurriculumRepository curriculumRepository;

    public CurriculumService(CurriculumRepository curriculumRepository) {
        this.curriculumRepository = curriculumRepository;
    }

    public void saveCurriculum(Curriculum curriculum){
        curriculumRepository.save(curriculum);
    }

    public Curriculum loadCurriculum(){
       return curriculumRepository.findById(1L).orElse(null);
    }




}

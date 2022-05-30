package com.example.spring_cv.service.aboutMe;

import com.example.spring_cv.model.aboutMe.Skill;
import com.example.spring_cv.repository.aboutMe.SkillRepository;
import org.springframework.stereotype.Service;

@Service
public class SkillService {
    private final SkillRepository skillRepository;

    public SkillService(SkillRepository skillRepository) {
        this.skillRepository = skillRepository;
    }

    public void saveSkill(Skill skill){
        skillRepository.save(skill);
    }

    public void deleteSkillById(Long id){
        skillRepository.deleteById(id);
    }


}

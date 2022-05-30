package com.example.spring_cv.repository.aboutMe;

import com.example.spring_cv.model.aboutMe.Skill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SkillRepository extends JpaRepository<Skill, Long> {
}

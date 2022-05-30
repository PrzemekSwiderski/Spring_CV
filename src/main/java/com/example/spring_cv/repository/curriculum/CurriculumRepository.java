package com.example.spring_cv.repository.curriculum;

import com.example.spring_cv.model.curriculumVitae.Curriculum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CurriculumRepository extends JpaRepository<Curriculum, Long> {
}

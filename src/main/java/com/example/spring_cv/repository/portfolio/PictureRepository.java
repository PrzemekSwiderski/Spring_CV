package com.example.spring_cv.repository.portfolio;

import com.example.spring_cv.model.portfolio.Picture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PictureRepository extends JpaRepository<Picture, Long> {
}

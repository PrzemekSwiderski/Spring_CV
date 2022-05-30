package com.example.spring_cv.repository.portfolio;

import com.example.spring_cv.model.portfolio.Portfolio;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PortfolioRepository extends JpaRepository<Portfolio, Long> {
}

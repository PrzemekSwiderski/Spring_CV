package com.example.spring_cv.service.portfolio;

import com.example.spring_cv.model.portfolio.Portfolio;
import com.example.spring_cv.repository.portfolio.PortfolioRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PortfolioService {

    private final PortfolioRepository portfolioRepository;

    public PortfolioService(PortfolioRepository portfolioRepository) {
        this.portfolioRepository = portfolioRepository;
    }

    public void savePortfolio(Portfolio portfolio) {
        portfolioRepository.save(portfolio);
    }

    public List<Portfolio> getAll(){
        return portfolioRepository.findAll();
    }

    public void deleteById(Long id){
        portfolioRepository.deleteById(id);
    }

}

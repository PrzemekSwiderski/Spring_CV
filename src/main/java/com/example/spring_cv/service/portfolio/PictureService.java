package com.example.spring_cv.service.portfolio;

import com.example.spring_cv.model.portfolio.Picture;
import com.example.spring_cv.repository.portfolio.PictureRepository;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class PictureService {

    private final PictureRepository pictureRepository;

    public PictureService(PictureRepository pictureRepository) {
        this.pictureRepository = pictureRepository;
    }

    public Picture savePicture(MultipartFile file) throws IOException {
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
        Picture picture = new Picture(fileName, file.getContentType(), file.getBytes());
        return pictureRepository.save(picture);
    }

    public Picture getPictureById(Long id) {
        return pictureRepository.findById(id).orElse(null);
    }

    public List<Picture> getAll() {
        return pictureRepository.findAll();
    }
}

package com.example.spring_cv.model.portfolio;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ResponsePicture {
    private String name;
    private String url;
    private String type;
    private long size;
}

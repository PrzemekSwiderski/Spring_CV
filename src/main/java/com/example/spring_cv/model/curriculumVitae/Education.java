package com.example.spring_cv.model.curriculumVitae;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Education {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private Date begin;
    private Date finished;
    private String nameOfSchool;
    @Column(columnDefinition = "TEXT")
    private String description;


    @ManyToOne
    private Curriculum curriculum;

}

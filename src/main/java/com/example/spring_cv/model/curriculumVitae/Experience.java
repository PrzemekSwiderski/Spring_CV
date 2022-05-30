package com.example.spring_cv.model.curriculumVitae;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Experience {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Date begin;
    private String finished;
    private String jobName;
    private String firm;
    @OneToMany(cascade = {CascadeType.REFRESH, CascadeType.DETACH, CascadeType.REMOVE}, mappedBy = "experience", fetch = FetchType.EAGER)
    private List<Task> tasks = new ArrayList<>();
    @ManyToOne
    private Curriculum curriculum;

}

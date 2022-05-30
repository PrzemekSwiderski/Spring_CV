package com.example.spring_cv.model.curriculumVitae;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Curriculum {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(columnDefinition = "TEXT")
    private String summary;

    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "curriculum", fetch = FetchType.LAZY)
    Set<Education> education;

    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "curriculum", fetch = FetchType.EAGER)
    Set<Experience> experiences;
}

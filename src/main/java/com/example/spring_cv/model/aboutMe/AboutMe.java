package com.example.spring_cv.model.aboutMe;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class AboutMe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String jobSpecialization;
    @Column(columnDefinition = "TEXT")
    private String shortInfo;
    private String birthday;
    private Boolean enableBirthday;
    private String website;
    private Boolean enableWebsite;
    private String phone;
    private Boolean enablePhone;
    private String city;
    private Boolean enableCity;
    private String age;
    private Boolean enableAge;
    private String degree;
    private Boolean enableDegree;
    private String email;
    private Boolean enableEmail;
    private String freelance;
    private Boolean enableFreelance;
    @Column(columnDefinition = "TEXT")
    private String longInfo;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "aboutMe", fetch = FetchType.EAGER)
    private Set<Skill> skills;
}

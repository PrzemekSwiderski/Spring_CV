package com.example.spring_cv.model.portfolio;

import lombok.*;

import javax.persistence.*;

@Entity
@Setter
@Getter
@NoArgsConstructor

@AllArgsConstructor
public class Picture {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String type;

    @Lob
    private byte[] data;

    public Picture(String name, String type, byte[] data) {
        this.name = name;
        this.type = type;
        this.data = data;
    }
}

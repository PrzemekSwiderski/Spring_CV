package com.example.spring_cv.model.user;

import com.example.spring_cv.utility.Role;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
public class UserRole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "ROLE")
    @Enumerated(EnumType.STRING)
    private Role role;

    @ManyToOne
    private User user;

    public UserRole() {
        role = Role.USER;
    }

    public UserRole(User user) {
        this.user = user;
        role = Role.USER;
    }

}

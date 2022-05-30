package com.example.spring_cv.model.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;

@Entity
@AllArgsConstructor
@Getter
@Setter
public class User {
    @Id
    @Column(name = "MAIL")
    private String mail;
    @Column(name = "PASSWORD")
    private String password;
    @Column(name = "FIRST_NAME")
    @Nullable
    private String firstname;
    @Column(name = "LAST_NAME")
    @Nullable
        private String lastname;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user", fetch = FetchType.EAGER)
    private Set<UserRole> role = new HashSet<>();

    @Column(name = "ENABLED")
    @NotNull
    private Boolean enabled;
    @Lob
    @Nullable
    private Byte[] image;

    public User() {
        role.add(new UserRole(this));
        enabled = true;
    }
}

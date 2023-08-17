package com.tahourdev.mvccrud.model;

import javax.persistence.*;
import lombok.*;



@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "dev_team")
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String userName;

    @Column
    private String email;

    @Column
    private String jobTitle;

    @Column
    private String role;
}
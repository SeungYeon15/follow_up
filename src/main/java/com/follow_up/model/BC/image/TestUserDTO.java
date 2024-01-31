package com.follow_up.model.BC.image;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class TestUserDTO {
    private int userId;
    private String userPassword;
    private String userFile;
    private String userRegisterDate;
    private String userName;
    private String userEmail;
    private String userGrade;
}

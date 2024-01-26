package com.follow_up.model.BC.comment;


import java.util.List;
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

public class ResponseDTO {
    private  String fullName ;
    private  String  avatarUrl;
    private  String userId;
    private  String  comId;
    private  String text;
    private List<ResponseDTO> replies;
}

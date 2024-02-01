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

public class ImageCommentDTO {
    private String contents;
    private String comId;
    private int userId;
    private int imgId;

}

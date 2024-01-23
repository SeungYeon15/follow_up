package com.follow_up.model.BC.comment;


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
    private int commentId;
    private int userId;
    private String comId;
    private String contents;
    private int imgId;
}

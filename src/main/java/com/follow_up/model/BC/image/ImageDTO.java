package com.follow_up.model.BC.image;

import org.springframework.web.multipart.MultipartFile;

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

public class ImageDTO {
    private int imgId;
    private String title;
    private String tag;
    private String imgDescription;
    private String imgUrl;
    private String imgType;
    private String registerDate;
    private int viewCount;
    private int likeCount;
    private int downloadCount;

    private MultipartFile filenameMF;
}

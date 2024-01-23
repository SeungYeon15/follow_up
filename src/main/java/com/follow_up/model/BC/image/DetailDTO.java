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

public class DetailDTO {
    private int viewCount;
    private int likeCount;
    private int downloadCount;
    private int imgId;
}

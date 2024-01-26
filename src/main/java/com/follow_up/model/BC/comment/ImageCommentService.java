package com.follow_up.model.BC.comment;

import com.follow_up.model.BC.image.ImageDTO;
import java.util.List;

public interface ImageCommentService {
    List<ResponseDTO> getCommentsById(int imgId);

    List<ResponseDTO> getRepliesById(String comId);
}

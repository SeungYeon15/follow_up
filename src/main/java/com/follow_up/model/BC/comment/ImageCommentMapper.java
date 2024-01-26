package com.follow_up.model.BC.comment;


import java.util.List;

public interface ImageCommentMapper {
    List<ResponseDTO> getCommentsById(int imgId);

    List<ResponseDTO> getRepliesById(String comId);


}

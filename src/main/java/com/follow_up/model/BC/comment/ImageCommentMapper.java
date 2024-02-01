package com.follow_up.model.BC.comment;


import java.util.List;
import java.util.Map;

public interface ImageCommentMapper {
    List<ResponseDTO> getCommentsById(int imgId);

    List<ResponseDTO> getRepliesById(String comId);

    int saveComment(ImageCommentDTO imageCommentDTO);

    int saveReply(ImageReplyDTO imageReplyDTO);

    int deleteComment(String comId);

    int deleteReply(String replyId);

    int updateComment(Map comId);

    int updateReply(Map replyId);


}

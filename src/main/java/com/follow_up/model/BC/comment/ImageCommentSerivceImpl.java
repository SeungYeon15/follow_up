package com.follow_up.model.BC.comment;


import com.follow_up.model.BC.image.ImageDTO;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.follow_up.model.BC.comment.ImageCommentServiceImpl")
public class ImageCommentSerivceImpl implements ImageCommentService{

    @Autowired
    private ImageCommentMapper mapper;


    @Override
    public List<ResponseDTO> getCommentsById(int imgId) {
        return mapper.getCommentsById(imgId);
    }

    @Override
    public List<ResponseDTO> getRepliesById(String comId) {
        return mapper.getRepliesById(comId);
    }

    @Override
    public int saveComment(ImageCommentDTO imageCommentDTO) {
        return mapper.saveComment(imageCommentDTO);
    }

    @Override
    public int saveReply(ImageReplyDTO imageReplyDTO) {
        return mapper.saveReply(imageReplyDTO);
    }

    @Override
    public int deleteComment(String comId) {
        return mapper.deleteComment(comId);
    }

    @Override
    public int deleteReply(String replyId) {
        return mapper.deleteReply(replyId);
    }

    @Override
    public int updateComment(Map map) {
        return mapper.updateComment(map);
    }

    @Override
    public int updateReply(Map map) {
        return mapper.updateReply(map);
    }
}

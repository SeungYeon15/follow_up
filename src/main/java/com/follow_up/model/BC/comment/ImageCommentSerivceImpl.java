package com.follow_up.model.BC.comment;


import com.follow_up.model.BC.image.ImageDTO;
import java.util.List;
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
}

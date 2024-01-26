package com.follow_up.controller.BC;

import com.follow_up.model.BC.comment.ImageCommentDTO;
import com.follow_up.model.BC.comment.ImageCommentService;
import com.follow_up.model.BC.comment.ImageReplyDTO;
import com.follow_up.model.BC.comment.ResponseDTO;
import com.follow_up.model.BC.image.ImageDTO;
import com.follow_up.model.BC.image.ImageService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommentController {

    @Autowired
    @Qualifier("com.follow_up.model.BC.comment.ImageCommentServiceImpl")
    private ImageCommentService commentService;


    @GetMapping("/api/images/comments/{imgId}")
    public List<ResponseDTO> getCommentsById(@PathVariable int imgId) {
        System.out.println("imgId" +  imgId);
        List<ResponseDTO> comments = commentService.getCommentsById(imgId);

        comments.forEach(comment -> {
            String comId = comment.getComId();
            List<ResponseDTO> replies = commentService.getRepliesById(comId);
            comment.setReplies(replies);
        });

        System.out.println(comments);

        return comments;
    }

    @PostMapping("/api/images/comments/add/{imgId}")
    public ResponseEntity<String> addComment(
            @PathVariable int imgId,
            @RequestBody ResponseDTO responseDTO
    ) {
        try {
            // You can use imgId in your service if needed
            System.out.println("imgid" + imgId);
            System.out.println("responseDTO" + responseDTO);
// imageCommentDTO로 변환후 저장하기

//            commentService.saveComment(imgId, ResponseDTO);
            return ResponseEntity.ok("Comment added successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error adding comment");
        }
    }



}

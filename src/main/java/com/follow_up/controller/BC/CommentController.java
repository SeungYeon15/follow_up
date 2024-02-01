package com.follow_up.controller.BC;

import com.follow_up.model.BC.comment.ImageCommentDTO;
import com.follow_up.model.BC.comment.ImageCommentService;
import com.follow_up.model.BC.comment.ImageReplyDTO;
import com.follow_up.model.BC.comment.ResponseDTO;
import com.follow_up.model.BC.image.ImageDTO;
import com.follow_up.model.BC.image.ImageService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
//        System.out.println("imgId" +  imgId);
        List<ResponseDTO> comments = commentService.getCommentsById(imgId);

        comments.forEach(comment -> {
            String comId = comment.getComId();
            List<ResponseDTO> replies = commentService.getRepliesById(comId);
            comment.setReplies(replies);
        });

//        System.out.println(comments);

        return comments;
    }

    @PostMapping("/api/images/comments/add")
    public ResponseEntity<String> addComment(@RequestBody ImageCommentDTO imageCommentDTO) {
        try {
//            System.out.println("imageCommentDTO" + imageCommentDTO);
            int check = commentService.saveComment(imageCommentDTO);
            if(check<0){
                System.out.println("오류 발생");
                // 저장실패오류는 따로 처리해주기
                throw new Exception();

            }
            return ResponseEntity.ok("Comment added successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error adding comment");
        }
    }
    @PostMapping("/api/images/replies/add")
    public ResponseEntity<String> addReply(@RequestBody ImageReplyDTO imageReplyDTO) {
        try {
//            System.out.println("imageReplyDTO" + imageReplyDTO);
            int check = commentService.saveReply(imageReplyDTO);
            if(check<0){
                System.out.println("오류 발생");
                // 저장실패오류는 따로 처리해주기
                throw new Exception();

            }

            return ResponseEntity.ok("Comment added successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error adding comment");
        }
    }


    @PostMapping("/api/images/comments/delete/{comId}")
    public ResponseEntity<String> deleteComment(@PathVariable String comId) {
        try {
//            System.out.println("comId" + comId);
            int check = commentService.deleteComment(comId);
            if(check<0){
                System.out.println("오류 발생");
                // 오류 따로 처리해주기
                throw new Exception();
            }

            return ResponseEntity.ok("Comment delte successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error adding comment");
        }
    }

    @PostMapping("/api/images/replies/delete/{replyId}")
    public ResponseEntity<String> deleteReply(@PathVariable String replyId) {
        try {
//            System.out.println("replyId" + replyId);
            int check = commentService.deleteReply(replyId);
            if(check<0){

                //오류 따로 처리해주기
                throw new Exception();
            }

            return ResponseEntity.ok("Reply delte successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error adding comment");
        }
    }

    @PostMapping("/api/images/comments/update/{comId}/{contents}")
    public ResponseEntity<String> updateComment(@PathVariable String comId,@PathVariable String contents) {
        Map map = new HashMap();
        map.put("comId", comId);
        map.put("contents", contents);
        System.out.println(map.toString());
        try {
            int check = commentService.updateComment(map);

            if(check<0){
                System.out.println("오류 발생");
                // 오류 따로 처리해주기
                throw new Exception();
            }

            return ResponseEntity.ok("Comment update successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error update comment");
        }
    }

    @PostMapping("/api/images/replies/update/{replyId}/{contents}")
    public ResponseEntity<String> updateReply(@PathVariable String replyId,@PathVariable String contents) {
        Map map = new HashMap();
        map.put("replyId", replyId);
        map.put("contents", contents);
        System.out.println(map.toString());
        try {
            System.out.println("replyId" + replyId + "contents" + contents);
            int check = commentService.updateReply(map);
            if(check<0){
                System.out.println("오류 발생");
                //오류 따로 처리해주기
                throw new Exception();
            }
            return ResponseEntity.ok("Reply update successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error update comment");
        }
    }

}

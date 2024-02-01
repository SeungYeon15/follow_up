package com.follow_up.controller.BC;

import com.follow_up.model.BC.image.ImageDTO;
import com.follow_up.model.BC.image.ImageService;
import com.follow_up.model.BC.image.TestUserDTO;
import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ImageController {
    @Autowired
    @Qualifier("com.follow_up.model.BC.image.ImageServiceImpl")
    private ImageService imageService;

    @GetMapping("/api/images/search")
    public List<ImageDTO> imageList(@RequestParam String col, @RequestParam String word) {
        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        System.out.println("col::"+col);
        System.out.println("word::"+word);
        return imageService.searchImages(map);
    }


    @GetMapping("/api/images/image/{imgId}")
    public ImageDTO getImageById(@PathVariable int imgId) {
//        System.out.println("imgId" +  imgId);
//        System.out.println(imageService.getImageById(imgId).toString());
        return imageService.getImageById(imgId);
    }

    @GetMapping("/api/images/distinctTags")
    public List<String> getDistinctTags(){
        return imageService.getDistinctTags();
    }

    @GetMapping("/api/images/likedImages/{userId}")
    public List<Integer> likedimages(@PathVariable int userId){
//        System.out.println(imageService.getLikedImagesById(userId).toString());
        return imageService.getLikedImagesById(userId);
    }
    @PostMapping("/api/images/like/{imgId}/{userId}")
    public ResponseEntity<Void> likeImage(@PathVariable int imgId, @PathVariable int userId) {
        Map map = new HashMap<>();
        map.put("imgId", imgId);
        map.put("userId", userId);
        imageService.likeImage(map);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/api/images/like/{imgId}/{userId}")
    public ResponseEntity<Void> unlikeImage(@PathVariable int imgId, @PathVariable int userId) {
        Map map = new HashMap<>();
        map.put("imgId", imgId);
        map.put("userId", userId);
        imageService.unlikeImage(map);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/api/images/likeCount/{imgId}")
    public int likeCount(@PathVariable int imgId){

        return imageService.likeCount(imgId);
    }

    @GetMapping("/api/images/viewCount/{imgId}")
    public void viewCount(@PathVariable int imgId)
    {
        imageService.viewCount(imgId);
    }

    @GetMapping("/api/images/downloadCount/{imgId}")
    public void downloadCount(@PathVariable int imgId)
    {
        imageService.downloadCount(imgId);
    }


    @GetMapping("/api/images/collectionedImages/{userId}")
    public List<Integer> collectionedimages(@PathVariable int userId){
//        System.out.println(imageService.getLikedImagesById(userId).toString());
        return imageService.getCollectionedImagesById(userId);
    }
    @PostMapping("/api/images/collection/{imgId}/{userId}")
    public ResponseEntity<Void> collectionImage(@PathVariable int imgId, @PathVariable int userId) {
        Map map = new HashMap<>();
        map.put("imgId", imgId);
        map.put("userId", userId);
        imageService.collectionImage(map);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/api/images/collection/{imgId}/{userId}")
    public ResponseEntity<Void> uncollectionImage(@PathVariable int imgId, @PathVariable int userId) {
        Map map = new HashMap<>();
        map.put("imgId", imgId);
        map.put("userId", userId);
        imageService.uncollectionImage(map);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/api/images/collectionCount/{imgId}")
    public int collectionCount(@PathVariable int imgId){

        return imageService.collectionCount(imgId);
    }

    @GetMapping("/api/images/delete/{imgId}")
    public ResponseEntity<Void> deleteImage(@PathVariable int imgId){
        imageService.deleteImage(imgId);
        return ResponseEntity.ok().build();
    }


    @GetMapping("/api/images/pagemove")
    public TestUserDTO pagemove(){
        System.out.println("경로테스트");
//        여기서 세션 값을 이용해서, 권한
//        만약 세션에 저장되어있는 값들을 저장해서 리턴 을어캐시미
        TestUserDTO testUserDTO = new TestUserDTO();
        testUserDTO.setUserId(1);
        testUserDTO.setUserFile("https://images.unsplash.com/photo-1523413651479-597eb2da0ad6");
        testUserDTO.setUserGrade("A");
        testUserDTO.setUserName("병찬");
        return testUserDTO;
//        return null;
    }

}

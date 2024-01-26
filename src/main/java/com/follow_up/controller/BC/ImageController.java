package com.follow_up.controller.BC;

import com.follow_up.model.BC.image.ImageDTO;
import com.follow_up.model.BC.image.ImageService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
        System.out.println("imgId" +  imgId);
        System.out.println(imageService.getImageById(imgId).toString());


        return imageService.getImageById(imgId);
    }



}

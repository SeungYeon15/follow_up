package com.follow_up.model.BC.image;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.follow_up.model.BC.image.ImageServiceImpl")
public class ImageServiceImpl implements ImageService {

    @Autowired
    private ImageMapper mapper;

    @Override
    public List<ImageDTO> searchImages(Map map) {
        return mapper.searchImages(map);
    }



    @Override
    public ImageDTO getImageById(int imgId) {
        return mapper.getImageById(imgId);
    }


}

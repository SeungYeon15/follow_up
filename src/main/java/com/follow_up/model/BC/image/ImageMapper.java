package com.follow_up.model.BC.image;

import java.util.List;
import java.util.Map;

public interface ImageMapper {
    List<ImageDTO> searchImages(Map map);
    ImageDTO getImageById(int imgId);
}

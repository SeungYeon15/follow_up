package com.follow_up.model.BC.image;


import java.util.List;
import java.util.Map;

public interface ImageService {
    List<ImageDTO> searchImages(Map map);


    ImageDTO getImageById(int imgId);

    void viewCount(int imgId);

    List<String> getDistinctTags();

    List<Integer> getLikedImagesById(int userId);

    void likeImage(Map map);

    void unlikeImage(Map map);

    void downloadCount(int imgId);

    int likeCount(int imgId);

    List<Integer> getCollectionedImagesById(int userId);

    void collectionImage(Map map);

    void uncollectionImage(Map map);

    int collectionCount(int imgId);

    void deleteImage(int imgId);

    int upload(ImageDTO dto);

    TestUserDTO getUserById(int id);
}

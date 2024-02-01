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

    @Override
    public void viewCount(int imgId) {
        mapper.viewCount(imgId);
    }
    @Override
    public List<String> getDistinctTags() {
        return mapper.getDistinctTags();
    }

    @Override
    public List<Integer> getLikedImagesById(int userId) {
        return mapper.getLikedImagesById(userId);
    }

    @Override
    public void likeImage(Map map) {
        mapper.likeImage(map);
    }

    @Override
    public void unlikeImage(Map map) {
        mapper.unlikeImage(map);
    }

    @Override
    public void downloadCount(int imgId) { mapper.downloadCount(imgId); }

    @Override
    public int likeCount(int imgId) {
        return mapper.likeCount(imgId);
    }

    @Override
    public List<Integer> getCollectionedImagesById(int userId) {
        return mapper.getCollectionedImagesById(userId);
    }

    @Override
    public void collectionImage(Map map) {
        mapper.collectionImage(map);
    }

    @Override
    public void uncollectionImage(Map map) {
        mapper.uncollectionImage(map);
    }

    @Override
    public int collectionCount(int imgId) {
        return mapper.collectionCount(imgId);
    }

    @Override
    public void deleteImage(int imgId) {
        mapper.deleteImage(imgId);
    }

    @Override
    public int upload(ImageDTO dto) {
        return mapper.upload(dto);
    }

}

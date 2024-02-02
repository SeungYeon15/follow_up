package com.follow_up.model.SY.music;

import java.util.List;

public interface MusicService {

	List<AlbumDTO> getAlbumList();

	List<MusicDTO> getMusicList(int albumId);

}

package com.follow_up.model.SY.music;

import java.util.List;

public interface MusicMapper {

	List<AlbumDTO> getAlbumList();

	List<MusicDTO> getMusicList(int id);

}

package com.follow_up.model.SY.music;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service ("com.follow_up.model.SY.music.MusicServiceImpl")
public class MusicServiceImpl implements MusicService{
	
	@Autowired
	private MusicMapper mapper;

	@Override
	public List<AlbumDTO> getAlbumList() {
		// TODO Auto-generated method stub
		return mapper.getAlbumList();
	}

	@Override
	public List<MusicDTO> getMusicList(int id) {
		// TODO Auto-generated method stub
		return mapper.getMusicList(id);
	}

}

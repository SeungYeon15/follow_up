package com.follow_up.controller.SY;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.follow_up.model.SY.music.AlbumDTO;
import com.follow_up.model.SY.music.MusicDTO;
import com.follow_up.model.SY.music.MusicService;

import java.util.*;

@Controller
public class MusicControlloer {
	@Autowired
	@Qualifier("com.follow_up.model.SY.music.MusicServiceImpl")
	private MusicService service;
	
	@GetMapping("/music")
	public String music(HttpServletRequest request) {
		List<AlbumDTO> albumList = new ArrayList<>();
		albumList = service.getAlbumList();
		System.out.println(albumList);
		
		request.setAttribute("albumList", albumList);
		
		return "/music";
	}
	
	@GetMapping("/music/getMusicList/{albumId}")
	@ResponseBody
	public List<MusicDTO> getMusicList(@PathVariable int albumId) {
		List<MusicDTO> musicList = service.getMusicList(albumId);
		
		return musicList;
	}
}

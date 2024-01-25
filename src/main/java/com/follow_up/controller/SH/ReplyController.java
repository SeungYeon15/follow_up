package com.follow_up.controller.SH;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.follow_up.model.SH.Board.ReplyDTO;
import com.follow_up.model.SH.Board.ReplyService;
import com.follow_up.utility.Utility;

@RestController
public class ReplyController {
	private static final Logger log = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	@Qualifier("com.follow_up.model.SH.Board.ReplyServiceImpl")
	private ReplyService service;

	@GetMapping("/board/reply/list/{bnum}/{sno}/{eno}")
	public ResponseEntity<List<ReplyDTO>> getList(@PathVariable("bnum") int bnum, @PathVariable("sno") int sno,
			@PathVariable("eno") int eno) {

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bnum", bnum);

		return new ResponseEntity<List<ReplyDTO>>(service.list(map), HttpStatus.OK);
	}

	@GetMapping("/board/reply/page")
	public ResponseEntity<String> getPage(int nPage, int nowPage, int bnum, String col, String word) {
		int total = service.total(bnum);
		String url = "read";

		int recordPerPage = 4; // 한페이지당 출력할 레코드 갯수

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url, nPage, bnum);

		return new ResponseEntity<>(paging, HttpStatus.OK);
	}

	@GetMapping("/board/reply/{rnum}")
	public ResponseEntity<ReplyDTO> get(@PathVariable("rnum") int rnum) {
		log.info("get:" + rnum);

		return new ResponseEntity<>(service.read(rnum), HttpStatus.OK);
	}

	@PostMapping("/board/reply/create")
	public ResponseEntity<String> create(@RequestBody ReplyDTO vo) {
		log.info("ReplyDTO1: " + vo.getRcontent());
		log.info("ReplyDTO1: " + vo.getId());
		log.info("ReplyDTO1: " + vo.getBnum());

		vo.setRcontent(vo.getRcontent().replaceAll("\n\r", "<br>"));

		vo = service.create(vo);
		int flag = vo.getRnum();
//		int flag = service.create(vo);

		log.info("Reply INSERT flag: " + flag);

		return flag > 0 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PutMapping("/board/reply/")
	public ResponseEntity<String> modify(@RequestBody ReplyDTO vo) {
		log.info("modify:" + vo);

		return service.update(vo) > 0 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping("/board/reply/{rnum}")
	public ResponseEntity<String> remove(@PathVariable int rnum) {
		log.info("remove: " + rnum);
		service.delete(rnum);
		int cnt = 1;
		return cnt == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

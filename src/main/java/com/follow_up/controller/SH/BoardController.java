package com.follow_up.controller.SH;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.follow_up.model.SH.Board.BoardDTO;
import com.follow_up.model.SH.Board.BoardService;
import com.follow_up.model.SH.Board.ReplyMapper;
import com.follow_up.utility.Utility;

@Controller
public class BoardController {
	@Autowired
	@Qualifier("com.follow_up.model.SH.Board.BoardServiceImpl")
	private BoardService service;

	@Autowired
	private ReplyMapper rmapper;

	// 게시판 목록
	@RequestMapping("/board/list")
	public String list(HttpServletRequest request) {
		// 검색
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이지
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;

		// DB에서 가져오는 순서
		int sno = ((nowPage - 1) * recordPerPage);
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("cnt", recordPerPage);

		int total = service.total(map);

		List<BoardDTO> list = service.list(map);

		String url = "/board/list";

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		request.setAttribute("rmapper", rmapper);

		return "/board/list";
	}

	// 게시판 조회
	@GetMapping("/board/read")
	public String read(int bnum, Model model, HttpServletRequest request) {
		service.upViewcnt(bnum); // 조회수 증가
		BoardDTO dto = service.read(bnum);// 데이터 한건 조회
		String bcontent = dto.getBcontent().replaceAll("\r\n", "<br>");
		dto.setBcontent(bcontent);
		model.addAttribute("dto", dto);

		/* 댓글 */
		int nPage = 1;
		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 5;

		int sno = (nPage - 1) * recordPerPage;
		int eno = recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("nPage", nPage);

		model.addAllAttributes(map);

		return "/board/read";
	}

	// 게시판 등록
	@GetMapping("/board/create")
	public String create() {

		return "/board/create";
	}

	@PostMapping("/board/create")
	public String create(BoardDTO dto) {
		Boolean flag = false;

		int cnt = service.create(dto);

		if (cnt > 0)
			flag = true;

		if (flag) {
			return "redirect:/board/list";
		} else {
			return "error";
		}
	}

	// 게시판 삭제
	@GetMapping("/board/delete")
	public String delete(Model model) {
		boolean flag = true;

		model.addAttribute("flag", flag);

		return "/board/delete";
	}

	@PostMapping("/board/delete")
	public String delete(@RequestParam Map<String, String> map, RedirectAttributes redirect) {
		boolean pflag = false;
		int cnt = service.passCheck(map);
		if (cnt > 0) {
			pflag = true;
		}

		boolean flag = false;

		if (pflag) {
			int bnum = Integer.parseInt(map.get("bnum"));
			int cnt2 = service.delete(bnum);

			if (cnt2 > 0) {
				flag = true;
			}
		}

		if (!pflag) {
			return "passwdError";
		} else if (flag) {
			redirect.addAttribute("nowPage", map.get("nowPage"));
			redirect.addAttribute("col", map.get("col"));
			redirect.addAttribute("word", map.get("word"));

			return "redirect:/board/list";
		} else {
			return "error";
		}
	}

	// 게시판 수정
	@GetMapping("/board/update")
	public String update(int bnum, Model model) {

		model.addAttribute("dto", service.read(bnum));

		return "/board/update";
	}

	@PostMapping("/board/update")
	public String update(BoardDTO dto, String nowPage, String col, String word, RedirectAttributes redirect) {
		// 패스워드 확인
		Boolean pflag = false;
		Map map = new HashMap();
		map.put("bnum", dto.getBnum());
		map.put("bpasswd", dto.getBpasswd());

		int pass = service.passCheck(map);

		if (pass > 0) {
			pflag = true;
		}

		// 데이터베이스 수정
		Boolean flag = false;

		if (pflag) {
			int cnt = service.update(dto);
			if (cnt > 0) {
				flag = true;
			}
		}

		// 목록 이동
		if (!pflag) {
			return "passwdError";
		} else if (flag) {
			redirect.addAttribute("nowPage", nowPage);
			redirect.addAttribute("col", col);
			redirect.addAttribute("word", word);
			return "redirect:/board/list";
		} else {
			return "error";
		}
	}
}

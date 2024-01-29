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

import com.follow_up.model.SH.notice.NoticeDTO;
import com.follow_up.model.SH.notice.NoticeService;
import com.follow_up.utility.Utility;

@Controller
public class NoticeController {
	@Autowired
	@Qualifier("com.follow_up.model.SH.notice.NoticeServiceImpl")
	private NoticeService service;
	
	// 공지사항 목록
	@RequestMapping("/notice/list")
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

		List<NoticeDTO> list = service.list(map);

		String url = "/notice/list";

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/notice/list";
	}

	// 공지사항 조회
	@GetMapping("/notice/read")
	public String read(int nnum, Model model, HttpServletRequest request) {
		service.upViewcnt(nnum); // 조회수 증가
		NoticeDTO dto = service.read(nnum);// 데이터 한건 조회
		String content = dto.getNcontent().replaceAll("\r\n", "<br>");
		dto.setNcontent(content);
		model.addAttribute("dto", dto);

		return "/notice/read";
	}

	// 공지사항 등록
	@GetMapping("/notice/create")
	public String create() {

		return "/notice/create";
	}

	@PostMapping("/notice/create")
	public String create(NoticeDTO dto) {
		Boolean flag = false;

		int cnt = service.create(dto);

		if (cnt > 0)
			flag = true;

		if (flag) {
			return "redirect:/notice/list";
		} else {
			return "error";
		}
	}
	
	// 공지사항 삭제
	@GetMapping("/notice/delete")
	public String delete(Model model) {
		boolean flag = true;

		model.addAttribute("flag", flag);

		return "/notice/delete";
	}

	@PostMapping("/notice/delete")
	public String delete(@RequestParam Map<String, String> map, RedirectAttributes redirect) {
		boolean pflag = false;
		int cnt = service.passCheck(map);
		if (cnt > 0) {
			pflag = true;
		}

		boolean flag = false;

		if (pflag) {
			int nnum = Integer.parseInt(map.get("nnum"));
			int cnt2 = service.delete(nnum);

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

			return "redirect:/notice/list";
		} else {
			return "error";
		}
	}

	// 공지사항 수정
	@GetMapping("/notice/update")
	public String update(int nnum, Model model) {

		model.addAttribute("dto", service.read(nnum));

		return "/notice/update";
	}

	@PostMapping("/notice/update")
	public String update(NoticeDTO dto, String nowPage, String col, String word, RedirectAttributes redirect) {
		// 패스워드 확인
		Boolean pflag = false;
		Map map = new HashMap();
		map.put("nnum", dto.getNnum());
		map.put("npasswd", dto.getNpasswd());
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
			return "redirect:/notice/list";
		} else {
			return "error";
		}
	}
}

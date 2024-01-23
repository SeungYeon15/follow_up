package com.follow_up.controller.SH;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.follow_up.model.SH.Board.BoardDTO;
import com.follow_up.model.SH.Board.BoardService;
import com.follow_up.utility.Utility;

@Controller
@MapperScan(basePackages = "com.follow_up.model.SH.Board")
public class BoardController {
	@Autowired
	@Qualifier("com.follow_up.model.SH.Board.BoardServiceImpl")
	private BoardService service;

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
		// request.setAttribute("rmapper", rmapper);

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

		return "/notice/read";
	}

	/*
	 * @Autowired private ReplyMapper rmapper;
	 */

	// 상품 등록
	/*
	 * @GetMapping("/board/create") public String create() {
	 * 
	 * return "/board/create"; }
	 * 
	 * @PostMapping("/board/create") public String create(BoardDTO dto) { // 업로드 처리
	 * 
	 * if (dto.getFilenameMF().getSize() > 0) {
	 * dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(),
	 * UploadNot.getUploadDir())); dto.setFilesize((int)
	 * dto.getFilenameMF().getSize()); }
	 * 
	 * // 데이터베이스 저장
	 * 
	 * Boolean flag = false;
	 * 
	 * int cnt = service.create(dto);
	 * 
	 * if (cnt > 0) flag = true;
	 * 
	 * if (flag service.create(dto) == 1 ) { return "redirect:/board/list"; } else {
	 * return "error"; }
	 * 
	 * }
	 */

	/**
	 * @GetMapping("/board/update") public String update(int boardno, Model model) {
	 * 
	 * model.addAttribute("dto", service.read(boardno));
	 * 
	 * return "/board/update"; }
	 * 
	 * @PostMapping("/board/update") public String update(BoardDTO dto, String
	 * nowPage, String col, String word, RedirectAttributes redirect, String
	 * oldfile) { // 패스워드 확인 Boolean pflag = false; Map map = new HashMap();
	 * map.put("boardno", dto.getBoardno()); map.put("passwd", dto.getPasswd());
	 * 
	 * int pass = service.passCheck(map);
	 * 
	 * if (pass > 0) { pflag = true; }
	 * 
	 * // 데이터베이스 수정 Boolean flag = false;
	 * 
	 * if (pflag) { // 파일 업로드 if (dto.getFilenameMF().getSize() > 0) { if (oldfile
	 * != null) Utility.deleteFile(UploadNot.getUploadDir(), oldfile);
	 * dto.setFilename(Utility.saveFileSpring(dto.getFilenameMF(),
	 * UploadNot.getUploadDir())); dto.setFilesize((int)
	 * dto.getFilenameMF().getSize()); }
	 * 
	 * int cnt = service.update(dto);
	 * 
	 * if (cnt > 0) { flag = true; } }
	 * 
	 * // 목록 이동 if (!pflag) { return "passwdError"; } else if (flag) {
	 * redirect.addAttribute("nowPage", nowPage); redirect.addAttribute("col", col);
	 * redirect.addAttribute("word", word); return "redirect:/board/list"; } else {
	 * return "error"; } }
	 * 
	 * 
	 * @GetMapping("/board/delete") public String delete(Model model) { boolean flag
	 * = true;
	 * 
	 * model.addAttribute("flag", flag);
	 * 
	 * return "/board/delete"; }
	 * 
	 * @PostMapping("/board/delete") public String delete(@RequestParam Map<String,
	 * String> map, RedirectAttributes redirect) {
	 * 
	 * boolean pflag = false; int cnt = service.passCheck(map); if (cnt > 0) { pflag
	 * = true; }
	 * 
	 * boolean flag = false;
	 * 
	 * if (pflag) { int boardno = Integer.parseInt(map.get("boardno")); int cnt2 =
	 * service.delete(boardno);
	 * 
	 * if (cnt2 > 0) { flag = true; } }
	 * 
	 * if (!pflag) { return "passwdError"; } else if (flag) {
	 * redirect.addAttribute("nowPage", map.get("nowPage"));
	 * redirect.addAttribute("col", map.get("col")); redirect.addAttribute("word",
	 * map.get("word"));
	 * 
	 * return "redirect:/board/list"; } else { return "error"; }
	 * 
	 * }
	 * 
	 * // 파일 다운로드
	 * 
	 * @GetMapping("/board/fileDown") public void fileDown(String filename,
	 * HttpServletResponse response) throws IOException { String dir =
	 * UploadNot.getUploadDir(); byte[] files = FileUtils.readFileToByteArray(new
	 * File(dir, filename)); response.setHeader("Content-disposition", "attachment;
	 * fileName=\"" + URLEncoder.encode(filename, "UTF-8") + "\";"); //
	 * Content-Transfer-Encoding : 전송 데이타의 body를 인코딩한 방법을 표시함.
	 * response.setHeader("Content-Transfer-Encoding", "binary");
	 *//**
		 * Content-Disposition가 attachment와 함게 설정되었다면 'Save As'로 파일을 제안하는지 여부에 따라 브라우저가
		 * 실행한다.
		 *//*
			 * response.setContentType("application/octet-stream");
			 * response.setContentLength(files.length);
			 * response.getOutputStream().write(files); response.getOutputStream().flush();
			 * response.getOutputStream().close(); }
			 */
}

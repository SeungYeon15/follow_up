package com.follow_up.controller.NH;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.follow_up.UploadCon;
import com.follow_up.UploadMem;
//import com.UploadCon;
import com.follow_up.model.NH.member.MemberDTO;
import com.follow_up.model.NH.member.MemberService;
import com.follow_up.utility.Utility;

@Controller
public class MemberController {

	
	
	@Autowired
	@Qualifier("com.follow_up.model.NH.member.MemberServiceImpl")
	private MemberService service;

	/** 동의 페이지 **/
	@GetMapping("/member/agree")
	public String agree() {

		return "/member/agree";
	}
	
	@GetMapping("/member/login")
	public String login(HttpServletRequest request) {
		/*----쿠키설정 내용시작----------------------------*/
		String c_id = ""; // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue(); // Y
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue(); // user1...
				}
			}
		}
		/*----쿠키설정 내용 끝----------------------------*/

		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);

		return "/member/login";
	}

	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

	@PostMapping("/member/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(map.toString());
		int cnt = service.loginCheck(map);
//		String cnt2 = service.findCheck(map);
		
		if (cnt > 0) {
			Map<String, String> gmap = service.getGrade(map.get("Email"));
			System.out.println("gmap"+ gmap.toString());
			session.setAttribute("userEmail", map.get("Email"));
			session.setAttribute("userId", gmap.get("userId"));
			session.setAttribute("userGrade", gmap.get("userGrade"));
			session.setAttribute("userName", gmap.get("userName"));
			// Cookie 저장,id저장 여부 및 id
			Cookie cookie = null;
			String c_id = request.getParameter("c_id");
			if (c_id != null) {
				cookie = new Cookie("c_id", c_id); // c_id=> Y
				cookie.setMaxAge(60 * 60 * 24 * 365);// 1년
				response.addCookie(cookie);// 요청지(client:브라우저 컴) 쿠키 저장

				cookie = new Cookie("c_id_val", map.get("id"));
				cookie.setMaxAge(60 * 60 * 24 * 365);// 1년
				response.addCookie(cookie);// 요청지(client:브라우저 컴) 쿠키 저장
			} else {
				cookie = new Cookie("c_id", ""); // 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", "");// 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

		}

		if (cnt > 0) {

			return "redirect:/";
		} else {

			request.setAttribute("msg", "아이디 또는 비밀번호를 잘못 입력 했거나 <br>회원이 아닙니다. 회원가입 하세요");
			return "passwdError";
		}
	}
	
	@PostMapping("/member/find_email")
	@ResponseBody
	public Map<String,String> find(HttpServletRequest request) {
			Map<String,String> map = new HashMap<>();
			String name = request.getParameter("name");
			
			Map<String,String> info = new HashMap<>();
			info.put("name", name);
			String email = service.getfind_emailcheck(info);
			
			if (email == null) {

				map.put("str", "이름을 확인해주세요!");
				return map;
				
			} 
			map.put("str", name+"님의 이메일: " + email + "입니다.");
			return map;
	}
	
	@PostMapping("/member/find_pwd")
	@ResponseBody
	public Map<String,String> find_pwd (HttpServletRequest request) {
			Map<String,String> map = new HashMap<>();
			String email = request.getParameter("email");
			
			Map<String,String> info = new HashMap<>();
			info.put("email", email);
			String pwd = service.getfind_pwdcheck(info);
			
			if (pwd == null) {

				map.put("str", "이메일을 확인해주세요!");
				return map;
				
			} 
			map.put("str", email +"님의 비밀번호: " + pwd + "입니다.");
			return map;
	}

	
	@PostMapping("/member/createForm")
	public String create() {
		return "/member/create";
	}
	
	@PostMapping("/member/create")
	public String create(MemberDTO dto) {
		//아이디 중복확인 한다. (service....)
		int cnt1 = service.duplicatedEmail(dto.getUserEmail());
		
		if(cnt1>0) {
			
			return "error2";
		}
		
		//이메일 중복확인 한다. 
		//if(cnt1>0 || cnt2>0){
		//
		//}
		String fname = Utility.saveFileSpring(dto.getFnameMF(), UploadMem.getUploadDir());
		long fsize = dto.getFnameMF().getSize();

		if (fsize == 0)
			fname = "member.jpg";

		dto.setUserFile(fname);

		int cnt = service.create(dto);

		if (cnt > 0) {
			return "redirect:/";
		} else {
			return "error";
		}

	}// create() end
	
	@GetMapping(value = "/member/emailcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> emailcheck(String email) {
		int cnt = service.duplicatedEmail(email);
		Map<String, String> map = new HashMap<String, String>();

		if (cnt > 0) {
			map.put("str", email + "는 중복되어서 사용할 수 없습니다.");
		} else {
			map.put("str", email + "는 중복아님, 사용가능합니다.");
		}

		return map;

	}
	
	@GetMapping("/member/mypage")
	public String mypage() {

		return "/member/mypage";
	}
		
	
	
	
//
//	@PostMapping("/member/create")
//	public String create(MemberDTO dto) {
//		//아이디 중복확인 한다. (service....)
//		int cnt2 = service.duplicatedId(dto.getUserId());
//		int cnt1 = service.duplicatedEmail(dto.getUserEmail());
//		
//		if(cnt2>0 || cnt1>0) {
//			
//			return "error2";
//		}
//		
//		//이메일 중복확인 한다. 
//		//if(cnt1>0 || cnt2>0){
//		//
//		//}
//		String fname = Utility.saveFileSpring(dto.getFnameMF(), UploadMem.getUploadDir());
//		long fsize = dto.getFnameMF().getSize();
//
//		if (fsize == 0)
//			fname = "member.jpg";
//
//		dto.setFname(fname);
//
//		int cnt = service.create(dto);
//
//		if (cnt > 0) {
//			return "redirect:/";
//		} else {
//			return "error";
//		}
//
//	}// create() end
	
}// class end

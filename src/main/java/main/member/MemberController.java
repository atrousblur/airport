package main.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;

import erp.insa.dto.EmpDTO;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	// 카카오 로그인
	@RequestMapping(value = "/member/kakao", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaologin(@RequestParam("code") String code, HttpSession Session) {
		JsonNode token = KakaoLogin.getAccessToken(code);
		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		String id = profile.path("id").asText();
		String nickname = profile.path("properties").path("nickname").asText();
		String email = profile.path("kaccount_email").asText();
		String urlPath = null;
		MemberDTO member = new MemberDTO();
		boolean loginUser = service.idCheck(id);
		if (loginUser == false) {
			member.setId(id);
			member.setName(nickname);
			member.setEmail(email);
			service.kakao(member);
			Session.removeAttribute("loginUser");
			Session.setAttribute("loginUser", id);
			urlPath = "redirect:/main/index.do";
		} else {
			Session.removeAttribute("loginUser");
			Session.setAttribute("loginUser", id);
			urlPath = "redirect:/main/index.do";
		}
		return urlPath;
	}

	// 회원가입
	@RequestMapping(value = "/member/signup.do", method = RequestMethod.POST)
	public String signup(MemberDTO member, HttpSession session) {
		if (member.getEmail_alarm() == null) {
			member.setEmail_alarm("n");
		}
		if (member.getSms_alarm() == null) {
			member.setSms_alarm("n");
		}

		int result = service.signup(member);
		// System.out.println(result + "가입 성공");
		return "redirect:/main/signin.do";
	}

	// 로그인
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String login(MemberDTO user, HttpSession session) {
		String viewName = "";
		MemberDTO loginUser = service.login(user.getId(), user.getPwd());

		if (loginUser != null) {
			if (loginUser.getState().equals("1")) {
				viewName = "redirect:/main/index.do";
				session.setAttribute("loginUser", loginUser);
			} else if (loginUser.getState().equals("0")) { // 회원탈퇴의 경우
				viewName = "redirect:/main/signin.do";
			}
		} else {
			viewName = "redirect:/main/signin.do";
		}
		return viewName;
	}

	// 로그아웃
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/main/signin.do";
	}

	// 아이디 중복 체크
	@RequestMapping(value = "/member/idcheck.do", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	public @ResponseBody String idCheck(String id) {
		String result = "";
		boolean check = service.idCheck(id);
		if (check) {
			result = "이미 존재하는 아이디";
		}
		return result;
	}

	// 회원 정보 수정
	@RequestMapping(value = "/member/update.do", method = RequestMethod.POST)
	public String update(MemberDTO user) {
		int result = service.update(user);
		System.out.println(result + "수정 성공");
		return "redirect:/main/myservice.do";
	}

	// 회원 탈퇴 - 상태변경
	@RequestMapping(value = "/member/withdraw.do", method = RequestMethod.POST)
	public String withdraw(MemberDTO user) {
		int result = service.withdraw(user);
		System.out.println(result + "탈퇴 성공");
		return "redirect:/main/index.do";
	}

	// 회원목록
	@RequestMapping(value = "/main/admin")
	public ModelAndView emplist() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> memberlist = service.memberList();
		for (int i = 0; i < memberlist.size();i++) {
			if(memberlist.get(i).getState().equals("0")){
				memberlist.get(i).setState("탈퇴");
			}else if(memberlist.get(i).getState().equals("1")){
				memberlist.get(i).setState("일반");
			}else if(memberlist.get(i).getState().equals("2")){
				memberlist.get(i).setState("카카오");
			}
		}
		mav.addObject("memberlist", memberlist);
		mav.setViewName("adminMain");
		return mav;
	}
	
	// 회원검색
	@RequestMapping(value="/main/admin/membersearh.do")
	public ModelAndView empsearch(String search){
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> memberlist = service.memberSearch(search);
		for (int i = 0; i < memberlist.size();i++) {
			if(memberlist.get(i).getState().equals("0")){
				memberlist.get(i).setState("탈퇴");
			}else if(memberlist.get(i).getState().equals("1")){
				memberlist.get(i).setState("일반");
			}else if(memberlist.get(i).getState().equals("2")){
				memberlist.get(i).setState("카카오");
			}
		}
		mav.addObject("memberlist", memberlist);
		mav.setViewName("adminMain");
		return mav;
	} 

}
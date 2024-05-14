package com.remake.weplay.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.remake.weplay.member.model.service.MemberService;
import com.remake.weplay.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/***
	 * 로그인 (암호)
	 * @param member
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("login.member")
	public ModelAndView login(Member member, HttpSession session, ModelAndView mv) {
		
		Member loginUser = memberService.login(member);
		if(loginUser != null && bcryptPasswordEncoder.matches(member.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			
			mv.setViewName("main");
		} else {
			// model.addAttribute
			mv.addObject("errorMsg", "로그인 실패..").setViewName("common/errorPage");
			// 메소드 체이닝 가능
		System.out.println(loginUser);
		}
		return mv;
	}
	
	/***
	 * 로그아웃
	 * @param session
	 * @return
	 */
	@RequestMapping("logout.member")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	
	/***
	 * 회원가입 폼
	 * @return
	 */
	@RequestMapping("enrollForm.member")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	
	/***
	 * 로그인 폼
	 * @return
	 */
	@RequestMapping("loginForm.member")
	public String loginForm() {
		return "member/memberLoginForm";
	}
	/***
	 * 회원가입
	 * @param member
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping("insert.member")
	public ModelAndView insertMember(Member member, ModelAndView mv, HttpSession session) {
		
		member.setUserPwd(bcryptPasswordEncoder.encode(member.getUserPwd()));
		
		if(memberService.insert(member) > 0) {
			session.setAttribute("alertMsg", "가입 성공");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "회원가입 실패..").setViewName("common/errorPage");
		}
		return mv;
	}
}

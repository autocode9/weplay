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
	
//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder;
//	
//	/***
//	 * 로그인 (암호)
//	 * @param member
//	 * @param session
//	 * @param mv
//	 * @return
//	 */
//	@RequestMapping("login.member")
//	public ModelAndView login(Member member, HttpSession session, ModelAndView mv) {
//		
//		// 사용자가 입력한 비밀번호 : member.getUserPwd()(평문)
//		
//		// 하지만 Member테이블의 USER_PWD컬럼에는 암호문이 들어있기 때문에
//		// WHERE 조건절의 조건식이 절대로 true가 될 수 없음
//		Member loginUser = memberService.login(member);
//		
//		// Member member의 userPwd필드 : 사용자가 입력한 비밀번호(평문)
//		// Member loginUser의 userPwd필드 : DB에 기록된 암호화된 비밀번호
//		
//		// 1234
//		// $2a$10$K89Uu1GgSAst4Ta5nxt.qeCfFhmU6liP5SeYzBVaPbb7K1p0ffgjy
//		
//		// BCryptPasswordEncoder객체 matches()
//		// matches(평문, 암호문)
//		// 암호문에 포함되어있는 버전과 반복횟수와 소금값을 가지고 인자로 전달된 평문을 다시 암호화를 거쳐
//		// 두 번째 인자로 전달된 암호문과 같은지 다른지를 비교한 결과값을 반환
//		
//		if(loginUser != null && bcryptPasswordEncoder.matches(member.getUserPwd(), loginUser.getUserPwd())) {
//			session.setAttribute("loginUser", loginUser);
//			mv.setViewName("redirect:/");
//		} else {
//			// model.addAttribute
//			mv.addObject("errorMsg", "로그인 실패..").setViewName("common/errorPage");
//			// 메소드 체이닝 가능
//		}
//		return mv;
//	}
	
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
//	/***
//	 * 회원가입
//	 * @param member
//	 * @param mv
//	 * @param session
//	 * @return
//	 */
//	@RequestMapping("insert.member")
//	public ModelAndView insertMember(Member member, ModelAndView mv, HttpSession session) {
//		// 1. 한글 문자가 깨짐 -> 인코딩 -> web.xml에 스프링에서 제공하는 인코딩 필터 등록
//		// 2. 나이를 입력하지않으면 int자료형에 빈 문자열이 넘어오기때문에 
//		// 파싱과정에서 String -> int NumberFormatException 발생함
//		// 클라이언트에게는 400 Bad Request가 뜸
//		// 3. 비밀번호가 사용자가 입력한 있는 그대로의 평문(plain text)
//		// Bcrypt방식을 사용해서 암호화 => Spring Security Module제공 (pom.xml)
//		// BCrypt클래스를 .xml 파일 이용해서 configurationBean으로 Bean으로 등록 
//		// ==> web.xml 에서 spring-security.xml파일을 로딩할 수 있도록 추가
//		
//		//System.out.println("평문 : " + member.getUserPwd());
//		// 암호화 작업(암호문을 만들어내는 과정)
//		//String encPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
//		//System.out.println("암호문 : " + encPwd);
//		
//		member.setUserPwd(bcryptPasswordEncoder.encode(member.getUserPwd())); // Member객체 userPwd필드에 평문이 아닌 암호문을 담아서 DB로 보내기
//		
//		if(memberService.insert(member) > 0) {
//			session.setAttribute("alertMsg", "가입 성공");
//			mv.setViewName("redirect:/");
//		} else {
//			mv.addObject("errorMsg", "회원가입 실패..").setViewName("common/errorPage");
//		}
//		return mv;
//	}
}

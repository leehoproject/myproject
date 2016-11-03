package com.naver.dlghdud740;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.dlghdud740.entities.Login;
import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.service.MemberDao;

@Controller
public class LoginController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}	
	@RequestMapping(value = "/loginfail", method = RequestMethod.GET)
	public String loginfail() {
		return "login/loginfail";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:/index";
	}
	@RequestMapping(value = "/loginup", method = RequestMethod.POST)
	public String loginup(@ModelAttribute("member") Member member,HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member data = dao.selectLogin(member);
		if(data == null){
			return "redirect:/loginfail";
		}else{
			session.setAttribute("sessionid", data.getId());
			session.setAttribute("sessionpass", data.getPassword());
			session.setAttribute("sessionname", data.getName());
			session.setAttribute("sessionemail", data.getEmail());
			
		}
		return "redirect:/index";		
	}
}
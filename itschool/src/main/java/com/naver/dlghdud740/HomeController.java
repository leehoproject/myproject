package com.naver.dlghdud740;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dlghdud740.entities.Board;
import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.service.BoardDao;
import com.naver.dlghdud740.service.MemberDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private Member member;
	@Autowired
	private Board Board;
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "redirect:/home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {	
		return "layout/main-body";
	}
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute("member") Member member) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		try {
			member.setPhoto(member.getImgfile().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg = "";
		int result = dao.insertRow(member);
		if(result==1){
			msg="success! Insert your Info.";
		} else {
			msg="fail! yout Info.";
		}
		ModelAndView mav = new ModelAndView("jQuerytest/member_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
//		mav.addObject("content","jQuerytest/member_result");
		return mav;
	}
	@RequestMapping(value = "/result_submit", method = RequestMethod.POST)
	public String result(Locale locale, Model model) {	
		return "jQuerytest/result_submit";
	}
	@RequestMapping(value = "/membersearch", method = RequestMethod.GET)
	public String search(Locale locale, Model model) {	
		return "jQuerytest/membersearch";
	}
	@RequestMapping(value = "/salary", method = RequestMethod.GET)
	public String salary(Locale locale, Model model) {	
		return "salary/salary_main";
	}
	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
	@ResponseBody public int idconfirm( @RequestParam("id") String id) {
		int count = 0;
		int find = 0;
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		try {
			count = dao.selectCount(id);
		} catch (Exception e) {
			System.out.println("idconfirm err: "+e.getMessage());
		}
		if(count>0)
			find=1;
		else
			find=0;
		return find;
	}
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	@ResponseBody public ModelAndView memberupdate(@RequestParam("id") String id ) {
		ModelAndView mav = new ModelAndView("jQuerytest/member_update_form");
		return mav;
	}
	@RequestMapping(value = "/memberInsertForm", method = RequestMethod.GET)
	public String memberInsertForm( ) {	
		return "jQuerytest/jQuerytest";
	}

	@RequestMapping(value = "/member_result", method = RequestMethod.GET)
	public String memberresult( ) {	
		return "jQuerytest/member_result";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index( ) {	
		return "layout/main-body";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main( ) {	
		return "wass/index";
	}
	@RequestMapping(value = "/elements.html", method = RequestMethod.GET)
	public String elements( ) {	
		return "wass/elements";
	}
	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public String main2( ) {	
		return "layout/main-body";
	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register( ) {	
		return "jQuerytest/jQuerytest";
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list( ) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member> members= dao.selectAll();
		ModelAndView mav = new ModelAndView("layout/list");
		mav.addObject("members",members);
		return mav;
	}
	@RequestMapping(value = "/memberdeleteyn", method = RequestMethod.GET)
	public ModelAndView memberdeleteyn(@RequestParam String id ) {
		ModelAndView mav = new ModelAndView("jQuerytest/member_delete_rs");
		mav.addObject("id",id);
		return mav;
	}
	@RequestMapping(value = "/memberdelete", method = RequestMethod.GET)
	public ModelAndView memberdelete(@RequestParam("id") String id ) {
		System.out.println("id :"+id);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		String msg = "";
		int result = dao.deleteRow(id);
		if(result==1){
			msg="success! Delete yout info.";
		} else {
			msg="fail!";
		}
		ModelAndView mav = new ModelAndView("jQuerytest/member_result");
		mav.addObject("msg",msg);
		return mav;
	}
	@RequestMapping(value = "/memberselectdelete", method = RequestMethod.GET)
	public String memberselectdelete(@RequestParam String saveids[] ) {
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		for (String ids:saveids){
			int result = dao.deleteRow(ids);
		}
		return "redirect:/list";
	}
	@RequestMapping(value = "/member_update_form", method = RequestMethod.GET)
	public ModelAndView member_update_form(@RequestParam("id") String id ,HttpServletResponse response, HttpServletRequest request) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(id);
//		String path = request.getContextPath();
//		byte[] bytes = member.getPhoto();
//		if(bytes.length>0){
//			InputStream in = new ByteArrayInputStream(bytes);
//			BufferedImage bimg = ImageIO.read(in);
//			in.close();
//			ServletOutputStream sos = response.getOutputStream();
//			member.setImgfile();
//		}
		ModelAndView mav = new ModelAndView("jQuerytest/member_update_form");
		mav.addObject("member",member);
		return mav;
	}
	
	@RequestMapping(value = "/memberupdate", method = RequestMethod.GET)
	public ModelAndView memberupdate(@ModelAttribute("member") Member member ) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);

//		try {
//			member.setPhoto(member.getImgfile().getBytes());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		String msg = "";
		int result = dao.updateRow(member);
		if(result==1){
			msg="success! Insert your Info.";
		} else {
			msg="fail! yout Info.";
		}
		ModelAndView mav = new ModelAndView("jQuerytest/member_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
//		mav.addObject("content","jQuerytest/member_result");
		return mav;
	}
}

package com.naver.dlghdud740;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dlghdud740.entities.Board;
import com.naver.dlghdud740.entities.BoardPage;
import com.naver.dlghdud740.entities.BoardPaging;
import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.service.BoardDao;
import com.naver.dlghdud740.service.MemberDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController implements ApplicationContextAware{
	@Autowired
	private Board board;
	@Autowired
	private SqlSession sqlSession;
	private WebApplicationContext context =null;
	private int selectedPage;
	public static String selectbox;
	public static String find;
	
	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		this.context = (WebApplicationContext) arg0;
	}
	
	@RequestMapping(value = "/boardPageList", method = RequestMethod.POST)
	public ModelAndView boardpagelist(@ModelAttribute("boardpaging") BoardPaging boardpaging) {
		BoardDao dao =sqlSession.getMapper(BoardDao.class);
		ModelAndView mav = new ModelAndView("jQuerytest/board_list");
		
		this.selectbox = boardpaging.getSelectbox();
		this.find = boardpaging.getFind();
		int rowcount = dao.selectCount(boardpaging);
		int pageSize = 10;
		int pageCount = 0;
		int absPage = 0;
		
		if(selectedPage == 0)
			selectedPage =1;
		int startrow = (selectedPage - 1) *pageSize;
		int endrow = startrow + 10;
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		
		ArrayList<Board> boards = dao.selectPageList(boardpaging);
		
		if(rowcount>0 && rowcount%pageSize != 0)
			absPage = 1;
		pageCount = rowcount / pageSize + absPage;
		int pages [] =new int[pageCount];
		for(int i = 0 ; i< pageCount; i++){
			pages[i] = i+1;
		}
		mav.addObject("boardpaging",boardpaging);
		mav.addObject("boards",boards);
		mav.addObject("pages",pages);
		
		return mav;
	}
	
	@RequestMapping(value = "/boardpageselect", method = RequestMethod.GET)
	public ModelAndView boardpageselect(@RequestParam int page,@ModelAttribute("boardpaging") BoardPaging boardpaging) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ModelAndView mav = new ModelAndView("jQuerytest/board_list");
		
		boardpaging.setSelectbox(this.selectbox);
		boardpaging.setFind(this.find);
		int rowcount = dao.selectCount(boardpaging);
		int pageSize = 10;
		int absPage = 0;
		int startrow = (page - 1) * pageSize;
		int endrow = startrow + 10;
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		
		ArrayList<Board> boards = dao.selectPageList(boardpaging);
		if(rowcount>0 && rowcount%pageSize != 0)
			absPage = 1;
		int pageCount = rowcount / pageSize + absPage;
		int pages [] =new int[pageCount];
		for(int i = 0 ; i< pageCount; i++){
			pages[i] = i+1;
		}
		mav.addObject("boardpaging",boardpaging);
		mav.addObject("boards",boards);
		mav.addObject("pages",pages);
		
		return mav;
	}
	
	@RequestMapping(value = "/boarddownload", method = RequestMethod.GET)
	public ModelAndView boarddownlaod(@RequestParam("b_attach")String b_attach) {
		File file = new File(b_attach);
		return new ModelAndView("download","downloadFile",file);
	}
	
	@RequestMapping(value = "/boardinsert", method = RequestMethod.POST)
	public ModelAndView boardinsert(@ModelAttribute("board") Board board,HttpServletRequest request,
			@RequestParam CommonsMultipartFile file,HttpSession session) {
		String path="D:/KFMT/itschool/src/main/webapp/resources/uploadFolder/";
		String filename=file.getOriginalFilename();
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String b_ip = request.getRemoteAddr();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate = new Date();
		String b_date = simple.format(currentdate);
		board.setB_ip(b_ip);
		board.setB_date(b_date);
		board.setB_step(0);
		board.setB_hit(0);
		board.setB_level(0);
		System.out.println(filename);
		if(filename.equals("")){
			board.setB_attach(filename);
		} else {
			board.setB_attach(path+filename);
			try {
				byte barr[]=file.getBytes();
				
				BufferedOutputStream bout = new BufferedOutputStream(
						new FileOutputStream(path+filename));
				bout.write(barr);
				bout.flush();
				bout.close();
				} catch (Exception e) {
					System.out.println(e);
				}
		}
		String msg = "";
		
		
		int result = dao.insertcontent(board);
		if(result==1){
			msg="success! Insert your Info.";
		} else {
			msg="fail! yout Info.";
		}
		ModelAndView mav = new ModelAndView("jQuerytest/board_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
		return mav;
	}

	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public ModelAndView boardlist(HttpServletRequest request,@ModelAttribute("boardpaging") BoardPaging boardpaging) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		this.selectbox="b_title";
		this.find="";
		int rowcount = dao.selectCountAll();
		int pageSize = 10;
		int absPage = 0;
		if(rowcount>0 && rowcount%pageSize != 0)
			absPage = 1;
		int pageCount = rowcount / pageSize + absPage;
		int pages[] = new int[pageCount];
		for(int i = 0 ; i< pageCount; i++){
			pages[i] = i+1;
		}
		
		HttpSession session=request.getSession();
		String result = (String) session.getAttribute("sessionid");
		if(result==null){
			ModelAndView mav = new ModelAndView("login/board_login_request");
			return mav;
		}
		ModelAndView mav = new ModelAndView("jQuerytest/board_list");
		ArrayList<Board> boards = dao.selectAll();
		mav.addObject("boardpaging",boardpaging);
		mav.addObject("boards",boards);
		mav.addObject("pages",pages);
		return mav;
	}
	@RequestMapping(value = "/board_detail", method = RequestMethod.GET)
	public String board( ) {	
		System.out.println(this.selectbox);
		System.out.println(this.find);
		return "jQuerytest/board_detail";
	}
	@RequestMapping(value = "/board_update_form", method = RequestMethod.GET)
	public ModelAndView boardupdateform(@RequestParam("b_seq") int b_seq ) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		Board board = dao.selectOne(b_seq);
		dao.updateHit(b_seq);
		ModelAndView mav = new ModelAndView("jQuerytest/board_update_form");
		mav.addObject("board",board);
		return mav;
	}
	@RequestMapping(value = "/boardupdate", method = RequestMethod.POST)
	public ModelAndView boardupdate(@ModelAttribute("board") Board board,HttpServletRequest request ) {	
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String b_ip = request.getRemoteAddr();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate = new Date();
		String b_date = simple.format(currentdate);
		board.setB_ip(b_ip);
		board.setB_date(b_date);
		String msg = "";
		int result = dao.updateRow(board);
		if(result==1){
			msg="success! Update your Info.";
		} else {
			msg="fail! yout Info.";
		}
		ModelAndView mav = new ModelAndView("jQuerytest/board_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
//		mav.addObject("content","jQuerytest/member_result");
		return mav;
	}
	@RequestMapping(value = "/boarddelete", method = RequestMethod.GET)
	public String boardselectdelete(@RequestParam int b_seq ) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
			dao.deleteRow(b_seq);
		return "redirect:/board_list";
	}
	@RequestMapping(value = "/boarddeleteyn", method = RequestMethod.GET)
	public ModelAndView boarddeleteyn(@RequestParam int b_seq ) {
		ModelAndView mav = new ModelAndView("jQuerytest/board_delete_rs");
		mav.addObject("b_seq",b_seq);
		return mav;
	}
	@RequestMapping(value = "/boardreply", method = RequestMethod.GET)
	public ModelAndView boardreply(@RequestParam int b_seq ) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		Board board = dao.selectOne(b_seq);
		dao.updateHit(b_seq);
		ModelAndView mav = new ModelAndView("jQuerytest/board_reply");
		mav.addObject("board",board);
		return mav;
	}
	@RequestMapping(value = "/boardreplysave", method = RequestMethod.POST)
	public ModelAndView boardreplysave(@ModelAttribute("board") Board board,HttpServletRequest request) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String b_ip = request.getRemoteAddr();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate = new Date();
		String b_date = simple.format(currentdate);
		board.setB_ip(b_ip);
		board.setB_date(b_date);
		board.setB_hit(0);
		board.setB_level(0);
		String msg = "";
		int result = dao.insertreply(board);
		if(result==1){
			msg="success! Insert your reply.";
		} else {
			msg="fail! yout Info.";
		}
		ModelAndView mav = new ModelAndView("jQuerytest/board_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
		return mav;
	}


}

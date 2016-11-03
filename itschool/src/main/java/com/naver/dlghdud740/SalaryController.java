package com.naver.dlghdud740;


import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
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
import com.naver.dlghdud740.entities.BoardPaging;
import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.entities.Salary;
import com.naver.dlghdud740.entities.SalaryPaging;
import com.naver.dlghdud740.service.BoardDao;
import com.naver.dlghdud740.service.MemberDao;
import com.naver.dlghdud740.service.SalaryDao;

import oracle.net.aso.e;


/**
 * Handles requests for the application home page.
 */
@Controller
public class SalaryController {
	@Autowired
	private Salary salary;
	@Autowired
	private SqlSession sqlSession;
	private int selectedPage;
	public static String selectbox;
	public static String find;

	@RequestMapping(value = "/salary_insert", method = RequestMethod.GET)
	public String salary_insert() {	
		return "salary/salary_insert";
	}
	
	@RequestMapping(value = "/salaryinsertform", method = RequestMethod.POST)
	public ModelAndView salaryinsertform(@ModelAttribute("salary") Salary salary) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		String msg = "";
		int result = dao.insertsalary(salary);
		if(result==1){
			msg="success! Insert your Info.";
		} else {
			msg="fail! yout Info.";
		}
		ModelAndView mav = new ModelAndView("salary/salary_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
		return mav;
	}
	
	@RequestMapping(value = "/noconfirm", method = RequestMethod.POST)
	@ResponseBody public int noconfirm( @RequestParam("no") String no) {
		int count = 0;
		int find = 0;
		System.out.println("타요타요");
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		try {
			count = dao.Countconfirm(no);
		} catch (Exception e) {
			System.out.println("noconfirm err: "+e.getMessage());
		}
		if(count>0)
			find=1;
		else
			find=0;
		return find;
	}
	
	@RequestMapping(value = "/salary_list", method = RequestMethod.GET)
	public ModelAndView salary_list(HttpServletRequest request,@ModelAttribute("salarypaging") SalaryPaging salarypaging ) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		this.selectbox="name";
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
		ArrayList<Salary> salarys= dao.selectsalaryAll();
		ModelAndView mav = new ModelAndView("salary/salary_list");
		mav.addObject("salarypaging",salarypaging);
		mav.addObject("salarys",salarys);
		mav.addObject("pages",pages);
		return mav;
	}
	@RequestMapping(value = "/salary_form", method = RequestMethod.GET)
	public ModelAndView salary_form( @RequestParam("no") String no) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		Salary salary= dao.selectsalaryOne(no);
		ModelAndView mav = new ModelAndView("salary/salary_form");
		mav.addObject("salary",salary);
		return mav;
	}
	@RequestMapping(value = "/salary_delete", method = RequestMethod.GET)
	public ModelAndView salary_delete( @RequestParam("no") String no) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		String msg = "";
		System.out.println(no);
		int result= dao.deletesalaryOne(no);
		if(result==1){
			msg="success! Delete your Info.";
		} else {
			msg="fail! yout Info.";
		}
		ModelAndView mav = new ModelAndView("salary/salary_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
		return mav;
	}
	@RequestMapping(value = "/salary_delete_rs", method = RequestMethod.GET)
	public ModelAndView salary_delete_rs( @RequestParam("no") String no) {
		ModelAndView mav = new ModelAndView("salary/salary_delete_rs");
		mav.addObject("no",no);
		return mav;
	}
	@RequestMapping(value = "/salaryupdateform", method = RequestMethod.POST)
	public ModelAndView salaryupdateform(@ModelAttribute("salary") Salary salary ) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		String msg = "";
		int result = dao.updatesalary(salary);
		if(result==1){
			msg="success! update your Info.";
		} else {
			msg="fail! yout Info.";
		}
		ModelAndView mav = new ModelAndView("salary/salary_result");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
		return mav;
	}
	
	@RequestMapping(value = "/salaryPageList", method = RequestMethod.POST)
	public ModelAndView salarypagelist(@ModelAttribute("salarypaging") SalaryPaging salarypaging) {
		SalaryDao dao =sqlSession.getMapper(SalaryDao.class);
		ModelAndView mav = new ModelAndView("salary/salary_list");
		
		this.selectbox = salarypaging.getSelectbox();
		this.find = salarypaging.getFind();
		int rowcount = dao.selectCount(salarypaging);
		int pageSize = 10;
		int pageCount = 0;
		int absPage = 0;
		
		if(selectedPage == 0)
			selectedPage =1;
		int startrow = (selectedPage - 1) *pageSize;
		int endrow = startrow + 10;
		salarypaging.setStartrow(startrow);
		salarypaging.setEndrow(endrow);
		
		ArrayList<Salary> salarys = dao.selectPageList(salarypaging);
		
		if(rowcount>0 && rowcount%pageSize != 0)
			absPage = 1;
		pageCount = rowcount / pageSize + absPage;
		int pages [] =new int[pageCount];
		for(int i = 0 ; i< pageCount; i++){
			pages[i] = i+1;
		}
		mav.addObject("salarypaging",salarypaging);
		mav.addObject("salarys",salarys);
		mav.addObject("pages",pages);
		
		return mav;
	}
	
	@RequestMapping(value = "/salarypageselect", method = RequestMethod.GET)
	public ModelAndView boardpageselect(@RequestParam int page,@ModelAttribute("salarypaging") SalaryPaging salarypaging) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		ModelAndView mav = new ModelAndView("salary/salary_list");
		
		salarypaging.setSelectbox(this.selectbox);
		salarypaging.setFind(this.find);
		int rowcount = dao.selectCount(salarypaging);
		int pageSize = 10;
		int absPage = 0;
		int startrow = (page - 1) * pageSize;
		int endrow = startrow + 10;
		salarypaging.setStartrow(startrow);
		salarypaging.setEndrow(endrow);
		
		ArrayList<Salary> salarys = dao.selectPageList(salarypaging);
		if(rowcount>0 && rowcount%pageSize != 0)
			absPage = 1;
		int pageCount = rowcount / pageSize + absPage;
		int pages [] =new int[pageCount];
		for(int i = 0 ; i< pageCount; i++){
			pages[i] = i+1;
		}
		mav.addObject("salarypaging",salarypaging);
		mav.addObject("salarys",salarys);
		mav.addObject("pages",pages);
		
		return mav;
	}
}

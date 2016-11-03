package com.naver.dlghdud740;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import com.naver.dlghdud740.entities.SalaryRoll;
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
	private SalaryRoll salaryroll;
	@Autowired
	private SqlSession sqlSession;
	private int selectedPage;
	public static String selectbox;
	public static String find;

	@RequestMapping(value = "/salary_insert", method = RequestMethod.GET)
	public String salary_insert() {	
		return "salary/salary_insert";
	}
	
	@RequestMapping(value = "/salarycreate", method = RequestMethod.GET)
	public ModelAndView salarycreate() {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy", Locale.KOREA);
		String year = df.format(currentdate);
		SimpleDateFormat mf = new SimpleDateFormat("MM", Locale.KOREA);
		String month = mf.format(currentdate);
		ModelAndView mav = new ModelAndView("salary/salary_create");
		mav.addObject("year",year);
		mav.addObject("month",month);
		return mav;
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
	@RequestMapping(value = "/salarycreateyn", method = RequestMethod.POST)
	public ModelAndView salarycreateyn( @RequestParam("yyyy") String yyyy,@RequestParam("mm") String mm) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		dao.deleterollrow(yyyy+mm);
		ArrayList<Salary> salarys= dao.selectsalaryAll();
		List<SalaryRoll> salaryrolls= new ArrayList<SalaryRoll>();
		for (Salary salary : salarys) {
			salaryroll = new SalaryRoll();
			salaryroll.setYyyymm(yyyy+mm);
			salaryroll.setNo(salary.getNo());
			salaryroll.setAmount(salary.getBase()+salary.getExtrapay1()+salary.getExtrapay2());
			salaryroll.setAmount12(salaryroll.getAmount() * 12);
			int incometax = 0;
			if(salaryroll.getAmount12() < 5000001){
				incometax = (int) (salaryroll.getAmount12() * 0.7);
			} else if(salaryroll.getAmount12() < 15000001) {
				incometax = (int) (3500000+ (salaryroll.getAmount12()-5000000) * 0.4);
			} else if(salaryroll.getAmount12() < 45000001) {
				incometax = (int) (7500000+ (salaryroll.getAmount12()-15000000) * 0.15);
			} else if(salaryroll.getAmount12() < 100000001) {
				incometax = (int) (12000000+ (salaryroll.getAmount12()-45000000) * 0.05);
			} else {
				incometax = (int) (14750000+ (salaryroll.getAmount12()-100000000) * 0.02);
			}
			salaryroll.setIncometax(incometax);
			int temp = (int) (salaryroll.getAmount() * 0.0001);
			temp=temp*1000;
			temp=(int) (( temp * 0.045 )* 0.1 * 10) *12;
			salaryroll.setInsurance(temp);
			int dependent = salary.getPartner() + salary.getDependent20() + salary.getDependent60();
			temp = dependent * 1500000;
			salaryroll.setHumandeduct(temp);
			int addtemp = (int) ((40000000 - salaryroll.getAmount12()) *0.04);
			salaryrolls.add(salaryroll);
			temp = 0;
			if( (salaryroll.getAmount12() <30000001) && (dependent == 1))
				temp = (int) (3100000 + (salaryroll.getAmount12()*0.04));
			if( (salaryroll.getAmount12() <30000001) && (dependent == 2))
				temp = (int) (3600000 + (salaryroll.getAmount12()*0.04));
			if( (salaryroll.getAmount12() <30000001) && (dependent > 2))
				temp = (int) (5000000 + (salaryroll.getAmount12()*0.07)) +addtemp;
			if( (salaryroll.getAmount12() > 30000000 && salaryroll.getAmount12() < 45000001) && (dependent == 1))
				temp = (int) ((3100000 + (salaryroll.getAmount12()*0.04)) -( (salaryroll.getAmount12() - 30000000)*0.05));
			if( (salaryroll.getAmount12() > 30000000 && salaryroll.getAmount12() < 45000001) && (dependent == 2))
				temp = (int) ((3600000 + (salaryroll.getAmount12()*0.04)) -( (salaryroll.getAmount12() - 30000000)*0.05));
			if( (salaryroll.getAmount12() > 30000000 && salaryroll.getAmount12() < 45000001) && (dependent > 2))
				temp = (int) (((5000000 + (salaryroll.getAmount12()*0.07)) -( (salaryroll.getAmount12() - 30000000)*0.05))) +addtemp ;
			if( (salaryroll.getAmount12() > 45000000 && salaryroll.getAmount12() < 70000001) && (dependent == 1))
				temp = (int) (3100000 + (salaryroll.getAmount12()*0.015));
			if( (salaryroll.getAmount12() > 45000000 && salaryroll.getAmount12() < 70000001) && (dependent == 2))
				temp = (int) (3600000 + (salaryroll.getAmount12()*0.02));
			if( (salaryroll.getAmount12() > 45000000 && salaryroll.getAmount12() < 70000001) && (dependent > 2))
				temp = (int) (5000000 + (salaryroll.getAmount12()*0.05))+addtemp;
			if( (salaryroll.getAmount12() > 70000000 && salaryroll.getAmount12() < 120000001) && (dependent == 1))
				temp = (int) (3100000 + (salaryroll.getAmount12()*0.005));
			if( (salaryroll.getAmount12() > 70000000 && salaryroll.getAmount12() < 120000001) && (dependent == 2))
				temp = (int) (3600000 + (salaryroll.getAmount12()*0.01));
			if( (salaryroll.getAmount12() > 70000000 && salaryroll.getAmount12() < 120000001) && (dependent > 2))
				temp = (int) (5000000 + (salaryroll.getAmount12()*0.03))+addtemp;
			salaryroll.setSpecial(temp);
		}
		dao.insertrollrow(salaryrolls);
		ModelAndView mav = new ModelAndView("salary/salary_list");
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

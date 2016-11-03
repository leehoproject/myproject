package com.naver.dlghdud740;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProjectController {
	@Autowired
	private SqlSession sqlSession;
	private int selectedPage;
	public static String selectbox;
	public static String find;

	@RequestMapping(value = "/login_demo", method = RequestMethod.GET)
	public String login() {	
		return "project/login_demo";
	}
	
}

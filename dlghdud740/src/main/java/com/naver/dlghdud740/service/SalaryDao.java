package com.naver.dlghdud740.service;

import java.util.ArrayList;
import java.util.List;

import com.naver.dlghdud740.entities.Board;
import com.naver.dlghdud740.entities.BoardPaging;
import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.entities.Salary;
import com.naver.dlghdud740.entities.SalaryPaging;
import com.naver.dlghdud740.entities.SalaryRoll;

public interface SalaryDao {
	public int selectCount(SalaryPaging salarypaging);
	public int selectCountAll();
	public ArrayList<Salary> selectPageList(SalaryPaging salarypaging);
	public Salary selectsalaryOne( String no);
	public int deletesalaryOne( String no);
	public int updatesalary(Salary salary);
	public int insertsalary(Salary salary);
	public int insertrollrow(List<SalaryRoll> list);
	public ArrayList<Salary> selectsalaryAll();
	public int Countconfirm(String no); 
	public int deleterollrow(String yyyymm); 
}

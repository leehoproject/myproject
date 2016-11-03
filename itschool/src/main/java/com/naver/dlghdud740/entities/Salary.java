package com.naver.dlghdud740.entities;

import org.springframework.stereotype.Component;

@Component
public class Salary {
	private String no;
	private String name;
	private String dept;
	private int partner;
	private int dependent20;
	private int dependent60;
	private int base;
	private int extrapay1;
	private int extrapay2;
	

	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getPartner() {
		return partner;
	}
	public void setPartner(int partner) {
		this.partner = partner;
	}
	public int getDependent20() {
		return dependent20;
	}
	public void setDependent20(int dependent20) {
		this.dependent20 = dependent20;
	}
	public int getDependent60() {
		return dependent60;
	}
	public void setDependent60(int dependent60) {
		this.dependent60 = dependent60;
	}
	public int getBase() {
		return base;
	}
	public void setBase(int base) {
		this.base = base;
	}
	public int getExtrapay1() {
		return extrapay1;
	}
	public void setExtrapay1(int extrapay1) {
		this.extrapay1 = extrapay1;
	}
	public int getExtrapay2() {
		return extrapay2;
	}
	public void setExtrapay2(int extrapay2) {
		this.extrapay2 = extrapay2;
	}
	
}
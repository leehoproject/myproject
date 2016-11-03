package com.naver.dlghdud740.entities;

import org.springframework.stereotype.Component;

@Component
public class SalaryRoll {
	private String yyyymm;
	private String no;
	private int amount;
	private int amount12;
	private int incometax;
	private int income;
	private int humandeduct;
	private int insurance;
	private int special;
	private int standard;
	private int calculatetax;
	private int incometaxdeduct;
	private int decisiontax12;
	private int decisiontax;
	
	public int getInsurance() {
		return insurance;
	}
	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}
	public String getYyyymm() {
		return yyyymm;
	}
	public void setYyyymm(String yyyymm) {
		this.yyyymm = yyyymm;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getAmount12() {
		return amount12;
	}
	public void setAmount12(int amount12) {
		this.amount12 = amount12;
	}
	public int getIncometax() {
		return incometax;
	}
	public void setIncometax(int incometax) {
		this.incometax = incometax;
	}
	public int getIncome() {
		return income;
	}
	public void setIncome(int income) {
		this.income = income;
	}
	public int getHumandeduct() {
		return humandeduct;
	}
	public void setHumandeduct(int humandeduct) {
		this.humandeduct = humandeduct;
	}
	public int getSpecial() {
		return special;
	}
	public void setSpecial(int special) {
		this.special = special;
	}
	public int getStandard() {
		return standard;
	}
	public void setStandard(int standard) {
		this.standard = standard;
	}
	public int getCalculatetax() {
		return calculatetax;
	}
	public void setCalculatetax(int calculatetax) {
		this.calculatetax = calculatetax;
	}
	public int getIncometaxdeduct() {
		return incometaxdeduct;
	}
	public void setIncometaxdeduct(int incometaxdeduct) {
		this.incometaxdeduct = incometaxdeduct;
	}
	public int getDecisiontax12() {
		return decisiontax12;
	}
	public void setDecisiontax12(int decisiontax12) {
		this.decisiontax12 = decisiontax12;
	}
	public int getDecisiontax() {
		return decisiontax;
	}
	public void setDecisiontax(int decisiontax) {
		this.decisiontax = decisiontax;
	}
	


	
}
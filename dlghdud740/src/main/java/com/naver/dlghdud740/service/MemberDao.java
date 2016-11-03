package com.naver.dlghdud740.service;

import java.util.ArrayList;

import com.naver.dlghdud740.entities.Member;

public interface MemberDao {
	public Member selectOne( String id );
	public int selectCount(String id);
	public int insertRow(Member member);
	public ArrayList<Member> selectAll();
	public int updateRow(Member member);
	public int deleteRow(String id);
	public Member selectLogin(Member member);
}

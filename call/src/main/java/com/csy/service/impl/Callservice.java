package com.csy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csy.mapper.CallMapper;
import com.csy.pojo.Call;
import com.csy.service.ICallService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Transactional()
public class Callservice implements ICallService {
	/**
	 * 登陆
	 */
	@Resource
	private CallMapper callMapper;

	public Call loginCall(Call call) {
		// TODO Auto-generated method stub
		System.out.println();
		return callMapper.loginCall(call);
	}

	/*
	 * 通过id查询
	 */
	public	Call getCallById(Call call) {
		return callMapper.getCallById(call);
	}
	/**
	 * 查询所有
	 */
	public PageInfo<Call> findCall(PageInfo<Call> page, Call call) {
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		List<Call> call1 = callMapper.findCall(call);
		PageInfo<Call> callList = new PageInfo<Call>(call1);
		return callList;
	}
	
	/**
	 * 查询普通用户总数
	 */
	public List<Call> selectCallIsManager() {
		return callMapper.selectCallIsManager();
	}
	/**
	 * 更新
	 */
	public boolean updateCall(Call call) {
		// TODO Auto-generated method stub
		return callMapper.updateCall(call);
	}
	
	
	/**
	 * 添加
	 */
	public boolean insertCall(Call call) {
		return callMapper.insertCall(call);
	}
	/**
	 * 通过id删除
	 */
	public boolean deleteCall(Call call) {
		return callMapper.deleteCall(call);
	}
}

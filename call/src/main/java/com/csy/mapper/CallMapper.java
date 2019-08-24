package com.csy.mapper;

import java.util.List;

import com.csy.pojo.Call;
import com.github.pagehelper.PageInfo;

public interface CallMapper {
	/**
	 * 登陆验证
	 */
	Call loginCall(Call call);
	/**
	 * 通过id查询
	 */
	Call getCallById(Call call);
	
	/**
	 * 查询所有
	 */
	//List<Call> findCall(Call call);
	List<Call> findCall(Call call);
	
	
	/**
	 * 查询普通用户
	 */
	List<Call> selectCallIsManager();
	
	
	/**
	 * 更新
	 */
	boolean updateCall(Call call);
	/**
	 * 添加
	 */
	boolean insertCall(Call call);
	
	/**
	 * 通过id删除
	 */
	boolean deleteCall(Call call);
}

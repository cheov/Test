package com.csy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.csy.pojo.Call;
import com.csy.service.ICallService;
import com.csy.utils.GetSRR;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("call")
public class CallController extends GetSRR {

	@Resource
	private ICallService callService;
	GetSRR getSRR = new GetSRR();

	/**
	 * 跳转登陆页
	 */
	@RequestMapping(value = "login")
	public String login() {
		System.out.println("中转挑login");
		return "call/login";
	}

	/**
	 * 登陆
	 */
	@RequestMapping(value = "loginCall")
	public String CallLogin(Call call) {
		System.out.println(call);
		Call loginCall = callService.loginCall(call);
		System.out.println("\t loginCall" + loginCall);
		if (loginCall.getIsmanager() == 1) {
			getSRR.getRequest().getSession().setAttribute("call", loginCall);
			return "redirect:/call/callMan";
		} else if (loginCall.getIsmanager() == 0) {
			List<Call> count = selectCallIsManager();
			List<Integer> f = new ArrayList<Integer>();
			for (Call call2 : count) {
				f.add(call2.getId());
			}
			PageInfo<Call> pageInfo = new PageInfo<Call>();
			pageInfo.setPageSize(50);
			pageInfo.setPageNum(1);
			PageInfo<Call> findCall = callService.findCall(pageInfo, null);
			// System.out.println("\t callCount"+f);
			System.out.println(findCall);
			int size = count.size();
			getSRR.getRequest().setAttribute("countCall", size);
			getSRR.getRequest().setAttribute("countManager", f);
			getSRR.getRequest().setAttribute("call", call);
			getSRR.getRequest().setAttribute("callList", findCall);
			return "call/dianming";
		} else {
			return "call/login";
		}
	}

	@RequestMapping(value = "callMan")
	public String CallLogin(Call call, Integer pageNum, Integer pageSize, String EditCall) {
		// man主页

		System.out.println(pageNum + "\t pageNum");
		System.out.println(pageSize + "\t pageSize");
		PageInfo<Call> pageInfo = new PageInfo<Call>();
		if (pageNum == null) {
			pageNum = 1;
		}
		if (pageNum == 0) {
			pageNum = 1;
		}
		if (pageSize == null) {
			pageSize = 5;
		}
		pageInfo.setPageSize(5);
		pageInfo.setPageNum(pageNum);

		PageInfo<Call> findCall = callService.findCall(pageInfo, call);
		// System.out.println(findCall);
		List<Call> count = selectCallIsManager();
		List<Integer> f = new ArrayList<Integer>();
		for (Call call2 : count) {
			f.add(call2.getId());
		}
		// System.out.println("\t callCount"+f);
		int size = count.size();
		getSRR.getRequest().setAttribute("countCall", size);
		getSRR.getRequest().setAttribute("countManager", f);

		getSRR.getRequest().setAttribute("call", call);
		getSRR.getRequest().setAttribute("callList", findCall);
		
		return "call/CallMan";
	}

	@RequestMapping(value = "EditCall")
	public String EditCall(Call call) {
		if (call.getId().equals(-1)) {
			getSRR.getRequest().setAttribute("ed", "添加");
			return "call/editCall";
		} else {
			Call callById = callService.getCallById(call);
			System.out.println(callById);
			getSRR.getRequest().setAttribute("ed", "修改");
			System.out.println(getSRR.getRequest().getAttribute("ed"));
			getSRR.getRequest().setAttribute("callById", callById);
		}
		return "call/editCall";
	}

	@RequestMapping(value = "EditCallSucc")
	public String EditCallSucc(Call call) {
		System.out.println(call.getId());
		if (call.getId() == null) {
			boolean insertCall = callService.insertCall(call);
			System.out.println(insertCall + "\t     insertCall");
			return "redirect:/call/callMan";
		} else {
			boolean updateCall = callService.updateCall(call);
			System.out.println(updateCall);
			return "redirect:/call/callMan";
		}
	}

	@RequestMapping(value = "deleteCall")
	public String deleteCall(Call call, String pageNum) {
		boolean deleteCall = callService.deleteCall(call);
		System.out.println(deleteCall);
		return "redirect:/call/callMan?pageNum=" + pageNum;
	}

	@RequestMapping(value = "selectCallIsManager")
	public List<Call> selectCallIsManager() {
		return callService.selectCallIsManager();
	}

	@RequestMapping(value = "getCallById")
	@ResponseBody
	public Call getCallById(Call call) {
		Call callById = callService.getCallById(call);
		System.out.println(callById);
		getSRR.getRequest().setAttribute("callById", callById);
		return callById;
	}

}

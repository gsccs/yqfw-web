package com.gsccs.plat.auth.controller;

import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gsccs.plat.auth.model.Resource;
import com.gsccs.plat.auth.model.Resource.ResourceType;
import com.gsccs.plat.auth.model.User;
import com.gsccs.plat.auth.service.AuthService;
import com.gsccs.plat.auth.service.ResourceService;
import com.gsccs.plat.auth.shiro.CurrentUser;
import com.gsccs.plat.bass.Constants;
import com.gsccs.yqfw.gis.service.GisConfService;

/**
 * 系统首页
 * @author x.d zhang
 *
 */
@Controller
public class IndexController {

	@Autowired
	private ResourceService resourceService;
	@Autowired
	private AuthService authService;
	@Autowired
	private GisConfService gisConfService;

	@RequestMapping("/")
	public String index(@CurrentUser User loginUser, Model model) {
		Set<String> permissions = authService.findPermissions(
				Constants.SERVER_APP_KEY, loginUser.getUsername());
		Resource param = new Resource();
		param.setParentId(0l);
		param.setType(ResourceType.menu);
		List<Resource> menus = resourceService.findMenus(permissions, param);
		model.addAttribute("menus", menus);
		return "index";
	}
	
	@RequestMapping("/main")
	public String main(@CurrentUser User loginUser, Model model) {
		return "main";
	}
	
	
	@RequestMapping("/top")
	public String top(@CurrentUser User loginUser, Model model) {
		Set<String> permissions = authService.findPermissions(
				Constants.SERVER_APP_KEY, loginUser.getUsername());
		Resource param = new Resource();
		param.setParentId(1l);
		List<Resource> menus = resourceService.findSysMenus(permissions, param);
		model.addAttribute("menus", menus);
		return "top";
	}

	@RequestMapping("/menu")
	@ResponseBody
	public List<Resource> menu(@CurrentUser User loginUser, Long pid,
			Model model) {
		Set<String> permissions = authService.findPermissions(
				Constants.SERVER_APP_KEY, loginUser.getUsername());
		if (null == pid) {
			pid = 1l;
		}
		Resource param = new Resource();
		param.setParentId(pid);
		List<Resource> menutree = resourceService.findSysMenus(permissions,param);
		return menutree;
	}
	
	
	@RequestMapping("/forward")
	public String forward(String path) {
		// BuyerAccount baccount = buyerAPI.getBuyerAccount(1000, 1001);
		/*
		 * if (null != baccount) { System.out.println("baccount:" +
		 * baccount.getName()); }
		 */
		return path;
	}

}

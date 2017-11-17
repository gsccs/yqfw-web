package com.gsccs.plat.auth.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 系统用户登录
 * @author x.d zhang
 *
 */
@Controller
public class LoginController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	protected String doGet(HttpServletRequest req) {
		return "login";
	}

	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String showLoginForm(HttpServletRequest req, Model model) {
		String error = null;
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username,
				password);
		token.setRememberMe(true);
		try {
			subject.login(token);
		} catch (UnknownAccountException e) {
			error = "用户名不存在";
		} catch (IncorrectCredentialsException e) {
			error = "用户名/密码错误";
		} catch (AuthenticationException e) {
			e.printStackTrace();
			error = "其他错误：" + e.getMessage();
		}

		if (error != null) {// 出错了，返回登录页面
			model.addAttribute("error", error);
		} else {// 登录成功
			return "redirect:/";
		}
		return "login";
	}

}

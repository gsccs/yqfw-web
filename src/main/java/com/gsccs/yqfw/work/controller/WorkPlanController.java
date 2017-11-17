package com.gsccs.yqfw.work.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gsccs.plat.bass.Datagrid;
import com.gsccs.plat.bass.JsonMsg;
import com.gsccs.yqfw.work.model.WorkPlan;
import com.gsccs.yqfw.work.service.WorkService;


/**
 * 工作计划
 * @author x.d zhang
 *
 */
@Controller
@RequestMapping(value = "/plan")
public class WorkPlanController {

	@Autowired
	private WorkService workService;

	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	protected String getDkyyList(HttpServletRequest req) {
		return "work/plan-list";
	}

	@RequestMapping(value = "/datagrid", method = RequestMethod.POST)
	@ResponseBody
	public Datagrid getPlanList(WorkPlan param,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows,
			@RequestParam(defaultValue = "") String orderstr,
			HttpServletRequest request, ModelMap map) {
		Datagrid grid = new Datagrid();
		List<WorkPlan> list = workService.find(param, orderstr, page, rows);
		int count = workService.count(param);
		grid.setRows(list);
		grid.setTotal(Long.valueOf(count));
		return grid;
	}

	
	/**
	 * 加载工作计划
	 * @param id
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/planInfo", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg getPlanInfo(String id,
			HttpServletRequest request, ModelMap map) {
		JsonMsg json = new JsonMsg();
		WorkPlan workplan = workService.getPlan(id);
		if (null != workplan){
			json.setSuccess(true);
			json.setData(workplan);
		}else{
			json.setSuccess(false);
			json.setMsg("工作计划不存在！");
		}
		
		return json;
	}

	// 新增
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String showCreateForm(Model model, String id) {
		model.addAttribute("op", "新增");
		return "work/plan-edit";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(WorkPlan workplan, RedirectAttributes redirectAttributes) {
		if (null != workplan) {
			workService.add(workplan);
		}
		JsonMsg msg = new JsonMsg();
		msg.setSuccess(true);
		msg.setMsg("记录添加成功!");
		return msg;
	}

	// 修改
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String showUpdateForm(String id, Model model) {
		if (null != id && id.trim().length() > 0) {
			WorkPlan workplan = workService.getPlan(id);
			model.addAttribute("workplan", workplan);
		}
		model.addAttribute("op", "修改");
		return "work/plan-edit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(WorkPlan workplan, RedirectAttributes redirectAttributes) {
		JsonMsg msg = new JsonMsg();
		if (null != workplan) {
			workService.update(workplan);
			msg.setSuccess(true);
			msg.setMsg("信息修改成功!");
		} else {
			msg.setSuccess(false);
			msg.setMsg("信息修改失败!");
		}
		return msg;
	}

	// 删除
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public JsonMsg del(String id, HttpServletRequest request) {
		JsonMsg msg = new JsonMsg();
		if (null != id) {
			workService.deletePlan(id);
			msg.setSuccess(true);
			msg.setMsg("记录删除成功!");
		} else {
			msg.setSuccess(false);
			msg.setMsg("记录删除失败!");
		}
		return msg;
	}
}

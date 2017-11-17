package com.gsccs.yqfw.corp.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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
import com.gsccs.yqfw.corp.model.MonitorType;
import com.gsccs.yqfw.corp.model.WarnRule;
import com.gsccs.yqfw.corp.service.MonitorService;

/**
 * 监测指标管理
 * 
 * @author x.d zhang
 *
 */

@Controller
@RequestMapping("/monitortype")
public class MonitorTypeController {
	
	@Autowired
	private MonitorService monitorService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String list() {
		return "corp/monitortype-list";
	}

	@RequestMapping(value = "/datagrid")
	@ResponseBody
	public Datagrid list(ModelMap map,@RequestParam(defaultValue = " id  ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, 
			MonitorType monitorType, HttpServletRequest request) {
		List<MonitorType> monitorTypes = monitorService.find(monitorType, order, page, rows);
		int count = monitorService.countMinitorType(monitorType);
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(monitorTypes);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
	}

	@RequestMapping(value = "/dataform", method = RequestMethod.GET)
	public String showCreateForm(String id,Model model) {
		MonitorType monitortype = null;
		if(StringUtils.isNotEmpty(id)){
			monitortype = monitorService.getMonitorType(id);
		}
		model.addAttribute("op", "update");
		model.addAttribute("monitortype", monitortype);
		return "corp/monitortype-edit";
	}
	

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(MonitorType monitorType, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != monitorType) {
			monitorService.addMonitorType(monitorType);
		}
		json.setSuccess(true);
		json.setMsg("新增成功");
		return json;
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(MonitorType param, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != param) {
			monitorService.updateMonitorType(param);
		}
		json.setSuccess(true);
		json.setMsg("预警规则更新成功！");
		return json;
	}
	
	
	/**
	 * 
	 * @param ids
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg delete(@RequestParam(value = "ids", required = false) String ids, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (StringUtils.isNotEmpty(ids)) {
			String[] idarray = ids.split(",");
			monitorService.delMonitorType(Arrays.asList(idarray));
			json.setSuccess(true);
			json.setMsg("预警规则删除成功！");
			return json;
		}
		json.setSuccess(false);
		json.setMsg("预警规则删除失败！");
		return json;
	}
}

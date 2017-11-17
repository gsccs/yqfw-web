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
import com.gsccs.yqfw.corp.model.Company;
import com.gsccs.yqfw.corp.model.MonitorType;
import com.gsccs.yqfw.corp.model.MonitorVal;
import com.gsccs.yqfw.corp.service.CompanyService;
import com.gsccs.yqfw.corp.service.MonitorService;

/**
 * 企业数据监测
 * @author x.d zhang
 *
 */

@Controller
@RequestMapping("/monitorval")
public class MonitorDataController {
	
	@Autowired
	private MonitorService monitorService;
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String list(String id,Model model) {
		List<MonitorType> typelist = monitorService.find(new MonitorType(), "", 1, Integer.MAX_VALUE);
		List<Company> corplist = companyService.find(null);
		model.addAttribute("typelist", typelist);
		model.addAttribute("corplist", corplist);
		return "corp/monitorval-list";
	}

	@RequestMapping(value = "/dataform", method = RequestMethod.GET)
	public String showCreateForm(String id,Model model) {
		MonitorVal monitval = null;
		if(StringUtils.isNotEmpty(id)){
			monitval = monitorService.getMonitorVal(id);
		}
		List<MonitorType> typelist = monitorService.find(new MonitorType(), "", 1, Integer.MAX_VALUE);
		List<Company> corplist = companyService.find(null);
		model.addAttribute("op", "update");
		model.addAttribute("monitval", monitval);
		model.addAttribute("typelist", typelist);
		model.addAttribute("corplist", corplist);
		return "corp/monitorval-edit";
	}
	
	@RequestMapping(value = "/datagrid")
	@ResponseBody
	public Datagrid list(ModelMap map,@RequestParam(defaultValue = " addtime desc  ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, 
			MonitorVal param, HttpServletRequest request) {
		List<MonitorVal> monvallist = monitorService.find(param, order, page, rows);
		int count = monitorService.countMinitorVal(param);
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(monvallist);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
	}
	
	/**
	 * 查询超标数据
	 * @param map
	 * @param order
	 * @param page
	 * @param rows
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/overdata")
	@ResponseBody
	public List<MonitorVal> overdata(ModelMap map,@RequestParam(defaultValue = " addtime desc  ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, 
			HttpServletRequest request) {
		List<MonitorVal> monvallist = monitorService.findOverData(page, rows);
		return monvallist;
	}


	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(MonitorVal monitorVal, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != monitorVal) {
			monitorService.addMonitorVal(monitorVal);
		}
		json.setSuccess(true);
		json.setMsg("检测数据新增成功！");
		return json;
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(MonitorVal param, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != param) {
			monitorService.updateMonitorVal(param);
		}
		json.setSuccess(true);
		json.setMsg("检测数据更新成功！");
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
	public JsonMsg delete(@RequestParam(value = "ids", required = false) String ids,
		RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (StringUtils.isNotEmpty(ids)) {
			String[] idarray = ids.split(",");
			monitorService.delMonitorVal(Arrays.asList(idarray));
			json.setSuccess(true);
			json.setMsg("检测数据删除成功！");
			return json;
		}
		json.setSuccess(false);
		json.setMsg("检测数据删除失败！");
		return json;
	}
}

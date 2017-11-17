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
import com.gsccs.yqfw.corp.model.MonitorVal;
import com.gsccs.yqfw.corp.model.WarnRule;
import com.gsccs.yqfw.corp.service.MonitorService;

/**
 * 企业监测数据预警规则
 * @author x.d zhang
 *
 */
@Controller
@RequestMapping("/warnrule")
public class WarnRuleController {
	
	@Autowired
	private MonitorService monitorService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String list(Model model) {
		List<MonitorType> typelist = monitorService.find(new MonitorType(), "", 1, Integer.MAX_VALUE);
		model.addAttribute("typelist", typelist);
		return "corp/warnrule-list";
	}
	
	
	
	@RequestMapping(value = "/dataform", method = RequestMethod.GET)
	public String showCreateForm(String id,Model model) {
		WarnRule warnrule = null;
		if(StringUtils.isNotEmpty(id)){
			warnrule = monitorService.getWarnRule(id);
		}
		List<MonitorType> typelist = monitorService.find(new MonitorType(), "", 1, Integer.MAX_VALUE);
		model.addAttribute("op", "update");
		model.addAttribute("warnrule", warnrule);
		model.addAttribute("typelist", typelist);
		return "corp/warnrule-edit";
	}

	@RequestMapping(value = "/datagrid")
	@ResponseBody
	public Datagrid list(ModelMap map,@RequestParam(defaultValue = " id  ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, 
			WarnRule company, HttpServletRequest request) {
		List<WarnRule> companyList = monitorService.find(company, order, page, rows);
		int count = monitorService.countWarnRule(company);
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(companyList);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(WarnRule param, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null == param) {
			json.setSuccess(false);
			json.setMsg("保存失败！指标预警规则不完整！");
			return json;
		}
		
		String typeid = param.getTypeId();
		WarnRule queryparam = new WarnRule();
		queryparam.setTypeId(typeid);
		List list = monitorService.find(queryparam);
		if (list.size()>0){
			json.setSuccess(false);
			json.setMsg("指标预警规则已制定！");
		}else{
			monitorService.addWarnRule(param);
			json.setSuccess(true);
			json.setMsg("预警规则新增成功！");
		}
		return json;
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(WarnRule param, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != param) {
			monitorService.updateWarnRule(param);
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
	public JsonMsg delete(@RequestParam(value = "ids", required = false) String ids,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (StringUtils.isNotEmpty(ids)) {
			String[] idarray = ids.split(",");
			monitorService.delWarnRule(Arrays.asList(idarray));
			json.setSuccess(true);
			json.setMsg("预警规则删除成功！");
			return json;
		}
		json.setSuccess(false);
		json.setMsg("预警规则删除失败！");
		return json;
	}
	
}

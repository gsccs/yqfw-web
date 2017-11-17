package com.gsccs.yqfw.gis.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gsccs.plat.bass.Datagrid;
import com.gsccs.plat.bass.JsonMsg;
import com.gsccs.yqfw.corp.model.Company;
import com.gsccs.yqfw.corp.service.CompanyService;
import com.gsccs.yqfw.gis.model.LandInfo;
import com.gsccs.yqfw.gis.model.LandPoint;
import com.gsccs.yqfw.gis.model.MarkerFactor;
import com.gsccs.yqfw.gis.model.MarkerFactor.ClassfyType;
import com.gsccs.yqfw.gis.service.LandService;
import com.gsccs.yqfw.gis.service.MarkerService;

/**
 * 图层要素控制类
 * 
 * @author x.d zhang
 * 
 */

@Controller
@RequestMapping("/mkfact")
public class MarkerController {

	@Autowired
	private MarkerService markerService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap map, HttpServletRequest request) {
		return "gis/mkfact-list";
	}


	@RequestMapping(value = "/datagrid")
	@ResponseBody
	public Datagrid list(ModelMap map,
			@RequestParam(defaultValue = " id ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, MarkerFactor markerFactor,
			HttpServletRequest request) {
		List<MarkerFactor> markerFactors = markerService
				.find(markerFactor, order, page, rows);
		int count = markerService.count(markerFactor);
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(markerFactors);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
	}

	
	@RequestMapping(value = "/dataform", method = RequestMethod.GET)
	public String dataform(String id, ModelMap map) {
		MarkerFactor markerFactor = null;
		if (StringUtils.isNotEmpty(id)) {
			markerFactor = markerService.getMarkerFactor(id);
		}
		map.put("mkfact", markerFactor);
		return "gis/mkfact-edit";
	}

	/**
	 * 新增要素分类
	 * 
	 * @param landInfo
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(MarkerFactor markerFactor,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != markerFactor) {
			markerService.addMarkerFact(markerFactor);
		}
		json.setSuccess(true);
		json.setMsg("新增要素分类成功");
		return json;

	}

	/**
	 * 修改要素信息
	 * 
	 * @param landInfo
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(MarkerFactor markerFactor,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != markerFactor) {
			markerService.updateMarkerFactor(markerFactor);
		}
		json.setSuccess(true); 
		json.setMsg("更新要素信息成功！");
		return json;
	}

	
	/**
	 * 删除要素信息
	 * 
	 * @param landInfo
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
			markerService.delMarkerFactors(Arrays.asList(idarray));
			json.setSuccess(true); 
			json.setMsg("删除要素信息成功！");
		}else{
			json.setSuccess(false); 
			json.setMsg("删除要素成功:内容不存在。");
		}
		return json;
	}

	
}

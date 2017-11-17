package com.gsccs.yqfw.corp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gsccs.plat.bass.Datagrid;
import com.gsccs.plat.bass.JsonMsg;
import com.gsccs.yqfw.corp.model.MonitorVal;
import com.gsccs.yqfw.corp.service.MonitorService;
import com.gsccs.yqfw.corp.service.ProjInfoService;
import com.gsccs.yqfw.gis.model.MarkerFactor;
import com.gsccs.yqfw.gis.model.MarkerFactor.ClassfyType;
import com.gsccs.yqfw.gis.service.MarkerService;
import com.gsccs.yqfw.project.model.ProjInfo;

/**
 * 园区项目管理
 * 
 * @author x.d zhang
 * 
 */

@Controller
@RequestMapping("/proj")
public class ProjectController {

	@Autowired
	private ProjInfoService projInfoService;
	@Autowired
	private MarkerService markerService;

	/**
	 * 园区项目清单
	 * 
	 * @param map
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap map, HttpServletRequest request) {
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.CORP);
		List<MarkerFactor> scaleList = markerService
				.findByClassfy(ClassfyType.SCALE);
		map.put("scaleList", scaleList);
		map.put("makFacts", makFactors);
		return "project/project-list";
	}

	/**
	 * 项目分布图
	 * 
	 * @param map
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(ModelMap map, HttpServletRequest request) {
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.CORP);
		List<MarkerFactor> scaleList = markerService
				.findByClassfy(ClassfyType.SCALE);
		map.put("scaleList", scaleList);
		map.put("makFacts", makFactors);
		return "project/project-map";
	}

	@RequestMapping(value = "/datagrid")
	@ResponseBody
	public Datagrid list(ModelMap map,
			@RequestParam(defaultValue = " ordernum  ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, ProjInfo projInfo,
			HttpServletRequest request) {
		List<ProjInfo> projList = projInfoService.find(projInfo, order, page,
				rows);
		int count = projInfoService.count(projInfo);
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(projList);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
	}

	/**
	 * 项目信息表单
	 * 
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/dataform", method = RequestMethod.GET)
	public String dataform(String id, ModelMap map) {
		ProjInfo projInfo = null;
		if (StringUtils.isNotEmpty(id)) {
			projInfo = projInfoService.getProjInfo(id);
		}
		map.put("projInfo", projInfo);
		return "project/project-edit";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(ProjInfo projinfo, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != projinfo) {
			projInfoService.addProjInfo(projinfo);
		}
		json.setSuccess(true);
		json.setMsg("项目信息新增成功!");
		return json;

	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(ProjInfo projinfo, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != projinfo) {
			projInfoService.updateProjInfo(projinfo);
		}
		json.setSuccess(true);
		json.setMsg("更新项目信息成功！");
		return json;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg delete(String id, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (StringUtils.isNotEmpty(id)) {
			projInfoService.delProjInfo(id);
		}
		json.setSuccess(true);
		json.setMsg("项目信息删除成功！");
		return json;
	}

	@RequestMapping(value = "/queryProjInfo", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg queryProjInfo(ProjInfo projinfo,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		List<ProjInfo> clist = projInfoService.find(projinfo);
		json.setSuccess(true);
		json.setData(clist);
		json.setMsg("加载成功");
		return json;

	}

	/**
	 * 更新项目地理数据
	 * 
	 * @param param
	 * @param page
	 * @param rows
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/savePoints", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg savePoints(String corpid, Double lng, Double lat,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (StringUtils.isNotEmpty(corpid) && null != lng && null != lat) {
			ProjInfo corp = projInfoService.getProjInfo(corpid);
			//corp.setLng(lng);
			//corp.setLat(lat);
			projInfoService.updateProjInfo(corp);
			json.setSuccess(true);
			json.setMsg("项目地理数据更新成功！");
		} else {
			json.setSuccess(false);
			json.setMsg("保存失败，项目地理数据有误！");
		}
		return json;
	}
}

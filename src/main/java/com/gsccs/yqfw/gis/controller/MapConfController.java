package com.gsccs.yqfw.gis.controller;

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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gsccs.plat.bass.Datagrid;
import com.gsccs.plat.bass.JsonMsg;
import com.gsccs.yqfw.gis.model.GisConf;
import com.gsccs.yqfw.gis.service.GisConfService;

/**
 * 地图配置控制类
 * 
 * @author x.d zhang
 * 
 */

@Controller
@RequestMapping("/mapconf")
public class MapConfController {

	@Autowired
	private GisConfService gisConfService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap map, HttpServletRequest request) {
		return "gis/mapconf-list";
	}

	@RequestMapping(value = "/datagrid")
	@ResponseBody
	public Datagrid list(ModelMap map,
			@RequestParam(defaultValue = " isdefault ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, GisConf param,
			HttpServletRequest request) {
		List<GisConf> gisConfs = gisConfService.find(param);
		int count = gisConfService.count(param);
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(gisConfs);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
	}
	
	
	@RequestMapping(value = "/dataform", method = RequestMethod.GET)
	public String dataform(String id, ModelMap map) {
		GisConf gisConf = null;
		if (StringUtils.isNotEmpty(id)) {
			gisConf = gisConfService.getGisConf(id);
		}
		map.put("gisconf", gisConf);
		return "gis/mapconf-edit";
	}

	/**
	 * 新增地图配置
	 * 
	 * @param GisConf
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(GisConf gisConf, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != gisConf) {
			gisConfService.addGisConf(gisConf);
		}
		json.setSuccess(true);
		json.setMsg("新增地图配置成功");
		return json;
	}

	/**
	 * 地图配置
	 * 
	 * @param GisConf
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/get.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject get(String ak, RedirectAttributes redirectAttributes) {
		JSONObject json = new JSONObject();
		GisConf gisConf = gisConfService.getGisConf(ak);
		if (null != gisConf) {
			json = (JSONObject) JSON.toJSON(gisConf);
		}
		return json;
	}

	/**
	 * 修改地图配置信息
	 * 
	 * @param gisConf
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(GisConf gisConf, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != gisConf) {
			gisConfService.updateGisConf(gisConf);
		}
		json.setSuccess(true);
		json.setMsg("更新地图配置信息成功！");
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
	public JsonMsg delete(
			@RequestParam(value = "ids", required = false) String ids,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (StringUtils.isNotEmpty(ids)) {
			String[] idarray = ids.split(",");
			// gisConfService.delMarkerFactors(Arrays.asList(idarray));
			json.setSuccess(true);
			json.setMsg("删除地图配置信息成功！");
		} else {
			json.setSuccess(false);
			json.setMsg("删除操作失败:内容不存在。");
		}
		return json;
	}

}

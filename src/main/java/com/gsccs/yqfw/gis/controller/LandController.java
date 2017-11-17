package com.gsccs.yqfw.gis.controller;

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

import com.alibaba.fastjson.JSON;
import com.gsccs.plat.bass.Datagrid;
import com.gsccs.plat.bass.JsonMsg;
import com.gsccs.yqfw.corp.model.Company;
import com.gsccs.yqfw.corp.service.CompanyService;
import com.gsccs.yqfw.gis.model.GisConf;
import com.gsccs.yqfw.gis.model.LandInfo;
import com.gsccs.yqfw.gis.model.LandPoint;
import com.gsccs.yqfw.gis.model.MarkerFactor;
import com.gsccs.yqfw.gis.model.MarkerFactor.ClassfyType;
import com.gsccs.yqfw.gis.service.GisConfService;
import com.gsccs.yqfw.gis.service.LandService;
import com.gsccs.yqfw.gis.service.MarkerService;

/**
 * 园区土地控制类
 * 
 * @author x.d zhang
 * 
 */

@Controller
@RequestMapping("/land")
public class LandController {

	@Autowired
	private LandService landService;
	@Autowired
	private MarkerService markerService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private GisConfService gisConfService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap map, HttpServletRequest request) {
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.LAND);
		List<Company> corplist = companyService.find(null);
		map.put("corplist", corplist);
		map.put("makFacts", makFactors);
		return "gis/land-list";
	}

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(ModelMap map, HttpServletRequest request) {
		GisConf gisConf = gisConfService.getDefaultGisConf();
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.LAND);
		List<Company> corplist = companyService.find(null);
		map.put("corplist", corplist);
		map.put("makFacts", makFactors);
		map.put("gisconf", JSON.toJSON(gisConf));
		return "gis/land-map";
	}

	@RequestMapping(value = "/datagrid")
	@ResponseBody
	public Datagrid list(ModelMap map,
			@RequestParam(defaultValue = " id ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, LandInfo landInfo,
			HttpServletRequest request) {
		List<LandInfo> landinfos = landService
				.find(landInfo, order, page, rows);
		if (null != landinfos && landinfos.size() > 0) {
			for (int i = 0; i < landinfos.size(); i++) {
				List list = landService.getLandPoints(landinfos.get(i).getId());
				if(null != list){
					landinfos.get(i).setPoints(list);
				}
				
			}
		}
		int count = landService.countLandInfo(landInfo);
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(landinfos);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
	}

	@RequestMapping(value = "/dataform", method = RequestMethod.GET)
	public String dataform(String id, ModelMap map) {
		LandInfo landInfo = null;
		if (StringUtils.isNotEmpty(id)) {
			landInfo = landService.getLandInfo(id);
		}
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.LAND);
		
		List<Company> corplist = companyService.find(null);
		map.put("corplist", corplist);
		map.put("makFacts", makFactors);
		map.put("landInfo", landInfo);
		return "gis/land-edit";
	}

	/**
	 * 新增土地信息
	 * 
	 * @param landInfo
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(LandInfo landInfo,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != landInfo) {
			landService.addLandInfo(landInfo);
		}
		json.setSuccess(true);
		json.setMsg("新增成功");
		return json;

	}

	/**
	 * 修改土地信息
	 * 
	 * @param landInfo
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(LandInfo landInfo,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != landInfo) {
			landService.updateLandInfo(landInfo);
		}
		json.setSuccess(true);
		json.setMsg("更新土地资源信息成功！");
		return json;
	}

	/**
	 * 修改土地信息
	 * 
	 * @param landInfo
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg delete(String id, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (StringUtils.isNotEmpty(id)) {
			landService.delLandInfo(id);
		}
		json.setSuccess(true);
		json.setMsg("土地资源删除成功！");
		return json;
	}

	/**
	 * 查询土地地理数据
	 * 
	 * @param param
	 * @param page
	 * @param rows
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/queryPoints", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg queryPoints(LandInfo param,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows,
			RedirectAttributes redirectAttributes) {

		JsonMsg json = new JsonMsg();
		List<LandInfo> landinfos = landService.find(param, "", page, rows);
		if (null != landinfos && landinfos.size() > 0) {
			for (int i = 0; i < landinfos.size(); i++) {
				List list = landService.getLandPoints(landinfos.get(i).getId());
				landinfos.get(i).setPoints(list);
			}
			json.setSuccess(true);
			json.setData(landinfos);
		} else {
			json.setSuccess(false);
			json.setMsg("未查询到相关数据！");
		}
		return json;
	}

	/**
	 * 更新土地地理数据
	 * 
	 * @param param
	 * @param page
	 * @param rows
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/savePoints", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg savePoints(@RequestBody List<LandPoint> points,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != points && points.size() > 0) {
			landService.addLandPoints(null, points);
			json.setSuccess(true);
			json.setMsg("土地地理数据保存成功！");
		} else {
			json.setSuccess(false);
			json.setMsg("未查询到相关数据！");
		}
		return json;
	}
}

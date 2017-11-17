package com.gsccs.yqfw.corp.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.gsccs.plat.bass.Datagrid;
import com.gsccs.plat.bass.JsonMsg;
import com.gsccs.yqfw.corp.model.Company;
import com.gsccs.yqfw.corp.model.MonitorVal;
import com.gsccs.yqfw.corp.service.CompanyService;
import com.gsccs.yqfw.corp.service.MonitorService;
import com.gsccs.yqfw.gis.model.GisConf;
import com.gsccs.yqfw.gis.model.MarkerFactor;
import com.gsccs.yqfw.gis.model.MarkerFactor.ClassfyType;
import com.gsccs.yqfw.gis.service.GisConfService;
import com.gsccs.yqfw.gis.service.MarkerService;

/**
 * 企业信息
 * 
 * @author niu x j
 * 
 */

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	@Autowired
	private MarkerService markerService;
	@Autowired
	private MonitorService monitorService;
	@Autowired
	private GisConfService gisConfService;

	/**
	 * 园区企业清单
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
		return "gis/corp-list";
	}

	/**
	 * 企业分布图
	 * 
	 * @param map
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(ModelMap map, HttpServletRequest request) {
		GisConf gisConf = gisConfService.getDefaultGisConf();
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.CORP);
		List<MarkerFactor> scaleList = markerService
				.findByClassfy(ClassfyType.SCALE);
		map.put("scaleList", scaleList);
		map.put("makFacts", makFactors);
		map.put("gisconf", JSON.toJSON(gisConf));
		return "gis/corp-map";
	}

	@RequestMapping(value = "/datagrid")
	@ResponseBody
	public Datagrid list(ModelMap map,
			@RequestParam(defaultValue = " id  ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, Company company,
			HttpServletRequest request) {
		List<Company> companyList = companyService.find(company, order, page,
				rows);
		int count = companyService.count(company);
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(companyList);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
	}

	/**
	 * 企业信息表单
	 * 
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/dataform", method = RequestMethod.GET)
	public String dataform(String id, ModelMap map) {
		Company company = null;
		if (StringUtils.isNotEmpty(id)) {
			company = companyService.getCompany(id);
		}
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.CORP);
		List<MarkerFactor> scaleList = markerService
				.findByClassfy(ClassfyType.SCALE);
		map.put("scaleList", scaleList);
		map.put("makFacts", makFactors);
		map.put("company", company);
		return "gis/corp-add";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(Company company,
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {
		JsonMsg json = new JsonMsg();
		if (null != company) {
			if (null != file){
				String path = request.getSession().getServletContext()
						.getRealPath("upload");
				String fileName = file.getOriginalFilename();
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					file.transferTo(targetFile);// 保存
				} catch (IllegalStateException | IOException e) {
					json.setSuccess(false);
					json.setMsg("保存失败：logo 上传失败");
				} 
				company.setLogo(request.getContextPath() + "/upload/" + fileName);
			}
			companyService.addCompany(company);
		}
		json.setSuccess(true);
		json.setMsg("企业信息新增成功!");
		return json;

	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(Company company, 
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {
		JsonMsg json = new JsonMsg();
		if (null != company) {
			if (null != file){
				String path = request.getSession().getServletContext()
						.getRealPath("upload");
				String fileName = file.getOriginalFilename();
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					file.transferTo(targetFile);// 保存
				} catch (IllegalStateException | IOException e) {
					json.setSuccess(false);
					json.setMsg("更新失败：logo 上传失败");
				} 
				company.setLogo(request.getContextPath() + "/upload/" + fileName);
			}
			companyService.updateCompany(company);
		}
		json.setSuccess(true);
		json.setMsg("更新企业信息成功！");
		return json;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg delete(String id, RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (StringUtils.isNotEmpty(id)) {
			companyService.delCompany(id);
			monitorService.delCorpMonitorVal(id);
		}
		json.setSuccess(true);
		json.setMsg("企业信息删除成功！");
		return json;
	}

	@RequestMapping(value = "/queryCompany", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg queryCompany(Company company,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		List<Company> clist = companyService.find(company);
		json.setSuccess(true);
		json.setData(clist);
		json.setMsg("加载成功");
		return json;

	}

	/**
	 * 查询企业监测数据
	 * 
	 * @param company
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/corpMonitVals", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg corpMonitVals(String corpid,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		List<MonitorVal> valslist = monitorService.findCorpMonitVals(corpid);
		json.setSuccess(true);
		json.setData(valslist);
		json.setMsg("监测数据加载成功！");
		return json;
	}

	/**
	 * 更新企业地理数据
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
			Company corp = companyService.getCompany(corpid);
			corp.setLng(lng);
			corp.setLat(lat);
			companyService.updateCompany(corp);
			json.setSuccess(true);
			json.setMsg("企业地理数据更新成功！");
		} else {
			json.setSuccess(false);
			json.setMsg("保存失败，企业地理数据有误！");
		}
		return json;
	}
}

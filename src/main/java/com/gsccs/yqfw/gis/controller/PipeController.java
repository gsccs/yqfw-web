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

import com.gsccs.plat.bass.Datagrid;
import com.gsccs.plat.bass.JsonMsg;
import com.gsccs.yqfw.corp.model.Company;
import com.gsccs.yqfw.corp.service.CompanyService;
import com.gsccs.yqfw.gis.model.MarkerFactor;
import com.gsccs.yqfw.gis.model.MarkerFactor.ClassfyType;
import com.gsccs.yqfw.gis.model.PipeLine;
import com.gsccs.yqfw.gis.model.PipePoint;
import com.gsccs.yqfw.gis.service.MarkerService;
import com.gsccs.yqfw.gis.service.PipeService;

/**
 * 园区管线控制类
 * 
 * @author x.d zhang
 * 
 */

@Controller
@RequestMapping("/pipe")
public class PipeController {

	@Autowired
	private PipeService pipeService;
	@Autowired
	private MarkerService markerService;
	@Autowired
	private CompanyService companyService;

	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap map, HttpServletRequest request) {
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.PIPE);
		List<Company> corplist = companyService.find(null);
		map.put("corplist", corplist);
		map.put("makFacts", makFactors);
		return "gis/pipe-list";
	}

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(ModelMap map, HttpServletRequest request) {
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.PIPE);
		List<Company> corplist = companyService.find(null);
		map.put("corplist", corplist);
		map.put("makFacts", makFactors);
		return "gis/pipe-map";
	}

	
	
	@RequestMapping(value = "/dataform", method = RequestMethod.GET)
	public String dataform(String id, ModelMap map) {
		PipeLine pipeLine = null;
		if (StringUtils.isNotEmpty(id)) {
			pipeLine = pipeService.getPipeLine(id);
		}
		List<MarkerFactor> makFactors = markerService
				.findByClassfy(ClassfyType.PIPE);
		List<Company> corplist = companyService.find(null);
		map.put("corplist", corplist);
		map.put("makFacts", makFactors);
		map.put("pipeLine", pipeLine);
		return "gis/pipe-edit";
	}

	@RequestMapping(value = "/datagrid")
	@ResponseBody
	public Datagrid list(ModelMap map,
			@RequestParam(defaultValue = " id  ") String order,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows, PipeLine pipeLine,
			HttpServletRequest request) {
		List<PipeLine> pipeLines = pipeService.find(pipeLine, order, page,
				rows);
		if(null != pipeLines && pipeLines.size()>0){
			for (int i=0;i<pipeLines.size();i++){
				List list = pipeService.findByPipeid(pipeLines.get(i).getId());
				pipeLines.get(i).setPoints(list);
			}
		}
		int count = pipeService.countPipeLine(pipeLine);
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(pipeLines);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
	}

	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg create(PipeLine pipeLine,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != pipeLine) {
			pipeService.addPipeLine(pipeLine);
		}
		json.setSuccess(true);
		json.setMsg("管道管线信息保存成功！");
		return json;

	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg update(PipeLine pipeLine,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != pipeLine) {
			pipeService.updatePipeLine(pipeLine);
		}
		json.setSuccess(true);
		json.setMsg("管线管道信息更新成功！");
		return json;
	}
	
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg delete(String id,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (StringUtils.isNotEmpty(id)) {
			pipeService.delPipeLine(id);
		}
		json.setSuccess(true);
		json.setMsg("管道删除成功！");
		return json;

	}

	/**
	 * 管线地理数据
	 * 
	 * @param param
	 * @param page
	 * @param rows
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/queryPoints", method = RequestMethod.POST)
	@ResponseBody
	public JsonMsg queryPipeLines(PipeLine param,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int rows,
			RedirectAttributes redirectAttributes) {

		JsonMsg json = new JsonMsg();
		List<PipeLine> pipeLines = pipeService.find(param, "", page, rows);
		if (null != pipeLines) {
			for (int i = 0; i < pipeLines.size(); i++) {
				pipeLines.get(i).setPoints(
						pipeService.findByPipeid(pipeLines.get(i).getId()));
			}
			json.setSuccess(true);
			json.setData(pipeLines);
		} else {
			json.setSuccess(false);
			json.setMsg("未查询到相关数据！");
		}
		return json;
	}

	@RequestMapping(value = "/pipePoints")
	@ResponseBody
	public Datagrid pipePoints(ModelMap map, String pipeid,
			HttpServletRequest request) {

		List<PipePoint> pipePoints = pipeService.findByPipeid(pipeid);
		int count = null == pipePoints ? 0 : pipePoints.size();
		Datagrid datagrid = new Datagrid();
		datagrid.setRows(pipePoints);
		datagrid.setTotal(Long.valueOf(count));
		return datagrid;
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
	public JsonMsg savePoints(@RequestBody List<PipePoint> points,
			RedirectAttributes redirectAttributes) {
		JsonMsg json = new JsonMsg();
		if (null != points && points.size() > 0) {
			pipeService.addPipePoint(points);
			json.setSuccess(true);
			json.setMsg("管道地理数据保存成功！");
		} else {
			json.setSuccess(false);
			json.setMsg("未查询到相关数据！");
		}
		return json;
	}

}

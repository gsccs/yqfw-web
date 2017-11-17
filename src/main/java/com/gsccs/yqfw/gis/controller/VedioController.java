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
import com.gsccs.yqfw.gis.model.LandInfo;
import com.gsccs.yqfw.gis.model.LandPoint;
import com.gsccs.yqfw.gis.model.MarkerFactor;
import com.gsccs.yqfw.gis.model.MarkerFactor.ClassfyType;
import com.gsccs.yqfw.gis.service.LandService;
import com.gsccs.yqfw.gis.service.MarkerService;

/**
 * 视频监控
 * 
 * @author x.d zhang
 * 
 */

@Controller
@RequestMapping("/vedio")
public class VedioController {

	@Autowired
	private LandService landService;

	@RequestMapping(value = "/viss", method = RequestMethod.GET)
	public String map(ModelMap map, HttpServletRequest request) {
		return "vedio/viss";
	}
	
}

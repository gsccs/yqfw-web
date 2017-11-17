package com.gsccs.yqfw.corp.service;

import java.util.List;

import com.gsccs.yqfw.corp.model.Company;

public interface CompanyService {

	public void addCompany(Company company);
	public void updateCompany(Company company);
	
	public Company getCompany(String id);
	public void delCompany(String id);
	
	public List<Company> find(Company company, String order, int currPage,
			int pageSize);
	
	public List<Company> find(Company company);
	
	public int count(Company company);
}

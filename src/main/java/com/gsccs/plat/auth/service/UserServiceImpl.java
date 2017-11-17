package com.gsccs.plat.auth.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsccs.plat.auth.dao.UserMapper;
import com.gsccs.plat.auth.model.User;
import com.gsccs.plat.auth.model.UserExample;
import com.gsccs.plat.auth.model.UserExample.Criteria;

/**
 * 
 * @author x.d zhang
 * 
 */
@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	@Autowired
	private PasswordHelper passwordHelper;

	/**
	 * 创建用户
	 * 
	 * @param user
	 */
	public User createUser(User user) {
		System.out.println("user:"+user.getId());
		// 加密密码
		passwordHelper.encryptPassword(user);
		userMapper.insert(user);
		return userMapper.selectByPrimaryKey(user.getId());
	}

	
	
	@Override
	public User updateUser(User user) {
		userMapper.updateByPrimaryKey(user);
		return userMapper.selectByPrimaryKey(user.getId());
	}

	@Override
	public void deleteUser(Long userId) {
		userMapper.deleteByPrimaryKey(userId);
	}

	/**
	 * 修改密码
	 * 
	 * @param userId
	 * @param newPassword
	 */
	public void changePassword(Long userId, String newPassword) {
		User user = userMapper.selectByPrimaryKey(userId);
		user.setPassword(newPassword);
		passwordHelper.encryptPassword(user);
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public User find(Long userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	@Override
	public List<User> findAll() {
		// return userMapper.selectByExample(null);
		return null;
	}

	/**
	 * 根据用户名查找用户
	 * 
	 * @param username
	 * @return
	 */
	public User findByUsername(String username) {

		UserExample uExample = new UserExample();
		Criteria criteria = uExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> users = userMapper.selectByExample(uExample);
		if (null != users && users.size() > 0) {
			return users.get(0);
		}
		return null;
	}

	@Override
	public List<User> find(User user, String order, int currPage, int pageSize) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		proSearchParam(user, criteria);
		example.setCurrPage(currPage);
		example.setPageSize(pageSize);
		return userMapper.selectPageByExample(example);
	}

	
	
	@Override
	public int count(User user) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		proSearchParam(user, criteria);
		return userMapper.countByExample(example);
	}

	public void proSearchParam(User user, UserExample.Criteria criteria) {
		if (null != user){
			if(StringUtils.isNotEmpty(user.getTitle())){
				criteria.andTitleLike("%"+user.getTitle()+"%");
			}
			
			if(StringUtils.isNotEmpty(user.getUsername())){
				criteria.andUsernameEqualTo(user.getUsername());
			}
			
			if(null != user.getOrgid()){
				criteria.andOrganizationIdEqualTo(user.getOrgid());
			}
		}
	}

}

package com.gsccs.plat.auth.service;

import java.util.List;

import com.gsccs.plat.auth.model.User;


public interface UserService {

    /**
     * 创建用户
     * @param user
     */
    public User createUser(User user);

    public User updateUser(User user);

    public void deleteUser(Long userId);

    /**
     * 修改密码
     * @param userId
     * @param newPassword
     */
    public void changePassword(Long userId, String newPassword);

    User find(Long userId);

    List<User> findAll();
    List<User> find(User user, String order, int currPage, int pageSize);
	public int count(User user);

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public User findByUsername(String username);


}

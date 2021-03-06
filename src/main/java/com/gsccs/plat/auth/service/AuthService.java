package com.gsccs.plat.auth.service;

import com.gsccs.plat.auth.model.Authorization;

import java.util.List;
import java.util.Set;

/**
 * <p>User: x.d zhang
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface AuthService {


    public Authorization createAuthorization(Authorization authorization);
    public Authorization updateAuthorization(Authorization authorization);
    public void deleteAuthorization(Long authorizationId);

    public Authorization findOne(Long authorizationId);
    public List<Authorization> findAll();

    /**
     * 根据AppKey和用户名查找其角色
     * @param username
     * @return
     */
    public Set<String> findRoles(String appKey, String username);

    /**
     * 根据AppKey和用户名查找权限字符串
     * @param username
     * @return
     */
    public Set<String> findPermissions(String appKey, String username);


}

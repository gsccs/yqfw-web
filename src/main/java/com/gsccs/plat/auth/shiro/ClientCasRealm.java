package com.gsccs.plat.auth.shiro;

import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.codehaus.jackson.map.Module.SetupContext;

/**
 * 单点登录
 */
public class ClientCasRealm extends CasRealm {

	private String appKey;
	
	public void setAppKey(String appKey) {
		System.out.println("××××××××××××××××××APPKEY:"+appKey);
		this.appKey = appKey;
	}
	
	public String getAppKey() {
		return appKey;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		System.out.println("*******************");
		// 得到用户名
		String username = (String) principals.fromRealm(getName()).iterator().next();
		//String username = (String) principals.getPrimaryPrincipal();
		System.out.println("**  "+username+" **");
		
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		//authorizationInfo.setRoles(userService.findRoles(username));  
        //authorizationInfo.setStringPermissions(userService.findPermissions(username));
		System.out.println("*******************");
		return authorizationInfo;
	}
	
	

	
}
